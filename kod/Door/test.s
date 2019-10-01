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
  42              		.file 1 "C:/git/DAT290-Larmsystem/kod/lib/USART.c"
   1:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include "USART.h"
   2:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
   3:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include "buffer.h"
   4:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include "misc.h"
   5:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include "core_cm4.h"
   6:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include "stm32f4xx_usart.h"
   7:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include "stm32f4xx_gpio.h"
   8:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include "stm32f4xx_rcc.h"
   9:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** #include <math.h>
  10:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  11:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  12:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Buffertar för mottagning och sändning
  13:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Pekare för att slippa skicka adresser med & hela tiden
  14:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** static FIFO *txBuffer, *rxBuffer, realTxBuffer, realRxBuffer;
  15:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t digitToPrintable(uint8_t inDigit);
  16:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t charToPrintable(uint8_t inChar);
  17:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  18:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Avbrottshantering för USART1
  19:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** void USART1_IRQHandler(void){
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
  20:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Avbrott orsakat av mottaget meddelande
  21:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if(USART_GetITStatus(USART1, USART_IT_RXNE) == SET){
  56              		.loc 1 21 0
  57 0006 1F4A     		ldr	r2, .L7
  58 0008 1F4B     		ldr	r3, .L7+4
  59 000a 1100     		movs	r1, r2
  60 000c 1800     		movs	r0, r3
  61 000e FFF7FEFF 		bl	USART_GetITStatus
  62 0012 0300     		movs	r3, r0
  63 0014 012B     		cmp	r3, #1
  64 0016 0BD1     		bne	.L2
  22:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Skriver inkommen medelande till rxBuffer
  23:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         bufferPut(rxBuffer, USART_ReceiveData(USART1));
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
  24:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Fundering ska vi ha något sätt att meddela att vi
  25:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //har missat meddelande på grund av full buffer?
  26:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
  27:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  28:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Avbrott orsakat av att registret för sändning är tomt
  29:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if(USART_GetITStatus(USART1, USART_IT_TXE) == SET){
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
  30:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Försöker läsa från txBuffer
  31:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         uint8_t data;
  32:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         uint8_t readOk = bufferGet(txBuffer,&data);
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
  33:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  34:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Om vi lyckades skickar vi data
  35:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Annars är buffern tom och vi avativerar avbrott för att skicka
  36:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         if(readOk) {
  97              		.loc 1 36 0
  98 0056 FB1D     		adds	r3, r7, #7
  99 0058 1B78     		ldrb	r3, [r3]
 100 005a 002B     		cmp	r3, #0
 101 005c 08D0     		beq	.L4
  37:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****             USART_SendData(USART1,data);
 102              		.loc 1 37 0
 103 005e BB1D     		adds	r3, r7, #6
 104 0060 1B78     		ldrb	r3, [r3]
 105 0062 9BB2     		uxth	r3, r3
 106 0064 084A     		ldr	r2, .L7+4
 107 0066 1900     		movs	r1, r3
 108 0068 1000     		movs	r0, r2
 109 006a FFF7FEFF 		bl	USART_SendData
 110              	.LBE2:
  38:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         } else{
  39:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****             USART_ITConfig(USART1, USART_IT_TXE, DISABLE);
  40:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         }
  41:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
  42:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }
 111              		.loc 1 42 0
 112 006e 05E0     		b	.L6
 113              	.L4:
 114              	.LBB3:
  39:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         }
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
  43:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  44:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Sätter upp USART1
  45:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** void USARTConfig(void){
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
  46:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Sätter bufferpekarna
  47:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     txBuffer = &realTxBuffer;
 162              		.loc 1 47 0
 163 009e 424B     		ldr	r3, .L10
 164 00a0 424A     		ldr	r2, .L10+4
 165 00a2 1A60     		str	r2, [r3]
  48:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     rxBuffer = &realRxBuffer;
 166              		.loc 1 48 0
 167 00a4 424B     		ldr	r3, .L10+8
 168 00a6 434A     		ldr	r2, .L10+12
 169 00a8 1A60     		str	r2, [r3]
  49:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  50:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Nollställer vår buffertar
  51:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     bufferInit(txBuffer);
 170              		.loc 1 51 0
 171 00aa 3F4B     		ldr	r3, .L10
 172 00ac 1B68     		ldr	r3, [r3]
 173 00ae 1800     		movs	r0, r3
 174 00b0 FFF7FEFF 		bl	bufferInit
  52:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     bufferInit(rxBuffer);
 175              		.loc 1 52 0
 176 00b4 3E4B     		ldr	r3, .L10+8
 177 00b6 1B68     		ldr	r3, [r3]
 178 00b8 1800     		movs	r0, r3
 179 00ba FFF7FEFF 		bl	bufferInit
  53:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  54:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Aktiverar klockorna för USART1, Port A
  55:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
 180              		.loc 1 55 0
 181 00be 0121     		movs	r1, #1
 182 00c0 1020     		movs	r0, #16
 183 00c2 FFF7FEFF 		bl	RCC_APB2PeriphClockCmd
  56:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
 184              		.loc 1 56 0
 185 00c6 0121     		movs	r1, #1
 186 00c8 0120     		movs	r0, #1
 187 00ca FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  57:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  58:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Aktiverar alternativ funktion USART1 för port A pinnar 9 och 10
  59:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_PinAFConfig(GPIOA, GPIO_Pin_9, GPIO_AF_USART1);
 188              		.loc 1 59 0
 189 00ce 8023     		movs	r3, #128
 190 00d0 9B00     		lsls	r3, r3, #2
 191 00d2 3948     		ldr	r0, .L10+16
 192 00d4 0722     		movs	r2, #7
 193 00d6 1900     		movs	r1, r3
 194 00d8 FFF7FEFF 		bl	GPIO_PinAFConfig
  60:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_PinAFConfig(GPIOA, GPIO_Pin_10, GPIO_AF_USART1);
 195              		.loc 1 60 0
 196 00dc 8023     		movs	r3, #128
 197 00de DB00     		lsls	r3, r3, #3
 198 00e0 3548     		ldr	r0, .L10+16
 199 00e2 0722     		movs	r2, #7
 200 00e4 1900     		movs	r1, r3
 201 00e6 FFF7FEFF 		bl	GPIO_PinAFConfig
  61:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  62:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Konfigurerar USART1 Tx och Rx som alternativ funktion push-pull
  63:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitTypeDef GPIO_InitStructure;
  64:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
 202              		.loc 1 64 0
 203 00ea 1821     		movs	r1, #24
 204 00ec 7B18     		adds	r3, r7, r1
 205 00ee 0222     		movs	r2, #2
 206 00f0 1A71     		strb	r2, [r3, #4]
  65:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
 207              		.loc 1 65 0
 208 00f2 7B18     		adds	r3, r7, r1
 209 00f4 0322     		movs	r2, #3
 210 00f6 5A71     		strb	r2, [r3, #5]
  66:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
 211              		.loc 1 66 0
 212 00f8 7B18     		adds	r3, r7, r1
 213 00fa 0022     		movs	r2, #0
 214 00fc 9A71     		strb	r2, [r3, #6]
  67:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
 215              		.loc 1 67 0
 216 00fe 7B18     		adds	r3, r7, r1
 217 0100 0122     		movs	r2, #1
 218 0102 DA71     		strb	r2, [r3, #7]
  68:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Pinne 9 är TX
  69:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
 219              		.loc 1 69 0
 220 0104 7B18     		adds	r3, r7, r1
 221 0106 8022     		movs	r2, #128
 222 0108 9200     		lsls	r2, r2, #2
 223 010a 1A60     		str	r2, [r3]
  70:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_Init(GPIOA, &GPIO_InitStructure);
 224              		.loc 1 70 0
 225 010c 0C00     		movs	r4, r1
 226 010e 7B18     		adds	r3, r7, r1
 227 0110 294A     		ldr	r2, .L10+16
 228 0112 1900     		movs	r1, r3
 229 0114 1000     		movs	r0, r2
 230 0116 FFF7FEFF 		bl	GPIO_Init
  71:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Pinne 10 är RX
  72:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
 231              		.loc 1 72 0
 232 011a 2100     		movs	r1, r4
 233 011c 7B18     		adds	r3, r7, r1
 234 011e 8022     		movs	r2, #128
 235 0120 D200     		lsls	r2, r2, #3
 236 0122 1A60     		str	r2, [r3]
  73:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     GPIO_Init(GPIOA, &GPIO_InitStructure);
 237              		.loc 1 73 0
 238 0124 7B18     		adds	r3, r7, r1
 239 0126 244A     		ldr	r2, .L10+16
 240 0128 1900     		movs	r1, r3
 241 012a 1000     		movs	r0, r2
 242 012c FFF7FEFF 		bl	GPIO_Init
  74:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  75:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Konfigurerar USART1
  76:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     USART_InitTypeDef USART_InitStructure;
  77:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     /* USARTx konfiguraras enligt:
  78:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     - BaudRate = 115200 baud
  79:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     - Word Length = 8 Bits
  80:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     - One Stop Bit
  81:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     - No parity
  82:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     - Hardware flow control disabled (RTS and CTS signals)
  83:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     - Receive and transmit enabled*/
  84:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****       USART_InitStructure.USART_BaudRate = 115200;
 243              		.loc 1 84 0
 244 0130 0821     		movs	r1, #8
 245 0132 7B18     		adds	r3, r7, r1
 246 0134 E122     		movs	r2, #225
 247 0136 5202     		lsls	r2, r2, #9
 248 0138 1A60     		str	r2, [r3]
  85:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****       USART_InitStructure.USART_WordLength = USART_WordLength_8b;
 249              		.loc 1 85 0
 250 013a 7B18     		adds	r3, r7, r1
 251 013c 0022     		movs	r2, #0
 252 013e 9A80     		strh	r2, [r3, #4]
  86:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****       USART_InitStructure.USART_StopBits = USART_StopBits_1;
 253              		.loc 1 86 0
 254 0140 7B18     		adds	r3, r7, r1
 255 0142 0022     		movs	r2, #0
 256 0144 DA80     		strh	r2, [r3, #6]
  87:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****       USART_InitStructure.USART_Parity = USART_Parity_No;
 257              		.loc 1 87 0
 258 0146 7B18     		adds	r3, r7, r1
 259 0148 0022     		movs	r2, #0
 260 014a 1A81     		strh	r2, [r3, #8]
  88:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****       USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
 261              		.loc 1 88 0
 262 014c 7B18     		adds	r3, r7, r1
 263 014e 0022     		movs	r2, #0
 264 0150 9A81     		strh	r2, [r3, #12]
  89:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****       USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 265              		.loc 1 89 0
 266 0152 7B18     		adds	r3, r7, r1
 267 0154 0C22     		movs	r2, #12
 268 0156 5A81     		strh	r2, [r3, #10]
  90:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     USART_Init(USART1, &USART_InitStructure);
 269              		.loc 1 90 0
 270 0158 7B18     		adds	r3, r7, r1
 271 015a 184A     		ldr	r2, .L10+20
 272 015c 1900     		movs	r1, r3
 273 015e 1000     		movs	r0, r2
 274 0160 FFF7FEFF 		bl	USART_Init
  91:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
  92:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Konfigurerar avbrott för USART
  93:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitTypeDef NVIC_InitStructure;
  94:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //4 möjliga gruppprioriteringar
  95:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //4 möjliga undergruppsprioriterinar
  96:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
  97:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
 275              		.loc 1 97 0
 276 0164 3B1D     		adds	r3, r7, #4
 277 0166 2522     		movs	r2, #37
 278 0168 1A70     		strb	r2, [r3]
  98:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
 279              		.loc 1 98 0
 280 016a 3B1D     		adds	r3, r7, #4
 281 016c 0022     		movs	r2, #0
 282 016e 5A70     		strb	r2, [r3, #1]
  99:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
 283              		.loc 1 99 0
 284 0170 3B1D     		adds	r3, r7, #4
 285 0172 0022     		movs	r2, #0
 286 0174 9A70     		strb	r2, [r3, #2]
 100:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
 287              		.loc 1 100 0
 288 0176 3B1D     		adds	r3, r7, #4
 289 0178 0122     		movs	r2, #1
 290 017a DA70     		strb	r2, [r3, #3]
 101:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     NVIC_Init(&NVIC_InitStructure);
 291              		.loc 1 101 0
 292 017c 3B1D     		adds	r3, r7, #4
 293 017e 1800     		movs	r0, r3
 294 0180 FFF7FEFF 		bl	NVIC_Init
 102:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 103:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Testar att sätta avbrottsvektorn manuellt
 104:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     *((void (**)(void) ) (0x2001C000 + 0xD4) ) = USART1_IRQHandler;
 295              		.loc 1 104 0
 296 0184 0E4B     		ldr	r3, .L10+24
 297 0186 0F4A     		ldr	r2, .L10+28
 298 0188 1A60     		str	r2, [r3]
 105:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 106:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Startar USART1
 107:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     USART_Cmd(USART1,ENABLE);
 299              		.loc 1 107 0
 300 018a 0C4B     		ldr	r3, .L10+20
 301 018c 0121     		movs	r1, #1
 302 018e 1800     		movs	r0, r3
 303 0190 FFF7FEFF 		bl	USART_Cmd
 108:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 109:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Aktiverar avbrott vid mottagning av meddelanden
 110:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
 304              		.loc 1 110 0
 305 0194 0C49     		ldr	r1, .L10+32
 306 0196 094B     		ldr	r3, .L10+20
 307 0198 0122     		movs	r2, #1
 308 019a 1800     		movs	r0, r3
 309 019c FFF7FEFF 		bl	USART_ITConfig
 111:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }
 310              		.loc 1 111 0
 311 01a0 C046     		nop
 312 01a2 BD46     		mov	sp, r7
 313 01a4 09B0     		add	sp, sp, #36
 314              		@ sp needed
 315 01a6 90BD     		pop	{r4, r7, pc}
 316              	.L11:
 317              		.align	2
 318              	.L10:
 319 01a8 00000000 		.word	txBuffer
 320 01ac 08000000 		.word	realTxBuffer
 321 01b0 04000000 		.word	rxBuffer
 322 01b4 70000000 		.word	realRxBuffer
 323 01b8 00000240 		.word	1073872896
 324 01bc 00100140 		.word	1073811456
 325 01c0 D4C00120 		.word	536985812
 326 01c4 00000000 		.word	USART1_IRQHandler
 327 01c8 25050000 		.word	1317
 328              		.cfi_endproc
 329              	.LFE124:
 331              		.align	1
 332              		.global	USARTPut
 333              		.syntax unified
 334              		.code	16
 335              		.thumb_func
 336              		.fpu softvfp
 338              	USARTPut:
 339              	.LFB125:
 112:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 113:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Lägger till elem till kön för att skicka
 114:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, 0 annars.
 115:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTPut (uint8_t elem){
 340              		.loc 1 115 0
 341              		.cfi_startproc
 342              		@ args = 0, pretend = 0, frame = 8
 343              		@ frame_needed = 1, uses_anonymous_args = 0
 344 01cc 80B5     		push	{r7, lr}
 345              		.cfi_def_cfa_offset 8
 346              		.cfi_offset 7, -8
 347              		.cfi_offset 14, -4
 348 01ce 82B0     		sub	sp, sp, #8
 349              		.cfi_def_cfa_offset 16
 350 01d0 00AF     		add	r7, sp, #0
 351              		.cfi_def_cfa_register 7
 352 01d2 0200     		movs	r2, r0
 353 01d4 FB1D     		adds	r3, r7, #7
 354 01d6 1A70     		strb	r2, [r3]
 116:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Lägger till den i bufferten om det går
 117:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if (bufferPut(txBuffer, elem)){
 355              		.loc 1 117 0
 356 01d8 0B4B     		ldr	r3, .L15
 357 01da 1A68     		ldr	r2, [r3]
 358 01dc FB1D     		adds	r3, r7, #7
 359 01de 1B78     		ldrb	r3, [r3]
 360 01e0 1900     		movs	r1, r3
 361 01e2 1000     		movs	r0, r2
 362 01e4 FFF7FEFF 		bl	bufferPut
 363 01e8 031E     		subs	r3, r0, #0
 364 01ea 07D0     		beq	.L13
 118:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Aktiverar avbrott för att skicka
 119:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         USART_ITConfig(USART1, USART_IT_TXE, ENABLE);
 365              		.loc 1 119 0
 366 01ec 0749     		ldr	r1, .L15+4
 367 01ee 084B     		ldr	r3, .L15+8
 368 01f0 0122     		movs	r2, #1
 369 01f2 1800     		movs	r0, r3
 370 01f4 FFF7FEFF 		bl	USART_ITConfig
 120:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Alternativ lösning: hålla koll på om avbrott redan är aktivt
 121:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return 1;
 371              		.loc 1 121 0
 372 01f8 0123     		movs	r3, #1
 373 01fa 00E0     		b	.L14
 374              	.L13:
 122:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
 123:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     return 0;
 375              		.loc 1 123 0
 376 01fc 0023     		movs	r3, #0
 377              	.L14:
 124:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }
 378              		.loc 1 124 0
 379 01fe 1800     		movs	r0, r3
 380 0200 BD46     		mov	sp, r7
 381 0202 02B0     		add	sp, sp, #8
 382              		@ sp needed
 383 0204 80BD     		pop	{r7, pc}
 384              	.L16:
 385 0206 C046     		.align	2
 386              	.L15:
 387 0208 00000000 		.word	txBuffer
 388 020c 27070000 		.word	1831
 389 0210 00100140 		.word	1073811456
 390              		.cfi_endproc
 391              	.LFE125:
 393              		.align	1
 394              		.global	USARTPrint
 395              		.syntax unified
 396              		.code	16
 397              		.thumb_func
 398              		.fpu softvfp
 400              	USARTPrint:
 401              	.LFB126:
 125:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 126:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Lägger till list till kön för att skicka
 127:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Sköter omvandling mellan sträng i c till rätt tecken i USART. Klarar 0-9 a-z A-Z och mellansla
 128:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, 0 annars.
 129:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTPrint(uint8_t *list){
 402              		.loc 1 129 0
 403              		.cfi_startproc
 404              		@ args = 0, pretend = 0, frame = 8
 405              		@ frame_needed = 1, uses_anonymous_args = 0
 406 0214 80B5     		push	{r7, lr}
 407              		.cfi_def_cfa_offset 8
 408              		.cfi_offset 7, -8
 409              		.cfi_offset 14, -4
 410 0216 82B0     		sub	sp, sp, #8
 411              		.cfi_def_cfa_offset 16
 412 0218 00AF     		add	r7, sp, #0
 413              		.cfi_def_cfa_register 7
 414 021a 7860     		str	r0, [r7, #4]
 130:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //En sträng avslutas med null så vi
 131:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //läser tills vi hittar den
 132:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     while (*list) {
 415              		.loc 1 132 0
 416 021c 0EE0     		b	.L18
 417              	.L20:
 133:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Lägg till alla tecken en efter en
 134:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Misslyckas vi med en avbryter vi resten
 135:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         if (!USARTPut(charToPrintable(*list++))){
 418              		.loc 1 135 0
 419 021e 7B68     		ldr	r3, [r7, #4]
 420 0220 5A1C     		adds	r2, r3, #1
 421 0222 7A60     		str	r2, [r7, #4]
 422 0224 1B78     		ldrb	r3, [r3]
 423 0226 1800     		movs	r0, r3
 424 0228 FFF7FEFF 		bl	charToPrintable
 425 022c 0300     		movs	r3, r0
 426 022e 1800     		movs	r0, r3
 427 0230 FFF7FEFF 		bl	USARTPut
 428 0234 031E     		subs	r3, r0, #0
 429 0236 01D1     		bne	.L18
 136:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****             return 0;
 430              		.loc 1 136 0
 431 0238 0023     		movs	r3, #0
 432 023a 04E0     		b	.L19
 433              	.L18:
 132:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         //Lägg till alla tecken en efter en
 434              		.loc 1 132 0
 435 023c 7B68     		ldr	r3, [r7, #4]
 436 023e 1B78     		ldrb	r3, [r3]
 437 0240 002B     		cmp	r3, #0
 438 0242 ECD1     		bne	.L20
 137:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         }
 138:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
 139:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     return 1;
 439              		.loc 1 139 0
 440 0244 0123     		movs	r3, #1
 441              	.L19:
 140:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }
 442              		.loc 1 140 0
 443 0246 1800     		movs	r0, r3
 444 0248 BD46     		mov	sp, r7
 445 024a 02B0     		add	sp, sp, #8
 446              		@ sp needed
 447 024c 80BD     		pop	{r7, pc}
 448              		.cfi_endproc
 449              	.LFE126:
 451              		.global	__aeabi_uidivmod
 452              		.global	__aeabi_uidiv
 453              		.align	1
 454              		.global	USARTPrintNum
 455              		.syntax unified
 456              		.code	16
 457              		.thumb_func
 458              		.fpu softvfp
 460              	USARTPrintNum:
 461              	.LFB127:
 141:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 142:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Lägger till num som enskilda nummer
 143:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //0-9 till kön för att skicka
 144:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, 0 annars.
 145:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTPrintNum(uint32_t num){
 462              		.loc 1 145 0
 463              		.cfi_startproc
 464              		@ args = 0, pretend = 0, frame = 24
 465              		@ frame_needed = 1, uses_anonymous_args = 0
 466 024e 90B5     		push	{r4, r7, lr}
 467              		.cfi_def_cfa_offset 12
 468              		.cfi_offset 4, -12
 469              		.cfi_offset 7, -8
 470              		.cfi_offset 14, -4
 471 0250 87B0     		sub	sp, sp, #28
 472              		.cfi_def_cfa_offset 40
 473 0252 00AF     		add	r7, sp, #0
 474              		.cfi_def_cfa_register 7
 475 0254 7860     		str	r0, [r7, #4]
 146:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Max längd för 32 bitar inbut är 10 digits
 147:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     uint8_t index = 0,digitArr[10];
 476              		.loc 1 147 0
 477 0256 1723     		movs	r3, #23
 478 0258 FB18     		adds	r3, r7, r3
 479 025a 0022     		movs	r2, #0
 480 025c 1A70     		strb	r2, [r3]
 481              	.L22:
 148:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 149:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Sparar tecknen i arrayn
 150:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     do {
 151:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         digitArr[index++] = digitToPrintable(num % 10);
 482              		.loc 1 151 0 discriminator 1
 483 025e 7B68     		ldr	r3, [r7, #4]
 484 0260 0A21     		movs	r1, #10
 485 0262 1800     		movs	r0, r3
 486 0264 FFF7FEFF 		bl	__aeabi_uidivmod
 487              	.LVL0:
 488 0268 0B00     		movs	r3, r1
 489 026a D9B2     		uxtb	r1, r3
 490 026c 1722     		movs	r2, #23
 491 026e BB18     		adds	r3, r7, r2
 492 0270 1B78     		ldrb	r3, [r3]
 493 0272 BA18     		adds	r2, r7, r2
 494 0274 581C     		adds	r0, r3, #1
 495 0276 1070     		strb	r0, [r2]
 496 0278 1C00     		movs	r4, r3
 497 027a 0800     		movs	r0, r1
 498 027c FFF7FEFF 		bl	digitToPrintable
 499 0280 0300     		movs	r3, r0
 500 0282 1A00     		movs	r2, r3
 501 0284 0C23     		movs	r3, #12
 502 0286 FB18     		adds	r3, r7, r3
 503 0288 1A55     		strb	r2, [r3, r4]
 152:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         num /= 10;
 504              		.loc 1 152 0 discriminator 1
 505 028a 7B68     		ldr	r3, [r7, #4]
 506 028c 0A21     		movs	r1, #10
 507 028e 1800     		movs	r0, r3
 508 0290 FFF7FEFF 		bl	__aeabi_uidiv
 509              	.LVL1:
 510 0294 0300     		movs	r3, r0
 511 0296 7B60     		str	r3, [r7, #4]
 153:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     } while (num);
 512              		.loc 1 153 0 discriminator 1
 513 0298 7B68     		ldr	r3, [r7, #4]
 514 029a 002B     		cmp	r3, #0
 515 029c DFD1     		bne	.L22
 154:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 155:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //Printar
 156:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     while(index){
 516              		.loc 1 156 0
 517 029e 11E0     		b	.L23
 518              	.L25:
 157:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****          if(!USARTPut(digitArr[--index])){
 519              		.loc 1 157 0
 520 02a0 1721     		movs	r1, #23
 521 02a2 7B18     		adds	r3, r7, r1
 522 02a4 7A18     		adds	r2, r7, r1
 523 02a6 1278     		ldrb	r2, [r2]
 524 02a8 013A     		subs	r2, r2, #1
 525 02aa 1A70     		strb	r2, [r3]
 526 02ac 7B18     		adds	r3, r7, r1
 527 02ae 1B78     		ldrb	r3, [r3]
 528 02b0 0C22     		movs	r2, #12
 529 02b2 BA18     		adds	r2, r7, r2
 530 02b4 D35C     		ldrb	r3, [r2, r3]
 531 02b6 1800     		movs	r0, r3
 532 02b8 FFF7FEFF 		bl	USARTPut
 533 02bc 031E     		subs	r3, r0, #0
 534 02be 01D1     		bne	.L23
 158:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****              return 0;
 535              		.loc 1 158 0
 536 02c0 0023     		movs	r3, #0
 537 02c2 05E0     		b	.L26
 538              	.L23:
 156:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****          if(!USARTPut(digitArr[--index])){
 539              		.loc 1 156 0
 540 02c4 1723     		movs	r3, #23
 541 02c6 FB18     		adds	r3, r7, r3
 542 02c8 1B78     		ldrb	r3, [r3]
 543 02ca 002B     		cmp	r3, #0
 544 02cc E8D1     		bne	.L25
 159:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****          }
 160:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****      }
 161:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 162:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     return 1;
 545              		.loc 1 162 0
 546 02ce 0123     		movs	r3, #1
 547              	.L26:
 163:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }
 548              		.loc 1 163 0 discriminator 1
 549 02d0 1800     		movs	r0, r3
 550 02d2 BD46     		mov	sp, r7
 551 02d4 07B0     		add	sp, sp, #28
 552              		@ sp needed
 553 02d6 90BD     		pop	{r4, r7, pc}
 554              		.cfi_endproc
 555              	.LFE127:
 557              		.align	1
 558              		.global	USARTGet
 559              		.syntax unified
 560              		.code	16
 561              		.thumb_func
 562              		.fpu softvfp
 564              	USARTGet:
 565              	.LFB128:
 164:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 165:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Hämta senaste mottagna meddelandet till dest
 166:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Gör ingen omvandling, dvs returnerar det tal som skickades över USART
 167:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //Returnerar 1 om det lyckades, dvs det fanns ett meddelande att hämta 0 annars.
 168:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t USARTGet(uint8_t *dest){
 566              		.loc 1 168 0
 567              		.cfi_startproc
 568              		@ args = 0, pretend = 0, frame = 8
 569              		@ frame_needed = 1, uses_anonymous_args = 0
 570 02d8 80B5     		push	{r7, lr}
 571              		.cfi_def_cfa_offset 8
 572              		.cfi_offset 7, -8
 573              		.cfi_offset 14, -4
 574 02da 82B0     		sub	sp, sp, #8
 575              		.cfi_def_cfa_offset 16
 576 02dc 00AF     		add	r7, sp, #0
 577              		.cfi_def_cfa_register 7
 578 02de 7860     		str	r0, [r7, #4]
 169:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     return bufferGet (rxBuffer, dest);
 579              		.loc 1 169 0
 580 02e0 054B     		ldr	r3, .L29
 581 02e2 1B68     		ldr	r3, [r3]
 582 02e4 7A68     		ldr	r2, [r7, #4]
 583 02e6 1100     		movs	r1, r2
 584 02e8 1800     		movs	r0, r3
 585 02ea FFF7FEFF 		bl	bufferGet
 586 02ee 0300     		movs	r3, r0
 170:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }
 587              		.loc 1 170 0
 588 02f0 1800     		movs	r0, r3
 589 02f2 BD46     		mov	sp, r7
 590 02f4 02B0     		add	sp, sp, #8
 591              		@ sp needed
 592 02f6 80BD     		pop	{r7, pc}
 593              	.L30:
 594              		.align	2
 595              	.L29:
 596 02f8 04000000 		.word	rxBuffer
 597              		.cfi_endproc
 598              	.LFE128:
 600              		.align	1
 601              		.global	digitToPrintable
 602              		.syntax unified
 603              		.code	16
 604              		.thumb_func
 605              		.fpu softvfp
 607              	digitToPrintable:
 608              	.LFB129:
 171:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 172:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //För omvandling från 0-9 heltal till int som kan skrivas
 173:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //ut i terminalen. Det fungerar annorluna i simulatorn
 174:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t digitToPrintable(uint8_t inDigit){
 609              		.loc 1 174 0
 610              		.cfi_startproc
 611              		@ args = 0, pretend = 0, frame = 8
 612              		@ frame_needed = 1, uses_anonymous_args = 0
 613 02fc 80B5     		push	{r7, lr}
 614              		.cfi_def_cfa_offset 8
 615              		.cfi_offset 7, -8
 616              		.cfi_offset 14, -4
 617 02fe 82B0     		sub	sp, sp, #8
 618              		.cfi_def_cfa_offset 16
 619 0300 00AF     		add	r7, sp, #0
 620              		.cfi_def_cfa_register 7
 621 0302 0200     		movs	r2, r0
 622 0304 FB1D     		adds	r3, r7, #7
 623 0306 1A70     		strb	r2, [r3]
 175:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         #ifdef SIMULATOR
 176:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         if (0 <= inDigit && inDigit <= 9) {
 177:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****             return ('0' + inDigit);
 178:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         }
 179:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 180:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return '?';
 181:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         #else
 182:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         if (0 <= inDigit && inDigit <= 9) {
 624              		.loc 1 182 0
 625 0308 FB1D     		adds	r3, r7, #7
 626 030a 1B78     		ldrb	r3, [r3]
 627 030c 092B     		cmp	r3, #9
 628 030e 04D8     		bhi	.L32
 183:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****             //Where 16 is the number for a zero
 184:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****             return (16 + inDigit);
 629              		.loc 1 184 0
 630 0310 FB1D     		adds	r3, r7, #7
 631 0312 1B78     		ldrb	r3, [r3]
 632 0314 1033     		adds	r3, r3, #16
 633 0316 DBB2     		uxtb	r3, r3
 634 0318 00E0     		b	.L33
 635              	.L32:
 185:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         }
 186:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 187:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return (31); //return ?
 636              		.loc 1 187 0
 637 031a 1F23     		movs	r3, #31
 638              	.L33:
 188:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         #endif
 189:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }
 639              		.loc 1 189 0
 640 031c 1800     		movs	r0, r3
 641 031e BD46     		mov	sp, r7
 642 0320 02B0     		add	sp, sp, #8
 643              		@ sp needed
 644 0322 80BD     		pop	{r7, pc}
 645              		.cfi_endproc
 646              	.LFE129:
 648              		.align	1
 649              		.global	charToPrintable
 650              		.syntax unified
 651              		.code	16
 652              		.thumb_func
 653              		.fpu softvfp
 655              	charToPrintable:
 656              	.LFB130:
 190:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 191:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** //För omvandling från char till int som kan skrivas ut i terminalen
 192:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** // hårdvaran.  Det fungerar annorluna i simulatorn
 193:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** uint8_t charToPrintable(uint8_t inChar){
 657              		.loc 1 193 0
 658              		.cfi_startproc
 659              		@ args = 0, pretend = 0, frame = 8
 660              		@ frame_needed = 1, uses_anonymous_args = 0
 661 0324 80B5     		push	{r7, lr}
 662              		.cfi_def_cfa_offset 8
 663              		.cfi_offset 7, -8
 664              		.cfi_offset 14, -4
 665 0326 82B0     		sub	sp, sp, #8
 666              		.cfi_def_cfa_offset 16
 667 0328 00AF     		add	r7, sp, #0
 668              		.cfi_def_cfa_register 7
 669 032a 0200     		movs	r2, r0
 670 032c FB1D     		adds	r3, r7, #7
 671 032e 1A70     		strb	r2, [r3]
 194:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     #ifdef SIMULATOR
 195:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     return inChar;
 196:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     #else
 197:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //* används för ny rad
 198:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //10 är ny rad vid utskrift kort -> pc (USARTPut)
 199:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //"*" är 42
 200:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if (inChar == 42) {
 672              		.loc 1 200 0
 673 0330 FB1D     		adds	r3, r7, #7
 674 0332 1B78     		ldrb	r3, [r3]
 675 0334 2A2B     		cmp	r3, #42
 676 0336 01D1     		bne	.L35
 201:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return (10);
 677              		.loc 1 201 0
 678 0338 0A23     		movs	r3, #10
 679 033a 2DE0     		b	.L36
 680              	.L35:
 202:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
 203:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 204:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //2 är space vid utskrift kort -> pc (USARTPut)
 205:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //" " är 32
 206:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if (inChar == 32) {
 681              		.loc 1 206 0
 682 033c FB1D     		adds	r3, r7, #7
 683 033e 1B78     		ldrb	r3, [r3]
 684 0340 202B     		cmp	r3, #32
 685 0342 01D1     		bne	.L37
 207:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return (2);
 686              		.loc 1 207 0
 687 0344 0223     		movs	r3, #2
 688 0346 27E0     		b	.L36
 689              	.L37:
 208:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
 209:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 210:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //16 är 0 vid utskrift kort -> pc (USARTPut)
 211:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //"0" är 48. "9" är 57
 212:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if (48 <= inChar && inChar <= 57) {
 690              		.loc 1 212 0
 691 0348 FB1D     		adds	r3, r7, #7
 692 034a 1B78     		ldrb	r3, [r3]
 693 034c 2F2B     		cmp	r3, #47
 694 034e 08D9     		bls	.L38
 695              		.loc 1 212 0 is_stmt 0 discriminator 1
 696 0350 FB1D     		adds	r3, r7, #7
 697 0352 1B78     		ldrb	r3, [r3]
 698 0354 392B     		cmp	r3, #57
 699 0356 04D8     		bhi	.L38
 213:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return (16 + inChar - 48);
 700              		.loc 1 213 0 is_stmt 1
 701 0358 FB1D     		adds	r3, r7, #7
 702 035a 1B78     		ldrb	r3, [r3]
 703 035c 203B     		subs	r3, r3, #32
 704 035e DBB2     		uxtb	r3, r3
 705 0360 1AE0     		b	.L36
 706              	.L38:
 214:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
 215:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 216:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //33 är A vid utskrift kort -> pc (USARTPut)
 217:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //"A" är 65.  "Z" är 90
 218:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if (65 <= inChar && inChar <= 90) {
 707              		.loc 1 218 0
 708 0362 FB1D     		adds	r3, r7, #7
 709 0364 1B78     		ldrb	r3, [r3]
 710 0366 402B     		cmp	r3, #64
 711 0368 08D9     		bls	.L39
 712              		.loc 1 218 0 is_stmt 0 discriminator 1
 713 036a FB1D     		adds	r3, r7, #7
 714 036c 1B78     		ldrb	r3, [r3]
 715 036e 5A2B     		cmp	r3, #90
 716 0370 04D8     		bhi	.L39
 219:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return (33 + inChar - 65);
 717              		.loc 1 219 0 is_stmt 1
 718 0372 FB1D     		adds	r3, r7, #7
 719 0374 1B78     		ldrb	r3, [r3]
 720 0376 203B     		subs	r3, r3, #32
 721 0378 DBB2     		uxtb	r3, r3
 722 037a 0DE0     		b	.L36
 723              	.L39:
 220:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
 221:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     
 222:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //161 är A vid utskrift kort -> pc (USARTPut)
 223:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //"a" är 97. "z" är 122
 224:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     if (97 <= inChar && inChar <= 122) {
 724              		.loc 1 224 0
 725 037c FB1D     		adds	r3, r7, #7
 726 037e 1B78     		ldrb	r3, [r3]
 727 0380 602B     		cmp	r3, #96
 728 0382 08D9     		bls	.L40
 729              		.loc 1 224 0 is_stmt 0 discriminator 1
 730 0384 FB1D     		adds	r3, r7, #7
 731 0386 1B78     		ldrb	r3, [r3]
 732 0388 7A2B     		cmp	r3, #122
 733 038a 04D8     		bhi	.L40
 225:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****         return (161 + inChar - 97);
 734              		.loc 1 225 0 is_stmt 1
 735 038c FB1D     		adds	r3, r7, #7
 736 038e 1B78     		ldrb	r3, [r3]
 737 0390 4033     		adds	r3, r3, #64
 738 0392 DBB2     		uxtb	r3, r3
 739 0394 00E0     		b	.L36
 740              	.L40:
 226:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     }
 227:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** 
 228:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     //else return ?
 229:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     return (31);
 741              		.loc 1 229 0
 742 0396 1F23     		movs	r3, #31
 743              	.L36:
 230:C:/git/DAT290-Larmsystem/kod/lib\USART.c ****     #endif
 231:C:/git/DAT290-Larmsystem/kod/lib\USART.c **** }...
 744              		.loc 1 231 0
 745 0398 1800     		movs	r0, r3
 746 039a BD46     		mov	sp, r7
 747 039c 02B0     		add	sp, sp, #8
 748              		@ sp needed
 749 039e 80BD     		pop	{r7, pc}
 750              		.cfi_endproc
 751              	.LFE130:
 753              	.Letext0:
 754              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 755              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 756              		.file 4 "C:/git/DAT290-Larmsystem/kod/lib/buffer.h"
 757              		.file 5 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
 758              		.file 6 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 759              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 760              		.file 8 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/misc.h"
 761              		.file 9 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_usart.h"
 762              		.file 10 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
 763              		.file 11 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 764              		.file 12 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 765              		.file 13 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 766              		.file 14 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
