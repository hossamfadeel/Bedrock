// Takes results from scanner and forms the 9-bit output stream for
// the packet buffer, according to the plan shown in memory.eps.
// Five-word "badge" written at the beginning of a packet:
//   1. Dummy, needed in case construct.v skips forward two
//   2. Length msb
//   3. Length lsb
//   4. Status
//   5. Reserved, currently zero
// .. where words 1 and 2 have the 9th bit set to mark start-of-frame.
// This structure must be kept consistent with decoder in construct.v.

module pbuf_writer #(
	parameter paw=11  // packet address width, 11 IRL, maybe less for simulations
) (
	input clk,
	// Simple flow of data from input state machine
	// conforms to AXI-stream-lite, if I adjust the names?
	input [7:0] data_in,
	input data_s,
	input data_f,
	// Results of scanning process provided to us
	input [10:0] pack_len,
	input [7:0] status_vec,
	input status_valid,
	// port to DPRAM, write every cycle
	output [8:0] mem_d,
	output [paw-1:0] mem_a,
	// Other
	output [paw-1:0] gray_state,  // Valid read pointer, Rx needs to know this
	output badge_stb  // debugging hook
);

// Possibly stupid waste of 8 FF, but makes development much easier
reg [7:0] status_r=0;
always @(posedge clk) if (status_valid) status_r <= status_vec;

// Synthesize address and data for output DPRAM.
// It's critical that we're able to fill in the badge once the packet has ended.
// See memory.eps for a simplified description of what we're trying to accomplish.
reg [paw-1:0] fp=0;   // unperturbed frame counter/pointer
reg [paw-1:0] fpp=0;  // actual destination address
reg [paw-1:0] origin=0;  // pointer to start of badge
reg [2:0] post_cnt=5;
reg [8:0] pxd=0;   // data + sof marker in 9th bit
wire not_head = post_cnt==5;
reg badge_stb_r=0;
reg data_s_d=0;
wire trig = data_s & ~data_s_d;
always @(posedge clk) begin
	data_s_d <= data_s;
	// Setup counter to start writing the badge at the end of data
	// Stagnate counter at 5, and if that's the case write data through
	post_cnt <= data_f ? 3'd0 : not_head ? 3'd5 : post_cnt+1;
	if (trig) origin <= fp;
	case (post_cnt)
		// 12 unused bits, will find customers later, including authentication
		0: pxd <= {1'b1, 1'b0, 7'b0};
		1: pxd <= {1'b1, 1'b1, pack_len[6:0]};
		2: pxd <= {1'b0, 4'd0, pack_len[10:7]};
		3: pxd <= {1'b0, status_r};
		4: pxd <= {1'b0, 8'd0};
		5: pxd <= {1'b0, data_in};
		default: pxd <= 9'bx;
	endcase
	fp <= fp+1;
	fpp <= data_s ? fp + 5 : not_head ? fp : origin + post_cnt;
	badge_stb_r <= post_cnt!=0 && post_cnt!=5;
end

// Output ports
assign mem_a = fpp;
assign mem_d = pxd;
assign badge_stb = badge_stb_r;

// Convert to Gray code for Rx side, so Rx and Tx can be in different clock domains
wire [paw-1:0] fp_gray = fp ^ {1'b0, fp[paw-1:1]};
reg [paw-1:0] gray_state_r=0; always @(posedge clk) gray_state_r <= fp_gray;
assign gray_state = gray_state_r;

endmodule
