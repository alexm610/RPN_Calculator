#include <at89lp51rd2.h>
#include "prototypes.h"
#include <stdlib.h>

void main (void)
{
    unsigned char i = 0;
    const char* key = "n";

    LCD_4BIT();
    LCDprint("keypad:    ", 0x80, 1);

    while (1) {
        key = key_actual(switch_press_scan());
        LCDprint(key, 0xc0 + i, 1);

        if (i == 15) {
            LCDprint(key_actual(switch_press_scan()), 0xc0, 1);
            LCDprint("                ", 0xc1, 1);
            i = 0;
        }
        i++;
    }
}