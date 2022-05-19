`define S_WAIT		4'b0000
`deeS_WRITE1	4'b0001
`S_WRITE2	4'b0010


module rpn(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire [7:0] data_IN, data_OUT;
	reg write;
	reg [4:0] current_state;

	reg_load_enable #(8) STACK_POINTER_REGISTER (CLOCK_50, data_IN, write, data_OUT);
	multiplexer_2input #(8) SP_Multiplexor (8'b0, (data_OUT + 1'b1), ~KEY[1], data_IN); 
	RAM STACK (CLOCK_50, data_OUT[7:0], data_OUT[7:0], ~KEY[0], SW[7:0], LEDR[7:0]);

	always @(posedge CLOCK_50)
		if (~KEY[1]) begin // if reset is asserted then keep in wait signl
			current_state = `S_WAIT;
		end
	
		case (current_state)
			`S_WAIT: {write} = {1'b0};

		endcase
endmodule


/*
	note: in armv7, the stack pointer is a register!
	needs to be read from, with a reset signal perhaps??


*/