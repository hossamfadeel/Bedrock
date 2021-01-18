import subprocess
import zlib
import struct
import hashlib
from math import ceil, log2
import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), "../badger"))
from lbus_access import lbus_access


def chunk(li, flag=1):
    '''
    l: list of 16-bit ints
    flag: type
    Each chunk has an ID that preceeds it
    ID is 16-bit {2 bits: type, 14 bits: length of the chunk}
    '''
    chunk_size = len(li)
    if chunk_size >= (1 << 14):
        raise Exception
    else:
        return [chunk_size + (flag << 14)] + li


def sixteen(ss, pad=b'\0'):
    if len(ss) % 2:  # need an even number of octets
        # Pad with \0 if pad char not specified
        ss += pad
    return list(struct.unpack("!" + "H" * int(len(ss) / 2), ss))


def compress_file(fname):
    sha = hashlib.sha1()
    fv = open(fname, 'r').read().encode('utf-8')
    sha.update(fv)
    file_zip = zlib.compress(fv, 9)
    return sha.hexdigest(), sixteen(file_zip)


def create_array(descrip, json_file):
    try:
        git_sha = subprocess.check_output(['git', 'rev-parse', 'HEAD'])
    except subprocess.CalledProcessError:
        print("Warning: no git info found, filling in with zeros")
        git_sha = 40*"0"
    git_binary = [int(git_sha[ix * 4 + 0:ix * 4 + 4], 16) for ix in range(10)]
    sha1sum, regmap = compress_file(json_file)
    json_sha1_binary = [
        int(sha1sum[ix * 4 + 0:ix * 4 + 4], 16) for ix in range(10)
    ]
    descrip_binary = sixteen(descrip, pad=b'.')  # Pad description string with '.', not null (non-printable)
    final = (chunk(
        json_sha1_binary, flag=2) + chunk(
            git_binary, flag=2) + chunk(descrip_binary) + chunk(
                regmap, flag=3))
    return final


def decode_array(a):
    rec_num = 0
    result = []
    while len(a):
        clen = a[0]
        flag = clen >> 14
        clen = clen & 0x3fff
        data = a[1:clen + 1]
        a = a[clen + 1:]
        # print(clen, flag)
        if flag == 0:
            break
        print("Record %d type %d length %d" % (rec_num, flag, clen))
        if flag == 1:
            result += [struct.pack("!" + "H" * len(data), *data).decode("utf-8")]
        elif flag == 2:
            result += ["".join([format(x, "04x") for x in data])]
        elif flag == 3:
            zipped = struct.pack("!" + "H" * len(data), *data)
            result += [zlib.decompress(zipped).decode("utf-8")]
        rec_num += 1
    return result


def verilog_rom(a, MAX_ROM_SIZE):
    ROM_MSB = ceil(log2(MAX_ROM_SIZE))
    print("%d/%d ROM entries used" % (len(a), MAX_ROM_SIZE))
    if len(a) > MAX_ROM_SIZE:
        print("ROM_size input exceeds MAX_ROM_SIZE")
        return ""
    config_case = '\n'.join([
        '''\t%i'h%3.3x: dxx <= 16'h%4.4x;''' % (ROM_MSB, ix, a[ix])  # MAX_ROM_SIZE
        for ix in range(len(a))
    ])
    return '''// 2K x 16 ROM machine generated by python verilog_rom()
module config_romx(
\tinput clk,
\tinput [%i:0] address,
\toutput [15:0] data
);
reg [15:0] dxx = 0;
assign data = dxx;
always @(posedge clk) case(address)
''' % (ROM_MSB-1) + config_case + '''
\tdefault: dxx <= 0;
endcase
endmodule
'''


def read_live_array(dev, len):
    foo = dev.exchange(range(0x800, 0x800+len))
    return foo


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description='Read/Write from FPGA memory')
    parser.add_argument(
        '-r', help='Maximum ROM size', dest='rom_size', type=int, default=2048)  # Variable ROM size
    parser.add_argument(
        '--loopback',
        dest='loopback',
        help='Encode and decode config_rom array',
        action='store_true',
        default=False)
    parser.add_argument(
        '--live',
        help='Read config_rom from device,'
        'decode and print',
        dest='live',
        action='store_true',
        default=False)
    parser.add_argument(
        '-a',
        '--ip',
        help='ip_address',
        dest='ip',
        type=str,
        default='192.168.21.11')
    parser.add_argument(
        '-p', '--port', help='port', dest='port', type=int, default=50006)
    parser.add_argument(
        '-v',
        '--verilog_file',
        dest='verilog_file',
        help='Destination config_rom filename',
        type=str,
        default='')
    parser.add_argument(
        '-j',
        '--json',
        dest='json',
        help='Register map filename',
        type=str)
    # TO-DO: Add argument for ROM size that also affects the address width.
    # TO-DO: Also check the Verilog files where the ROM is instantiated in,
    # TO-DO: and change the signals that are tied to the addr
    # NB: This is a placeholder for the argument parser
    parser.add_argument(
        '-d',
        '--dev_descript',
        dest='dev_descript',
        help='ASCII string to use as device description',
        type=str,
        default='LBNL BEDROCK ROM')
    args = parser.parse_args()
    if args.live:
        ip_addr = args.ip
        port = args.port
        dev = lbus_access(ip_addr, port=port)
        a = read_live_array(dev, args.rom_size)
        # print(" ".join(["%4.4x"%x for x in a]))
        r = decode_array(a)
        for rr in r:
            print(rr)
    else:
        if not args.json:
            print("JSON register map must be specified so ROM can be built")
            sys.exit(2)

        dev_desc = args.dev_descript.encode('utf-8')
        a = create_array(dev_desc, args.json)
        if args.loopback:
            r = decode_array(a)
            for rr in r:
                print(rr)
        elif args.verilog_file == '':
            print(len(a))
            print(a)
        else:
            with open(args.verilog_file, 'w') as f:
                f.write(verilog_rom(a, args.rom_size))
