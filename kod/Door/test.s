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
  11              		.file	"buffer.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	bufferInit
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	bufferInit:
  23              	.LFB0:
  24              		.file 1 "C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib/buffer.c"
   1:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** #include "buffer.h"
   2:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
   3:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** //Nollställer bufferten
   4:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** void bufferInit(FIFO *buffer) {
  25              		.loc 1 4 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 8
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 82B0     		sub	sp, sp, #8
  34              		.cfi_def_cfa_offset 16
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 7860     		str	r0, [r7, #4]
   5:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     buffer->count = 0;
  38              		.loc 1 5 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 6422     		movs	r2, #100
  41 000c 0021     		movs	r1, #0
  42 000e 9954     		strb	r1, [r3, r2]
   6:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     buffer->in = 0;
  43              		.loc 1 6 0
  44 0010 7B68     		ldr	r3, [r7, #4]
  45 0012 6522     		movs	r2, #101
  46 0014 0021     		movs	r1, #0
  47 0016 9954     		strb	r1, [r3, r2]
   7:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     buffer->out = 0;
  48              		.loc 1 7 0
  49 0018 7B68     		ldr	r3, [r7, #4]
  50 001a 6622     		movs	r2, #102
  51 001c 0021     		movs	r1, #0
  52 001e 9954     		strb	r1, [r3, r2]
   8:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** }
  53              		.loc 1 8 0
  54 0020 C046     		nop
  55 0022 BD46     		mov	sp, r7
  56 0024 02B0     		add	sp, sp, #8
  57              		@ sp needed
  58 0026 80BD     		pop	{r7, pc}
  59              		.cfi_endproc
  60              	.LFE0:
  62              		.align	1
  63              		.global	bufferPut
  64              		.syntax unified
  65              		.code	16
  66              		.thumb_func
  67              		.fpu softvfp
  69              	bufferPut:
  70              	.LFB1:
   9:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  10:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** //Lägger till ett elem i buffern.
  11:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** //Returnerar 1 om det lyckades, 0 annars.
  12:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** uint8_t bufferPut ( FIFO *buffer, uint8_t elem) {
  71              		.loc 1 12 0
  72              		.cfi_startproc
  73              		@ args = 0, pretend = 0, frame = 8
  74              		@ frame_needed = 1, uses_anonymous_args = 0
  75 0028 80B5     		push	{r7, lr}
  76              		.cfi_def_cfa_offset 8
  77              		.cfi_offset 7, -8
  78              		.cfi_offset 14, -4
  79 002a 82B0     		sub	sp, sp, #8
  80              		.cfi_def_cfa_offset 16
  81 002c 00AF     		add	r7, sp, #0
  82              		.cfi_def_cfa_register 7
  83 002e 7860     		str	r0, [r7, #4]
  84 0030 0A00     		movs	r2, r1
  85 0032 FB1C     		adds	r3, r7, #3
  86 0034 1A70     		strb	r2, [r3]
  13:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Kollar om bufferten är full.
  14:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     if (buffer->count == BUFFERSIZE){
  87              		.loc 1 14 0
  88 0036 7B68     		ldr	r3, [r7, #4]
  89 0038 6422     		movs	r2, #100
  90 003a 9B5C     		ldrb	r3, [r3, r2]
  91 003c 642B     		cmp	r3, #100
  92 003e 01D1     		bne	.L3
  15:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****         return 0;
  93              		.loc 1 15 0
  94 0040 0023     		movs	r3, #0
  95 0042 1EE0     		b	.L4
  96              	.L3:
  16:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     }
  17:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  18:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Lägger elem i bufferten
  19:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     buffer->buff[buffer->in++] = elem;
  97              		.loc 1 19 0
  98 0044 7B68     		ldr	r3, [r7, #4]
  99 0046 6522     		movs	r2, #101
 100 0048 9B5C     		ldrb	r3, [r3, r2]
 101 004a 5A1C     		adds	r2, r3, #1
 102 004c D0B2     		uxtb	r0, r2
 103 004e 7A68     		ldr	r2, [r7, #4]
 104 0050 6521     		movs	r1, #101
 105 0052 5054     		strb	r0, [r2, r1]
 106 0054 1900     		movs	r1, r3
 107 0056 7B68     		ldr	r3, [r7, #4]
 108 0058 FA1C     		adds	r2, r7, #3
 109 005a 1278     		ldrb	r2, [r2]
 110 005c 5A54     		strb	r2, [r3, r1]
  20:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     buffer->count++;
 111              		.loc 1 20 0
 112 005e 7B68     		ldr	r3, [r7, #4]
 113 0060 6422     		movs	r2, #100
 114 0062 9B5C     		ldrb	r3, [r3, r2]
 115 0064 0133     		adds	r3, r3, #1
 116 0066 D9B2     		uxtb	r1, r3
 117 0068 7B68     		ldr	r3, [r7, #4]
 118 006a 6422     		movs	r2, #100
 119 006c 9954     		strb	r1, [r3, r2]
  21:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  22:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Justerar pekaren om vi nått slutet
  23:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     if (buffer->in == BUFFERSIZE)
 120              		.loc 1 23 0
 121 006e 7B68     		ldr	r3, [r7, #4]
 122 0070 6522     		movs	r2, #101
 123 0072 9B5C     		ldrb	r3, [r3, r2]
 124 0074 642B     		cmp	r3, #100
 125 0076 03D1     		bne	.L5
  24:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****         buffer->in = 0;
 126              		.loc 1 24 0
 127 0078 7B68     		ldr	r3, [r7, #4]
 128 007a 6522     		movs	r2, #101
 129 007c 0021     		movs	r1, #0
 130 007e 9954     		strb	r1, [r3, r2]
 131              	.L5:
  25:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  26:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     return 1;
 132              		.loc 1 26 0
 133 0080 0123     		movs	r3, #1
 134              	.L4:
  27:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** }
 135              		.loc 1 27 0
 136 0082 1800     		movs	r0, r3
 137 0084 BD46     		mov	sp, r7
 138 0086 02B0     		add	sp, sp, #8
 139              		@ sp needed
 140 0088 80BD     		pop	{r7, pc}
 141              		.cfi_endproc
 142              	.LFE1:
 144              		.align	1
 145              		.global	bufferOverrideLast
 146              		.syntax unified
 147              		.code	16
 148              		.thumb_func
 149              		.fpu softvfp
 151              	bufferOverrideLast:
 152              	.LFB2:
  28:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  29:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** //Skriver över föregående elem i buffern.
  30:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** //Ändrar inga indexeringsvariabler
  31:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** void bufferOverrideLast ( FIFO *buffer, uint8_t elem) {
 153              		.loc 1 31 0
 154              		.cfi_startproc
 155              		@ args = 0, pretend = 0, frame = 16
 156              		@ frame_needed = 1, uses_anonymous_args = 0
 157 008a 80B5     		push	{r7, lr}
 158              		.cfi_def_cfa_offset 8
 159              		.cfi_offset 7, -8
 160              		.cfi_offset 14, -4
 161 008c 84B0     		sub	sp, sp, #16
 162              		.cfi_def_cfa_offset 24
 163 008e 00AF     		add	r7, sp, #0
 164              		.cfi_def_cfa_register 7
 165 0090 7860     		str	r0, [r7, #4]
 166 0092 0A00     		movs	r2, r1
 167 0094 FB1C     		adds	r3, r7, #3
 168 0096 1A70     		strb	r2, [r3]
  32:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Index för föregående element i buffern
  33:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     uint8_t prevIndex;
  34:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  35:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Om index för nästa element är 0 så blir föregående BUFFERSIZE - 1
  36:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //annars buffer->in - 1
  37:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     prevIndex =  (buffer->in == 0) ? BUFFERSIZE - 1 : buffer->in - 1;
 169              		.loc 1 37 0
 170 0098 7B68     		ldr	r3, [r7, #4]
 171 009a 6522     		movs	r2, #101
 172 009c 9B5C     		ldrb	r3, [r3, r2]
 173 009e 002B     		cmp	r3, #0
 174 00a0 05D0     		beq	.L7
 175              		.loc 1 37 0 is_stmt 0 discriminator 1
 176 00a2 7B68     		ldr	r3, [r7, #4]
 177 00a4 6522     		movs	r2, #101
 178 00a6 9B5C     		ldrb	r3, [r3, r2]
 179 00a8 013B     		subs	r3, r3, #1
 180 00aa DAB2     		uxtb	r2, r3
 181 00ac 00E0     		b	.L8
 182              	.L7:
 183              		.loc 1 37 0 discriminator 2
 184 00ae 6322     		movs	r2, #99
 185              	.L8:
 186              		.loc 1 37 0 discriminator 4
 187 00b0 0F21     		movs	r1, #15
 188 00b2 7B18     		adds	r3, r7, r1
 189 00b4 1A70     		strb	r2, [r3]
  38:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  39:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Skriver över elem i bufferten
  40:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     buffer->buff[prevIndex] = elem;
 190              		.loc 1 40 0 is_stmt 1 discriminator 4
 191 00b6 7B18     		adds	r3, r7, r1
 192 00b8 1B78     		ldrb	r3, [r3]
 193 00ba 7A68     		ldr	r2, [r7, #4]
 194 00bc F91C     		adds	r1, r7, #3
 195 00be 0978     		ldrb	r1, [r1]
 196 00c0 D154     		strb	r1, [r2, r3]
  41:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** }
 197              		.loc 1 41 0 discriminator 4
 198 00c2 C046     		nop
 199 00c4 BD46     		mov	sp, r7
 200 00c6 04B0     		add	sp, sp, #16
 201              		@ sp needed
 202 00c8 80BD     		pop	{r7, pc}
 203              		.cfi_endproc
 204              	.LFE2:
 206              		.align	1
 207              		.global	bufferGet
 208              		.syntax unified
 209              		.code	16
 210              		.thumb_func
 211              		.fpu softvfp
 213              	bufferGet:
 214              	.LFB3:
  42:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  43:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** //Hämtar ett element från buffern till dest.
  44:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** //Returnerar 1 om det lyckades, 0 annars.
  45:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** uint8_t bufferGet ( FIFO *buffer, uint8_t *dest) {
 215              		.loc 1 45 0
 216              		.cfi_startproc
 217              		@ args = 0, pretend = 0, frame = 8
 218              		@ frame_needed = 1, uses_anonymous_args = 0
 219 00ca 80B5     		push	{r7, lr}
 220              		.cfi_def_cfa_offset 8
 221              		.cfi_offset 7, -8
 222              		.cfi_offset 14, -4
 223 00cc 82B0     		sub	sp, sp, #8
 224              		.cfi_def_cfa_offset 16
 225 00ce 00AF     		add	r7, sp, #0
 226              		.cfi_def_cfa_register 7
 227 00d0 7860     		str	r0, [r7, #4]
 228 00d2 3960     		str	r1, [r7]
  46:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Kollar om bufferten är tom
  47:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     if (!buffer->count){
 229              		.loc 1 47 0
 230 00d4 7B68     		ldr	r3, [r7, #4]
 231 00d6 6422     		movs	r2, #100
 232 00d8 9B5C     		ldrb	r3, [r3, r2]
 233 00da 002B     		cmp	r3, #0
 234 00dc 01D1     		bne	.L10
  48:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****         return 0;
 235              		.loc 1 48 0
 236 00de 0023     		movs	r3, #0
 237 00e0 1EE0     		b	.L11
 238              	.L10:
  49:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     }
  50:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  51:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Hämtar element ur buffern till dest
  52:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     *dest = buffer->buff[buffer->out++];
 239              		.loc 1 52 0
 240 00e2 7B68     		ldr	r3, [r7, #4]
 241 00e4 6622     		movs	r2, #102
 242 00e6 9B5C     		ldrb	r3, [r3, r2]
 243 00e8 5A1C     		adds	r2, r3, #1
 244 00ea D0B2     		uxtb	r0, r2
 245 00ec 7A68     		ldr	r2, [r7, #4]
 246 00ee 6621     		movs	r1, #102
 247 00f0 5054     		strb	r0, [r2, r1]
 248 00f2 1A00     		movs	r2, r3
 249 00f4 7B68     		ldr	r3, [r7, #4]
 250 00f6 9A5C     		ldrb	r2, [r3, r2]
 251 00f8 3B68     		ldr	r3, [r7]
 252 00fa 1A70     		strb	r2, [r3]
  53:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     buffer->count--;
 253              		.loc 1 53 0
 254 00fc 7B68     		ldr	r3, [r7, #4]
 255 00fe 6422     		movs	r2, #100
 256 0100 9B5C     		ldrb	r3, [r3, r2]
 257 0102 013B     		subs	r3, r3, #1
 258 0104 D9B2     		uxtb	r1, r3
 259 0106 7B68     		ldr	r3, [r7, #4]
 260 0108 6422     		movs	r2, #100
 261 010a 9954     		strb	r1, [r3, r2]
  54:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  55:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     //Justerar pekaren om vi nått slutet
  56:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     if (buffer->out == BUFFERSIZE)
 262              		.loc 1 56 0
 263 010c 7B68     		ldr	r3, [r7, #4]
 264 010e 6622     		movs	r2, #102
 265 0110 9B5C     		ldrb	r3, [r3, r2]
 266 0112 642B     		cmp	r3, #100
 267 0114 03D1     		bne	.L12
  57:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****         buffer->out = 0;
 268              		.loc 1 57 0
 269 0116 7B68     		ldr	r3, [r7, #4]
 270 0118 6622     		movs	r2, #102
 271 011a 0021     		movs	r1, #0
 272 011c 9954     		strb	r1, [r3, r2]
 273              	.L12:
  58:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** 
  59:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c ****     return 1;
 274              		.loc 1 59 0
 275 011e 0123     		movs	r3, #1
 276              	.L11:
  60:C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib\buffer.c **** }...
 277              		.loc 1 60 0
 278 0120 1800     		movs	r0, r3
 279 0122 BD46     		mov	sp, r7
 280 0124 02B0     		add	sp, sp, #8
 281              		@ sp needed
 282 0126 80BD     		pop	{r7, pc}
 283              		.cfi_endproc
 284              	.LFE3:
 286              	.Letext0:
 287              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 288              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 289              		.file 4 "C:/Users/Erik/Documents/Datateknisktprojekt/kod/lib/buffer.h"
