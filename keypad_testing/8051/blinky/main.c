#include <at89lp51rd2.h>
#include "prototypes.h"
#include <stdlib.h>

void main (void)
{
	P3M0=0;
	P3M1=0;
	LCD_4BIT();
	LCDprint("Hello World!", 1, 1);
	while(1)
	{
		
		blink();
	}
}