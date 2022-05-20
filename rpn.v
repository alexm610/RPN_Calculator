`define S_WAIT		4'b0000
`define S_WRITE1	4'b0001
`define S_WRITE2	4'b0010

module rpn(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire [7:0] data_IN, data_OUT;
	reg write;
	reg [3:0] current_state;

	reg_load_enable #(8) STACK_POINTER_REGISTER (CLOCK_50, SW[7:0], write, LEDR[7:0]);
	//multiplexer_2input #(8) SP_Multiplexor (8'b0, (data_OUT + 1'b1), ~KEY[1], data_IN); 
	//RAM STACK (CLOCK_50, data_OUT[7:0], data_OUT[7:0], ~KEY[0], SW[7:0], LEDR[7:0]);

	always @(posedge CLOCK_50) begin
		if (~KEY[1]) begin
			current_state = `S_WAIT;
		end else begin
			// here reset has not been asserted 
			casex ({current_state, ~KEY[0]})
				{`S_WAIT, 1'b1}: current_state = `S_WRITE1;
				{`S_WAIT, 1'b0}: current_state = `S_WAIT;
				{`S_WRITE1, 1'bx}: current_state = `S_WAIT;
			endcase

			case (current_state)
				`S_WAIT: {write} = 1'b0;
				`S_WRITE1: {write} = 1'b1; 	
			endcase
		end
	end


endmodule


/*
	note: in armv7, the stack pointer is a register!
	needs to be read from, with a reset signal perhaps??


*/