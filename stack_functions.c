#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <colour_manak.h>
#include "prototypes.h"

struct stack *push(struct stack *top, double value)
{
	struct stack *ptr;
	
	// allocate space for new node to be attached to the stack
	ptr = (struct stack*)malloc(sizeof(struct stack));

	// set the data to this node, 
		// this node is going to be connected to the stack!
	ptr->data = value;

	if(top == NULL)
	{
		// nothing is on the stack
		// set the top ptr handed to function to be the new node
		top = ptr;
	}
	else
	{
		// already data on the stack
		ptr->next = top;
		top = ptr;
		// remember, the stack grows down
	}

	return top;
}

struct stack *pop(struct stack *top)
{
	struct stack *ptr;
	
	ptr = top;

	if(top == NULL)
	{
		printf("\n Stack Underflow\n");
	}
	else
	{
		top = top->next;
		printf("popped value: %lf\n", ptr->data);
		free(ptr);
	}

	return top;
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

		printf("\t %lf", pointer->data);
		pointer = pointer->next;
		flag *= -1;
	}

	printf("\n");

	return NODES;
}


















