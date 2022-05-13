#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <colour_manak.h>

struct stack
{
	int data;
	struct stack *next;
};

struct stack *create(struct stack*, int*);
struct stack *display(struct stack*);

int main(void)
{
 	int i, size, input, first, second;
	struct stack *start = NULL;

	start = create(start, &size);
	start = display(start);

	// initiate a push pop thing-a-ma-jig for testing

	while(1)
	{
		printf("enter 1 for PUSH and 2 for POP\n");
		scanf("%d", &i);

		if(i == 1)
		{
			// need to push data onto the stack
			printf("enter data to push to stack\n");
			scanf("%d", &input);

			// PUSH FUNCTION GOES HERE
		}
		else if(i == 2)
		{
			// need to pop data off of the stack and save into a variable
				// NOTE: after this operation, the data that comes off of the stack should be saved into some variables, but also deleted from the stack. 
				// because RPN only requires that the two most recent operands be popped off of the stack, have two variables, FIRST and SECOND


		}
	}	











	// USE A LINKED LIST!!!!
		//stack is LIFO structure, LAST IN FIRST OUT
		// have a variable that records the 'top' of the stack

	// after each operator is entered, the top two operands on the stack
		// are operated upon, with their solution put on the top of the stack. 
		// need to put 'x' into the now empty space held by one of the operands

	// if a value appears next in the expression, PUSH the value onto the stack
	// if an operator appears next, then POP two items from the top of the stack and push the result of the operation on to the stack
	



	return 0;
}

struct stack *create(struct stack *start, int *size)
{
	struct stack *new_node, *ptr;
	int num, count, value;

	printf("Creating stack from linked list with 100 nodes...\n");
	*size = 100;

	count = 0;
	while(count < 100)
	{
		// create a new node
		new_node = (struct stack*)malloc(sizeof(struct stack));
		
		// set data to be NULL
		new_node->data = 0;

		if(start == NULL)
		{
		 	// first node! 
			new_node->next = NULL;
			start = new_node;
		}
		else
		{
			ptr = start;

			// go through list that has already been created and then add a new node
			while(ptr->next != NULL)
			{
				ptr = ptr->next;
			}

			ptr->next = new_node;
			new_node->next = NULL;
		}

		count++;

	}
	
	return start;
}

struct stack *display(struct stack *NODES)
{
	struct stack *pointer;
	int flag = 1;
	pointer = NODES;

	while(pointer != NULL)
	{
		if(flag < 0)
		{
			printf(BOLD_RED);
		}
		else	
		{
			printf(BOLD_BLUE);
		}

		printf("\t %d", pointer->data);
		pointer = pointer->next;
		flag *= -1;
	}

	printf("\n");

	return NODES;
}


















