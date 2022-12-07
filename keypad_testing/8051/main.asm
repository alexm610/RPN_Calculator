;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Tue Dec 06 19:00:07 2022
;--------------------------------------------------------
$name main
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _delay
	public _LCD2print
	public _LCD2_4BIT
	public _WriteCommand2
	public _WriteData2
	public _LCD2_byte
	public _LCD2_pulse
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _waitms
	public _wait_us
	public _GetADC
	public _SPIWrite
	public __c51_external_startup
	public _LCD2print_PARM_3
	public _LCDprint_PARM_3
	public _LCD2print_PARM_2
	public _LCDprint_PARM_2
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_B              DATA 0xf0
_PSW            DATA 0xd0
_SP             DATA 0x81
_SPX            DATA 0xef
_DPL            DATA 0x82
_DPH            DATA 0x83
_DPLB           DATA 0xd4
_DPHB           DATA 0xd5
_PAGE           DATA 0xf6
_AX             DATA 0xe1
_BX             DATA 0xf7
_DSPR           DATA 0xe2
_FIRD           DATA 0xe3
_MACL           DATA 0xe4
_MACH           DATA 0xe5
_PCON           DATA 0x87
_AUXR           DATA 0x8e
_AUXR1          DATA 0xa2
_DPCF           DATA 0xa1
_CKRL           DATA 0x97
_CKCKON0        DATA 0x8f
_CKCKON1        DATA 0xaf
_CKSEL          DATA 0x85
_CLKREG         DATA 0xae
_OSCCON         DATA 0x85
_IE             DATA 0xa8
_IEN0           DATA 0xa8
_IEN1           DATA 0xb1
_IPH0           DATA 0xb7
_IP             DATA 0xb8
_IPL0           DATA 0xb8
_IPH1           DATA 0xb3
_IPL1           DATA 0xb2
_P0             DATA 0x80
_P1             DATA 0x90
_P2             DATA 0xa0
_P3             DATA 0xb0
_P4             DATA 0xc0
_P0M0           DATA 0xe6
_P0M1           DATA 0xe7
_P1M0           DATA 0xd6
_P1M1           DATA 0xd7
_P2M0           DATA 0xce
_P2M1           DATA 0xcf
_P3M0           DATA 0xc6
_P3M1           DATA 0xc7
_P4M0           DATA 0xbe
_P4M1           DATA 0xbf
_SCON           DATA 0x98
_SBUF           DATA 0x99
_SADEN          DATA 0xb9
_SADDR          DATA 0xa9
_BDRCON         DATA 0x9b
_BRL            DATA 0x9a
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TCONB          DATA 0x91
_TL0            DATA 0x8a
_TH0            DATA 0x8c
_TL1            DATA 0x8b
_TH1            DATA 0x8d
_RL0            DATA 0xf2
_RH0            DATA 0xf4
_RL1            DATA 0xf3
_RH1            DATA 0xf5
_WDTRST         DATA 0xa6
_WDTPRG         DATA 0xa7
_T2CON          DATA 0xc8
_T2MOD          DATA 0xc9
_RCAP2H         DATA 0xcb
_RCAP2L         DATA 0xca
_TH2            DATA 0xcd
_TL2            DATA 0xcc
_SPCON          DATA 0xc3
_SPSTA          DATA 0xc4
_SPDAT          DATA 0xc5
_SSCON          DATA 0x93
_SSCS           DATA 0x94
_SSDAT          DATA 0x95
_SSADR          DATA 0x96
_KBLS           DATA 0x9c
_KBE            DATA 0x9d
_KBF            DATA 0x9e
_KBMOD          DATA 0x9f
_BMSEL          DATA 0x92
_FCON           DATA 0xd1
_EECON          DATA 0xd2
_ACSRA          DATA 0xa3
_ACSRB          DATA 0xab
_AREF           DATA 0xbd
_DADC           DATA 0xa4
_DADI           DATA 0xa5
_DADL           DATA 0xac
_DADH           DATA 0xad
_CCON           DATA 0xd8
_CMOD           DATA 0xd9
_CL             DATA 0xe9
_CH             DATA 0xf9
_CCAPM0         DATA 0xda
_CCAPM1         DATA 0xdb
_CCAPM2         DATA 0xdc
_CCAPM3         DATA 0xdd
_CCAPM4         DATA 0xde
_CCAP0H         DATA 0xfa
_CCAP1H         DATA 0xfb
_CCAP2H         DATA 0xfc
_CCAP3H         DATA 0xfd
_CCAP4H         DATA 0xfe
_CCAP0L         DATA 0xea
_CCAP1L         DATA 0xeb
_CCAP2L         DATA 0xec
_CCAP3L         DATA 0xed
_CCAP4L         DATA 0xee
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_P              BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES             BIT 0xac
_ET2            BIT 0xad
_EC             BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS             BIT 0xbc
_PT2            BIT 0xbd
_IP0D           BIT 0xbf
_PPCL           BIT 0xbe
_PT2L           BIT 0xbd
_PLS            BIT 0xbc
_PT1L           BIT 0xbb
_PX1L           BIT 0xba
_PT0L           BIT 0xb9
_PX0L           BIT 0xb8
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_RXD            BIT 0xb0
_TXD            BIT 0xb1
_INT0           BIT 0xb2
_INT1           BIT 0xb3
_T0             BIT 0xb4
_T1             BIT 0xb5
_WR             BIT 0xb6
_RD             BIT 0xb7
_P4_0           BIT 0xc0
_P4_1           BIT 0xc1
_P4_2           BIT 0xc2
_P4_3           BIT 0xc3
_P4_4           BIT 0xc4
_P4_5           BIT 0xc5
_P4_6           BIT 0xc6
_P4_7           BIT 0xc7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_SM2            BIT 0x9d
_SM1            BIT 0x9e
_SM0            BIT 0x9f
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_CP_RL2         BIT 0xc8
_C_T2           BIT 0xc9
_TR2            BIT 0xca
_EXEN2          BIT 0xcb
_TCLK           BIT 0xcc
_RCLK           BIT 0xcd
_EXF2           BIT 0xce
_TF2            BIT 0xcf
_CF             BIT 0xdf
_CR             BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LCDprint_PARM_2:
	ds 1
