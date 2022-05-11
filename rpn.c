#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(void)
{
 	int i, top_of_stack = 0;
	char* stack;

	// allocate space for the stack, say size 100 is maximum size for user expression
	stack = (char*)malloc(100 * sizeof(char));
	
	for(i=0; i<100; i++)
	{
	 	stack[i] = 'x';
	}


	/* printing, for testing
	for(i=0; i<100; i++)
	{
	 	printf("%c\n", stack[i]);
	}
	*/

	//stack is LIFO structure, LAST IN FIRST OUT
		// have a variable that records the 'top' of the stack

	// after each operator is entered, the top two operands on the stack
		// are operated upon, with their solution put on the top of the stack. 
		// need to put 'x' into the now empty space held by one of the operands

	// if a value appears next in the expression, PUSH the value onto the stack
	// if an operator appears next, then POP two items from the top of the stack and push the result of the operation on to the stack
	
	while(stack[1] != 'x')
	{
		
	
	}


	return 0;
}


