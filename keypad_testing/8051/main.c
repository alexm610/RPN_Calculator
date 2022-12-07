#include <at89lp51rd2.h>
#include "initialize.h"
#include <stdlib.h>

void main (void)
{
	P3M0=0;
	P3M1=0;
	while(1)
	{
		blink();
	}
}