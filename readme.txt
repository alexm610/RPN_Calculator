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

AUGUST 21, 2022
	- Need only one wire out of RAM into the A and B regs, just make sure you put the enable signal high only for one at a time!!

NOVEMBER 21, 2022
	- no longer using the rpn.v that has been created thus far, will be replaced with rpn.sv file that has same functionality
		thus far (only loading to the stack) but uses methods learned in CPEN 311
	- RAM will be replaced with wizard-made memory file, as per CPEN 311 lab 3 (file will be built by quartus)
	- with the new "enable = KEY[0]" system, we can also have a check for if SW[9] is high or low:
		if its high then that means a number is on the switches
		if its low, then that means an operation needs to happen, and read the switch value as an operation instead!
	- note: have an error check! If an ALU operation is started, keep checking if the hardware tries to decrement the PC BELOW ZERO; meaning that
		the ALU operation was triggered without enough operands on the Stack!!!!!!!!!!!

NOVEMBER 23, 2022
	- removed the register for the result out of the ALU; now the output of the ALU is directly connected into the stack.
		in the state machine, depending if we are idling or in operate mode, the data bus is either set to SW value or whatever is on the output of the ALU	
	- Do i even need a PC?? just set addr to 0 initially, and increment/decrement as needed
	- Time to go to bed: simulation works perfectly! but it fails completely on the hardware
		my hypothesis is that the program is running so fast, that when the ENABLE key is asserted, the state machine cycles through
		its states as it should, but by the time it gets back to the IDLE state, the ENABLE key is still asserted in practice 
		because I can't move as fast as a 50 MHz clock. The likely solution to this is to add a protocol (ready/enable!!) that only starts the write or 
		operate processes once the ENABLE key is asserted AND THEN deasserted. This wasn't an issue in simulation because the ENABLE button 
		was being asserted and deasserted within 4 ps, which is not possible in reality. 
	- With this new idea to add a ready/enable protocol, perhaps I could break the separate processes of writing to memory and then 
		operating on memory into different modules altogether, each with their own state machine! I'd have a module for writing, with 
		its own ready/enable signals, and a module for operation, also with its own ready/enable signals. 

NOVEMBER 24, 2022
	- A much more simplistic idea: just have an extra state that waits for KEY[0] to be deasserted. You can still split the functionality
		separate modules, but start with that simple solution. 
	- Upon further consideration, implementation of a ready/enable protocol and subsequent splitting of functionality into separate 
		modules is unnecessary, and should be left as an exercise once project is complete. The main issue was the stop/start behaviour
		that waited for deassertion of the ENABLE key, which has been solved. Introduction of a ready/enable protocol would still use 
		this functionality but would add complication. Split rpn.sv into separate modules later on, at least get it working first. 

DECEMBER 2, 2022
	- Product works, albeit with minimal testing. Addition definitely works, in both simulation and on the board; the output value is presented onto the 
		LEDs. 
	- Will now attempt to write code that converts a 4-bit binary value to hexadecimal value, as to display the calculated output onto the HEX display
	- Increase output put bus width to account for calculation output values larger than 8 bits!

DECEMBER 8, 2022
	- I've created a keypad-testing folder; it contains a directory for an 8051 microcontroller, and my DE1-Soc. 
		- A keypad interface for an 16x2 LCD via my 8051 atmel microcontroller was just completed. Keypad characters are shown on the screen one after the other on the LCD upon a button press.
	- GPIO testing file works; some notes:
		- with one end of the LED connected to ground: SW high corresponds to LED on
		- with one end of the LED connected to power: SW high corresponds to LED off
	- Thus, it makes more sense to always have the LED connected to ground and the GPIO, for simplicity's sake. 
	- Next step: add to the gpio testing module functionality where the gpio is connected to a push button that turns on the one of the HEX displays.

IDEAS FOR MORE FEATURES:
	- add registers to hold the most recent operands and have all of that displayed on the HEX display!!
		left two HEXs for the first operand, middle two for the second, and the rightmost two HEXs for the output
	- add overflow and underflow indicator
		- may require addition of underflow and overflow flags on the ALU	
			- see lab 7 of CPEN 211!
	- UPON RESET, STACK SHOULD BE ZEROED OUT!!!!!!!!!!!!!!!!!!!!!
