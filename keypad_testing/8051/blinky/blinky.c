//#include "initialize.h"
#include <stdlib.h>
#include <stdio.h>
#include <at89lp51rd2.h>
#include "prototypes.h"

void mydelay (void)
{
	unsigned long int j;
	for(j=0; j<500000; j++);
}

void blink()
{	
	P3_2=0;
	LCDprint("Good luck ", 1, 1);
	LCDprint("            ", 2, 1);
	mydelay();
	P3_2=1;
	LCDprint("Somya!", 2, 1);
	LCDprint("            ", 1, 1);
	mydelay();
	printf("Hello from blinky!\n");

}