_LCD2print_PARM_2:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
_LCD2print_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	initialize.h:30: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	initialize.h:33: P0M0=0; P0M1=0;
	mov	_P0M0,#0x00
	mov	_P0M1,#0x00
;	initialize.h:34: P1M0=0; P1M1=0;
	mov	_P1M0,#0x00
	mov	_P1M1,#0x00
;	initialize.h:35: P2M0=0; P2M1=0;
	mov	_P2M0,#0x00
	mov	_P2M1,#0x00
;	initialize.h:36: P3M0=0; P3M1=0;
	mov	_P3M0,#0x00
	mov	_P3M1,#0x00
;	initialize.h:39: PCON|=0x80;
	orl	_PCON,#0x80
;	initialize.h:40: SCON = 0x52;
	mov	_SCON,#0x52
;	initialize.h:41: BDRCON=0;
	mov	_BDRCON,#0x00
;	initialize.h:42: BRL=BRG_VAL;
	mov	_BRL,#0xF4
;	initialize.h:43: BDRCON=BRR|TBCK|RBCK|SPD;
	mov	_BDRCON,#0x1E
;	initialize.h:45: CLKREG=0x00; // TPS=0000B
	mov	_CLKREG,#0x00
;	initialize.h:47: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;out_byte                  Allocated to registers 
;------------------------------------------------------------
;	initialize.h:77: unsigned char SPIWrite(unsigned char out_byte)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	_ACC,dpl
;	initialize.h:82: BB_MOSI=ACC_7; BB_SCLK=1; B_7=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_7
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_7,c
	clr	_P2_3
;	initialize.h:83: BB_MOSI=ACC_6; BB_SCLK=1; B_6=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_6
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_6,c
	clr	_P2_3
