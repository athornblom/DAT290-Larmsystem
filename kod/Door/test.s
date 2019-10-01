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
  11              		.file	"USART.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.bss
  16              		.align	2
  17              	txBuffer:
  18 0000 00000000 		.space	4
  20              		.align	2
  21              	rxBuffer:
  22 0004 00000000 		.space	4
  24              		.align	2
  25              	realTxBuffer:
  26 0008 00000000 		.space	103
  26      00000000 
  26      00000000 
  26      00000000 
  26      00000000 
  28 006f 00       		.align	2
  29              	realRxBuffer:
  30 0070 00000000 		.space	103
  30      00000000 
  30      00000000 
  30      00000000 
  30      00000000 
  32              		.text
  33              		.align	1
  34              		.global	USART1_IRQHandler
  35              		.syntax unified
  36              		.code	16
  37              		.thumb_func
  38              		.fpu softvfp
  40              	USART1_IRQHandler:
  41              	.LFB123:
  42              		.file 1 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/USART.c"
   1:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include "USART.h"
   2:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
   3:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include "buffer.h"
   4:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include "misc.h"
   5:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include "core_cm4.h"
   6:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include "stm32f4xx_usart.h"
   7:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include "stm32f4xx_gpio.h"
   8:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include "stm32f4xx_rcc.h"
   9:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** #include <math.h>
  10:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  11:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  12:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Buffertar för mottagning och sändning
  13:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Pekare för att slippa skicka adresser med & hela tiden
  14:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** static FIFO *txBuffer, *rxBuffer, realTxBuffer, realRxBuffer;
  15:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** /*uint8_t digitToPrintable(uint8_t inDigit);
  16:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t charToPrintable(uint8_t inChar);*/
  17:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  18:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Avbrottshantering för USART1
  19:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** void USART1_IRQHandler(void){
  43              		.loc 1 19 0
  44              		.cfi_startproc
  45              		@ args = 0, pretend = 0, frame = 8
  46              		@ frame_needed = 1, uses_anonymous_args = 0
  47 0000 90B5     		push	{r4, r7, lr}
  48              		.cfi_def_cfa_offset 12
  49              		.cfi_offset 4, -12
  50              		.cfi_offset 7, -8
  51              		.cfi_offset 14, -4
  52 0002 83B0     		sub	sp, sp, #12
  53              		.cfi_def_cfa_offset 24
  54 0004 00AF     		add	r7, sp, #0
  55              		.cfi_def_cfa_register 7
  20:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Avbrott orsakat av mottaget meddelande
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     if(USART_GetITStatus(USART1, USART_IT_RXNE) == SET){
  56              		.loc 1 21 0
  57 0006 1F4A     		ldr	r2, .L7
  58 0008 1F4B     		ldr	r3, .L7+4
  59 000a 1100     		movs	r1, r2
  60 000c 1800     		movs	r0, r3
  61 000e FFF7FEFF 		bl	USART_GetITStatus
  62 0012 0300     		movs	r3, r0
  63 0014 012B     		cmp	r3, #1
  64 0016 0BD1     		bne	.L2
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Skriver inkommen medelande till rxBuffer
  23:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         bufferPut(rxBuffer, USART_ReceiveData(USART1));
  65              		.loc 1 23 0
  66 0018 1C4B     		ldr	r3, .L7+8
  67 001a 1C68     		ldr	r4, [r3]
  68 001c 1A4B     		ldr	r3, .L7+4
  69 001e 1800     		movs	r0, r3
  70 0020 FFF7FEFF 		bl	USART_ReceiveData
  71 0024 0300     		movs	r3, r0
  72 0026 DBB2     		uxtb	r3, r3
  73 0028 1900     		movs	r1, r3
  74 002a 2000     		movs	r0, r4
  75 002c FFF7FEFF 		bl	bufferPut
  76              	.L2:
  24:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Fundering ska vi ha något sätt att meddela att vi
  25:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //har missat meddelande på grund av full buffer?
  26:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     }
  27:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Avbrott orsakat av att registret för sändning är tomt
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     if(USART_GetITStatus(USART1, USART_IT_TXE) == SET){
  77              		.loc 1 29 0
  78 0030 174A     		ldr	r2, .L7+12
  79 0032 154B     		ldr	r3, .L7+4
  80 0034 1100     		movs	r1, r2
  81 0036 1800     		movs	r0, r3
  82 0038 FFF7FEFF 		bl	USART_GetITStatus
  83 003c 0300     		movs	r3, r0
  84 003e 012B     		cmp	r3, #1
  85 0040 1CD1     		bne	.L6
  86              	.LBB2:
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Försöker läsa från txBuffer
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         uint8_t data;
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         uint8_t readOk = bufferGet(txBuffer,&data);
  87              		.loc 1 32 0
  88 0042 144B     		ldr	r3, .L7+16
  89 0044 1B68     		ldr	r3, [r3]
  90 0046 FC1D     		adds	r4, r7, #7
  91 0048 BA1D     		adds	r2, r7, #6
  92 004a 1100     		movs	r1, r2
  93 004c 1800     		movs	r0, r3
  94 004e FFF7FEFF 		bl	bufferGet
  95 0052 0300     		movs	r3, r0
  96 0054 2370     		strb	r3, [r4]
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Om vi lyckades skickar vi data
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Annars är buffern tom och vi avativerar avbrott för att skicka
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         if(readOk) {
  97              		.loc 1 36 0
  98 0056 FB1D     		adds	r3, r7, #7
  99 0058 1B78     		ldrb	r3, [r3]
 100 005a 002B     		cmp	r3, #0
 101 005c 08D0     		beq	.L4
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****             USART_SendData(USART1,data);
 102              		.loc 1 37 0
 103 005e BB1D     		adds	r3, r7, #6
 104 0060 1B78     		ldrb	r3, [r3]
 105 0062 9BB2     		uxth	r3, r3
 106 0064 084A     		ldr	r2, .L7+4
 107 0066 1900     		movs	r1, r3
 108 0068 1000     		movs	r0, r2
 109 006a FFF7FEFF 		bl	USART_SendData
 110              	.LBE2:
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         } else{
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****             USART_ITConfig(USART1, USART_IT_TXE, DISABLE);
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         }
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     }
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** }
 111              		.loc 1 42 0
 112 006e 05E0     		b	.L6
 113              	.L4:
 114              	.LBB3:
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         }
 115              		.loc 1 39 0
 116 0070 0749     		ldr	r1, .L7+12
 117 0072 054B     		ldr	r3, .L7+4
 118 0074 0022     		movs	r2, #0
 119 0076 1800     		movs	r0, r3
 120 0078 FFF7FEFF 		bl	USART_ITConfig
 121              	.L6:
 122              	.LBE3:
 123              		.loc 1 42 0
 124 007c C046     		nop
 125 007e BD46     		mov	sp, r7
 126 0080 03B0     		add	sp, sp, #12
 127              		@ sp needed
 128 0082 90BD     		pop	{r4, r7, pc}
 129              	.L8:
 130              		.align	2
 131              	.L7:
 132 0084 25050000 		.word	1317
 133 0088 00100140 		.word	1073811456
 134 008c 04000000 		.word	rxBuffer
 135 0090 27070000 		.word	1831
 136 0094 00000000 		.word	txBuffer
 137              		.cfi_endproc
 138              	.LFE123:
 140              		.align	1
 141              		.global	USARTConfig
 142              		.syntax unified
 143              		.code	16
 144              		.thumb_func
 145              		.fpu softvfp
 147              	USARTConfig:
 148              	.LFB124:
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Sätter upp USART1
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** void USARTConfig(void){
 149              		.loc 1 45 0
 150              		.cfi_startproc
 151              		@ args = 0, pretend = 0, frame = 32
 152              		@ frame_needed = 1, uses_anonymous_args = 0
 153 0098 90B5     		push	{r4, r7, lr}
 154              		.cfi_def_cfa_offset 12
 155              		.cfi_offset 4, -12
 156              		.cfi_offset 7, -8
 157              		.cfi_offset 14, -4
 158 009a 89B0     		sub	sp, sp, #36
 159              		.cfi_def_cfa_offset 48
 160 009c 00AF     		add	r7, sp, #0
 161              		.cfi_def_cfa_register 7
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Sätter bufferpekarna
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     txBuffer = &realTxBuffer;
 162              		.loc 1 47 0
 163 009e 3F4B     		ldr	r3, .L10
 164 00a0 3F4A     		ldr	r2, .L10+4
 165 00a2 1A60     		str	r2, [r3]
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     rxBuffer = &realRxBuffer;
 166              		.loc 1 48 0
 167 00a4 3F4B     		ldr	r3, .L10+8
 168 00a6 404A     		ldr	r2, .L10+12
 169 00a8 1A60     		str	r2, [r3]
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Nollställer vår buffertar
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     bufferInit(txBuffer);
 170              		.loc 1 51 0
 171 00aa 3C4B     		ldr	r3, .L10
 172 00ac 1B68     		ldr	r3, [r3]
 173 00ae 1800     		movs	r0, r3
 174 00b0 FFF7FEFF 		bl	bufferInit
  52:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     bufferInit(rxBuffer);
 175              		.loc 1 52 0
 176 00b4 3B4B     		ldr	r3, .L10+8
 177 00b6 1B68     		ldr	r3, [r3]
 178 00b8 1800     		movs	r0, r3
 179 00ba FFF7FEFF 		bl	bufferInit
  53:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  54:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Aktiverar klockorna för USART1, Port A
  55:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
 180              		.loc 1 55 0
 181 00be 0121     		movs	r1, #1
 182 00c0 1020     		movs	r0, #16
 183 00c2 FFF7FEFF 		bl	RCC_APB2PeriphClockCmd
  56:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
 184              		.loc 1 56 0
 185 00c6 0121     		movs	r1, #1
 186 00c8 0120     		movs	r0, #1
 187 00ca FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  57:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Aktiverar alternativ funktion USART1 för port A pinnar 9 och 10
  59:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_PinAFConfig(GPIOA, GPIO_Pin_9, GPIO_AF_USART1);
 188              		.loc 1 59 0
 189 00ce 8023     		movs	r3, #128
 190 00d0 9B00     		lsls	r3, r3, #2
 191 00d2 3648     		ldr	r0, .L10+16
 192 00d4 0722     		movs	r2, #7
 193 00d6 1900     		movs	r1, r3
 194 00d8 FFF7FEFF 		bl	GPIO_PinAFConfig
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_PinAFConfig(GPIOA, GPIO_Pin_10, GPIO_AF_USART1);
 195              		.loc 1 60 0
 196 00dc 8023     		movs	r3, #128
 197 00de DB00     		lsls	r3, r3, #3
 198 00e0 3248     		ldr	r0, .L10+16
 199 00e2 0722     		movs	r2, #7
 200 00e4 1900     		movs	r1, r3
 201 00e6 FFF7FEFF 		bl	GPIO_PinAFConfig
  61:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  62:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Konfigurerar USART1 Tx och Rx som alternativ funktion push-pull
  63:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitTypeDef GPIO_InitStructure;
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
 202              		.loc 1 64 0
 203 00ea 1821     		movs	r1, #24
 204 00ec 7B18     		adds	r3, r7, r1
 205 00ee 0222     		movs	r2, #2
 206 00f0 1A71     		strb	r2, [r3, #4]
  65:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
 207              		.loc 1 65 0
 208 00f2 7B18     		adds	r3, r7, r1
 209 00f4 0322     		movs	r2, #3
 210 00f6 5A71     		strb	r2, [r3, #5]
  66:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
 211              		.loc 1 66 0
 212 00f8 7B18     		adds	r3, r7, r1
 213 00fa 0022     		movs	r2, #0
 214 00fc 9A71     		strb	r2, [r3, #6]
  67:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
 215              		.loc 1 67 0
 216 00fe 7B18     		adds	r3, r7, r1
 217 0100 0122     		movs	r2, #1
 218 0102 DA71     		strb	r2, [r3, #7]
  68:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Pinne 9 är TX
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
 219              		.loc 1 69 0
 220 0104 7B18     		adds	r3, r7, r1
 221 0106 8022     		movs	r2, #128
 222 0108 9200     		lsls	r2, r2, #2
 223 010a 1A60     		str	r2, [r3]
  70:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_Init(GPIOA, &GPIO_InitStructure);
 224              		.loc 1 70 0
 225 010c 0C00     		movs	r4, r1
 226 010e 7B18     		adds	r3, r7, r1
 227 0110 264A     		ldr	r2, .L10+16
 228 0112 1900     		movs	r1, r3
 229 0114 1000     		movs	r0, r2
 230 0116 FFF7FEFF 		bl	GPIO_Init
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Pinne 10 är RX
  72:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
 231              		.loc 1 72 0
 232 011a 2100     		movs	r1, r4
 233 011c 7B18     		adds	r3, r7, r1
 234 011e 8022     		movs	r2, #128
 235 0120 D200     		lsls	r2, r2, #3
 236 0122 1A60     		str	r2, [r3]
  73:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_Init(GPIOA, &GPIO_InitStructure);
 237              		.loc 1 73 0
 238 0124 7B18     		adds	r3, r7, r1
 239 0126 214A     		ldr	r2, .L10+16
 240 0128 1900     		movs	r1, r3
 241 012a 1000     		movs	r0, r2
 242 012c FFF7FEFF 		bl	GPIO_Init
  74:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  75:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Konfigurerar USART1
  76:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitTypeDef USART_InitStructure;
  77:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     /* USARTx konfiguraras enligt:
  78:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     - BaudRate = 115200 baud
  79:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     - Word Length = 8 Bits
  80:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     - One Stop Bit
  81:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     - No parity
  82:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     - Hardware flow control disabled (RTS and CTS signals)
  83:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     - Receive and transmit enabled*/
  84:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitStructure.USART_BaudRate = 115200;
 243              		.loc 1 84 0
 244 0130 0821     		movs	r1, #8
 245 0132 7B18     		adds	r3, r7, r1
 246 0134 E122     		movs	r2, #225
 247 0136 5202     		lsls	r2, r2, #9
 248 0138 1A60     		str	r2, [r3]
  85:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitStructure.USART_WordLength = USART_WordLength_8b;
 249              		.loc 1 85 0
 250 013a 7B18     		adds	r3, r7, r1
 251 013c 0022     		movs	r2, #0
 252 013e 9A80     		strh	r2, [r3, #4]
  86:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitStructure.USART_StopBits = USART_StopBits_1;
 253              		.loc 1 86 0
 254 0140 7B18     		adds	r3, r7, r1
 255 0142 0022     		movs	r2, #0
 256 0144 DA80     		strh	r2, [r3, #6]
  87:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitStructure.USART_Parity = USART_Parity_No;
 257              		.loc 1 87 0
 258 0146 7B18     		adds	r3, r7, r1
 259 0148 0022     		movs	r2, #0
 260 014a 1A81     		strh	r2, [r3, #8]
  88:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
 261              		.loc 1 88 0
 262 014c 7B18     		adds	r3, r7, r1
 263 014e 0022     		movs	r2, #0
 264 0150 9A81     		strh	r2, [r3, #12]
  89:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 265              		.loc 1 89 0
 266 0152 7B18     		adds	r3, r7, r1
 267 0154 0C22     		movs	r2, #12
 268 0156 5A81     		strh	r2, [r3, #10]
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Utan initsiering fungerar det utan "krumelurer"
  91:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //USART_Init(USART1, &USART_InitStructure);
  92:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
  93:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Konfigurerar avbrott för USART
  94:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitTypeDef NVIC_InitStructure;
  95:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //4 möjliga gruppprioriteringar
  96:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //4 möjliga undergruppsprioriterinar
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
  98:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
 269              		.loc 1 98 0
 270 0158 3B1D     		adds	r3, r7, #4
 271 015a 2522     		movs	r2, #37
 272 015c 1A70     		strb	r2, [r3]
  99:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
 273              		.loc 1 99 0
 274 015e 3B1D     		adds	r3, r7, #4
 275 0160 0022     		movs	r2, #0
 276 0162 5A70     		strb	r2, [r3, #1]
 100:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
 277              		.loc 1 100 0
 278 0164 3B1D     		adds	r3, r7, #4
 279 0166 0022     		movs	r2, #0
 280 0168 9A70     		strb	r2, [r3, #2]
 101:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
 281              		.loc 1 101 0
 282 016a 3B1D     		adds	r3, r7, #4
 283 016c 0122     		movs	r2, #1
 284 016e DA70     		strb	r2, [r3, #3]
 102:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_Init(&NVIC_InitStructure);
 285              		.loc 1 102 0
 286 0170 3B1D     		adds	r3, r7, #4
 287 0172 1800     		movs	r0, r3
 288 0174 FFF7FEFF 		bl	NVIC_Init
 103:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 104:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Testar att sätta avbrottsvektorn manuellt
 105:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     *((void (**)(void) ) (0x2001C000 + 0xD4) ) = USART1_IRQHandler;
 289              		.loc 1 105 0
 290 0178 0D4B     		ldr	r3, .L10+20
 291 017a 0E4A     		ldr	r2, .L10+24
 292 017c 1A60     		str	r2, [r3]
 106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 107:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Startar USART1
 108:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_Cmd(USART1,ENABLE);
 293              		.loc 1 108 0
 294 017e 0E4B     		ldr	r3, .L10+28
 295 0180 0121     		movs	r1, #1
 296 0182 1800     		movs	r0, r3
 297 0184 FFF7FEFF 		bl	USART_Cmd
 109:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 110:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Aktiverar avbrott vid mottagning av meddelanden
 111:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
 298              		.loc 1 111 0
 299 0188 0C49     		ldr	r1, .L10+32
 300 018a 0B4B     		ldr	r3, .L10+28
 301 018c 0122     		movs	r2, #1
 302 018e 1800     		movs	r0, r3
 303 0190 FFF7FEFF 		bl	USART_ITConfig
 112:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** }
 304              		.loc 1 112 0
 305 0194 C046     		nop
 306 0196 BD46     		mov	sp, r7
 307 0198 09B0     		add	sp, sp, #36
 308              		@ sp needed
 309 019a 90BD     		pop	{r4, r7, pc}
 310              	.L11:
 311              		.align	2
 312              	.L10:
 313 019c 00000000 		.word	txBuffer
 314 01a0 08000000 		.word	realTxBuffer
 315 01a4 04000000 		.word	rxBuffer
 316 01a8 70000000 		.word	realRxBuffer
 317 01ac 00000240 		.word	1073872896
 318 01b0 D4C00120 		.word	536985812
 319 01b4 00000000 		.word	USART1_IRQHandler
 320 01b8 00100140 		.word	1073811456
 321 01bc 25050000 		.word	1317
 322              		.cfi_endproc
 323              	.LFE124:
 325              		.align	1
 326              		.global	USARTPut
 327              		.syntax unified
 328              		.code	16
 329              		.thumb_func
 330              		.fpu softvfp
 332              	USARTPut:
 333              	.LFB125:
 113:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 114:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Lägger till elem till kön för att skicka
 115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, 0 annars.
 116:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTPut (uint8_t elem){
 334              		.loc 1 116 0
 335              		.cfi_startproc
 336              		@ args = 0, pretend = 0, frame = 8
 337              		@ frame_needed = 1, uses_anonymous_args = 0
 338 01c0 80B5     		push	{r7, lr}
 339              		.cfi_def_cfa_offset 8
 340              		.cfi_offset 7, -8
 341              		.cfi_offset 14, -4
 342 01c2 82B0     		sub	sp, sp, #8
 343              		.cfi_def_cfa_offset 16
 344 01c4 00AF     		add	r7, sp, #0
 345              		.cfi_def_cfa_register 7
 346 01c6 0200     		movs	r2, r0
 347 01c8 FB1D     		adds	r3, r7, #7
 348 01ca 1A70     		strb	r2, [r3]
 117:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Lägger till den i bufferten om det går
 118:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     if (bufferPut(txBuffer, elem)){
 349              		.loc 1 118 0
 350 01cc 0B4B     		ldr	r3, .L15
 351 01ce 1A68     		ldr	r2, [r3]
 352 01d0 FB1D     		adds	r3, r7, #7
 353 01d2 1B78     		ldrb	r3, [r3]
 354 01d4 1900     		movs	r1, r3
 355 01d6 1000     		movs	r0, r2
 356 01d8 FFF7FEFF 		bl	bufferPut
 357 01dc 031E     		subs	r3, r0, #0
 358 01de 07D0     		beq	.L13
 119:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Aktiverar avbrott för att skicka
 120:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         USART_ITConfig(USART1, USART_IT_TXE, ENABLE);
 359              		.loc 1 120 0
 360 01e0 0749     		ldr	r1, .L15+4
 361 01e2 084B     		ldr	r3, .L15+8
 362 01e4 0122     		movs	r2, #1
 363 01e6 1800     		movs	r0, r3
 364 01e8 FFF7FEFF 		bl	USART_ITConfig
 121:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Alternativ lösning: hålla koll på om avbrott redan är aktivt
 122:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         return 1;
 365              		.loc 1 122 0
 366 01ec 0123     		movs	r3, #1
 367 01ee 00E0     		b	.L14
 368              	.L13:
 123:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     }
 124:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     return 0;
 369              		.loc 1 124 0
 370 01f0 0023     		movs	r3, #0
 371              	.L14:
 125:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** }
 372              		.loc 1 125 0
 373 01f2 1800     		movs	r0, r3
 374 01f4 BD46     		mov	sp, r7
 375 01f6 02B0     		add	sp, sp, #8
 376              		@ sp needed
 377 01f8 80BD     		pop	{r7, pc}
 378              	.L16:
 379 01fa C046     		.align	2
 380              	.L15:
 381 01fc 00000000 		.word	txBuffer
 382 0200 27070000 		.word	1831
 383 0204 00100140 		.word	1073811456
 384              		.cfi_endproc
 385              	.LFE125:
 387              		.align	1
 388              		.global	USARTPrint
 389              		.syntax unified
 390              		.code	16
 391              		.thumb_func
 392              		.fpu softvfp
 394              	USARTPrint:
 395              	.LFB126:
 126:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 127:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Lägger till list till kön för att skicka
 128:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, 0 annars.
 129:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTPrint(uint8_t *list){
 396              		.loc 1 129 0
 397              		.cfi_startproc
 398              		@ args = 0, pretend = 0, frame = 8
 399              		@ frame_needed = 1, uses_anonymous_args = 0
 400 0208 80B5     		push	{r7, lr}
 401              		.cfi_def_cfa_offset 8
 402              		.cfi_offset 7, -8
 403              		.cfi_offset 14, -4
 404 020a 82B0     		sub	sp, sp, #8
 405              		.cfi_def_cfa_offset 16
 406 020c 00AF     		add	r7, sp, #0
 407              		.cfi_def_cfa_register 7
 408 020e 7860     		str	r0, [r7, #4]
 130:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //En sträng avslutas med null så vi
 131:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //läser tills vi hittar den
 132:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     while (*list) {
 409              		.loc 1 132 0
 410 0210 0AE0     		b	.L18
 411              	.L20:
 133:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Lägg till alla tecken en efter en
 134:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Misslyckas vi med en avbryter vi resten
 135:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         if (!USARTPut(*list++)){
 412              		.loc 1 135 0
 413 0212 7B68     		ldr	r3, [r7, #4]
 414 0214 5A1C     		adds	r2, r3, #1
 415 0216 7A60     		str	r2, [r7, #4]
 416 0218 1B78     		ldrb	r3, [r3]
 417 021a 1800     		movs	r0, r3
 418 021c FFF7FEFF 		bl	USARTPut
 419 0220 031E     		subs	r3, r0, #0
 420 0222 01D1     		bne	.L18
 136:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****             return 0;
 421              		.loc 1 136 0
 422 0224 0023     		movs	r3, #0
 423 0226 04E0     		b	.L19
 424              	.L18:
 132:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         //Lägg till alla tecken en efter en
 425              		.loc 1 132 0
 426 0228 7B68     		ldr	r3, [r7, #4]
 427 022a 1B78     		ldrb	r3, [r3]
 428 022c 002B     		cmp	r3, #0
 429 022e F0D1     		bne	.L20
 137:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         }
 138:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     }
 139:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     return 1;
 430              		.loc 1 139 0
 431 0230 0123     		movs	r3, #1
 432              	.L19:
 140:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** }
 433              		.loc 1 140 0
 434 0232 1800     		movs	r0, r3
 435 0234 BD46     		mov	sp, r7
 436 0236 02B0     		add	sp, sp, #8
 437              		@ sp needed
 438 0238 80BD     		pop	{r7, pc}
 439              		.cfi_endproc
 440              	.LFE126:
 442              		.global	__aeabi_uidivmod
 443              		.global	__aeabi_uidiv
 444              		.align	1
 445              		.global	USARTPrintNumBase
 446              		.syntax unified
 447              		.code	16
 448              		.thumb_func
 449              		.fpu softvfp
 451              	USARTPrintNumBase:
 452              	.LFB127:
 141:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 142:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Lägger till num som enskilda nummer
 143:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //base anger vilken bas
 144:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, 0 annars.
 145:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTPrintNumBase(uint32_t num, uint8_t base){
 453              		.loc 1 145 0
 454              		.cfi_startproc
 455              		@ args = 0, pretend = 0, frame = 48
 456              		@ frame_needed = 1, uses_anonymous_args = 0
 457 023a 80B5     		push	{r7, lr}
 458              		.cfi_def_cfa_offset 8
 459              		.cfi_offset 7, -8
 460              		.cfi_offset 14, -4
 461 023c 8CB0     		sub	sp, sp, #48
 462              		.cfi_def_cfa_offset 56
 463 023e 00AF     		add	r7, sp, #0
 464              		.cfi_def_cfa_register 7
 465 0240 7860     		str	r0, [r7, #4]
 466 0242 0A00     		movs	r2, r1
 467 0244 FB1C     		adds	r3, r7, #3
 468 0246 1A70     		strb	r2, [r3]
 146:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     if (base == 0 || base == 1){
 469              		.loc 1 146 0
 470 0248 FB1C     		adds	r3, r7, #3
 471 024a 1B78     		ldrb	r3, [r3]
 472 024c 002B     		cmp	r3, #0
 473 024e 03D0     		beq	.L22
 474              		.loc 1 146 0 is_stmt 0 discriminator 1
 475 0250 FB1C     		adds	r3, r7, #3
 476 0252 1B78     		ldrb	r3, [r3]
 477 0254 012B     		cmp	r3, #1
 478 0256 01D1     		bne	.L23
 479              	.L22:
 147:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         return 0;
 480              		.loc 1 147 0 is_stmt 1
 481 0258 0023     		movs	r3, #0
 482 025a 4CE0     		b	.L30
 483              	.L23:
 148:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     }
 149:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 150:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Max längd är 32 bitar vid base = 2
 151:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     uint8_t index = 0,digitArr[32];
 484              		.loc 1 151 0
 485 025c 2F23     		movs	r3, #47
 486 025e FB18     		adds	r3, r7, r3
 487 0260 0022     		movs	r2, #0
 488 0262 1A70     		strb	r2, [r3]
 489              	.L27:
 490              	.LBB4:
 152:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 153:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Sparar tecknen i arrayn
 154:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     do {
 155:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         uint8_t digit = num % base;
 491              		.loc 1 155 0
 492 0264 FB1C     		adds	r3, r7, #3
 493 0266 1A78     		ldrb	r2, [r3]
 494 0268 7B68     		ldr	r3, [r7, #4]
 495 026a 1100     		movs	r1, r2
 496 026c 1800     		movs	r0, r3
 497 026e FFF7FEFF 		bl	__aeabi_uidivmod
 498              	.LVL0:
 499 0272 0B00     		movs	r3, r1
 500 0274 1A00     		movs	r2, r3
 501 0276 2E21     		movs	r1, #46
 502 0278 7B18     		adds	r3, r7, r1
 503 027a 1A70     		strb	r2, [r3]
 156:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         digitArr[index++] = digit >= 10 ? 'A' + digit - 10 : '0' + digit;
 504              		.loc 1 156 0
 505 027c 7B18     		adds	r3, r7, r1
 506 027e 1B78     		ldrb	r3, [r3]
 507 0280 092B     		cmp	r3, #9
 508 0282 05D9     		bls	.L25
 509              		.loc 1 156 0 is_stmt 0 discriminator 1
 510 0284 2E23     		movs	r3, #46
 511 0286 FB18     		adds	r3, r7, r3
 512 0288 1B78     		ldrb	r3, [r3]
 513 028a 3733     		adds	r3, r3, #55
 514 028c DBB2     		uxtb	r3, r3
 515 028e 04E0     		b	.L26
 516              	.L25:
 517              		.loc 1 156 0 discriminator 2
 518 0290 2E23     		movs	r3, #46
 519 0292 FB18     		adds	r3, r7, r3
 520 0294 1B78     		ldrb	r3, [r3]
 521 0296 3033     		adds	r3, r3, #48
 522 0298 DBB2     		uxtb	r3, r3
 523              	.L26:
 524              		.loc 1 156 0 discriminator 4
 525 029a 2F21     		movs	r1, #47
 526 029c 7A18     		adds	r2, r7, r1
 527 029e 1278     		ldrb	r2, [r2]
 528 02a0 7918     		adds	r1, r7, r1
 529 02a2 501C     		adds	r0, r2, #1
 530 02a4 0870     		strb	r0, [r1]
 531 02a6 1100     		movs	r1, r2
 532 02a8 0C22     		movs	r2, #12
 533 02aa BA18     		adds	r2, r7, r2
 534 02ac 5354     		strb	r3, [r2, r1]
 157:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****         num /= base;
 535              		.loc 1 157 0 is_stmt 1 discriminator 4
 536 02ae FB1C     		adds	r3, r7, #3
 537 02b0 1B78     		ldrb	r3, [r3]
 538 02b2 1900     		movs	r1, r3
 539 02b4 7868     		ldr	r0, [r7, #4]
 540 02b6 FFF7FEFF 		bl	__aeabi_uidiv
 541              	.LVL1:
 542 02ba 0300     		movs	r3, r0
 543 02bc 7B60     		str	r3, [r7, #4]
 544              	.LBE4:
 158:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     } while (num);
 545              		.loc 1 158 0 discriminator 4
 546 02be 7B68     		ldr	r3, [r7, #4]
 547 02c0 002B     		cmp	r3, #0
 548 02c2 CFD1     		bne	.L27
 159:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 160:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     //Printar
 161:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     while(index){
 549              		.loc 1 161 0
 550 02c4 11E0     		b	.L28
 551              	.L29:
 162:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****          if(!USARTPut(digitArr[--index])){
 552              		.loc 1 162 0
 553 02c6 2F21     		movs	r1, #47
 554 02c8 7B18     		adds	r3, r7, r1
 555 02ca 7A18     		adds	r2, r7, r1
 556 02cc 1278     		ldrb	r2, [r2]
 557 02ce 013A     		subs	r2, r2, #1
 558 02d0 1A70     		strb	r2, [r3]
 559 02d2 7B18     		adds	r3, r7, r1
 560 02d4 1B78     		ldrb	r3, [r3]
 561 02d6 0C22     		movs	r2, #12
 562 02d8 BA18     		adds	r2, r7, r2
 563 02da D35C     		ldrb	r3, [r2, r3]
 564 02dc 1800     		movs	r0, r3
 565 02de FFF7FEFF 		bl	USARTPut
 566 02e2 031E     		subs	r3, r0, #0
 567 02e4 01D1     		bne	.L28
 163:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****              return 0;
 568              		.loc 1 163 0
 569 02e6 0023     		movs	r3, #0
 570 02e8 05E0     		b	.L30
 571              	.L28:
 161:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****          if(!USARTPut(digitArr[--index])){
 572              		.loc 1 161 0
 573 02ea 2F23     		movs	r3, #47
 574 02ec FB18     		adds	r3, r7, r3
 575 02ee 1B78     		ldrb	r3, [r3]
 576 02f0 002B     		cmp	r3, #0
 577 02f2 E8D1     		bne	.L29
 164:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****          }
 165:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****      }
 166:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 167:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     return 1;
 578              		.loc 1 167 0
 579 02f4 0123     		movs	r3, #1
 580              	.L30:
 168:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** }
 581              		.loc 1 168 0 discriminator 1
 582 02f6 1800     		movs	r0, r3
 583 02f8 BD46     		mov	sp, r7
 584 02fa 0CB0     		add	sp, sp, #48
 585              		@ sp needed
 586 02fc 80BD     		pop	{r7, pc}
 587              		.cfi_endproc
 588              	.LFE127:
 590              		.align	1
 591              		.global	USARTPrintNum
 592              		.syntax unified
 593              		.code	16
 594              		.thumb_func
 595              		.fpu softvfp
 597              	USARTPrintNum:
 598              	.LFB128:
 169:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 170:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Lägger till num som enskilda nummer
 171:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //0-9 till kön för att skicka
 172:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, 0 annars.
 173:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTPrintNum(uint32_t num){
 599              		.loc 1 173 0
 600              		.cfi_startproc
 601              		@ args = 0, pretend = 0, frame = 8
 602              		@ frame_needed = 1, uses_anonymous_args = 0
 603 02fe 80B5     		push	{r7, lr}
 604              		.cfi_def_cfa_offset 8
 605              		.cfi_offset 7, -8
 606              		.cfi_offset 14, -4
 607 0300 82B0     		sub	sp, sp, #8
 608              		.cfi_def_cfa_offset 16
 609 0302 00AF     		add	r7, sp, #0
 610              		.cfi_def_cfa_register 7
 611 0304 7860     		str	r0, [r7, #4]
 174:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     USARTPrintNumBase(num, 10);
 612              		.loc 1 174 0
 613 0306 7B68     		ldr	r3, [r7, #4]
 614 0308 0A21     		movs	r1, #10
 615 030a 1800     		movs	r0, r3
 616 030c FFF7FEFF 		bl	USARTPrintNumBase
 175:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** }
 617              		.loc 1 175 0
 618 0310 C046     		nop
 619 0312 1800     		movs	r0, r3
 620 0314 BD46     		mov	sp, r7
 621 0316 02B0     		add	sp, sp, #8
 622              		@ sp needed
 623 0318 80BD     		pop	{r7, pc}
 624              		.cfi_endproc
 625              	.LFE128:
 627              		.align	1
 628              		.global	USARTGet
 629              		.syntax unified
 630              		.code	16
 631              		.thumb_func
 632              		.fpu softvfp
 634              	USARTGet:
 635              	.LFB129:
 176:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** 
 177:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Hämta senaste mottagna meddelandet till dest
 178:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Gör ingen omvandling, dvs returnerar det tal som skickades över USART
 179:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, dvs det fanns ett meddelande att hämta 0 annars.
 180:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTGet(uint8_t *dest){
 636              		.loc 1 180 0
 637              		.cfi_startproc
 638              		@ args = 0, pretend = 0, frame = 8
 639              		@ frame_needed = 1, uses_anonymous_args = 0
 640 031a 80B5     		push	{r7, lr}
 641              		.cfi_def_cfa_offset 8
 642              		.cfi_offset 7, -8
 643              		.cfi_offset 14, -4
 644 031c 82B0     		sub	sp, sp, #8
 645              		.cfi_def_cfa_offset 16
 646 031e 00AF     		add	r7, sp, #0
 647              		.cfi_def_cfa_register 7
 648 0320 7860     		str	r0, [r7, #4]
 181:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c ****     return bufferGet (rxBuffer, dest);
 649              		.loc 1 181 0
 650 0322 064B     		ldr	r3, .L34
 651 0324 1B68     		ldr	r3, [r3]
 652 0326 7A68     		ldr	r2, [r7, #4]
 653 0328 1100     		movs	r1, r2
 654 032a 1800     		movs	r0, r3
 655 032c FFF7FEFF 		bl	bufferGet
 656 0330 0300     		movs	r3, r0
 182:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib\USART.c **** }
 657              		.loc 1 182 0
 658 0332 1800     		movs	r0, r3
 659 0334 BD46     		mov	sp, r7
 660 0336 02B0     		add	sp, sp, #8
 661              		@ sp needed
 662 0338 80BD     		pop	{r7, pc}
 663              	.L35:
 664 033a C046     		.align	2
 665              	.L34:
 666 033c 04000000 		.word	rxBuffer
 667              		.cfi_endproc
 668              	.LFE129:
 670              	.Letext0:
 671              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 672              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 673              		.file 4 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/buffer.h"
 674              		.file 5 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
 675              		.file 6 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 676              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 677              		.file 8 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/misc.h"
 678              		.file 9 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_usart.h"
 679              		.file 10 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
 680              		.file 11 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 681              		.file 12 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 682              		.file 13 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 683              		.file 14 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
