import datetime
import os
import subprocess
import getopt
import sys
import re


def config_romx(dsp_flavor=0, tool_rev=0, board_type=0):
    if isinstance(tool_rev, str) and tool_rev.isdigit():
        tool_rev = eval(tool_rev)
    else:
        tool_rev = 0
    if isinstance(dsp_flavor, str) and dsp_flavor.isdigit():
        dsp_flavor = eval(dsp_flavor)
    else:
        dsp_flavor = 0
    # HARDWARE mnemonics
    board_dict = {
        'mebt': 1,
        'interim': 2,
        'fcm': 3,
        'avnet': 4,
        'uxo': 5,
        'llrf4': 6,
        'av5t': 7,
        'sp601': 8,
        'sp605': 9,
        'ml505': 10,
        'ml506': 11,
        'fllrf': 12,
        'spec': 13,
        'lx150t': 14,
        'cutewr': 15,
        'llrf46': 16,
        'ac701': 17,
        'ml605': 18,
        'kc705': 19,
        'bmb7_kintex': 20,
        'qf2_kintex': 21,
        'test': 99
    }
    print('board_type {}'.format(board_type))
    board_name = board_type  # maybe
    if board_type is None:
        board_type = 0
    elif isinstance(board_type, str):
        if board_type in board_dict:
            board_type = board_dict[board_type]
        elif board_type.isdigit():
            board_type = eval(board_type)
        else:
            board_type = 0
    else:
        board_type = 0
    # NUM codes, must be less than 256
    user_dict = {
        'ldoolitt': 1,
        'larry': 1,
        'lrdoolit': 1,
        'cswanson': 2,
        'kasemir': 3,
        'hengjie': 4,
        'qcf': 4,
        'crofford': 5,
        'meddeler': 6,
        'baptiste': 7,
        'llrf_oper': 8,
        'hyaver': 9,
        'dim': 10,
        'begcbp': 11,
        'ghuang': 12,
        'luser': 13,
        'kstefan': 14,
        'cserrano': 15,
        'asalom': 16,
        'du': 17,
        'yangjin': 18,
        'lilima': 19,
        'ernesto': 20,
        'vkvytla': 21
    }
    try:
        # p3 the output is bytes, changing that to a regular string
        git_sha = subprocess.check_output(['git', 'rev-parse',
                                           'HEAD']).decode("utf-8")
    except Exception:
        git_sha = 40 * 'f'
    print(git_sha)
    version_number = 0
    try:
        git_version = subprocess.check_output(['git', 'describe', '--tag'])
        m = re.match('\D*(\d*)\.[\s\S]*', git_version)
        if m:
            version_number = eval(m.group(1))
    except subprocess.CalledProcessError:
        print('config_crunch.py: Subprocess ERROR')
    except Exception:
        print('config_crunch.py: Generic exception')

    try:
        code_is_dirty = 0 if ('nothing' in subprocess.check_output(
            ['git', 'status']).split('\n')[-2]) else 1
    except Exception:
        code_is_dirty = 0

    user = os.getenv('USER', 'NONE')
    datatimestr = datetime.datetime.now()
    year = format(int(datatimestr.strftime('%y')), '02x')
    month = format(int(datatimestr.strftime('%m')), '02x')
    date = format(int(datatimestr.strftime('%d')), '02x')
    hour = format(int(datatimestr.strftime('%H')), '02x')
    minute = format(int(datatimestr.strftime('%M')), '02x')
    comments = [
        'magic', 'dsp flavor', 'year', 'month', 'day', 'hour', 'minute',
        'code is (dirty), () commits after the latest tag',
        'tool rev (%s)' % tool_rev,
        'user (%s)' % user,
        'board type (%s)' % board_name, 'version number',
        'start of git commit SHA1'
    ] + ['...'] * 18 + ['end of git commit SHA1']

    str_config = ''.join([
        '55',
        format(dsp_flavor, '02x'),
        year,
        month,
        date,
        hour,
        minute,
        # datetime.datetime.now().strftime('%y%m%d%H%M'),
        format(code_is_dirty, '02x'),
        format(tool_rev, '02x'),
        # format(user, '02x'),
        format(user_dict[user] if user in user_dict else 99, '02x'),
        format(board_type, '02x'),
        format(version_number, '02x'),
        git_sha[:40]
        # format(git_sha, '040x')
    ])

    config_case = '\n'.join([
        '''\t5'h%s: data = 8'h%s; // %s''' %
        (format(i, '02x'), str_config[i * 2:i * 2 + 2], comments[i])
        for i in range(32)
    ])

    # print ''.join(str_config)
    # print config_case
    config_romx_v = '''\
// Machine generated by python config_crunch.py
`timescale 1ns / 1ns

module config_romx(
\tinput [4:0] address,
\toutput reg [7:0] data
);

always @(address) case(address)
{}
endcase

endmodule
'''
    Y = config_romx_v.format(config_case)
    return Y


def usage():
    print('python config_crunch.py --HARDWARE aaa --TOOL bbb --DSP_FLAVOR ccc')


if __name__ == "__main__":
    opts, args = getopt.getopt(
        sys.argv[1:], 'h:t:f:o:',
        ['HARDWARE=', 'TOOL=', 'DSP_FLAVOR=', 'OUTPUT='])
    dsp_flavor = 2
    tool_rev = '1.0'
    board_type = 'BOARD_llrf4'
    filename = 'config_romx.v'
    for opt, arg in opts:
        if opt in ('-h', '--HARDWARE'):
            board_type = arg
        elif opt in ('-t', '--TOOL'):
            tool_rev = arg
        elif opt in ('-f', '--DSP_FLAVOR'):
            dsp_flavor = arg
        elif opt in ('-o', '--OUTPUT'):
            filename = arg
        else:
            print('BAD')
            usage()
            exit(1)
    with open(filename, 'w') as f:
        f.write(
            config_romx(
                dsp_flavor=dsp_flavor, tool_rev=tool_rev, board_type=board_type))
