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
  49              		.global	init_GPIOA
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_GPIOA:
  56              	.LFB124:
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void init_GPIOA(){
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
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
  77              		.loc 1 28 0
  78 0016 3B00     		movs	r3, r7
  79 0018 AA22     		movs	r2, #170
  80 001a 1A60     		str	r2, [r3]
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Mode = GPIO_Mode_OUT;
  81              		.loc 1 29 0
  82 001c 3B00     		movs	r3, r7
  83 001e 0122     		movs	r2, #1
  84 0020 1A71     		strb	r2, [r3, #4]
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_OType = GPIO_OType_PP;
  85              		.loc 1 30 0
  86 0022 3B00     		movs	r3, r7
  87 0024 0022     		movs	r2, #0
  88 0026 9A71     		strb	r2, [r3, #6]
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Init(GPIOA,&init);
  89              		.loc 1 31 0
  90 0028 3B00     		movs	r3, r7
  91 002a 0E4A     		ldr	r2, .L3
  92 002c 1900     		movs	r1, r3
  93 002e 1000     		movs	r0, r2
  94 0030 FFF7FEFF 		bl	GPIO_Init
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** //konfigurerar inport
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_StructInit(&init);
  95              		.loc 1 34 0
  96 0034 3B00     		movs	r3, r7
  97 0036 1800     		movs	r0, r3
  98 0038 FFF7FEFF 		bl	GPIO_StructInit
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
  99              		.loc 1 35 0
 100 003c 3B00     		movs	r3, r7
 101 003e 5522     		movs	r2, #85
 102 0040 1A60     		str	r2, [r3]
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Mode = GPIO_Mode_IN;
 103              		.loc 1 36 0
 104 0042 3B00     		movs	r3, r7
 105 0044 0022     		movs	r2, #0
 106 0046 1A71     		strb	r2, [r3, #4]
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 107              		.loc 1 37 0
 108 0048 3B00     		movs	r3, r7
 109 004a 0122     		movs	r2, #1
 110 004c DA71     		strb	r2, [r3, #7]
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Init(GPIOA,&init);
 111              		.loc 1 38 0
 112 004e 3B00     		movs	r3, r7
 113 0050 044A     		ldr	r2, .L3
 114 0052 1900     		movs	r1, r3
 115 0054 1000     		movs	r0, r2
 116 0056 FFF7FEFF 		bl	GPIO_Init
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 117              		.loc 1 41 0
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
 131              		.global	app_init
 132              		.syntax unified
 133              		.code	16
 134              		.thumb_func
 135              		.fpu softvfp
 137              	app_init:
 138              	.LFB125:
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void app_init() {
 139              		.loc 1 43 0
 140              		.cfi_startproc
 141              		@ args = 0, pretend = 0, frame = 0
 142              		@ frame_needed = 1, uses_anonymous_args = 0
 143 0068 80B5     		push	{r7, lr}
 144              		.cfi_def_cfa_offset 8
 145              		.cfi_offset 7, -8
 146              		.cfi_offset 14, -4
 147 006a 00AF     		add	r7, sp, #0
 148              		.cfi_def_cfa_register 7
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 149              		.loc 1 45 0
 150 006c C046     		nop
 151 006e BD46     		mov	sp, r7
 152              		@ sp needed
 153 0070 80BD     		pop	{r7, pc}
 154              		.cfi_endproc
 155              	.LFE125:
 157              		.section	.rodata
 158              		.align	2
 159              	.LC0:
 160 0000 0100     		.short	1
 161 0002 0200     		.short	2
 162 0004 0400     		.short	4
 163 0006 0800     		.short	8
 164 0008 1000     		.short	16
 165 000a 2000     		.short	32
 166 000c 4000     		.short	64
 167 000e 8000     		.short	128
 168 0010 0001     		.short	256
 169 0012 0002     		.short	512
 170 0014 0004     		.short	1024
 171 0016 0008     		.short	2048
 172 0018 0010     		.short	4096
 173 001a 0020     		.short	8192
 174 001c 0040     		.short	16384
 175 001e 0080     		.short	-32768
 176              		.text
 177              		.align	1
 178              		.global	main
 179              		.syntax unified
 180              		.code	16
 181              		.thumb_func
 182              		.fpu softvfp
 184              	main:
 185              	.LFB126:
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void main(void)
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 186              		.loc 1 49 0
 187              		.cfi_startproc
 188              		@ args = 0, pretend = 0, frame = 40
 189              		@ frame_needed = 1, uses_anonymous_args = 0
 190 0072 90B5     		push	{r4, r7, lr}
 191              		.cfi_def_cfa_offset 12
 192              		.cfi_offset 4, -12
 193              		.cfi_offset 7, -8
 194              		.cfi_offset 14, -4
 195 0074 8BB0     		sub	sp, sp, #44
 196              		.cfi_def_cfa_offset 56
 197 0076 00AF     		add	r7, sp, #0
 198              		.cfi_def_cfa_register 7
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	// För iteration av samtliga GPIO_pins i loopar.
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	uint16_t GPIO_Pins[] = {
 199              		.loc 1 51 0
 200 0078 3B1D     		adds	r3, r7, #4
 201 007a 194A     		ldr	r2, .L12
 202 007c 13CA     		ldmia	r2!, {r0, r1, r4}
 203 007e 13C3     		stmia	r3!, {r0, r1, r4}
 204 0080 13CA     		ldmia	r2!, {r0, r1, r4}
 205 0082 13C3     		stmia	r3!, {r0, r1, r4}
 206 0084 03CA     		ldmia	r2!, {r0, r1}
 207 0086 03C3     		stmia	r3!, {r0, r1}
  52:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3,
  53:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_4, GPIO_Pin_5, GPIO_Pin_6, GPIO_Pin_7,
  54:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
  55:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15
  56:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		};
  57:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** //	app_init();  Vad ska hända här?
  59:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init_GPIOA();
 208              		.loc 1 59 0
 209 0088 FFF7FEFF 		bl	init_GPIOA
 210              	.L11:
 211              	.LBB2:
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  61:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		
  62:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	// Main Loop
  63:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	while(1){
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		for (int i = 0; i < sizeof(GPIO_Pins); i+=2)
 212              		.loc 1 64 0
 213 008c 0023     		movs	r3, #0
 214 008e 7B62     		str	r3, [r7, #36]
 215 0090 22E0     		b	.L7
 216              	.L10:
  65:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
  66:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			if(GPIO_ReadInputDataBit(GPIOA,GPIO_Pins[i]))
 217              		.loc 1 66 0
 218 0092 3B1D     		adds	r3, r7, #4
 219 0094 7A6A     		ldr	r2, [r7, #36]
 220 0096 5200     		lsls	r2, r2, #1
 221 0098 D35A     		ldrh	r3, [r2, r3]
 222 009a 124A     		ldr	r2, .L12+4
 223 009c 1900     		movs	r1, r3
 224 009e 1000     		movs	r0, r2
 225 00a0 FFF7FEFF 		bl	GPIO_ReadInputDataBit
 226 00a4 031E     		subs	r3, r0, #0
 227 00a6 0AD0     		beq	.L8
  67:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			{
  68:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				GPIO_ResetBits(GPIOA,GPIO_Pins[i+1]);
 228              		.loc 1 68 0
 229 00a8 7B6A     		ldr	r3, [r7, #36]
 230 00aa 5A1C     		adds	r2, r3, #1
 231 00ac 3B1D     		adds	r3, r7, #4
 232 00ae 5200     		lsls	r2, r2, #1
 233 00b0 D35A     		ldrh	r3, [r2, r3]
 234 00b2 0C4A     		ldr	r2, .L12+4
 235 00b4 1900     		movs	r1, r3
 236 00b6 1000     		movs	r0, r2
 237 00b8 FFF7FEFF 		bl	GPIO_ResetBits
 238 00bc 09E0     		b	.L9
 239              	.L8:
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			}else{
  70:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				GPIO_SetBits(GPIOA,GPIO_Pins[i+1]);
 240              		.loc 1 70 0
 241 00be 7B6A     		ldr	r3, [r7, #36]
 242 00c0 5A1C     		adds	r2, r3, #1
 243 00c2 3B1D     		adds	r3, r7, #4
 244 00c4 5200     		lsls	r2, r2, #1
 245 00c6 D35A     		ldrh	r3, [r2, r3]
 246 00c8 064A     		ldr	r2, .L12+4
 247 00ca 1900     		movs	r1, r3
 248 00cc 1000     		movs	r0, r2
 249 00ce FFF7FEFF 		bl	GPIO_SetBits
 250              	.L9:
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 251              		.loc 1 64 0 discriminator 2
 252 00d2 7B6A     		ldr	r3, [r7, #36]
 253 00d4 0233     		adds	r3, r3, #2
 254 00d6 7B62     		str	r3, [r7, #36]
 255              	.L7:
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 256              		.loc 1 64 0 is_stmt 0 discriminator 1
 257 00d8 7B6A     		ldr	r3, [r7, #36]
 258 00da 1F2B     		cmp	r3, #31
 259 00dc D9D9     		bls	.L10
 260              	.LBE2:
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 261              		.loc 1 64 0
 262 00de D5E7     		b	.L11
 263              	.L13:
 264              		.align	2
 265              	.L12:
 266 00e0 00000000 		.word	.LC0
 267 00e4 00000240 		.word	1073872896
 268              		.cfi_endproc
 269              	.LFE126:
 271              	.Letext0:
 272              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 273              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 274              		.file 4 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
 275              		.file 5 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 276              		.file 6 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 277              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
