/*-------------------------------*/
/*           Hardware            */
/*-------------------------------*/
#define CLK    22118400L // SYSCLK frequency in Hz
#define BAUD     115200L // Baud rate of UART in bps
#define ONE_USEC (CLK/1000000L) // Timer reload for one microsecond delay
#if (CLK/(16L*BAUD))>0x100
#error Can not set baudrate
#endif
#define BRG_VAL (0x100-(CLK/(16L*BAUD)))

/*-------------------------------*/
/*           LCD Pins            */
/*-------------------------------*/
#define LCD_RS P2_5
// #define LCD_RW PX_X // Not used in this code, connect the pin to GND
#define LCD_E  P2_4
#define LCD_D4 P3_4
#define LCD_D5 P3_5
#define LCD_D6 P3_6
#define LCD_D7 P3_7
#define LCD2_RS P2_6
// #define LCD_RW PX_X // Not used in this code, connect the pin to GND
#define LCD2_E  P2_7
#define LCD2_D4 P0_4
#define LCD2_D5 P0_3
#define LCD2_D6 P0_2
#define LCD2_D7 P0_1

/*-------------------------------*/
/*              ADC              */
/*-------------------------------*/
#define ADC_CE  P2_0
#define BB_MOSI P2_1
#define BB_MISO P2_2
#define BB_SCLK P2_3
#define VREF 4.096

/*-------------------------------*/
/*              LCD              */
/*-------------------------------*/
#define CHARS_PER_LINE 16

/*-------------------------------*/
/*           Prototypes          */
/*-------------------------------*/
void delay(void);
void LCD2print(char * string, unsigned char line, bit clear);
void LCD2_4BIT (void);
void WriteCommand2 (unsigned char x);
void WriteData2 (unsigned char x);
void LCD2_byte (unsigned char x);
void LCD2_pulse (void);
void LCDprint(char * string, unsigned char line, bit clear);
void LCD_4BIT (void);
void WriteCommand (unsigned char x);
void WriteData (unsigned char x);
void LCD_byte (unsigned char x);
void LCD_pulse (void);
void waitms (unsigned int ms);
void wait_us (unsigned char x);
unsigned int volatile GetADC(unsigned char channel);
unsigned char SPIWrite(unsigned char out_byte);
