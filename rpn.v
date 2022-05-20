`define S_WAIT		4'b0000
`define S_WRITE1	4'b0001
`define S_WRITE2	4'b0010
`define S_ZERO		4'b0011

module rpn(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire [7:0] data_IN, data_OUT;
	reg write, tri_enable;
	reg [3:0] current_state;

	reg_load_enable #(8) STACK_POINTER_REGISTER (CLOCK_50, data_IN, write, LEDR[7:0]); 

	assign data_IN = tri_enable ? SW[7:0] : 16'b0;	
	assign LEDR[8] = 1'b0;
	assign LEDR[9] = 1'b0;

	always @(posedge CLOCK_50) begin
		if (~KEY[1]) begin
			current_state = `S_ZERO;
		end else begin
			casex ({current_state, ~KEY[0]})
				{`S_ZERO, 1'bx}: current_state = `S_WRITE2;
				{`S_WAIT, 1'b1}: current_state = `S_WRITE1;
				{`S_WAIT, 1'b0}: current_state = `S_WAIT;
				{`S_WRITE1, 1'bx}: current_state = `S_WAIT;
				{`S_WRITE2, 1'bx}: current_state = `S_WAIT;
			endcase

			case (current_state)
				`S_ZERO: {write, tri_enable} = {1'b1, 1'b0};
				`S_WAIT: {write, tri_enable} = {1'b0, 1'b1};
				`S_WRITE1: {write, tri_enable} = {1'b1, 1'b1}; 
				`S_WRITE2: {write, tri_enable} = {1'b1, 1'b0};	
			endcase
		end
	end


endmodule
