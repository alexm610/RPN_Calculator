module rpn(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
	input CLOCK_50;
	input [3:0] KEY;
	input [7:0] SW;
	output [7:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire [7:0] data_IN, data_OUT;

	reg_load_enable #(8) STACK_POINTER_REGISTER (clk, data_IN, KEY[0], data_OUT);
	multiplexer_2input #(8) SP_Multiplexor (8'b0, (data_OUT + 1), reset, data_IN); 

	// instantiate the stack
		// read and write address lines are read from output of stack pointer. 
	RAM STACK (CLOCK_50, data_OUT[7:0], data_OUT[7:0], ~KEY[0], SW[7:0], LEDR[7:0]);
			
endmodule


/*
	note: in armv7, the stack pointer is a register!
	needs to be read from, with a reset signal perhaps??


*/