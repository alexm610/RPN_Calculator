/*-------------------------------*/
/*  This program contains        */
/*  software useful for 8051     */
/*  operation. Included are      */
/*  preprocessor directives,     */
/*  hardware setup, LCD setup,   */
/*  ADC setup and use.           */
/*-------------------------------*/

/*-------------------------------*/
/*    Preprocessor Directives    */
/*-------------------------------*/
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <at89lp51rd2.h>
#include "prototypes.h"




unsigned char _c51_external_startup(void)
{
	// If the ports are configured in compatibility mode, this is not needed.
	P0M0=0; P0M1=0;
	P1M0=0; P1M1=0;
	P2M0=0; P2M1=0;
	P3M0=0; P3M1=0;
	
	// Configure Serial Port and Baud Rate
    PCON|=0x80;
	SCON = 0x52;
    BDRCON=0;
    BRL=BRG_VAL;
    BDRCON=BRR|TBCK|RBCK|SPD;
    
	CLKREG=0x00; // TPS=0000B
    
    return 0;
}



unsigned char SPIWrite(unsigned char out_byte)
{
	// In the 8051 architecture both ACC and B are bit addressable!
	ACC=out_byte;
	
	BB_MOSI=ACC_7; BB_SCLK=1; B_7=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_6; BB_SCLK=1; B_6=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_5; BB_SCLK=1; B_5=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_4; BB_SCLK=1; B_4=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_3; BB_SCLK=1; B_3=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_2; BB_SCLK=1; B_2=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_1; BB_SCLK=1; B_1=BB_MISO; BB_SCLK=0;
	BB_MOSI=ACC_0; BB_SCLK=1; B_0=BB_MISO; BB_SCLK=0;
	
	return B;
}

/*Read 10 bits from the MCP3008 ADC converter*/
unsigned int volatile GetADC(unsigned char channel)
{
	unsigned int adc;
	unsigned char spid;

	ADC_CE=0; // Activate the MCP3008 ADC.
	
	SPIWrite(0x01);// Send the start bit.
	spid=SPIWrite((channel*0x10)|0x80);	//Send single/diff* bit, D2, D1, and D0 bits.
	adc=((spid & 0x03)*0x100);// spid has the two most significant bits of the result.
	spid=SPIWrite(0x00);// It doesn't matter what we send now.
	adc+=spid;// spid contains the low part of the result. 
	
	ADC_CE=1; // Deactivate the MCP3008 ADC.
		
	return adc;
}



void wait_us (unsigned char x)
{
	unsigned int j;
	
	TR0=0; // Stop timer 0
	TMOD&=0xf0; // Clear the configuration bits for timer 0
	TMOD|=0x01; // Mode 1: 16-bit timer
	
	if(x>5) x-=5; // Subtract the overhead
	else x=1;
	
	j=-ONE_USEC*x;
	TF0=0;
	TH0=j/0x100;
	TL0=j%0x100;
	TR0=1; // Start timer 0
	while(TF0==0); //Wait for overflow
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) wait_us(250);
}

void LCD_pulse (void)
{
	LCD_E=1;
	wait_us(40);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the 8051 is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	wait_us(40);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	waitms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	waitms(5);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	//LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

void LCD2_pulse (void)
{
	LCD2_E=1;
	wait_us(40);
	LCD2_E=0;
}

void LCD2_byte (unsigned char x)
{
	// The accumulator in the 8051 is bit addressable!
	ACC=x; //Send high nible
	LCD2_D7=ACC_7;
	LCD2_D6=ACC_6;
	LCD2_D5=ACC_5;
	LCD2_D4=ACC_4;
	LCD2_pulse();
	wait_us(40);
	ACC=x; //Send low nible
	LCD2_D7=ACC_3;
	LCD2_D6=ACC_2;
	LCD2_D5=ACC_1;
	LCD2_D4=ACC_0;
	LCD2_pulse();
}

void WriteData2 (unsigned char x)
{
	LCD2_RS=1;
	LCD2_byte(x);
	waitms(2);
}

void WriteCommand2 (unsigned char x)
{
	LCD2_RS=0;
	LCD2_byte(x);
	waitms(5);
}

void LCD2_4BIT (void)
{
	LCD2_E=0; // Resting state of LCD's enable is zero
	//LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand2(0x33);
	WriteCommand2(0x33);
	WriteCommand2(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand2(0x28);
	WriteCommand2(0x0);
	WriteCommand2(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCD2print(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand2(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	WriteData2(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData2(' '); // Clear the rest of the line
}

void delay(void)
{
	int i, j;
	for(i=0; i<10000; i++)
	{
		for(j=0; j<10000; j++)
		{
			;
		}
	}
}