;	initialize.h:84: BB_MOSI=ACC_5; BB_SCLK=1; B_5=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_5
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_5,c
	clr	_P2_3
;	initialize.h:85: BB_MOSI=ACC_4; BB_SCLK=1; B_4=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_4
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_4,c
	clr	_P2_3
;	initialize.h:86: BB_MOSI=ACC_3; BB_SCLK=1; B_3=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_3
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_3,c
	clr	_P2_3
;	initialize.h:87: BB_MOSI=ACC_2; BB_SCLK=1; B_2=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_2
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_2,c
	clr	_P2_3
;	initialize.h:88: BB_MOSI=ACC_1; BB_SCLK=1; B_1=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_1
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_1,c
	clr	_P2_3
;	initialize.h:89: BB_MOSI=ACC_0; BB_SCLK=1; B_0=BB_MISO; BB_SCLK=0;
	mov	c,_ACC_0
	mov	_P2_1,c
	setb	_P2_3
	mov	c,_P2_2
	mov	_B_0,c
	clr	_P2_3
;	initialize.h:91: return B;
	mov	dpl,_B
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetADC'
;------------------------------------------------------------
;channel                   Allocated to registers r2 
;adc                       Allocated to registers r3 r4 
;spid                      Allocated to registers r2 
;------------------------------------------------------------
;	initialize.h:95: unsigned int volatile GetADC(unsigned char channel)
;	-----------------------------------------
;	 function GetADC
;	-----------------------------------------
_GetADC:
	mov	r2,dpl
;	initialize.h:100: ADC_CE=0; // Activate the MCP3008 ADC.
	clr	_P2_0
;	initialize.h:102: SPIWrite(0x01);// Send the start bit.
	mov	dpl,#0x01
	push	ar2
	lcall	_SPIWrite
	pop	ar2
;	initialize.h:103: spid=SPIWrite((channel*0x10)|0x80);	//Send single/diff* bit, D2, D1, and D0 bits.
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	r2,a
	mov	a,#0x80
	orl	a,r2
	mov	dpl,a
	lcall	_SPIWrite
	mov	r2,dpl
;	initialize.h:104: adc=((spid & 0x03)*0x100);// spid has the two most significant bits of the result.
	mov	a,#0x03
	anl	a,r2
	mov	r4,a
	mov	r3,#0x00
;	initialize.h:105: spid=SPIWrite(0x00);// It doesn't matter what we send now.
	mov	dpl,#0x00
	push	ar3
	push	ar4
	lcall	_SPIWrite
	mov	r2,dpl
	pop	ar4
	pop	ar3
;	initialize.h:106: adc+=spid;// spid contains the low part of the result. 
	mov	r5,#0x00
	mov	a,r2
	add	a,r3
	mov	r3,a
	mov	a,r5
	addc	a,r4
	mov	r4,a
;	initialize.h:108: ADC_CE=1; // Deactivate the MCP3008 ADC.
	setb	_P2_0
;	initialize.h:110: return adc;
	mov	dpl,r3
	mov	dph,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wait_us'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	initialize.h:118: void wait_us (unsigned char x)
;	-----------------------------------------
;	 function wait_us
;	-----------------------------------------
_wait_us:
	mov	r2,dpl
;	initialize.h:122: TR0=0; // Stop timer 0
	clr	_TR0
;	initialize.h:123: TMOD&=0xf0; // Clear the configuration bits for timer 0
	anl	_TMOD,#0xF0
;	initialize.h:124: TMOD|=0x01; // Mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	initialize.h:126: if(x>5) x-=5; // Subtract the overhead
	mov	a,r2
	add	a,#0xff - 0x05
	jnc	L005002?
	mov	a,r2
	add	a,#0xfb
	mov	r2,a
	sjmp	L005003?
L005002?:
;	initialize.h:127: else x=1;
	mov	r2,#0x01
