#include <at89lp51rd2.h>
#include "prototypes.h"
#include <stdlib.h>

int read_key_inputs (void)
{
    // https://circuitdigest.com/microcontroller-projects/4x4-keypad-interfacing-with-pic16f877a

    ROW_1 = 0; ROW_2 = 1; ROW_3 = 1; ROW_4 = 1;    
    if (COLUMN_1 == 0) { waitms(100); while (COLUMN_1==0); return 0x1; }
    if (COLUMN_2 == 0) { waitms(100); while (COLUMN_2==0); return 0x2; }
    if (COLUMN_3 == 0) { waitms(100); while (COLUMN_3==0); return 0x3; }
    if (COLUMN_4 == 0) { waitms(100); while (COLUMN_4==0); return 0xA; }
    
    ROW_1 = 1; ROW_2 = 0; ROW_3 = 1; ROW_4 = 1;    
    if (COLUMN_1 == 0) { waitms(100); while (COLUMN_1==0); return 0x4; }
    if (COLUMN_2 == 0) { waitms(100); while (COLUMN_2==0); return 0x5; }
    if (COLUMN_3 == 0) { waitms(100); while (COLUMN_3==0); return 0x6; }
    if (COLUMN_4 == 0) { waitms(100); while (COLUMN_4==0); return 0xB; }
    
    ROW_1 = 1; ROW_2 = 1; ROW_3 = 0; ROW_4 = 1;    
    if (COLUMN_1 == 0) { waitms(100); while (COLUMN_1==0); return 0x7; }
    if (COLUMN_2 == 0) { waitms(100); while (COLUMN_2==0); return 0x8; }
    if (COLUMN_3 == 0) { waitms(100); while (COLUMN_3==0); return 0x9; }
    if (COLUMN_4 == 0) { waitms(100); while (COLUMN_4==0); return 0xC; }
    
    ROW_1 = 1; ROW_2 = 1; ROW_3 = 1; ROW_4 = 0;    
    if (COLUMN_1 == 0) { waitms(100); while (COLUMN_1==0); return 0xE; }
    if (COLUMN_2 == 0) { waitms(100); while (COLUMN_2==0); return 0x0; }
    if (COLUMN_3 == 0) { waitms(100); while (COLUMN_3==0); return 0xF; }
    if (COLUMN_4 == 0) { waitms(100); while (COLUMN_4==0); return 0xD; }
            
    return 0xFF;
}

int switch_press_scan (void)
{
    int key = 0xFF;
    while(key == 0xFF)
    {
        key = read_key_inputs();
    }
    return key;
}

const char* key_actual(int number)
{
    switch (number)
    {
        case 0x0: return "0"; break;
        case 0x1: return "1"; break;
        case 0x2: return "2"; break;
        case 0x3: return "3"; break;
        case 0x4: return "4"; break;
        case 0x5: return "5"; break;
        case 0x6: return "6"; break;
        case 0x7: return "7"; break;
        case 0x8: return "8"; break;
        case 0x9: return "9"; break;
        case 0xA: return "A"; break;
        case 0xB: return "B"; break;
        case 0xC: return "C"; break;
        case 0xD: return "D"; break;
        case 0xE: return "*"; break;
        case 0xF: return "#"; break;
    }   

    return "";
}
