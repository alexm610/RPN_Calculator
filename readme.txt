FPGA Implementation of a Reverse Polish Notation Calculator

May 19, 2022
	- at this point you can successfully write switch data to the dummy register and thus to the LEDs upon KEY[0] press
	- reset (KEY[1]) resets the dummy register to zero as desired. NOTE: it starts operation on falling edge of KEY[1] for some reason 
	- next step is to set up the stack pointer register. this will require having control signals set during already defined states
	- examples of control signals for the stack pointer register are the load wire, the reset wire (for the multiplexor into the stack pointer)
	- there should be a multiplexor going into the stack pointer register that chooses either SP+1 or 8'b0 to be on the input line 
		of the stack pointer register.

MAY 25, 2022
	- At this point, the calculator can write data from the from the switches into the dummy register which holds the data until it is rewritten 
	upon KEY[0] high. 
	- The stack pointer register is always set to 1 upon KEY[1] high (the reset button).
	- Stack pointer register increments by 1 every time KEY[0] is pressed.
	- LEDs are written to directly from the data held in the dummy register. 
	- Memory block has been instantiated; tonight I will attempt to connect RAM module so data in dummy register is directly written to RAM in 
		position defined by the data held in stack pointer register. 
	END OF NIGHT:
	- Stack pointer now starts at zero and increments upon KEY[0] high; earlier it started at zero, then went to 1 upon KEY[0], but 
		then wrote to position 1 of RAM for writing data in dummy register to memory. 
	- For next time: remove the dummy register, and write directly to RAM. 

MAY 26, 2022
	- Am going to attempt to get writing to RAM to work with the dummy register.
	