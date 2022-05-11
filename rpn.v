module rpn(clk, reset, push, pop, sp, full, empty, d_in, d_out);
	// need a stack pointer reg as well!!
	parameter data_width = 4; // let 4 switches on board be input : will only allow for up to the number 16 to be an operand, but I need some switches for operand input!
	parameter address_width = 6; // total data spots is 2^6 = 64

	input clk, reset, push, pop;
	input [data_width-1:0] d_in;
	output reg [data_width-1:0] d_out;
	output full, empty;
	reg [address_width-1:0] sp; // stack pointer


	// create memory block: the stack
	reg [data_width-1:0] mem [2**address_width-1:0];
	// no need to have inital statment, since we will be pushing and popping throughout. 


	// if reset signal is asserted, then clear memory and reset stack pointer to first position
	always @ (posedge clk) begin
		if(reset)
			
endmodule

