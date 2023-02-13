<h1>Reverse Polish Notation Calculator</h1>

This project is an implementation of a Reverse Polish Notation Calculator written in SystemVerilog. It was designed to be implmented on an Intel DE1-SoC. The programming development environments used were VS Code, Quartus, and Modelsim.
The folder version_1 contains the initial, completed implementation of the calculator. Numbers are inputted via the swithces on the DE1-SoC board and stored into memory via one of the pushbuttons; operators are also inputted via the switches, but the 10th switch is used to tell the system whether to recognize the value on the switches as an operand or operator. The value on top of the stack is is displayed on the HEX display, in hexadecimal code. 
