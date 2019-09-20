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
  15              		.global	aTxBuffer
  16              		.data
  17              		.align	2
  20              	aTxBuffer:
  21 0000 436F6D6D 		.ascii	"Communication between two USART using DMA\000"
  21      756E6963 
  21      6174696F 
  21      6E206265 
  21      74776565 
  22 002a 00000000 		.space	58
  22      00000000 
  22      00000000 
  22      00000000 
  22      00000000 
  23              		.global	aRxBuffer
  24              		.align	2
  27              	aRxBuffer:
  28 0064 37       		.byte	55
  29 0065 37       		.byte	55
  30 0066 37       		.byte	55
  31 0067 37       		.byte	55
  32 0068 37       		.byte	55
  33 0069 37       		.byte	55
  34 006a 37       		.byte	55
  35 006b 37       		.byte	55
  36 006c 37       		.byte	55
  37 006d 2C       		.byte	44
  38 006e 00000000 		.space	90
  38      00000000 
  38      00000000 
  38      00000000 
  38      00000000 
  39              		.text
  40              		.align	1
  41              		.global	USART_Config
  42              		.syntax unified
  43              		.code	16
  44              		.thumb_func
  45              		.fpu softvfp
  47              	USART_Config:
  48              	.LFB123:
  49              		.file 1 "C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress/startup.c"
   1:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** /*
   2:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****  * 	startup.c
   3:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****  *
   4:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****  */
   5:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #include "stm32f4xx.h"
   6:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #include "stm32f4xx_usart.h"
   7:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #include "stm32f4xx_gpio.h"
   8:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #include "stm32f4xx_rcc.h"
   9:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #include "stm32f4xx_dma.h"
  10:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #include <stdint.h>
  11:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** 
  12:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** //Buffertar for USART
  13:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #define fborg
  14:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** #define BUFFERSIZE 100
  15:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** uint8_t aTxBuffer[BUFFERSIZE] = "Communication between two USART using DMA";
  16:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** uint8_t aRxBuffer [BUFFERSIZE] = {55,55,55,55,55,55,55,55,55,44};
  17:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** 
  18:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** void USART_Config(void){
  50              		.loc 1 18 0
  51              		.cfi_startproc
  52              		@ args = 0, pretend = 0, frame = 88
  53              		@ frame_needed = 1, uses_anonymous_args = 0
  54 0000 90B5     		push	{r4, r7, lr}
  55              		.cfi_def_cfa_offset 12
  56              		.cfi_offset 4, -12
  57              		.cfi_offset 7, -8
  58              		.cfi_offset 14, -4
  59 0002 97B0     		sub	sp, sp, #92
  60              		.cfi_def_cfa_offset 104
  61 0004 00AF     		add	r7, sp, #0
  62              		.cfi_def_cfa_register 7
  19:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Aktiverar klockorna för USART1, Port A och DMA2 
  20:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
  63              		.loc 1 20 0
  64 0006 0121     		movs	r1, #1
  65 0008 1020     		movs	r0, #16
  66 000a FFF7FEFF 		bl	RCC_APB2PeriphClockCmd
  21:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
  67              		.loc 1 21 0
  68 000e 0121     		movs	r1, #1
  69 0010 0120     		movs	r0, #1
  70 0012 FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  22:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_DMA2, ENABLE);
  71              		.loc 1 22 0
  72 0016 8023     		movs	r3, #128
  73 0018 DB03     		lsls	r3, r3, #15
  74 001a 0121     		movs	r1, #1
  75 001c 1800     		movs	r0, r3
  76 001e FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
  23:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
  24:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Aktiverar alternativ funktion USART1 för port A pinnar 9 och 10
  25:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_PinAFConfig(GPIOA, GPIO_Pin_9, GPIO_AF_USART1);
  77              		.loc 1 25 0
  78 0022 8023     		movs	r3, #128
  79 0024 9B00     		lsls	r3, r3, #2
  80 0026 6F48     		ldr	r0, .L6
  81 0028 0722     		movs	r2, #7
  82 002a 1900     		movs	r1, r3
  83 002c FFF7FEFF 		bl	GPIO_PinAFConfig
  26:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_PinAFConfig(GPIOA, GPIO_Pin_10, GPIO_AF_USART1);
  84              		.loc 1 26 0
  85 0030 8023     		movs	r3, #128
  86 0032 DB00     		lsls	r3, r3, #3
  87 0034 6B48     		ldr	r0, .L6
  88 0036 0722     		movs	r2, #7
  89 0038 1900     		movs	r1, r3
  90 003a FFF7FEFF 		bl	GPIO_PinAFConfig
  27:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
  28:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** 
  29:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     /* Konfigurerar USART1 Tx och Rx som alternativ funktion push-pull */
  30:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_InitTypeDef GPIO_InitStructure;
  31:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  91              		.loc 1 31 0
  92 003e 5021     		movs	r1, #80
  93 0040 7B18     		adds	r3, r7, r1
  94 0042 0222     		movs	r2, #2
  95 0044 1A71     		strb	r2, [r3, #4]
  32:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  96              		.loc 1 32 0
  97 0046 7B18     		adds	r3, r7, r1
  98 0048 0322     		movs	r2, #3
  99 004a 5A71     		strb	r2, [r3, #5]
  33:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
 100              		.loc 1 33 0
 101 004c 7B18     		adds	r3, r7, r1
 102 004e 0022     		movs	r2, #0
 103 0050 9A71     		strb	r2, [r3, #6]
  34:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
 104              		.loc 1 34 0
 105 0052 7B18     		adds	r3, r7, r1
 106 0054 0122     		movs	r2, #1
 107 0056 DA71     		strb	r2, [r3, #7]
  35:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Pinne 9 är TX
  36:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
 108              		.loc 1 36 0
 109 0058 7B18     		adds	r3, r7, r1
 110 005a 8022     		movs	r2, #128
 111 005c 9200     		lsls	r2, r2, #2
 112 005e 1A60     		str	r2, [r3]
  37:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_Init(GPIOA, &GPIO_InitStructure);
 113              		.loc 1 37 0
 114 0060 0C00     		movs	r4, r1
 115 0062 7B18     		adds	r3, r7, r1
 116 0064 5F4A     		ldr	r2, .L6
 117 0066 1900     		movs	r1, r3
 118 0068 1000     		movs	r0, r2
 119 006a FFF7FEFF 		bl	GPIO_Init
  38:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Pinne 10 är RX
  39:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
 120              		.loc 1 39 0
 121 006e 2100     		movs	r1, r4
 122 0070 7B18     		adds	r3, r7, r1
 123 0072 8022     		movs	r2, #128
 124 0074 D200     		lsls	r2, r2, #3
 125 0076 1A60     		str	r2, [r3]
  40:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     GPIO_Init(GPIOA, &GPIO_InitStructure);
 126              		.loc 1 40 0
 127 0078 7B18     		adds	r3, r7, r1
 128 007a 5A4A     		ldr	r2, .L6
 129 007c 1900     		movs	r1, r3
 130 007e 1000     		movs	r0, r2
 131 0080 FFF7FEFF 		bl	GPIO_Init
  41:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   
  42:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Konfigurerar USART1
  43:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     USART_InitTypeDef USART_InitStructure;
  44:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       /* USARTx configured as follows:
  45:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****             - BaudRate = 115200 baud  
  46:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****             - Word Length = 8 Bits
  47:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****             - One Stop Bit
  48:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****             - No parity
  49:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****             - Hardware flow control disabled (RTS and CTS signals)
  50:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****             - Receive and transmit enabled
  51:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       */
  52:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       USART_InitStructure.USART_BaudRate = 115200;
 132              		.loc 1 52 0
 133 0084 4021     		movs	r1, #64
 134 0086 7B18     		adds	r3, r7, r1
 135 0088 E122     		movs	r2, #225
 136 008a 5202     		lsls	r2, r2, #9
 137 008c 1A60     		str	r2, [r3]
  53:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       USART_InitStructure.USART_WordLength = USART_WordLength_8b;
 138              		.loc 1 53 0
 139 008e 7B18     		adds	r3, r7, r1
 140 0090 0022     		movs	r2, #0
 141 0092 9A80     		strh	r2, [r3, #4]
  54:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       USART_InitStructure.USART_StopBits = USART_StopBits_1;
 142              		.loc 1 54 0
 143 0094 7B18     		adds	r3, r7, r1
 144 0096 0022     		movs	r2, #0
 145 0098 DA80     		strh	r2, [r3, #6]
  55:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       USART_InitStructure.USART_Parity = USART_Parity_No;
 146              		.loc 1 55 0
 147 009a 7B18     		adds	r3, r7, r1
 148 009c 0022     		movs	r2, #0
 149 009e 1A81     		strh	r2, [r3, #8]
  56:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
 150              		.loc 1 56 0
 151 00a0 7B18     		adds	r3, r7, r1
 152 00a2 0022     		movs	r2, #0
 153 00a4 9A81     		strh	r2, [r3, #12]
  57:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 154              		.loc 1 57 0
 155 00a6 7B18     		adds	r3, r7, r1
 156 00a8 0C22     		movs	r2, #12
 157 00aa 5A81     		strh	r2, [r3, #10]
  58:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     USART_Init(USART1, &USART_InitStructure);
 158              		.loc 1 58 0
 159 00ac 7B18     		adds	r3, r7, r1
 160 00ae 4E4A     		ldr	r2, .L6+4
 161 00b0 1900     		movs	r1, r3
 162 00b2 1000     		movs	r0, r2
 163 00b4 FFF7FEFF 		bl	USART_Init
  59:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
  60:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Startar USART1
  61:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     USART_Cmd(USART1,ENABLE);
 164              		.loc 1 61 0
 165 00b8 4B4B     		ldr	r3, .L6+4
 166 00ba 0121     		movs	r1, #1
 167 00bc 1800     		movs	r0, r3
 168 00be FFF7FEFF 		bl	USART_Cmd
  62:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   
  63:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   USART_SendData(USART1,'a');
 169              		.loc 1 63 0
 170 00c2 494B     		ldr	r3, .L6+4
 171 00c4 6121     		movs	r1, #97
 172 00c6 1800     		movs	r0, r3
 173 00c8 FFF7FEFF 		bl	USART_SendData
  64:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   USART_SendData(USART1,'q');
 174              		.loc 1 64 0
 175 00cc 464B     		ldr	r3, .L6+4
 176 00ce 7121     		movs	r1, #113
 177 00d0 1800     		movs	r0, r3
 178 00d2 FFF7FEFF 		bl	USART_SendData
  65:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   while(DMA_GetCmdStatus(DMA2_Stream7) == DISABLE){
 179              		.loc 1 65 0
 180 00d6 04E0     		b	.L2
 181              	.L3:
  66:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       DMA_Cmd(DMA2_Stream7,DISABLE);
 182              		.loc 1 66 0
 183 00d8 444B     		ldr	r3, .L6+8
 184 00da 0021     		movs	r1, #0
 185 00dc 1800     		movs	r0, r3
 186 00de FFF7FEFF 		bl	DMA_Cmd
 187              	.L2:
  65:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   while(DMA_GetCmdStatus(DMA2_Stream7) == DISABLE){
 188              		.loc 1 65 0
 189 00e2 424B     		ldr	r3, .L6+8
 190 00e4 1800     		movs	r0, r3
 191 00e6 FFF7FEFF 		bl	DMA_GetCmdStatus
 192 00ea 031E     		subs	r3, r0, #0
 193 00ec F4D0     		beq	.L3
  67:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   }
  68:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   USART_SendData(USART1,'b');
 194              		.loc 1 68 0
 195 00ee 3E4B     		ldr	r3, .L6+4
 196 00f0 6221     		movs	r1, #98
 197 00f2 1800     		movs	r0, r3
 198 00f4 FFF7FEFF 		bl	USART_SendData
  69:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   while(DMA_GetCmdStatus(DMA2_Stream5) == DISABLE){
 199              		.loc 1 69 0
 200 00f8 04E0     		b	.L4
 201              	.L5:
  70:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       DMA_Cmd(DMA2_Stream5,DISABLE);
 202              		.loc 1 70 0
 203 00fa 3D4B     		ldr	r3, .L6+12
 204 00fc 0021     		movs	r1, #0
 205 00fe 1800     		movs	r0, r3
 206 0100 FFF7FEFF 		bl	DMA_Cmd
 207              	.L4:
  69:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   while(DMA_GetCmdStatus(DMA2_Stream5) == DISABLE){
 208              		.loc 1 69 0
 209 0104 3A4B     		ldr	r3, .L6+12
 210 0106 1800     		movs	r0, r3
 211 0108 FFF7FEFF 		bl	DMA_GetCmdStatus
 212 010c 031E     		subs	r3, r0, #0
 213 010e F4D0     		beq	.L5
  71:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   }
  72:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   USART_SendData(USART1,'c');
 214              		.loc 1 72 0
 215 0110 354B     		ldr	r3, .L6+4
 216 0112 6321     		movs	r1, #99
 217 0114 1800     		movs	r0, r3
 218 0116 FFF7FEFF 		bl	USART_SendData
  73:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   //Konfigurerar DMA Stream todo channel tx rx todo skriv vilke dma och kanaler som används!
  74:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitTypeDef DMA_InitStructure;
  75:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_StructInit(&DMA_InitStructure);
 219              		.loc 1 75 0
 220 011a 3B1D     		adds	r3, r7, #4
 221 011c 1800     		movs	r0, r3
 222 011e FFF7FEFF 		bl	DMA_StructInit
  76:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_BufferSize = BUFFERSIZE ;
 223              		.loc 1 76 0
 224 0122 3B1D     		adds	r3, r7, #4
 225 0124 6422     		movs	r2, #100
 226 0126 1A61     		str	r2, [r3, #16]
  77:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable ;
 227              		.loc 1 77 0
 228 0128 3B1D     		adds	r3, r7, #4
 229 012a 0022     		movs	r2, #0
 230 012c DA62     		str	r2, [r3, #44]
  78:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_1QuarterFull ;
 231              		.loc 1 78 0
 232 012e 3B1D     		adds	r3, r7, #4
 233 0130 0022     		movs	r2, #0
 234 0132 1A63     		str	r2, [r3, #48]
  79:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single ;
 235              		.loc 1 79 0
 236 0134 3B1D     		adds	r3, r7, #4
 237 0136 0022     		movs	r2, #0
 238 0138 5A63     		str	r2, [r3, #52]
  80:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
 239              		.loc 1 80 0
 240 013a 3B1D     		adds	r3, r7, #4
 241 013c 0022     		movs	r2, #0
 242 013e 1A62     		str	r2, [r3, #32]
  81:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
 243              		.loc 1 81 0
 244 0140 3B1D     		adds	r3, r7, #4
 245 0142 8022     		movs	r2, #128
 246 0144 D200     		lsls	r2, r2, #3
 247 0146 9A61     		str	r2, [r3, #24]
  82:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
 248              		.loc 1 82 0
 249 0148 3B1D     		adds	r3, r7, #4
 250 014a 0022     		movs	r2, #0
 251 014c 5A62     		str	r2, [r3, #36]
  83:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_PeripheralBaseAddr =(uint32_t) (&(USART1->DR)) ;
 252              		.loc 1 83 0
 253 014e 3B1D     		adds	r3, r7, #4
 254 0150 284A     		ldr	r2, .L6+16
 255 0152 5A60     		str	r2, [r3, #4]
  84:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
 256              		.loc 1 84 0
 257 0154 3B1D     		adds	r3, r7, #4
 258 0156 0022     		movs	r2, #0
 259 0158 9A63     		str	r2, [r3, #56]
  85:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
 260              		.loc 1 85 0
 261 015a 3B1D     		adds	r3, r7, #4
 262 015c 0022     		movs	r2, #0
 263 015e DA61     		str	r2, [r3, #28]
  86:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
 264              		.loc 1 86 0
 265 0160 3B1D     		adds	r3, r7, #4
 266 0162 0022     		movs	r2, #0
 267 0164 5A61     		str	r2, [r3, #20]
  87:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_Priority = DMA_Priority_High;
 268              		.loc 1 87 0
 269 0166 3B1D     		adds	r3, r7, #4
 270 0168 8022     		movs	r2, #128
 271 016a 9202     		lsls	r2, r2, #10
 272 016c 9A62     		str	r2, [r3, #40]
  88:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   //Configure TX DMA
  89:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_Channel = DMA_Channel_4;
 273              		.loc 1 89 0
 274 016e 3B1D     		adds	r3, r7, #4
 275 0170 8022     		movs	r2, #128
 276 0172 1205     		lsls	r2, r2, #20
 277 0174 1A60     		str	r2, [r3]
  90:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral ;
 278              		.loc 1 90 0
 279 0176 3B1D     		adds	r3, r7, #4
 280 0178 4022     		movs	r2, #64
 281 017a DA60     		str	r2, [r3, #12]
  91:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_Memory0BaseAddr =(uint32_t)aTxBuffer;
 282              		.loc 1 91 0
 283 017c 1E4A     		ldr	r2, .L6+20
 284 017e 3B1D     		adds	r3, r7, #4
 285 0180 9A60     		str	r2, [r3, #8]
  92:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_Init(DMA2_Stream7,&DMA_InitStructure);
 286              		.loc 1 92 0
 287 0182 3B1D     		adds	r3, r7, #4
 288 0184 194A     		ldr	r2, .L6+8
 289 0186 1900     		movs	r1, r3
 290 0188 1000     		movs	r0, r2
 291 018a FFF7FEFF 		bl	DMA_Init
  93:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   //Configure RX DMA
  94:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_Channel = DMA_Channel_4 ;
 292              		.loc 1 94 0
 293 018e 3B1D     		adds	r3, r7, #4
 294 0190 8022     		movs	r2, #128
 295 0192 1205     		lsls	r2, r2, #20
 296 0194 1A60     		str	r2, [r3]
  95:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory ;
 297              		.loc 1 95 0
 298 0196 3B1D     		adds	r3, r7, #4
 299 0198 0022     		movs	r2, #0
 300 019a DA60     		str	r2, [r3, #12]
  96:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_InitStructure.DMA_Memory0BaseAddr =(uint32_t)aRxBuffer ; 
 301              		.loc 1 96 0
 302 019c 174A     		ldr	r2, .L6+24
 303 019e 3B1D     		adds	r3, r7, #4
 304 01a0 9A60     		str	r2, [r3, #8]
  97:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   DMA_Init(DMA2_Stream5,&DMA_InitStructure);
 305              		.loc 1 97 0
 306 01a2 3B1D     		adds	r3, r7, #4
 307 01a4 124A     		ldr	r2, .L6+12
 308 01a6 1900     		movs	r1, r3
 309 01a8 1000     		movs	r0, r2
 310 01aa FFF7FEFF 		bl	DMA_Init
  98:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
  99:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Aktiverar DMA för USART1 RX och TX
 100:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     USART_DMACmd(USART1, USART_DMAReq_Rx, ENABLE);
 311              		.loc 1 100 0
 312 01ae 0E4B     		ldr	r3, .L6+4
 313 01b0 0122     		movs	r2, #1
 314 01b2 4021     		movs	r1, #64
 315 01b4 1800     		movs	r0, r3
 316 01b6 FFF7FEFF 		bl	USART_DMACmd
 101:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     USART_DMACmd(USART1, USART_DMAReq_Tx, ENABLE);
 317              		.loc 1 101 0
 318 01ba 0B4B     		ldr	r3, .L6+4
 319 01bc 0122     		movs	r2, #1
 320 01be 8021     		movs	r1, #128
 321 01c0 1800     		movs	r0, r3
 322 01c2 FFF7FEFF 		bl	USART_DMACmd
 102:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
 103:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Startar DMA streams
 104:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     DMA_Cmd(DMA2_Stream7, ENABLE);
 323              		.loc 1 104 0
 324 01c6 094B     		ldr	r3, .L6+8
 325 01c8 0121     		movs	r1, #1
 326 01ca 1800     		movs	r0, r3
 327 01cc FFF7FEFF 		bl	DMA_Cmd
 105:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     DMA_Cmd(DMA2_Stream5, ENABLE);
 328              		.loc 1 105 0
 329 01d0 074B     		ldr	r3, .L6+12
 330 01d2 0121     		movs	r1, #1
 331 01d4 1800     		movs	r0, r3
 332 01d6 FFF7FEFF 		bl	DMA_Cmd
 106:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** }
 333              		.loc 1 106 0
 334 01da C046     		nop
 335 01dc BD46     		mov	sp, r7
 336 01de 17B0     		add	sp, sp, #92
 337              		@ sp needed
 338 01e0 90BD     		pop	{r4, r7, pc}
 339              	.L7:
 340 01e2 C046     		.align	2
 341              	.L6:
 342 01e4 00000240 		.word	1073872896
 343 01e8 00100140 		.word	1073811456
 344 01ec B8640240 		.word	1073898680
 345 01f0 88640240 		.word	1073898632
 346 01f4 04100140 		.word	1073811460
 347 01f8 00000000 		.word	aTxBuffer
 348 01fc 00000000 		.word	aRxBuffer
 349              		.cfi_endproc
 350              	.LFE123:
 352              		.align	1
 353              		.global	main
 354              		.syntax unified
 355              		.code	16
 356              		.thumb_func
 357              		.fpu softvfp
 359              	main:
 360              	.LFB124:
 107:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** 
 108:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** void main() {
 361              		.loc 1 108 0
 362              		.cfi_startproc
 363              		@ args = 0, pretend = 0, frame = 16
 364              		@ frame_needed = 1, uses_anonymous_args = 0
 365 0200 80B5     		push	{r7, lr}
 366              		.cfi_def_cfa_offset 8
 367              		.cfi_offset 7, -8
 368              		.cfi_offset 14, -4
 369 0202 84B0     		sub	sp, sp, #16
 370              		.cfi_def_cfa_offset 24
 371 0204 00AF     		add	r7, sp, #0
 372              		.cfi_def_cfa_register 7
 109:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     int i = 0;
 373              		.loc 1 109 0
 374 0206 0023     		movs	r3, #0
 375 0208 BB60     		str	r3, [r7, #8]
 110:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #if defined (USE_STM324xG_EVAL)
 111:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     i += 1;
 112:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #endif
 113:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #if defined (fborg)
 114:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     i += 3;
 376              		.loc 1 114 0
 377 020a BB68     		ldr	r3, [r7, #8]
 378 020c 0333     		adds	r3, r3, #3
 379 020e BB60     		str	r3, [r7, #8]
 115:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #endif
 116:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #if defined (USE_STM324x7I_EVAL)
 117:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     i += 10;
 118:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #endif
 119:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #if defined (USE_STM324x9I_EVAL)
 120:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     i += 100;
 121:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     #endif
 122:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     USART_Config();
 380              		.loc 1 122 0
 381 0210 FFF7FEFF 		bl	USART_Config
 123:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
 124:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     unsigned long macH = ETH->MACA0HR;
 382              		.loc 1 124 0
 383 0214 154B     		ldr	r3, .L12
 384 0216 1B6C     		ldr	r3, [r3, #64]
 385 0218 7B60     		str	r3, [r7, #4]
 125:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** 
 126:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //Väntar tills DMA2 stream7 är aktiv
 127:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     while (DMA_GetCmdStatus(DMA2_Stream7) == DISABLE);
 386              		.loc 1 127 0
 387 021a C046     		nop
 388              	.L9:
 389              		.loc 1 127 0 is_stmt 0 discriminator 1
 390 021c 144B     		ldr	r3, .L12+4
 391 021e 1800     		movs	r0, r3
 392 0220 FFF7FEFF 		bl	DMA_GetCmdStatus
 393 0224 031E     		subs	r3, r0, #0
 394 0226 F9D0     		beq	.L9
 128:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
 129:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     /* Waiting the end of Data transfer */
 130:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //while (USART_GetFlagStatus(USART1,USART_FLAG_TC)==RESET);    
 131:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     //while (DMA_GetFlagStatus(DMA1_Stream1,DMA_FLAG_TCIF1)==DISABLE);
 132:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       
 133:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       /* Clear DMA Transfer Complete Flags */
 134:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       //DMA_ClearFlag(DMA1_Stream1,DMA_FLAG_TCIF1);
 135:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       /* Clear USART Transfer Complete Flags */
 136:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       //USART_ClearFlag(USART1,USART_FLAG_TC); 
 137:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   
 138:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   USART_SendData(USART1,'a');
 395              		.loc 1 138 0 is_stmt 1
 396 0228 124B     		ldr	r3, .L12+8
 397 022a 6121     		movs	r1, #97
 398 022c 1800     		movs	r0, r3
 399 022e FFF7FEFF 		bl	USART_SendData
 400              	.L11:
 139:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****   
 140:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****    uint8_t current;
 141:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     uint8_t lastRead;
 142:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
 143:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     while (1) {
 144:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****         //USART_SendData(USART1,57);
 145:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****         current = USART_ReceiveData(USART1);
 401              		.loc 1 145 0
 402 0232 104B     		ldr	r3, .L12+8
 403 0234 1800     		movs	r0, r3
 404 0236 FFF7FEFF 		bl	USART_ReceiveData
 405 023a 0300     		movs	r3, r0
 406 023c 1A00     		movs	r2, r3
 407 023e FB1C     		adds	r3, r7, #3
 408 0240 1A70     		strb	r2, [r3]
 146:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****         if(current != lastRead){
 409              		.loc 1 146 0
 410 0242 FA1C     		adds	r2, r7, #3
 411 0244 0F23     		movs	r3, #15
 412 0246 FB18     		adds	r3, r7, r3
 413 0248 1278     		ldrb	r2, [r2]
 414 024a 1B78     		ldrb	r3, [r3]
 415 024c 9A42     		cmp	r2, r3
 416 024e F0D0     		beq	.L11
 147:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****                 USART_SendData(USART1,current);
 417              		.loc 1 147 0
 418 0250 FB1C     		adds	r3, r7, #3
 419 0252 1B78     		ldrb	r3, [r3]
 420 0254 9BB2     		uxth	r3, r3
 421 0256 074A     		ldr	r2, .L12+8
 422 0258 1900     		movs	r1, r3
 423 025a 1000     		movs	r0, r2
 424 025c FFF7FEFF 		bl	USART_SendData
 148:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****                 lastRead = current;
 425              		.loc 1 148 0
 426 0260 0F23     		movs	r3, #15
 427 0262 FB18     		adds	r3, r7, r3
 428 0264 FA1C     		adds	r2, r7, #3
 429 0266 1278     		ldrb	r2, [r2]
 430 0268 1A70     		strb	r2, [r3]
 145:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****         if(current != lastRead){
 431              		.loc 1 145 0
 432 026a E2E7     		b	.L11
 433              	.L13:
 434              		.align	2
 435              	.L12:
 436 026c 00800240 		.word	1073905664
 437 0270 B8640240 		.word	1073898680
 438 0274 00100140 		.word	1073811456
 439              		.cfi_endproc
 440              	.LFE124:
 442              		.section	.start_section,"ax",%progbits
 443              		.align	1
 444              		.global	startup
 445              		.syntax unified
 446              		.code	16
 447              		.thumb_func
 448              		.fpu softvfp
 450              	startup:
 451              	.LFB125:
 149:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****         }
 150:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     }
 151:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     
 152:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     /*for (uint32_t i = 0; i < 200; i++){
 153:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****         USART_SendData(USART1,i);
 154:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     }*/
 155:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     return;
 156:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** }
 157:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** 
 158:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** // **** Boilerplate startup code ****
 159:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
 160:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** 
 161:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** void startup( void ) {
 452              		.loc 1 161 0
 453              		.cfi_startproc
 454              		@ Naked Function: prologue and epilogue provided by programmer.
 455              		@ args = 0, pretend = 0, frame = 0
 456              		@ frame_needed = 1, uses_anonymous_args = 0
 162:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****     __asm volatile(
 457              		.loc 1 162 0
 458              		.syntax divided
 459              	@ 162 "C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress/startup.c" 1
 460 0000 0248     		 LDR R0,=0x2001C000
 461 0002 8546     	 MOV SP,R0
 462 0004 FFF7FEFF 	 BL main
 463 0008 FEE7     	 B .
 464              	@ 0 "" 2
 163:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       " LDR R0,=0x2001C000\n"		/* set stack */
 164:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       " MOV SP,R0\n" 
 165:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       " BL main\n" 	    /* call main */
 166:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       " B ."
 167:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c ****       );
 168:C:/Users/x240/Documents/DAT290-Larmsystem/kod/centralenhet/MACaddress\startup.c **** }
 465              		.loc 1 168 0
 466              		.thumb
 467              		.syntax unified
 468 000a C046     		nop
 469              		.cfi_endproc
 470              	.LFE125:
 472              		.text
 473              	.Letext0:
 474              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 475              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 476              		.file 4 "../../lib/STM32F4_lib/CMSIS/Include/core_cm4.h"
 477              		.file 5 "../../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 478              		.file 6 "../../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 479              		.file 7 "../../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_usart.h"
 480              		.file 8 "../../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
 481              		.file 9 "../../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_dma.h"
