Verilog Implementation

May 19
	- at this point you can successfully write switch data to the dummy register and thus to the LEDs upon KEY[0] press
	- reset (KEY[1]) resets the dummy register to zero as desired. NOTE: it starts operation on falling edge of KEY[1] for some reason 
	- next step is to set up the stack pointer register. this will require having control signals set during already defined states
	- examples of control signals for the stack pointer register are the load wire, the reset wire (for the multiplexor into the stack pointer)
	- there should be a multiplexor going into the stack pointer register that chooses either SP+1 or 8'b0 to be on the input line of the stack pointer register. 