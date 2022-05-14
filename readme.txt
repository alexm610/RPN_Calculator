Two options for creating the stack:
1)	
	create a fixed stack of 100 (kind of like hardware) and implement a stack pointer

2)
	have nodes be created dynamically 


I think I will go with the linked list option, because although it will not involve a stack pointer, because pop and push operations will just iterate to the end of the list, it will be easier to pop and push. 


----

// USE A LINKED LIST!!!!
		//stack is LIFO structure, LAST IN FIRST OUT
		// have a variable that records the 'top' of the stack

	// after each operator is entered, the top two operands on the stack
		// are operated upon, with their solution put on the top of the stack. 
		// need to put 'x' into the now empty space held by one of the operands

	// if a value appears next in the expression, PUSH the value onto the stack
	// if an operator appears next, then POP two items from the top of the stack and push the result of the operation on to the stack
	



// need to pop data off of the stack and save into a variable
				// NOTE: after this operation, the data that comes off of the stack should be saved into some variables, but also deleted from the stack. 
				// because RPN only requires that the two most recent operands be popped off of the stack, have two variables, FIRST and SECOND