L005003?:
;	initialize.h:129: j=-ONE_USEC*x;
	mov	__mullong_PARM_2,r2
	mov	(__mullong_PARM_2 + 1),#0x00
	mov	(__mullong_PARM_2 + 2),#0x00
	mov	(__mullong_PARM_2 + 3),#0x00
	mov	dptr,#0xFFEA
	mov	a,#0xFF
	mov	b,a
	lcall	__mullong
	mov	r2,dpl
	mov	r3,dph
;	initialize.h:130: TF0=0;
	clr	_TF0
;	initialize.h:131: TH0=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_TH0,r4
;	initialize.h:132: TL0=j%0x100;
	mov	r3,#0x00
	mov	_TL0,r2
;	initialize.h:133: TR0=1; // Start timer 0
	setb	_TR0
;	initialize.h:134: while(TF0==0); //Wait for overflow
L005004?:
	jnb	_TF0,L005004?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	initialize.h:137: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	initialize.h:141: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L006005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L006009?
;	initialize.h:142: for (k=0; k<4; k++) wait_us(250);
	mov	r6,#0x00
L006001?:
	cjne	r6,#0x04,L006018?
L006018?:
	jnc	L006007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_wait_us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L006001?
L006007?:
;	initialize.h:141: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L006005?
	inc	r5
	sjmp	L006005?
L006009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	initialize.h:145: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	initialize.h:147: LCD_E=1;
	setb	_P2_4
;	initialize.h:148: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
;	initialize.h:149: LCD_E=0;
	clr	_P2_4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	initialize.h:152: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	initialize.h:155: ACC=x; //Send high nible
	mov	_ACC,r2
;	initialize.h:156: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P3_7,c
;	initialize.h:157: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P3_6,c
;	initialize.h:158: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P3_5,c
;	initialize.h:159: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P3_4,c
;	initialize.h:160: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	initialize.h:161: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
	pop	ar2
;	initialize.h:162: ACC=x; //Send low nible
	mov	_ACC,r2
;	initialize.h:163: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P3_7,c
;	initialize.h:164: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P3_6,c
;	initialize.h:165: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P3_5,c
;	initialize.h:166: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P3_4,c
;	initialize.h:167: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	initialize.h:170: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	initialize.h:172: LCD_RS=1;
	setb	_P2_5
;	initialize.h:173: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	initialize.h:174: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	initialize.h:177: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	initialize.h:179: LCD_RS=0;
	clr	_P2_5
;	initialize.h:180: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	initialize.h:181: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	initialize.h:184: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	initialize.h:186: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_4
;	initialize.h:188: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	initialize.h:190: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	initialize.h:191: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	initialize.h:192: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	initialize.h:195: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	initialize.h:196: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	initialize.h:197: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	initialize.h:198: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	initialize.h:201: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	initialize.h:205: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L012013?
	mov	r5,#0xC0
	sjmp	L012014?
L012013?:
	mov	r5,#0x80
L012014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	initialize.h:206: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	initialize.h:207: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L012003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L012006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L012003?
	inc	r6
	sjmp	L012003?
L012006?:
;	initialize.h:208: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L012011?
	mov	ar2,r5
	mov	ar3,r6
L012007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L012011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L012007?
	inc	r3
	sjmp	L012007?
L012011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD2_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	initialize.h:211: void LCD2_pulse (void)
;	-----------------------------------------
;	 function LCD2_pulse
;	-----------------------------------------
_LCD2_pulse:
;	initialize.h:213: LCD2_E=1;
	setb	_P2_7
;	initialize.h:214: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
;	initialize.h:215: LCD2_E=0;
	clr	_P2_7
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD2_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	initialize.h:218: void LCD2_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD2_byte
;	-----------------------------------------
_LCD2_byte:
	mov	r2,dpl
;	initialize.h:221: ACC=x; //Send high nible
	mov	_ACC,r2
;	initialize.h:222: LCD2_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P0_1,c
;	initialize.h:223: LCD2_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P0_2,c
;	initialize.h:224: LCD2_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P0_3,c
;	initialize.h:225: LCD2_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P0_4,c
;	initialize.h:226: LCD2_pulse();
	push	ar2
	lcall	_LCD2_pulse
