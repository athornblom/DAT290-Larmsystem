   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB123:
  25              		.file 1 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.c"
   1:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** /*
   2:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****  * 	startup.c
   3:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****  *
   4:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****  */
   5:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx_gpio.h"
   6:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx.h"
   7:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx_rcc.h"
   8:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
   9:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  10:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  11:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  12:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void startup ( void )
  13:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
  26              		.loc 1 13 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  14:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** __asm volatile(
  31              		.loc 1 14 0
  32              		.syntax divided
  33              	@ 14 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  15:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  16:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	" MOV SP,R0\n"
  17:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	" BL main\n"				/* call main */
  18:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	"_exit: B .\n"				/* never return */
  19:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	) ;
  20:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
  40              		.loc 1 20 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE123:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB124:
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void app_init(){
  57              		.loc 1 22 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 8
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 82B0     		sub	sp, sp, #8
  66              		.cfi_def_cfa_offset 16
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  23:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** /*  Function used to set the GPIO configuration to the default reset state ****/
  24:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_InitTypeDef init;
  25:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  26:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
  69              		.loc 1 26 0
  70 0006 0121     		movs	r1, #1
  71 0008 0120     		movs	r0, #1
  72 000a FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  27:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_StructInit(&init);
  73              		.loc 1 27 0
  74 000e 3B00     		movs	r3, r7
  75 0010 1800     		movs	r0, r3
  76 0012 FFF7FEFF 		bl	GPIO_StructInit
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Pin = GPIO_Pin_1;
  77              		.loc 1 29 0
  78 0016 3B00     		movs	r3, r7
  79 0018 0222     		movs	r2, #2
  80 001a 1A60     		str	r2, [r3]
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Mode = GPIO_Mode_OUT;
  81              		.loc 1 30 0
  82 001c 3B00     		movs	r3, r7
  83 001e 0122     		movs	r2, #1
  84 0020 1A71     		strb	r2, [r3, #4]
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_OType = GPIO_OType_PP;
  85              		.loc 1 31 0
  86 0022 3B00     		movs	r3, r7
  87 0024 0022     		movs	r2, #0
  88 0026 9A71     		strb	r2, [r3, #6]
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Init(GPIOA,&init);
  89              		.loc 1 34 0
  90 0028 3B00     		movs	r3, r7
  91 002a 0E4A     		ldr	r2, .L3
  92 002c 1900     		movs	r1, r3
  93 002e 1000     		movs	r0, r2
  94 0030 FFF7FEFF 		bl	GPIO_Init
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** //konfigurerar inport
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_StructInit(&init);
  95              		.loc 1 37 0
  96 0034 3B00     		movs	r3, r7
  97 0036 1800     		movs	r0, r3
  98 0038 FFF7FEFF 		bl	GPIO_StructInit
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Pin = GPIO_Pin_2;
  99              		.loc 1 38 0
 100 003c 3B00     		movs	r3, r7
 101 003e 0422     		movs	r2, #4
 102 0040 1A60     		str	r2, [r3]
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Mode = GPIO_Mode_IN;
 103              		.loc 1 39 0
 104 0042 3B00     		movs	r3, r7
 105 0044 0022     		movs	r2, #0
 106 0046 1A71     		strb	r2, [r3, #4]
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 107              		.loc 1 40 0
 108 0048 3B00     		movs	r3, r7
 109 004a 0122     		movs	r2, #1
 110 004c DA71     		strb	r2, [r3, #7]
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Init(GPIOA,&init);
 111              		.loc 1 41 0
 112 004e 3B00     		movs	r3, r7
 113 0050 044A     		ldr	r2, .L3
 114 0052 1900     		movs	r1, r3
 115 0054 1000     		movs	r0, r2
 116 0056 FFF7FEFF 		bl	GPIO_Init
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 117              		.loc 1 42 0
 118 005a C046     		nop
 119 005c BD46     		mov	sp, r7
 120 005e 02B0     		add	sp, sp, #8
 121              		@ sp needed
 122 0060 80BD     		pop	{r7, pc}
 123              	.L4:
 124 0062 C046     		.align	2
 125              	.L3:
 126 0064 00000240 		.word	1073872896
 127              		.cfi_endproc
 128              	.LFE124:
 130              		.align	1
 131              		.global	main
 132              		.syntax unified
 133              		.code	16
 134              		.thumb_func
 135              		.fpu softvfp
 137              	main:
 138              	.LFB125:
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void main(void)
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 139              		.loc 1 44 0
 140              		.cfi_startproc
 141              		@ args = 0, pretend = 0, frame = 0
 142              		@ frame_needed = 1, uses_anonymous_args = 0
 143 0068 80B5     		push	{r7, lr}
 144              		.cfi_def_cfa_offset 8
 145              		.cfi_offset 7, -8
 146              		.cfi_offset 14, -4
 147 006a 00AF     		add	r7, sp, #0
 148              		.cfi_def_cfa_register 7
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	app_init();
 149              		.loc 1 45 0
 150 006c FFF7FEFF 		bl	app_init
 151              	.L8:
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	while (1) {
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		if (GPIO_ReadInputData(GPIOA) & (1<<2)) {
 152              		.loc 1 48 0
 153 0070 0A4B     		ldr	r3, .L9
 154 0072 1800     		movs	r0, r3
 155 0074 FFF7FEFF 		bl	GPIO_ReadInputData
 156 0078 0300     		movs	r3, r0
 157 007a 1A00     		movs	r2, r3
 158 007c 0423     		movs	r3, #4
 159 007e 1340     		ands	r3, r2
 160 0080 05D0     		beq	.L6
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			GPIO_SetBits(GPIOA,GPIO_Pin_1);
 161              		.loc 1 49 0
 162 0082 064B     		ldr	r3, .L9
 163 0084 0221     		movs	r1, #2
 164 0086 1800     		movs	r0, r3
 165 0088 FFF7FEFF 		bl	GPIO_SetBits
 166 008c F0E7     		b	.L8
 167              	.L6:
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		} else {
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			GPIO_ResetBits(GPIOA,GPIO_Pin_1);
 168              		.loc 1 51 0
 169 008e 034B     		ldr	r3, .L9
 170 0090 0221     		movs	r1, #2
 171 0092 1800     		movs	r0, r3
 172 0094 FFF7FEFF 		bl	GPIO_ResetBits
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			GPIO_SetBits(GPIOA,GPIO_Pin_1);
 173              		.loc 1 48 0
 174 0098 EAE7     		b	.L8
 175              	.L10:
 176 009a C046     		.align	2
 177              	.L9:
 178 009c 00000240 		.word	1073872896
 179              		.cfi_endproc
 180              	.LFE125:
 182              	.Letext0:
 183              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 184              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 185              		.file 4 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
 186              		.file 5 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 187              		.file 6 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 188              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
