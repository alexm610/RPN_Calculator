module rpn(clk, reset, push, pop, d_in, d_out);
	// need a stack pointer reg as well!!
	parameter data_width = 4; // let 4 switches on board be input : will only allow for up to the number 16 to be an operand, but I need some switches for operand input!
	parameter address_width = 6; // total data spots is 2^6 = 64

	input clk, reset, push, pop;
	input [data_width-1:0] d_in;
	output reg [data_width-1:0] d_out;



			
endmodule


/*
	note: in armv7, the stack pointer is a register!
	needs to be read from, with a reset signal perhaps??


*/