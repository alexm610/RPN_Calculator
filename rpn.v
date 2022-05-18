module rpn(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	// instantiate the stack
		// read and write address lines are read from output of stack pointer. 
	RAM STACK (CLOCK_50, stack_pointer[7:0], stack_pointer[7:0], ~KEY[0], SW[7:0], LEDR[7:0]);
	
	



			
endmodule


/*
	note: in armv7, the stack pointer is a register!
	needs to be read from, with a reset signal perhaps??


*/