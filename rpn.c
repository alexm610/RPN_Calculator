#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <colour_manak.h>
#include "prototypes.h"

int main(void)
{
 	int i;
    char user_input;
	double first, second, result, operand;

	struct stack *top = NULL;

    printf(BOLD_MAGENTA);
    printf("\nPlease begin entering operands and operators.\nCorrect formatting is assumed upon input.\n");
    printf("Enter the letter e when complete to display the final answer.\n");

    do
    {
        top = display(top);
        printf(BOLD_YELLOW);
        printf("->");
        scanf("%c", &user_input);

        if(user_input == '+')
        {
            first = top->data;
            top = pop(top);
            second = top->data;
            top = pop(top);

            result = second + first;

            top = push(top, result);
        }
        else if(user_input == '-')
        {
            first = top->data;
            top = pop(top);
            second = top->data;
            top = pop(top);

            result = second - first;

            top = push(top, result);
        }
        else if(user_input == '*')
        {
            first = top->data;
            top = pop(top);
            second = top->data;
            top = pop(top);

            result = second * first;

            top = push(top, result);
        }
        else if(user_input == '/')
        {
            first = top->data;
            top = pop(top);
            second = top->data;
            top = pop(top);

            result = second / first;

            top = push(top, result);
        }
        else
        {
            // at this point, it is assumed a number has been entered. convert from char to int. 
            operand = (double) user_input; //////// this doesnt work
            top = push(top, operand);
        }
    }while(user_input != 'e');
	
    printf("Evaluated expression: %lf\n", top->data);

	return 0;
}


/*








*/
