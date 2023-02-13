#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <colour_manak.h>
#include "prototypes.h"

int main(void)
{
    char *ptr;
	int user_input, i, first, second, result, operand;

	struct stack *top = NULL;

    printf(BOLD_MAGENTA);
    printf("\nPlease begin entering operands and operators.\nCorrect formatting is assumed upon input.\n");
    printf("Enter the letter e when complete to display the final answer.\n");

    do
    {
        top = display(top);
        printf(BOLD_YELLOW);
        printf("->");
        scanf("%d", &user_input);

        if(user_input == 43)
        {
            first = top->data;
            top = pop(top);
            second = top->data;
            top = pop(top);

            result = second + first;

            top = push(top, result);
        }
        else if(user_input == 45)
        {
            first = top->data;
            top = pop(top);
            second = top->data;
            top = pop(top);

            result = second - first;

            top = push(top, result);
        }
        else if(user_input == 42)
        {
            first = top->data;
            top = pop(top);
            second = top->data;
            top = pop(top);

            result = second * first;

            top = push(top, result);
        }
        else if(user_input == 76)
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
            printf("%lf", operand);
            top = push(top, operand);
        }
    }while(user_input != 'e');
	
    printf("Evaluated expression: %lf\n", top->data);

	return 0;
}


/*








*/
