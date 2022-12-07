#include <at89lp51rd2.h>
#include "prototypes.h"
#include <stdlib.h>

void main (void)
{
    char* key = "n";
    LCD_4BIT();
    LCDprint("keypad:    ", 1, 1);
    while (1) {
        key = key_actual(switch_press_scan());
        LCDprint(key, 2, 1);
    }
}