;	initialize.h:227: wait_us(40);
	mov	dpl,#0x28
	lcall	_wait_us
	pop	ar2
;	initialize.h:228: ACC=x; //Send low nible
	mov	_ACC,r2
;	initialize.h:229: LCD2_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P0_1,c
;	initialize.h:230: LCD2_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P0_2,c
;	initialize.h:231: LCD2_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P0_3,c
;	initialize.h:232: LCD2_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P0_4,c
;	initialize.h:233: LCD2_pulse();
	ljmp	_LCD2_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData2'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	initialize.h:236: void WriteData2 (unsigned char x)
;	-----------------------------------------
;	 function WriteData2
;	-----------------------------------------
_WriteData2:
	mov	r2,dpl
;	initialize.h:238: LCD2_RS=1;
	setb	_P2_6
;	initialize.h:239: LCD2_byte(x);
	mov	dpl,r2
	lcall	_LCD2_byte
;	initialize.h:240: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand2'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	initialize.h:243: void WriteCommand2 (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand2
;	-----------------------------------------
_WriteCommand2:
	mov	r2,dpl
;	initialize.h:245: LCD2_RS=0;
	clr	_P2_6
;	initialize.h:246: LCD2_byte(x);
	mov	dpl,r2
	lcall	_LCD2_byte
;	initialize.h:247: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD2_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	initialize.h:250: void LCD2_4BIT (void)
;	-----------------------------------------
;	 function LCD2_4BIT
;	-----------------------------------------
_LCD2_4BIT:
;	initialize.h:252: LCD2_E=0; // Resting state of LCD's enable is zero
	clr	_P2_7
;	initialize.h:254: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	initialize.h:256: WriteCommand2(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand2
;	initialize.h:257: WriteCommand2(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand2
;	initialize.h:258: WriteCommand2(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand2
;	initialize.h:261: WriteCommand2(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand2
;	initialize.h:262: WriteCommand2(0x0);
	mov	dpl,#0x00
	lcall	_WriteCommand2
;	initialize.h:263: WriteCommand2(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand2
;	initialize.h:264: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD2print'
;------------------------------------------------------------
;line                      Allocated with name '_LCD2print_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	initialize.h:267: void LCD2print(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCD2print
;	-----------------------------------------
_LCD2print:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	initialize.h:271: WriteCommand2(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCD2print_PARM_2,L018013?
	mov	r5,#0xC0
	sjmp	L018014?
L018013?:
	mov	r5,#0x80
L018014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand2
;	initialize.h:272: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	initialize.h:273: for(j=0; string[j]!=0; j++)	WriteData2(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L018003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L018006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData2
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L018003?
	inc	r6
	sjmp	L018003?
L018006?:
;	initialize.h:274: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData2(' '); // Clear the rest of the line
	jnb	_LCD2print_PARM_3,L018011?
	mov	ar2,r5
	mov	ar3,r6
L018007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L018011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData2
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L018007?
	inc	r3
	sjmp	L018007?
L018011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;i                         Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	initialize.h:277: void delay(void)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
;	initialize.h:280: for(i=0; i<10000; i++)
	mov	r2,#0x00
	mov	r3,#0x00
L019004?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0xa7
	jnc	L019008?
;	initialize.h:282: for(j=0; j<10000; j++)
	mov	r4,#0x10
	mov	r5,#0x27
L019003?:
	dec	r4
	cjne	r4,#0xff,L019017?
	dec	r5
L019017?:
	mov	a,r4
	orl	a,r5
	jnz	L019003?
;	initialize.h:280: for(i=0; i<10000; i++)
	inc	r2
	cjne	r2,#0x00,L019004?
	inc	r3
	sjmp	L019004?
L019008?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	main.c:3: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c:5: P3M0=0;
	mov	_P3M0,#0x00
;	main.c:6: P3M1=0;
	mov	_P3M1,#0x00
;	main.c:7: while(1)
L020002?:
;	main.c:9: blink();
	lcall	_blink
	sjmp	L020002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
