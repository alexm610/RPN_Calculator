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

MAY 28, 2022
	- I was wrong, although the stack pointer writes data to first position in RAM on start, upon reset it writes to second position. 
	- Tonight, I will focus on stack pointer sending data to correct position. 
	- End of the night: calculator no longer works. Have renamed and added another write signal for the SP register. Shouldn't take long to restore
		basic functionality. 
	- Later in the day: starting up again, going to get reset behaviour to work again. This includes first writing zeros to the dummy register, THEN 
		updating the SP
	- Seems to work great now: upon reset button, dummy register has zero written to it, and stack pointer is set to zero as well. Upon enter button, 
		data is written to the dummy register, and then to memory, and then SP is updated. Reset works after enter button has been pressed 
		several times
	- Have created an ALU module, not connected to anything yet though. 

AUGUST 12, 2022
	- Starting up again
	- basic functionality remains, stack pointer seems to increment and reset to zero upon correct signals
	- Added two new registers that take input from the stack, and output into the ALU
	- still need to add control signals into the CPU finite state machine. 
	- wave.do file updated with new signals; these signals are not currently connected to anything
	- Need to test if ~KEY[2] (the button that will be used to indiate an ALU operation) going HIGH can be added into the FSM properly
	- Stack pointer and thus the stack should continue to increment/decrement to zero upon proper usage of ~KEY[0] and ~KEY[1]
	- Only when ~KEY[2] is asserted, should an ALU operation begin

AUGUST 13, 2022
	- In analyzing my design that I've come up with until now, I've realized there is little need for the dummy register. 
	- I can simply have switch values written to the stack upon a 'write RAM' high signal.
	- The goal is to now delete most of what I have, as to simplify the design for writing to the stack. 
	- I came acros this idea, and epiphany that I'm overcomplicating things, when I tried to modify the design such that the 
		LEDs displayed exactly what was at the top of the stack. 
	- As of today, the LEDs only display what is in the DUMMY register. This seems inefficient. 

AUGUST 14, 2022
	- Upon further inspection, the stack pointer is not working properly, and thus the desired functionality of the LEDs displaying whatever 
		is on top of the stack is not working. 
	- Need to modify the process of incrementing the stack pointer; as of now, the stack pointer points to the next space on the stack,
		regardless of the fact that there is nothing at that location yet. 
	- But first, try removing the dummy register; it seems like an unnecessary middle man...
	- A ha! I slightly modified the design to work without a dummy register, seems to have the same behaviour as before
	- EPIPHANY: rename the current 'stack pointer' to program counter, and create a new stack pointer register that is one less than the program 
		counter!
	- Time to go to bed. I was thinking about having a program counter and a stack pointer. This seems inefficient. So I will 
		change the behaviour of the stack pointer such that UPON RESET the stack pointer is reset. Say the reset button is triggered, then 
		the CPU is to write the data on SW[7:0] into position 0 of the stack, THEN the stack pointer is set to zero. And as more numbers are
		entered, the stack pointer is incremented to the next spot on the stack, SW[7:0] is written to this new position, and that's it. 
		At that point, stack pointer is pointing to the top of the stack. 