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
  11              		.file	"main_rorelse.c"
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
  24              	.LFB126:
  25              		.file 1 "C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse/main_rorelse.c"
   1:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** /*
   2:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c ****  * 	startup.c
   3:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c ****  *
   4:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c ****  */
   5:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
   7:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** #include "stdio.h"
   8:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** #include "stm32f4xx_gpio.h"
   9:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** #include "core_cm4.h"
  10:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** #include "stm32f4xx_rcc.h"
  11:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** #include "stm32f4xx_syscfg.h"
  12:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  13:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  14:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  15:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** void startup ( void )
  16:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** {
  26              		.loc 1 16 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  17:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** __asm volatile(
  31              		.loc 1 17 0
  32              		.syntax divided
  33              	@ 17 "C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse/main_rorelse.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  18:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  19:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	" MOV SP,R0\n"
  20:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	" BL main\n"				/* call main */
  21:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	"_exit: B .\n"				/* never return */
  22:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	) ;
  23:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** }
  40              		.loc 1 23 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE126:
  47              		.text
  48              		.align	1
  49              		.syntax unified
  50              		.code	16
  51              		.thumb_func
  52              		.fpu softvfp
  54              	NVIC_SetPriority:
  55              	.LFB117:
  56              		.file 2 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
   1:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /**************************************************************************//**
   2:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  * @file     core_cm4.h
   3:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  * @brief    CMSIS Cortex-M4 Core Peripheral Access Layer Header File
   4:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  * @version  V4.10
   5:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  * @date     18. March 2015
   6:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  *
   7:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  * @note
   8:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  *
   9:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  ******************************************************************************/
  10:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Copyright (c) 2009 - 2015 ARM LIMITED
  11:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  12:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    All rights reserved.
  13:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    Redistribution and use in source and binary forms, with or without
  14:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    modification, are permitted provided that the following conditions are met:
  15:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    - Redistributions of source code must retain the above copyright
  16:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      notice, this list of conditions and the following disclaimer.
  17:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    - Redistributions in binary form must reproduce the above copyright
  18:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      notice, this list of conditions and the following disclaimer in the
  19:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      documentation and/or other materials provided with the distribution.
  20:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    - Neither the name of ARM nor the names of its contributors may be used
  21:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      to endorse or promote products derived from this software without
  22:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      specific prior written permission.
  23:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    *
  24:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  25:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  26:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  27:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
  28:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  29:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  30:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  31:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  32:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  33:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  34:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    POSSIBILITY OF SUCH DAMAGE.
  35:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    ---------------------------------------------------------------------------*/
  36:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  37:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  38:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if defined ( __ICCARM__ )
  39:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  #pragma system_include  /* treat file as system include file for MISRA check */
  40:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
  41:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  42:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #ifndef __CORE_CM4_H_GENERIC
  43:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define __CORE_CM4_H_GENERIC
  44:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  45:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #ifdef __cplusplus
  46:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  extern "C" {
  47:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
  48:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  49:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \page CMSIS_MISRA_Exceptions  MISRA-C:2004 Compliance Exceptions
  50:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   CMSIS violates the following MISRA-C:2004 rules:
  51:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  52:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    \li Required Rule 8.5, object/function definition in header file.<br>
  53:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      Function definitions in header files are used to allow 'inlining'.
  54:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  55:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    \li Required Rule 18.4, declaration of union type or object of union type: '{...}'.<br>
  56:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      Unions are used for effective representation of core registers.
  57:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  58:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****    \li Advisory Rule 19.7, Function-like macro defined.<br>
  59:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****      Function-like macros are used to allow more efficient code.
  60:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
  61:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  62:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  63:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*******************************************************************************
  64:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  *                 CMSIS definitions
  65:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  ******************************************************************************/
  66:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup Cortex_M4
  67:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
  68:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
  69:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  70:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*  CMSIS CM4 definitions */
  71:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define __CM4_CMSIS_VERSION_MAIN  (0x04)                                   /*!< [31:16] CMSIS HAL m
  72:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define __CM4_CMSIS_VERSION_SUB   (0x00)                                   /*!< [15:0]  CMSIS HAL s
  73:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define __CM4_CMSIS_VERSION       ((__CM4_CMSIS_VERSION_MAIN << 16) | \
  74:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                                     __CM4_CMSIS_VERSION_SUB          )     /*!< CMSIS HAL version n
  75:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  76:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define __CORTEX_M                (0x04)                                   /*!< Cortex-M Core      
  77:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  78:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  79:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if   defined ( __CC_ARM )
  80:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __ASM            __asm                                      /*!< asm keyword for ARM Comp
  81:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __INLINE         __inline                                   /*!< inline keyword for ARM C
  82:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __STATIC_INLINE  static __inline
  83:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  84:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __GNUC__ )
  85:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __ASM            __asm                                      /*!< asm keyword for GNU Comp
  86:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __INLINE         inline                                     /*!< inline keyword for GNU C
  87:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __STATIC_INLINE  static inline
  88:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  89:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __ICCARM__ )
  90:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __ASM            __asm                                      /*!< asm keyword for IAR Comp
  91:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __INLINE         inline                                     /*!< inline keyword for IAR C
  92:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __STATIC_INLINE  static inline
  93:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  94:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __TMS470__ )
  95:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __ASM            __asm                                      /*!< asm keyword for TI CCS C
  96:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __STATIC_INLINE  static inline
  97:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
  98:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __TASKING__ )
  99:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __ASM            __asm                                      /*!< asm keyword for TASKING 
 100:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __INLINE         inline                                     /*!< inline keyword for TASKI
 101:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __STATIC_INLINE  static inline
 102:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 103:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __CSMC__ )
 104:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __packed
 105:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __ASM            _asm                                      /*!< asm keyword for COSMIC Co
 106:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __INLINE         inline                                    /*use -pc99 on compile line !<
 107:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define __STATIC_INLINE  static inline
 108:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 109:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
 110:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 111:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** __FPU_USED indicates whether an FPU is used or not.
 112:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     For this, __FPU_PRESENT has to be checked prior to making use of FPU specific registers and fun
 113:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** */
 114:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if defined ( __CC_ARM )
 115:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #if defined __TARGET_FPU_VFP
 116:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #if (__FPU_PRESENT == 1)
 117:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       1
 118:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #else
 119:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #warning "Compiler generates FPU instructions for a device without an FPU (check __FPU_PRESEN
 120:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       0
 121:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #endif
 122:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #else
 123:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __FPU_USED         0
 124:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 125:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 126:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __GNUC__ )
 127:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #if defined (__VFP_FP__) && !defined(__SOFTFP__)
 128:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #if (__FPU_PRESENT == 1)
 129:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       1
 130:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #else
 131:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #warning "Compiler generates FPU instructions for a device without an FPU (check __FPU_PRESEN
 132:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       0
 133:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #endif
 134:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #else
 135:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __FPU_USED         0
 136:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 137:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 138:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __ICCARM__ )
 139:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #if defined __ARMVFP__
 140:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #if (__FPU_PRESENT == 1)
 141:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       1
 142:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #else
 143:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #warning "Compiler generates FPU instructions for a device without an FPU (check __FPU_PRESEN
 144:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       0
 145:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #endif
 146:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #else
 147:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __FPU_USED         0
 148:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 149:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 150:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __TMS470__ )
 151:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #if defined __TI_VFP_SUPPORT__
 152:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #if (__FPU_PRESENT == 1)
 153:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       1
 154:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #else
 155:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #warning "Compiler generates FPU instructions for a device without an FPU (check __FPU_PRESEN
 156:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       0
 157:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #endif
 158:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #else
 159:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __FPU_USED         0
 160:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 161:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 162:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __TASKING__ )
 163:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #if defined __FPU_VFP__
 164:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #if (__FPU_PRESENT == 1)
 165:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       1
 166:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #else
 167:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #error "Compiler generates FPU instructions for a device without an FPU (check __FPU_PRESENT)
 168:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       0
 169:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #endif
 170:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #else
 171:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __FPU_USED         0
 172:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 173:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 174:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #elif defined ( __CSMC__ )		/* Cosmic */
 175:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #if ( __CSMC__ & 0x400)		// FPU present for parser
 176:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #if (__FPU_PRESENT == 1)
 177:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       1
 178:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #else
 179:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #error "Compiler generates FPU instructions for a device without an FPU (check __FPU_PRESENT)
 180:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****       #define __FPU_USED       0
 181:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #endif
 182:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #else
 183:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __FPU_USED         0
 184:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 185:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
 186:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 187:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #include <stdint.h>                      /* standard types definitions                      */
 188:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #include <core_cmInstr.h>                /* Core Instruction Access                         */
 189:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #include <core_cmFunc.h>                 /* Core Function Access                            */
 190:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #include <core_cmSimd.h>                 /* Compiler specific SIMD Intrinsics               */
 191:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 192:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #ifdef __cplusplus
 193:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
 194:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
 195:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 196:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif /* __CORE_CM4_H_GENERIC */
 197:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 198:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #ifndef __CMSIS_GENERIC
 199:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 200:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #ifndef __CORE_CM4_H_DEPENDANT
 201:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define __CORE_CM4_H_DEPENDANT
 202:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 203:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #ifdef __cplusplus
 204:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  extern "C" {
 205:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
 206:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 207:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* check device defines and use defaults */
 208:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if defined __CHECK_DEVICE_DEFINES
 209:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #ifndef __CM4_REV
 210:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __CM4_REV               0x0000
 211:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #warning "__CM4_REV not defined in device header file; using default!"
 212:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 213:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 214:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #ifndef __FPU_PRESENT
 215:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __FPU_PRESENT             0
 216:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #warning "__FPU_PRESENT not defined in device header file; using default!"
 217:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 218:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 219:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #ifndef __MPU_PRESENT
 220:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __MPU_PRESENT             0
 221:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #warning "__MPU_PRESENT not defined in device header file; using default!"
 222:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 223:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 224:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #ifndef __NVIC_PRIO_BITS
 225:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __NVIC_PRIO_BITS          4
 226:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #warning "__NVIC_PRIO_BITS not defined in device header file; using default!"
 227:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 228:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 229:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #ifndef __Vendor_SysTickConfig
 230:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #define __Vendor_SysTickConfig    0
 231:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     #warning "__Vendor_SysTickConfig not defined in device header file; using default!"
 232:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #endif
 233:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
 234:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 235:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* IO definitions (access restrictions to peripheral registers) */
 236:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /**
 237:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_glob_defs CMSIS Global Defines
 238:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 239:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     <strong>IO Type Qualifiers</strong> are used
 240:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \li to specify the access to peripheral variables.
 241:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \li for automatic generation of peripheral register debug information.
 242:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** */
 243:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #ifdef __cplusplus
 244:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define   __I     volatile             /*!< Defines 'read only' permissions                 */
 245:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #else
 246:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define   __I     volatile const       /*!< Defines 'read only' permissions                 */
 247:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
 248:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define     __O     volatile             /*!< Defines 'write only' permissions                */
 249:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define     __IO    volatile             /*!< Defines 'read / write' permissions              */
 250:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 251:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group Cortex_M4 */
 252:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 253:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 254:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 255:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*******************************************************************************
 256:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  *                 Register Abstraction
 257:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   Core Register contain:
 258:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core Register
 259:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core NVIC Register
 260:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core SCB Register
 261:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core SysTick Register
 262:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core Debug Register
 263:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core MPU Register
 264:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core FPU Register
 265:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  ******************************************************************************/
 266:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \defgroup CMSIS_core_register Defines and Type Definitions
 267:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief Type definitions and defines for Cortex-M processor based devices.
 268:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** */
 269:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 270:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup    CMSIS_core_register
 271:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup   CMSIS_CORE  Status and Control Registers
 272:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief  Core Register type definitions.
 273:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 274:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 275:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 276:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Union type to access the Application Program Status Register (APSR).
 277:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 278:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef union
 279:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 280:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   struct
 281:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   {
 282:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t _reserved0:16;              /*!< bit:  0..15  Reserved                           */
 283:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t GE:4;                       /*!< bit: 16..19  Greater than or Equal flags        */
 284:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t _reserved1:7;               /*!< bit: 20..26  Reserved                           */
 285:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t Q:1;                        /*!< bit:     27  Saturation condition flag          */
 286:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t V:1;                        /*!< bit:     28  Overflow condition code flag       */
 287:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t C:1;                        /*!< bit:     29  Carry condition code flag          */
 288:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t Z:1;                        /*!< bit:     30  Zero condition code flag           */
 289:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t N:1;                        /*!< bit:     31  Negative condition code flag       */
 290:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   } b;                                   /*!< Structure used for bit  access                  */
 291:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t w;                            /*!< Type      used for word access                  */
 292:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } APSR_Type;
 293:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 294:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* APSR Register Definitions */
 295:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_N_Pos                         31                                             /*!< APSR
 296:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_N_Msk                         (1UL << APSR_N_Pos)                            /*!< APSR
 297:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 298:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_Z_Pos                         30                                             /*!< APSR
 299:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_Z_Msk                         (1UL << APSR_Z_Pos)                            /*!< APSR
 300:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 301:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_C_Pos                         29                                             /*!< APSR
 302:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_C_Msk                         (1UL << APSR_C_Pos)                            /*!< APSR
 303:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 304:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_V_Pos                         28                                             /*!< APSR
 305:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_V_Msk                         (1UL << APSR_V_Pos)                            /*!< APSR
 306:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 307:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_Q_Pos                         27                                             /*!< APSR
 308:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_Q_Msk                         (1UL << APSR_Q_Pos)                            /*!< APSR
 309:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 310:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_GE_Pos                        16                                             /*!< APSR
 311:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define APSR_GE_Msk                        (0xFUL << APSR_GE_Pos)                         /*!< APSR
 312:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 313:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 314:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Union type to access the Interrupt Program Status Register (IPSR).
 315:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 316:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef union
 317:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 318:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   struct
 319:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   {
 320:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t ISR:9;                      /*!< bit:  0.. 8  Exception number                   */
 321:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t _reserved0:23;              /*!< bit:  9..31  Reserved                           */
 322:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   } b;                                   /*!< Structure used for bit  access                  */
 323:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t w;                            /*!< Type      used for word access                  */
 324:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } IPSR_Type;
 325:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 326:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* IPSR Register Definitions */
 327:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define IPSR_ISR_Pos                        0                                             /*!< IPSR
 328:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define IPSR_ISR_Msk                       (0x1FFUL /*<< IPSR_ISR_Pos*/)                  /*!< IPSR
 329:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 330:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 331:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Union type to access the Special-Purpose Program Status Registers (xPSR).
 332:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 333:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef union
 334:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 335:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   struct
 336:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   {
 337:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t ISR:9;                      /*!< bit:  0.. 8  Exception number                   */
 338:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t _reserved0:7;               /*!< bit:  9..15  Reserved                           */
 339:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t GE:4;                       /*!< bit: 16..19  Greater than or Equal flags        */
 340:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t _reserved1:4;               /*!< bit: 20..23  Reserved                           */
 341:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t T:1;                        /*!< bit:     24  Thumb bit        (read 0)          */
 342:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t IT:2;                       /*!< bit: 25..26  saved IT state   (read 0)          */
 343:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t Q:1;                        /*!< bit:     27  Saturation condition flag          */
 344:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t V:1;                        /*!< bit:     28  Overflow condition code flag       */
 345:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t C:1;                        /*!< bit:     29  Carry condition code flag          */
 346:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t Z:1;                        /*!< bit:     30  Zero condition code flag           */
 347:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t N:1;                        /*!< bit:     31  Negative condition code flag       */
 348:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   } b;                                   /*!< Structure used for bit  access                  */
 349:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t w;                            /*!< Type      used for word access                  */
 350:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } xPSR_Type;
 351:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 352:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* xPSR Register Definitions */
 353:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_N_Pos                         31                                             /*!< xPSR
 354:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_N_Msk                         (1UL << xPSR_N_Pos)                            /*!< xPSR
 355:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 356:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_Z_Pos                         30                                             /*!< xPSR
 357:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_Z_Msk                         (1UL << xPSR_Z_Pos)                            /*!< xPSR
 358:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 359:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_C_Pos                         29                                             /*!< xPSR
 360:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_C_Msk                         (1UL << xPSR_C_Pos)                            /*!< xPSR
 361:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 362:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_V_Pos                         28                                             /*!< xPSR
 363:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_V_Msk                         (1UL << xPSR_V_Pos)                            /*!< xPSR
 364:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 365:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_Q_Pos                         27                                             /*!< xPSR
 366:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_Q_Msk                         (1UL << xPSR_Q_Pos)                            /*!< xPSR
 367:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 368:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_IT_Pos                        25                                             /*!< xPSR
 369:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_IT_Msk                        (3UL << xPSR_IT_Pos)                           /*!< xPSR
 370:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 371:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_T_Pos                         24                                             /*!< xPSR
 372:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_T_Msk                         (1UL << xPSR_T_Pos)                            /*!< xPSR
 373:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 374:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_GE_Pos                        16                                             /*!< xPSR
 375:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_GE_Msk                        (0xFUL << xPSR_GE_Pos)                         /*!< xPSR
 376:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 377:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_ISR_Pos                        0                                             /*!< xPSR
 378:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define xPSR_ISR_Msk                       (0x1FFUL /*<< xPSR_ISR_Pos*/)                  /*!< xPSR
 379:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 380:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 381:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Union type to access the Control Registers (CONTROL).
 382:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 383:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef union
 384:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 385:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   struct
 386:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   {
 387:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t nPRIV:1;                    /*!< bit:      0  Execution privilege in Thread mode */
 388:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t SPSEL:1;                    /*!< bit:      1  Stack to be used                   */
 389:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t FPCA:1;                     /*!< bit:      2  FP extension active flag           */
 390:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     uint32_t _reserved0:29;              /*!< bit:  3..31  Reserved                           */
 391:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   } b;                                   /*!< Structure used for bit  access                  */
 392:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t w;                            /*!< Type      used for word access                  */
 393:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } CONTROL_Type;
 394:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 395:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* CONTROL Register Definitions */
 396:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CONTROL_FPCA_Pos                    2                                             /*!< CONT
 397:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CONTROL_FPCA_Msk                   (1UL << CONTROL_FPCA_Pos)                      /*!< CONT
 398:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 399:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CONTROL_SPSEL_Pos                   1                                             /*!< CONT
 400:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CONTROL_SPSEL_Msk                  (1UL << CONTROL_SPSEL_Pos)                     /*!< CONT
 401:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 402:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CONTROL_nPRIV_Pos                   0                                             /*!< CONT
 403:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CONTROL_nPRIV_Msk                  (1UL /*<< CONTROL_nPRIV_Pos*/)                 /*!< CONT
 404:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 405:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_CORE */
 406:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 407:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 408:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup    CMSIS_core_register
 409:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup   CMSIS_NVIC  Nested Vectored Interrupt Controller (NVIC)
 410:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the NVIC Registers
 411:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 412:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 413:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 414:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the Nested Vectored Interrupt Controller (NVIC).
 415:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 416:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
 417:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 418:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ISER[8];                 /*!< Offset: 0x000 (R/W)  Interrupt Set Enable Register   
 419:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED0[24];
 420:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ICER[8];                 /*!< Offset: 0x080 (R/W)  Interrupt Clear Enable Register 
 421:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RSERVED1[24];
 422:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ISPR[8];                 /*!< Offset: 0x100 (R/W)  Interrupt Set Pending Register  
 423:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED2[24];
 424:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ICPR[8];                 /*!< Offset: 0x180 (R/W)  Interrupt Clear Pending Register
 425:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED3[24];
 426:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t IABR[8];                 /*!< Offset: 0x200 (R/W)  Interrupt Active bit Register   
 427:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED4[56];
 428:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint8_t  IP[240];                 /*!< Offset: 0x300 (R/W)  Interrupt Priority Register (8Bi
 429:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED5[644];
 430:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __O  uint32_t STIR;                    /*!< Offset: 0xE00 ( /W)  Software Trigger Interrupt Regis
 431:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }  NVIC_Type;
 432:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 433:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Software Triggered Interrupt Register Definitions */
 434:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define NVIC_STIR_INTID_Pos                 0                                          /*!< STIR: I
 435:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define NVIC_STIR_INTID_Msk                (0x1FFUL /*<< NVIC_STIR_INTID_Pos*/)        /*!< STIR: I
 436:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 437:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_NVIC */
 438:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 439:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 440:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
 441:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_SCB     System Control Block (SCB)
 442:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the System Control Block Registers
 443:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 444:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 445:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 446:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the System Control Block (SCB).
 447:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 448:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
 449:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 450:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t CPUID;                   /*!< Offset: 0x000 (R/ )  CPUID Base Register             
 451:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ICSR;                    /*!< Offset: 0x004 (R/W)  Interrupt Control and State Regi
 452:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t VTOR;                    /*!< Offset: 0x008 (R/W)  Vector Table Offset Register    
 453:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t AIRCR;                   /*!< Offset: 0x00C (R/W)  Application Interrupt and Reset 
 454:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t SCR;                     /*!< Offset: 0x010 (R/W)  System Control Register         
 455:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CCR;                     /*!< Offset: 0x014 (R/W)  Configuration Control Register  
 456:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint8_t  SHP[12];                 /*!< Offset: 0x018 (R/W)  System Handlers Priority Registe
 457:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t SHCSR;                   /*!< Offset: 0x024 (R/W)  System Handler Control and State
 458:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CFSR;                    /*!< Offset: 0x028 (R/W)  Configurable Fault Status Regist
 459:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t HFSR;                    /*!< Offset: 0x02C (R/W)  HardFault Status Register       
 460:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t DFSR;                    /*!< Offset: 0x030 (R/W)  Debug Fault Status Register     
 461:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t MMFAR;                   /*!< Offset: 0x034 (R/W)  MemManage Fault Address Register
 462:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t BFAR;                    /*!< Offset: 0x038 (R/W)  BusFault Address Register       
 463:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t AFSR;                    /*!< Offset: 0x03C (R/W)  Auxiliary Fault Status Register 
 464:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PFR[2];                  /*!< Offset: 0x040 (R/ )  Processor Feature Register      
 465:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t DFR;                     /*!< Offset: 0x048 (R/ )  Debug Feature Register          
 466:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t ADR;                     /*!< Offset: 0x04C (R/ )  Auxiliary Feature Register      
 467:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t MMFR[4];                 /*!< Offset: 0x050 (R/ )  Memory Model Feature Register   
 468:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t ISAR[5];                 /*!< Offset: 0x060 (R/ )  Instruction Set Attributes Regis
 469:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED0[5];
 470:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CPACR;                   /*!< Offset: 0x088 (R/W)  Coprocessor Access Control Regis
 471:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } SCB_Type;
 472:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 473:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB CPUID Register Definitions */
 474:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_IMPLEMENTER_Pos          24                                             /*!< SCB 
 475:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_IMPLEMENTER_Msk          (0xFFUL << SCB_CPUID_IMPLEMENTER_Pos)          /*!< SCB 
 476:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 477:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_VARIANT_Pos              20                                             /*!< SCB 
 478:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_VARIANT_Msk              (0xFUL << SCB_CPUID_VARIANT_Pos)               /*!< SCB 
 479:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 480:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_ARCHITECTURE_Pos         16                                             /*!< SCB 
 481:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_ARCHITECTURE_Msk         (0xFUL << SCB_CPUID_ARCHITECTURE_Pos)          /*!< SCB 
 482:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 483:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_PARTNO_Pos                4                                             /*!< SCB 
 484:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_PARTNO_Msk               (0xFFFUL << SCB_CPUID_PARTNO_Pos)              /*!< SCB 
 485:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 486:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_REVISION_Pos              0                                             /*!< SCB 
 487:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CPUID_REVISION_Msk             (0xFUL /*<< SCB_CPUID_REVISION_Pos*/)          /*!< SCB 
 488:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 489:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB Interrupt Control State Register Definitions */
 490:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_NMIPENDSET_Pos            31                                             /*!< SCB 
 491:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_NMIPENDSET_Msk            (1UL << SCB_ICSR_NMIPENDSET_Pos)               /*!< SCB 
 492:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 493:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSVSET_Pos             28                                             /*!< SCB 
 494:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSVSET_Msk             (1UL << SCB_ICSR_PENDSVSET_Pos)                /*!< SCB 
 495:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 496:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSVCLR_Pos             27                                             /*!< SCB 
 497:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSVCLR_Msk             (1UL << SCB_ICSR_PENDSVCLR_Pos)                /*!< SCB 
 498:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 499:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSTSET_Pos             26                                             /*!< SCB 
 500:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSTSET_Msk             (1UL << SCB_ICSR_PENDSTSET_Pos)                /*!< SCB 
 501:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 502:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSTCLR_Pos             25                                             /*!< SCB 
 503:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_PENDSTCLR_Msk             (1UL << SCB_ICSR_PENDSTCLR_Pos)                /*!< SCB 
 504:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 505:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_ISRPREEMPT_Pos            23                                             /*!< SCB 
 506:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_ISRPREEMPT_Msk            (1UL << SCB_ICSR_ISRPREEMPT_Pos)               /*!< SCB 
 507:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 508:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_ISRPENDING_Pos            22                                             /*!< SCB 
 509:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_ISRPENDING_Msk            (1UL << SCB_ICSR_ISRPENDING_Pos)               /*!< SCB 
 510:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 511:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_VECTPENDING_Pos           12                                             /*!< SCB 
 512:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_VECTPENDING_Msk           (0x1FFUL << SCB_ICSR_VECTPENDING_Pos)          /*!< SCB 
 513:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 514:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_RETTOBASE_Pos             11                                             /*!< SCB 
 515:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_RETTOBASE_Msk             (1UL << SCB_ICSR_RETTOBASE_Pos)                /*!< SCB 
 516:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 517:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_VECTACTIVE_Pos             0                                             /*!< SCB 
 518:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_ICSR_VECTACTIVE_Msk            (0x1FFUL /*<< SCB_ICSR_VECTACTIVE_Pos*/)       /*!< SCB 
 519:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 520:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB Vector Table Offset Register Definitions */
 521:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_VTOR_TBLOFF_Pos                 7                                             /*!< SCB 
 522:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_VTOR_TBLOFF_Msk                (0x1FFFFFFUL << SCB_VTOR_TBLOFF_Pos)           /*!< SCB 
 523:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 524:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB Application Interrupt and Reset Control Register Definitions */
 525:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTKEY_Pos              16                                             /*!< SCB 
 526:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTKEY_Msk              (0xFFFFUL << SCB_AIRCR_VECTKEY_Pos)            /*!< SCB 
 527:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 528:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTKEYSTAT_Pos          16                                             /*!< SCB 
 529:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTKEYSTAT_Msk          (0xFFFFUL << SCB_AIRCR_VECTKEYSTAT_Pos)        /*!< SCB 
 530:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 531:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_ENDIANESS_Pos            15                                             /*!< SCB 
 532:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_ENDIANESS_Msk            (1UL << SCB_AIRCR_ENDIANESS_Pos)               /*!< SCB 
 533:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 534:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_PRIGROUP_Pos              8                                             /*!< SCB 
 535:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_PRIGROUP_Msk             (7UL << SCB_AIRCR_PRIGROUP_Pos)                /*!< SCB 
 536:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 537:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_SYSRESETREQ_Pos           2                                             /*!< SCB 
 538:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_SYSRESETREQ_Msk          (1UL << SCB_AIRCR_SYSRESETREQ_Pos)             /*!< SCB 
 539:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 540:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTCLRACTIVE_Pos         1                                             /*!< SCB 
 541:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTCLRACTIVE_Msk        (1UL << SCB_AIRCR_VECTCLRACTIVE_Pos)           /*!< SCB 
 542:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 543:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTRESET_Pos             0                                             /*!< SCB 
 544:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_AIRCR_VECTRESET_Msk            (1UL /*<< SCB_AIRCR_VECTRESET_Pos*/)           /*!< SCB 
 545:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 546:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB System Control Register Definitions */
 547:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SCR_SEVONPEND_Pos               4                                             /*!< SCB 
 548:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SCR_SEVONPEND_Msk              (1UL << SCB_SCR_SEVONPEND_Pos)                 /*!< SCB 
 549:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 550:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SCR_SLEEPDEEP_Pos               2                                             /*!< SCB 
 551:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SCR_SLEEPDEEP_Msk              (1UL << SCB_SCR_SLEEPDEEP_Pos)                 /*!< SCB 
 552:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 553:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SCR_SLEEPONEXIT_Pos             1                                             /*!< SCB 
 554:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SCR_SLEEPONEXIT_Msk            (1UL << SCB_SCR_SLEEPONEXIT_Pos)               /*!< SCB 
 555:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 556:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB Configuration Control Register Definitions */
 557:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_STKALIGN_Pos                9                                             /*!< SCB 
 558:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_STKALIGN_Msk               (1UL << SCB_CCR_STKALIGN_Pos)                  /*!< SCB 
 559:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 560:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_BFHFNMIGN_Pos               8                                             /*!< SCB 
 561:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_BFHFNMIGN_Msk              (1UL << SCB_CCR_BFHFNMIGN_Pos)                 /*!< SCB 
 562:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 563:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_DIV_0_TRP_Pos               4                                             /*!< SCB 
 564:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_DIV_0_TRP_Msk              (1UL << SCB_CCR_DIV_0_TRP_Pos)                 /*!< SCB 
 565:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 566:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_UNALIGN_TRP_Pos             3                                             /*!< SCB 
 567:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_UNALIGN_TRP_Msk            (1UL << SCB_CCR_UNALIGN_TRP_Pos)               /*!< SCB 
 568:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 569:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_USERSETMPEND_Pos            1                                             /*!< SCB 
 570:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_USERSETMPEND_Msk           (1UL << SCB_CCR_USERSETMPEND_Pos)              /*!< SCB 
 571:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 572:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_NONBASETHRDENA_Pos          0                                             /*!< SCB 
 573:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CCR_NONBASETHRDENA_Msk         (1UL /*<< SCB_CCR_NONBASETHRDENA_Pos*/)        /*!< SCB 
 574:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 575:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB System Handler Control and State Register Definitions */
 576:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_USGFAULTENA_Pos          18                                             /*!< SCB 
 577:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_USGFAULTENA_Msk          (1UL << SCB_SHCSR_USGFAULTENA_Pos)             /*!< SCB 
 578:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 579:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_BUSFAULTENA_Pos          17                                             /*!< SCB 
 580:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_BUSFAULTENA_Msk          (1UL << SCB_SHCSR_BUSFAULTENA_Pos)             /*!< SCB 
 581:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 582:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MEMFAULTENA_Pos          16                                             /*!< SCB 
 583:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MEMFAULTENA_Msk          (1UL << SCB_SHCSR_MEMFAULTENA_Pos)             /*!< SCB 
 584:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 585:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_SVCALLPENDED_Pos         15                                             /*!< SCB 
 586:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_SVCALLPENDED_Msk         (1UL << SCB_SHCSR_SVCALLPENDED_Pos)            /*!< SCB 
 587:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 588:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_BUSFAULTPENDED_Pos       14                                             /*!< SCB 
 589:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_BUSFAULTPENDED_Msk       (1UL << SCB_SHCSR_BUSFAULTPENDED_Pos)          /*!< SCB 
 590:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 591:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MEMFAULTPENDED_Pos       13                                             /*!< SCB 
 592:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MEMFAULTPENDED_Msk       (1UL << SCB_SHCSR_MEMFAULTPENDED_Pos)          /*!< SCB 
 593:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 594:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_USGFAULTPENDED_Pos       12                                             /*!< SCB 
 595:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_USGFAULTPENDED_Msk       (1UL << SCB_SHCSR_USGFAULTPENDED_Pos)          /*!< SCB 
 596:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 597:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_SYSTICKACT_Pos           11                                             /*!< SCB 
 598:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_SYSTICKACT_Msk           (1UL << SCB_SHCSR_SYSTICKACT_Pos)              /*!< SCB 
 599:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 600:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_PENDSVACT_Pos            10                                             /*!< SCB 
 601:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_PENDSVACT_Msk            (1UL << SCB_SHCSR_PENDSVACT_Pos)               /*!< SCB 
 602:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 603:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MONITORACT_Pos            8                                             /*!< SCB 
 604:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MONITORACT_Msk           (1UL << SCB_SHCSR_MONITORACT_Pos)              /*!< SCB 
 605:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 606:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_SVCALLACT_Pos             7                                             /*!< SCB 
 607:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_SVCALLACT_Msk            (1UL << SCB_SHCSR_SVCALLACT_Pos)               /*!< SCB 
 608:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 609:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_USGFAULTACT_Pos           3                                             /*!< SCB 
 610:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_USGFAULTACT_Msk          (1UL << SCB_SHCSR_USGFAULTACT_Pos)             /*!< SCB 
 611:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 612:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_BUSFAULTACT_Pos           1                                             /*!< SCB 
 613:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_BUSFAULTACT_Msk          (1UL << SCB_SHCSR_BUSFAULTACT_Pos)             /*!< SCB 
 614:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 615:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MEMFAULTACT_Pos           0                                             /*!< SCB 
 616:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_SHCSR_MEMFAULTACT_Msk          (1UL /*<< SCB_SHCSR_MEMFAULTACT_Pos*/)         /*!< SCB 
 617:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 618:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB Configurable Fault Status Registers Definitions */
 619:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CFSR_USGFAULTSR_Pos            16                                             /*!< SCB 
 620:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CFSR_USGFAULTSR_Msk            (0xFFFFUL << SCB_CFSR_USGFAULTSR_Pos)          /*!< SCB 
 621:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 622:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CFSR_BUSFAULTSR_Pos             8                                             /*!< SCB 
 623:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CFSR_BUSFAULTSR_Msk            (0xFFUL << SCB_CFSR_BUSFAULTSR_Pos)            /*!< SCB 
 624:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 625:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CFSR_MEMFAULTSR_Pos             0                                             /*!< SCB 
 626:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_CFSR_MEMFAULTSR_Msk            (0xFFUL /*<< SCB_CFSR_MEMFAULTSR_Pos*/)        /*!< SCB 
 627:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 628:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB Hard Fault Status Registers Definitions */
 629:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_HFSR_DEBUGEVT_Pos              31                                             /*!< SCB 
 630:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_HFSR_DEBUGEVT_Msk              (1UL << SCB_HFSR_DEBUGEVT_Pos)                 /*!< SCB 
 631:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 632:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_HFSR_FORCED_Pos                30                                             /*!< SCB 
 633:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_HFSR_FORCED_Msk                (1UL << SCB_HFSR_FORCED_Pos)                   /*!< SCB 
 634:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 635:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_HFSR_VECTTBL_Pos                1                                             /*!< SCB 
 636:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_HFSR_VECTTBL_Msk               (1UL << SCB_HFSR_VECTTBL_Pos)                  /*!< SCB 
 637:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 638:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SCB Debug Fault Status Register Definitions */
 639:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_EXTERNAL_Pos               4                                             /*!< SCB 
 640:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_EXTERNAL_Msk              (1UL << SCB_DFSR_EXTERNAL_Pos)                 /*!< SCB 
 641:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 642:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_VCATCH_Pos                 3                                             /*!< SCB 
 643:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_VCATCH_Msk                (1UL << SCB_DFSR_VCATCH_Pos)                   /*!< SCB 
 644:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 645:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_DWTTRAP_Pos                2                                             /*!< SCB 
 646:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_DWTTRAP_Msk               (1UL << SCB_DFSR_DWTTRAP_Pos)                  /*!< SCB 
 647:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 648:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_BKPT_Pos                   1                                             /*!< SCB 
 649:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_BKPT_Msk                  (1UL << SCB_DFSR_BKPT_Pos)                     /*!< SCB 
 650:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 651:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_HALTED_Pos                 0                                             /*!< SCB 
 652:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_DFSR_HALTED_Msk                (1UL /*<< SCB_DFSR_HALTED_Pos*/)               /*!< SCB 
 653:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 654:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_SCB */
 655:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 656:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 657:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
 658:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_SCnSCB System Controls not in SCB (SCnSCB)
 659:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the System Control and ID Register not in the SCB
 660:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 661:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 662:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 663:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the System Control and ID Register not in the SCB.
 664:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 665:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
 666:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 667:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED0[1];
 668:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t ICTR;                    /*!< Offset: 0x004 (R/ )  Interrupt Controller Type Regist
 669:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ACTLR;                   /*!< Offset: 0x008 (R/W)  Auxiliary Control Register      
 670:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } SCnSCB_Type;
 671:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 672:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Interrupt Controller Type Register Definitions */
 673:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ICTR_INTLINESNUM_Pos         0                                          /*!< ICTR: I
 674:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ICTR_INTLINESNUM_Msk        (0xFUL /*<< SCnSCB_ICTR_INTLINESNUM_Pos*/)  /*!< ICTR: I
 675:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 676:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Auxiliary Control Register Definitions */
 677:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISOOFP_Pos            9                                          /*!< ACTLR: 
 678:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISOOFP_Msk           (1UL << SCnSCB_ACTLR_DISOOFP_Pos)           /*!< ACTLR: 
 679:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 680:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISFPCA_Pos            8                                          /*!< ACTLR: 
 681:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISFPCA_Msk           (1UL << SCnSCB_ACTLR_DISFPCA_Pos)           /*!< ACTLR: 
 682:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 683:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISFOLD_Pos            2                                          /*!< ACTLR: 
 684:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISFOLD_Msk           (1UL << SCnSCB_ACTLR_DISFOLD_Pos)           /*!< ACTLR: 
 685:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 686:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISDEFWBUF_Pos         1                                          /*!< ACTLR: 
 687:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISDEFWBUF_Msk        (1UL << SCnSCB_ACTLR_DISDEFWBUF_Pos)        /*!< ACTLR: 
 688:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 689:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISMCYCINT_Pos         0                                          /*!< ACTLR: 
 690:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB_ACTLR_DISMCYCINT_Msk        (1UL /*<< SCnSCB_ACTLR_DISMCYCINT_Pos*/)    /*!< ACTLR: 
 691:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 692:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_SCnotSCB */
 693:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 694:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 695:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
 696:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_SysTick     System Tick Timer (SysTick)
 697:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the System Timer Registers.
 698:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 699:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 700:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 701:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the System Timer (SysTick).
 702:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 703:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
 704:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 705:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CTRL;                    /*!< Offset: 0x000 (R/W)  SysTick Control and Status Regis
 706:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t LOAD;                    /*!< Offset: 0x004 (R/W)  SysTick Reload Value Register   
 707:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t VAL;                     /*!< Offset: 0x008 (R/W)  SysTick Current Value Register  
 708:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t CALIB;                   /*!< Offset: 0x00C (R/ )  SysTick Calibration Register    
 709:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } SysTick_Type;
 710:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 711:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SysTick Control / Status Register Definitions */
 712:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_COUNTFLAG_Pos         16                                             /*!< SysT
 713:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_COUNTFLAG_Msk         (1UL << SysTick_CTRL_COUNTFLAG_Pos)            /*!< SysT
 714:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 715:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_CLKSOURCE_Pos          2                                             /*!< SysT
 716:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_CLKSOURCE_Msk         (1UL << SysTick_CTRL_CLKSOURCE_Pos)            /*!< SysT
 717:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 718:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_TICKINT_Pos            1                                             /*!< SysT
 719:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_TICKINT_Msk           (1UL << SysTick_CTRL_TICKINT_Pos)              /*!< SysT
 720:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 721:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_ENABLE_Pos             0                                             /*!< SysT
 722:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CTRL_ENABLE_Msk            (1UL /*<< SysTick_CTRL_ENABLE_Pos*/)           /*!< SysT
 723:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 724:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SysTick Reload Register Definitions */
 725:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_LOAD_RELOAD_Pos             0                                             /*!< SysT
 726:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_LOAD_RELOAD_Msk            (0xFFFFFFUL /*<< SysTick_LOAD_RELOAD_Pos*/)    /*!< SysT
 727:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 728:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SysTick Current Register Definitions */
 729:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_VAL_CURRENT_Pos             0                                             /*!< SysT
 730:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_VAL_CURRENT_Msk            (0xFFFFFFUL /*<< SysTick_VAL_CURRENT_Pos*/)    /*!< SysT
 731:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 732:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* SysTick Calibration Register Definitions */
 733:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CALIB_NOREF_Pos            31                                             /*!< SysT
 734:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CALIB_NOREF_Msk            (1UL << SysTick_CALIB_NOREF_Pos)               /*!< SysT
 735:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 736:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CALIB_SKEW_Pos             30                                             /*!< SysT
 737:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CALIB_SKEW_Msk             (1UL << SysTick_CALIB_SKEW_Pos)                /*!< SysT
 738:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 739:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CALIB_TENMS_Pos             0                                             /*!< SysT
 740:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_CALIB_TENMS_Msk            (0xFFFFFFUL /*<< SysTick_CALIB_TENMS_Pos*/)    /*!< SysT
 741:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 742:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_SysTick */
 743:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 744:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 745:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
 746:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_ITM     Instrumentation Trace Macrocell (ITM)
 747:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the Instrumentation Trace Macrocell (ITM)
 748:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 749:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 750:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 751:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the Instrumentation Trace Macrocell Register (ITM).
 752:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 753:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
 754:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 755:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __O  union
 756:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   {
 757:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     __O  uint8_t    u8;                  /*!< Offset: 0x000 ( /W)  ITM Stimulus Port 8-bit         
 758:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     __O  uint16_t   u16;                 /*!< Offset: 0x000 ( /W)  ITM Stimulus Port 16-bit        
 759:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     __O  uint32_t   u32;                 /*!< Offset: 0x000 ( /W)  ITM Stimulus Port 32-bit        
 760:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }  PORT [32];                          /*!< Offset: 0x000 ( /W)  ITM Stimulus Port Registers     
 761:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED0[864];
 762:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t TER;                     /*!< Offset: 0xE00 (R/W)  ITM Trace Enable Register       
 763:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED1[15];
 764:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t TPR;                     /*!< Offset: 0xE40 (R/W)  ITM Trace Privilege Register    
 765:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED2[15];
 766:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t TCR;                     /*!< Offset: 0xE80 (R/W)  ITM Trace Control Register      
 767:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED3[29];
 768:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __O  uint32_t IWR;                     /*!< Offset: 0xEF8 ( /W)  ITM Integration Write Register  
 769:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t IRR;                     /*!< Offset: 0xEFC (R/ )  ITM Integration Read Register   
 770:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t IMCR;                    /*!< Offset: 0xF00 (R/W)  ITM Integration Mode Control Reg
 771:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED4[43];
 772:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __O  uint32_t LAR;                     /*!< Offset: 0xFB0 ( /W)  ITM Lock Access Register        
 773:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t LSR;                     /*!< Offset: 0xFB4 (R/ )  ITM Lock Status Register        
 774:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED5[6];
 775:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID4;                    /*!< Offset: 0xFD0 (R/ )  ITM Peripheral Identification Re
 776:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID5;                    /*!< Offset: 0xFD4 (R/ )  ITM Peripheral Identification Re
 777:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID6;                    /*!< Offset: 0xFD8 (R/ )  ITM Peripheral Identification Re
 778:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID7;                    /*!< Offset: 0xFDC (R/ )  ITM Peripheral Identification Re
 779:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID0;                    /*!< Offset: 0xFE0 (R/ )  ITM Peripheral Identification Re
 780:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID1;                    /*!< Offset: 0xFE4 (R/ )  ITM Peripheral Identification Re
 781:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID2;                    /*!< Offset: 0xFE8 (R/ )  ITM Peripheral Identification Re
 782:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PID3;                    /*!< Offset: 0xFEC (R/ )  ITM Peripheral Identification Re
 783:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t CID0;                    /*!< Offset: 0xFF0 (R/ )  ITM Component  Identification Re
 784:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t CID1;                    /*!< Offset: 0xFF4 (R/ )  ITM Component  Identification Re
 785:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t CID2;                    /*!< Offset: 0xFF8 (R/ )  ITM Component  Identification Re
 786:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t CID3;                    /*!< Offset: 0xFFC (R/ )  ITM Component  Identification Re
 787:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } ITM_Type;
 788:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 789:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ITM Trace Privilege Register Definitions */
 790:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TPR_PRIVMASK_Pos                0                                             /*!< ITM 
 791:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TPR_PRIVMASK_Msk               (0xFUL /*<< ITM_TPR_PRIVMASK_Pos*/)            /*!< ITM 
 792:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 793:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ITM Trace Control Register Definitions */
 794:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_BUSY_Pos                   23                                             /*!< ITM 
 795:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_BUSY_Msk                   (1UL << ITM_TCR_BUSY_Pos)                      /*!< ITM 
 796:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 797:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_TraceBusID_Pos             16                                             /*!< ITM 
 798:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_TraceBusID_Msk             (0x7FUL << ITM_TCR_TraceBusID_Pos)             /*!< ITM 
 799:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 800:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_GTSFREQ_Pos                10                                             /*!< ITM 
 801:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_GTSFREQ_Msk                (3UL << ITM_TCR_GTSFREQ_Pos)                   /*!< ITM 
 802:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 803:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_TSPrescale_Pos              8                                             /*!< ITM 
 804:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_TSPrescale_Msk             (3UL << ITM_TCR_TSPrescale_Pos)                /*!< ITM 
 805:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 806:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_SWOENA_Pos                  4                                             /*!< ITM 
 807:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_SWOENA_Msk                 (1UL << ITM_TCR_SWOENA_Pos)                    /*!< ITM 
 808:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 809:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_DWTENA_Pos                  3                                             /*!< ITM 
 810:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_DWTENA_Msk                 (1UL << ITM_TCR_DWTENA_Pos)                    /*!< ITM 
 811:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 812:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_SYNCENA_Pos                 2                                             /*!< ITM 
 813:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_SYNCENA_Msk                (1UL << ITM_TCR_SYNCENA_Pos)                   /*!< ITM 
 814:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 815:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_TSENA_Pos                   1                                             /*!< ITM 
 816:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_TSENA_Msk                  (1UL << ITM_TCR_TSENA_Pos)                     /*!< ITM 
 817:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 818:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_ITMENA_Pos                  0                                             /*!< ITM 
 819:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_TCR_ITMENA_Msk                 (1UL /*<< ITM_TCR_ITMENA_Pos*/)                /*!< ITM 
 820:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 821:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ITM Integration Write Register Definitions */
 822:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_IWR_ATVALIDM_Pos                0                                             /*!< ITM 
 823:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_IWR_ATVALIDM_Msk               (1UL /*<< ITM_IWR_ATVALIDM_Pos*/)              /*!< ITM 
 824:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 825:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ITM Integration Read Register Definitions */
 826:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_IRR_ATREADYM_Pos                0                                             /*!< ITM 
 827:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_IRR_ATREADYM_Msk               (1UL /*<< ITM_IRR_ATREADYM_Pos*/)              /*!< ITM 
 828:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 829:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ITM Integration Mode Control Register Definitions */
 830:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_IMCR_INTEGRATION_Pos            0                                             /*!< ITM 
 831:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_IMCR_INTEGRATION_Msk           (1UL /*<< ITM_IMCR_INTEGRATION_Pos*/)          /*!< ITM 
 832:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 833:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ITM Lock Status Register Definitions */
 834:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_LSR_ByteAcc_Pos                 2                                             /*!< ITM 
 835:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_LSR_ByteAcc_Msk                (1UL << ITM_LSR_ByteAcc_Pos)                   /*!< ITM 
 836:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 837:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_LSR_Access_Pos                  1                                             /*!< ITM 
 838:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_LSR_Access_Msk                 (1UL << ITM_LSR_Access_Pos)                    /*!< ITM 
 839:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 840:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_LSR_Present_Pos                 0                                             /*!< ITM 
 841:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_LSR_Present_Msk                (1UL /*<< ITM_LSR_Present_Pos*/)               /*!< ITM 
 842:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 843:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@}*/ /* end of group CMSIS_ITM */
 844:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 845:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 846:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
 847:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_DWT     Data Watchpoint and Trace (DWT)
 848:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the Data Watchpoint and Trace (DWT)
 849:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 850:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 851:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 852:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the Data Watchpoint and Trace Register (DWT).
 853:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 854:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
 855:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 856:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CTRL;                    /*!< Offset: 0x000 (R/W)  Control Register                
 857:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CYCCNT;                  /*!< Offset: 0x004 (R/W)  Cycle Count Register            
 858:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CPICNT;                  /*!< Offset: 0x008 (R/W)  CPI Count Register              
 859:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t EXCCNT;                  /*!< Offset: 0x00C (R/W)  Exception Overhead Count Registe
 860:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t SLEEPCNT;                /*!< Offset: 0x010 (R/W)  Sleep Count Register            
 861:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t LSUCNT;                  /*!< Offset: 0x014 (R/W)  LSU Count Register              
 862:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FOLDCNT;                 /*!< Offset: 0x018 (R/W)  Folded-instruction Count Registe
 863:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t PCSR;                    /*!< Offset: 0x01C (R/ )  Program Counter Sample Register 
 864:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t COMP0;                   /*!< Offset: 0x020 (R/W)  Comparator Register 0           
 865:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t MASK0;                   /*!< Offset: 0x024 (R/W)  Mask Register 0                 
 866:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FUNCTION0;               /*!< Offset: 0x028 (R/W)  Function Register 0             
 867:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED0[1];
 868:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t COMP1;                   /*!< Offset: 0x030 (R/W)  Comparator Register 1           
 869:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t MASK1;                   /*!< Offset: 0x034 (R/W)  Mask Register 1                 
 870:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FUNCTION1;               /*!< Offset: 0x038 (R/W)  Function Register 1             
 871:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED1[1];
 872:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t COMP2;                   /*!< Offset: 0x040 (R/W)  Comparator Register 2           
 873:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t MASK2;                   /*!< Offset: 0x044 (R/W)  Mask Register 2                 
 874:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FUNCTION2;               /*!< Offset: 0x048 (R/W)  Function Register 2             
 875:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED2[1];
 876:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t COMP3;                   /*!< Offset: 0x050 (R/W)  Comparator Register 3           
 877:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t MASK3;                   /*!< Offset: 0x054 (R/W)  Mask Register 3                 
 878:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FUNCTION3;               /*!< Offset: 0x058 (R/W)  Function Register 3             
 879:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } DWT_Type;
 880:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 881:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT Control Register Definitions */
 882:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NUMCOMP_Pos               28                                          /*!< DWT CTR
 883:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NUMCOMP_Msk               (0xFUL << DWT_CTRL_NUMCOMP_Pos)             /*!< DWT CTR
 884:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 885:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOTRCPKT_Pos              27                                          /*!< DWT CTR
 886:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOTRCPKT_Msk              (0x1UL << DWT_CTRL_NOTRCPKT_Pos)            /*!< DWT CTR
 887:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 888:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOEXTTRIG_Pos             26                                          /*!< DWT CTR
 889:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOEXTTRIG_Msk             (0x1UL << DWT_CTRL_NOEXTTRIG_Pos)           /*!< DWT CTR
 890:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 891:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOCYCCNT_Pos              25                                          /*!< DWT CTR
 892:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOCYCCNT_Msk              (0x1UL << DWT_CTRL_NOCYCCNT_Pos)            /*!< DWT CTR
 893:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 894:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOPRFCNT_Pos              24                                          /*!< DWT CTR
 895:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_NOPRFCNT_Msk              (0x1UL << DWT_CTRL_NOPRFCNT_Pos)            /*!< DWT CTR
 896:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 897:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CYCEVTENA_Pos             22                                          /*!< DWT CTR
 898:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CYCEVTENA_Msk             (0x1UL << DWT_CTRL_CYCEVTENA_Pos)           /*!< DWT CTR
 899:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 900:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_FOLDEVTENA_Pos            21                                          /*!< DWT CTR
 901:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_FOLDEVTENA_Msk            (0x1UL << DWT_CTRL_FOLDEVTENA_Pos)          /*!< DWT CTR
 902:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 903:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_LSUEVTENA_Pos             20                                          /*!< DWT CTR
 904:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_LSUEVTENA_Msk             (0x1UL << DWT_CTRL_LSUEVTENA_Pos)           /*!< DWT CTR
 905:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 906:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_SLEEPEVTENA_Pos           19                                          /*!< DWT CTR
 907:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_SLEEPEVTENA_Msk           (0x1UL << DWT_CTRL_SLEEPEVTENA_Pos)         /*!< DWT CTR
 908:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 909:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_EXCEVTENA_Pos             18                                          /*!< DWT CTR
 910:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_EXCEVTENA_Msk             (0x1UL << DWT_CTRL_EXCEVTENA_Pos)           /*!< DWT CTR
 911:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 912:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CPIEVTENA_Pos             17                                          /*!< DWT CTR
 913:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CPIEVTENA_Msk             (0x1UL << DWT_CTRL_CPIEVTENA_Pos)           /*!< DWT CTR
 914:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 915:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_EXCTRCENA_Pos             16                                          /*!< DWT CTR
 916:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_EXCTRCENA_Msk             (0x1UL << DWT_CTRL_EXCTRCENA_Pos)           /*!< DWT CTR
 917:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 918:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_PCSAMPLENA_Pos            12                                          /*!< DWT CTR
 919:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_PCSAMPLENA_Msk            (0x1UL << DWT_CTRL_PCSAMPLENA_Pos)          /*!< DWT CTR
 920:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 921:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_SYNCTAP_Pos               10                                          /*!< DWT CTR
 922:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_SYNCTAP_Msk               (0x3UL << DWT_CTRL_SYNCTAP_Pos)             /*!< DWT CTR
 923:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 924:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CYCTAP_Pos                 9                                          /*!< DWT CTR
 925:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CYCTAP_Msk                (0x1UL << DWT_CTRL_CYCTAP_Pos)              /*!< DWT CTR
 926:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 927:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_POSTINIT_Pos               5                                          /*!< DWT CTR
 928:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_POSTINIT_Msk              (0xFUL << DWT_CTRL_POSTINIT_Pos)            /*!< DWT CTR
 929:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 930:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_POSTPRESET_Pos             1                                          /*!< DWT CTR
 931:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_POSTPRESET_Msk            (0xFUL << DWT_CTRL_POSTPRESET_Pos)          /*!< DWT CTR
 932:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 933:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CYCCNTENA_Pos              0                                          /*!< DWT CTR
 934:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CTRL_CYCCNTENA_Msk             (0x1UL /*<< DWT_CTRL_CYCCNTENA_Pos*/)       /*!< DWT CTR
 935:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 936:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT CPI Count Register Definitions */
 937:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CPICNT_CPICNT_Pos               0                                          /*!< DWT CPI
 938:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_CPICNT_CPICNT_Msk              (0xFFUL /*<< DWT_CPICNT_CPICNT_Pos*/)       /*!< DWT CPI
 939:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 940:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT Exception Overhead Count Register Definitions */
 941:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_EXCCNT_EXCCNT_Pos               0                                          /*!< DWT EXC
 942:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_EXCCNT_EXCCNT_Msk              (0xFFUL /*<< DWT_EXCCNT_EXCCNT_Pos*/)       /*!< DWT EXC
 943:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 944:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT Sleep Count Register Definitions */
 945:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_SLEEPCNT_SLEEPCNT_Pos           0                                          /*!< DWT SLE
 946:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_SLEEPCNT_SLEEPCNT_Msk          (0xFFUL /*<< DWT_SLEEPCNT_SLEEPCNT_Pos*/)   /*!< DWT SLE
 947:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 948:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT LSU Count Register Definitions */
 949:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_LSUCNT_LSUCNT_Pos               0                                          /*!< DWT LSU
 950:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_LSUCNT_LSUCNT_Msk              (0xFFUL /*<< DWT_LSUCNT_LSUCNT_Pos*/)       /*!< DWT LSU
 951:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 952:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT Folded-instruction Count Register Definitions */
 953:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FOLDCNT_FOLDCNT_Pos             0                                          /*!< DWT FOL
 954:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FOLDCNT_FOLDCNT_Msk            (0xFFUL /*<< DWT_FOLDCNT_FOLDCNT_Pos*/)     /*!< DWT FOL
 955:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 956:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT Comparator Mask Register Definitions */
 957:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_MASK_MASK_Pos                   0                                          /*!< DWT MAS
 958:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_MASK_MASK_Msk                  (0x1FUL /*<< DWT_MASK_MASK_Pos*/)           /*!< DWT MAS
 959:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 960:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* DWT Comparator Function Register Definitions */
 961:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_MATCHED_Pos           24                                          /*!< DWT FUN
 962:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_MATCHED_Msk           (0x1UL << DWT_FUNCTION_MATCHED_Pos)         /*!< DWT FUN
 963:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 964:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVADDR1_Pos        16                                          /*!< DWT FUN
 965:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVADDR1_Msk        (0xFUL << DWT_FUNCTION_DATAVADDR1_Pos)      /*!< DWT FUN
 966:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 967:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVADDR0_Pos        12                                          /*!< DWT FUN
 968:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVADDR0_Msk        (0xFUL << DWT_FUNCTION_DATAVADDR0_Pos)      /*!< DWT FUN
 969:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 970:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVSIZE_Pos         10                                          /*!< DWT FUN
 971:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVSIZE_Msk         (0x3UL << DWT_FUNCTION_DATAVSIZE_Pos)       /*!< DWT FUN
 972:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 973:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_LNK1ENA_Pos            9                                          /*!< DWT FUN
 974:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_LNK1ENA_Msk           (0x1UL << DWT_FUNCTION_LNK1ENA_Pos)         /*!< DWT FUN
 975:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 976:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVMATCH_Pos         8                                          /*!< DWT FUN
 977:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_DATAVMATCH_Msk        (0x1UL << DWT_FUNCTION_DATAVMATCH_Pos)      /*!< DWT FUN
 978:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 979:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_CYCMATCH_Pos           7                                          /*!< DWT FUN
 980:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_CYCMATCH_Msk          (0x1UL << DWT_FUNCTION_CYCMATCH_Pos)        /*!< DWT FUN
 981:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 982:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_EMITRANGE_Pos          5                                          /*!< DWT FUN
 983:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_EMITRANGE_Msk         (0x1UL << DWT_FUNCTION_EMITRANGE_Pos)       /*!< DWT FUN
 984:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 985:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_FUNCTION_Pos           0                                          /*!< DWT FUN
 986:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_FUNCTION_FUNCTION_Msk          (0xFUL /*<< DWT_FUNCTION_FUNCTION_Pos*/)    /*!< DWT FUN
 987:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 988:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@}*/ /* end of group CMSIS_DWT */
 989:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 990:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 991:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
 992:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_TPI     Trace Port Interface (TPI)
 993:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the Trace Port Interface (TPI)
 994:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
 995:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 996:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
 997:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the Trace Port Interface Register (TPI).
 998:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
 999:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
1000:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1001:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t SSPSR;                   /*!< Offset: 0x000 (R/ )  Supported Parallel Port Size Reg
1002:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CSPSR;                   /*!< Offset: 0x004 (R/W)  Current Parallel Port Size Regis
1003:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED0[2];
1004:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ACPR;                    /*!< Offset: 0x010 (R/W)  Asynchronous Clock Prescaler Reg
1005:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED1[55];
1006:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t SPPR;                    /*!< Offset: 0x0F0 (R/W)  Selected Pin Protocol Register *
1007:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED2[131];
1008:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t FFSR;                    /*!< Offset: 0x300 (R/ )  Formatter and Flush Status Regis
1009:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FFCR;                    /*!< Offset: 0x304 (R/W)  Formatter and Flush Control Regi
1010:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t FSCR;                    /*!< Offset: 0x308 (R/ )  Formatter Synchronization Counte
1011:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED3[759];
1012:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t TRIGGER;                 /*!< Offset: 0xEE8 (R/ )  TRIGGER */
1013:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t FIFO0;                   /*!< Offset: 0xEEC (R/ )  Integration ETM Data */
1014:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t ITATBCTR2;               /*!< Offset: 0xEF0 (R/ )  ITATBCTR2 */
1015:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED4[1];
1016:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t ITATBCTR0;               /*!< Offset: 0xEF8 (R/ )  ITATBCTR0 */
1017:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t FIFO1;                   /*!< Offset: 0xEFC (R/ )  Integration ITM Data */
1018:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t ITCTRL;                  /*!< Offset: 0xF00 (R/W)  Integration Mode Control */
1019:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED5[39];
1020:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CLAIMSET;                /*!< Offset: 0xFA0 (R/W)  Claim tag set */
1021:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CLAIMCLR;                /*!< Offset: 0xFA4 (R/W)  Claim tag clear */
1022:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED7[8];
1023:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t DEVID;                   /*!< Offset: 0xFC8 (R/ )  TPIU_DEVID */
1024:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t DEVTYPE;                 /*!< Offset: 0xFCC (R/ )  TPIU_DEVTYPE */
1025:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } TPI_Type;
1026:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1027:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI Asynchronous Clock Prescaler Register Definitions */
1028:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ACPR_PRESCALER_Pos              0                                          /*!< TPI ACP
1029:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ACPR_PRESCALER_Msk             (0x1FFFUL /*<< TPI_ACPR_PRESCALER_Pos*/)    /*!< TPI ACP
1030:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1031:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI Selected Pin Protocol Register Definitions */
1032:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_SPPR_TXMODE_Pos                 0                                          /*!< TPI SPP
1033:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_SPPR_TXMODE_Msk                (0x3UL /*<< TPI_SPPR_TXMODE_Pos*/)          /*!< TPI SPP
1034:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1035:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI Formatter and Flush Status Register Definitions */
1036:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_FtNonStop_Pos              3                                          /*!< TPI FFS
1037:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_FtNonStop_Msk             (0x1UL << TPI_FFSR_FtNonStop_Pos)           /*!< TPI FFS
1038:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1039:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_TCPresent_Pos              2                                          /*!< TPI FFS
1040:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_TCPresent_Msk             (0x1UL << TPI_FFSR_TCPresent_Pos)           /*!< TPI FFS
1041:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1042:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_FtStopped_Pos              1                                          /*!< TPI FFS
1043:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_FtStopped_Msk             (0x1UL << TPI_FFSR_FtStopped_Pos)           /*!< TPI FFS
1044:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1045:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_FlInProg_Pos               0                                          /*!< TPI FFS
1046:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFSR_FlInProg_Msk              (0x1UL /*<< TPI_FFSR_FlInProg_Pos*/)        /*!< TPI FFS
1047:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1048:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI Formatter and Flush Control Register Definitions */
1049:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFCR_TrigIn_Pos                 8                                          /*!< TPI FFC
1050:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFCR_TrigIn_Msk                (0x1UL << TPI_FFCR_TrigIn_Pos)              /*!< TPI FFC
1051:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1052:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFCR_EnFCont_Pos                1                                          /*!< TPI FFC
1053:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FFCR_EnFCont_Msk               (0x1UL << TPI_FFCR_EnFCont_Pos)             /*!< TPI FFC
1054:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1055:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI TRIGGER Register Definitions */
1056:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_TRIGGER_TRIGGER_Pos             0                                          /*!< TPI TRI
1057:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_TRIGGER_TRIGGER_Msk            (0x1UL /*<< TPI_TRIGGER_TRIGGER_Pos*/)      /*!< TPI TRI
1058:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1059:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI Integration ETM Data Register Definitions (FIFO0) */
1060:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ITM_ATVALID_Pos          29                                          /*!< TPI FIF
1061:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ITM_ATVALID_Msk          (0x3UL << TPI_FIFO0_ITM_ATVALID_Pos)        /*!< TPI FIF
1062:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1063:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ITM_bytecount_Pos        27                                          /*!< TPI FIF
1064:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ITM_bytecount_Msk        (0x3UL << TPI_FIFO0_ITM_bytecount_Pos)      /*!< TPI FIF
1065:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1066:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM_ATVALID_Pos          26                                          /*!< TPI FIF
1067:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM_ATVALID_Msk          (0x3UL << TPI_FIFO0_ETM_ATVALID_Pos)        /*!< TPI FIF
1068:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1069:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM_bytecount_Pos        24                                          /*!< TPI FIF
1070:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM_bytecount_Msk        (0x3UL << TPI_FIFO0_ETM_bytecount_Pos)      /*!< TPI FIF
1071:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1072:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM2_Pos                 16                                          /*!< TPI FIF
1073:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM2_Msk                 (0xFFUL << TPI_FIFO0_ETM2_Pos)              /*!< TPI FIF
1074:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1075:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM1_Pos                  8                                          /*!< TPI FIF
1076:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM1_Msk                 (0xFFUL << TPI_FIFO0_ETM1_Pos)              /*!< TPI FIF
1077:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1078:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM0_Pos                  0                                          /*!< TPI FIF
1079:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO0_ETM0_Msk                 (0xFFUL /*<< TPI_FIFO0_ETM0_Pos*/)          /*!< TPI FIF
1080:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1081:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI ITATBCTR2 Register Definitions */
1082:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ITATBCTR2_ATREADY_Pos           0                                          /*!< TPI ITA
1083:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ITATBCTR2_ATREADY_Msk          (0x1UL /*<< TPI_ITATBCTR2_ATREADY_Pos*/)    /*!< TPI ITA
1084:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1085:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI Integration ITM Data Register Definitions (FIFO1) */
1086:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM_ATVALID_Pos          29                                          /*!< TPI FIF
1087:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM_ATVALID_Msk          (0x3UL << TPI_FIFO1_ITM_ATVALID_Pos)        /*!< TPI FIF
1088:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1089:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM_bytecount_Pos        27                                          /*!< TPI FIF
1090:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM_bytecount_Msk        (0x3UL << TPI_FIFO1_ITM_bytecount_Pos)      /*!< TPI FIF
1091:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1092:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ETM_ATVALID_Pos          26                                          /*!< TPI FIF
1093:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ETM_ATVALID_Msk          (0x3UL << TPI_FIFO1_ETM_ATVALID_Pos)        /*!< TPI FIF
1094:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1095:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ETM_bytecount_Pos        24                                          /*!< TPI FIF
1096:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ETM_bytecount_Msk        (0x3UL << TPI_FIFO1_ETM_bytecount_Pos)      /*!< TPI FIF
1097:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1098:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM2_Pos                 16                                          /*!< TPI FIF
1099:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM2_Msk                 (0xFFUL << TPI_FIFO1_ITM2_Pos)              /*!< TPI FIF
1100:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1101:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM1_Pos                  8                                          /*!< TPI FIF
1102:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM1_Msk                 (0xFFUL << TPI_FIFO1_ITM1_Pos)              /*!< TPI FIF
1103:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1104:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM0_Pos                  0                                          /*!< TPI FIF
1105:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_FIFO1_ITM0_Msk                 (0xFFUL /*<< TPI_FIFO1_ITM0_Pos*/)          /*!< TPI FIF
1106:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1107:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI ITATBCTR0 Register Definitions */
1108:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ITATBCTR0_ATREADY_Pos           0                                          /*!< TPI ITA
1109:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ITATBCTR0_ATREADY_Msk          (0x1UL /*<< TPI_ITATBCTR0_ATREADY_Pos*/)    /*!< TPI ITA
1110:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1111:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI Integration Mode Control Register Definitions */
1112:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ITCTRL_Mode_Pos                 0                                          /*!< TPI ITC
1113:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_ITCTRL_Mode_Msk                (0x1UL /*<< TPI_ITCTRL_Mode_Pos*/)          /*!< TPI ITC
1114:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1115:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI DEVID Register Definitions */
1116:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_NRZVALID_Pos             11                                          /*!< TPI DEV
1117:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_NRZVALID_Msk             (0x1UL << TPI_DEVID_NRZVALID_Pos)           /*!< TPI DEV
1118:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1119:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_MANCVALID_Pos            10                                          /*!< TPI DEV
1120:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_MANCVALID_Msk            (0x1UL << TPI_DEVID_MANCVALID_Pos)          /*!< TPI DEV
1121:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1122:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_PTINVALID_Pos             9                                          /*!< TPI DEV
1123:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_PTINVALID_Msk            (0x1UL << TPI_DEVID_PTINVALID_Pos)          /*!< TPI DEV
1124:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1125:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_MinBufSz_Pos              6                                          /*!< TPI DEV
1126:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_MinBufSz_Msk             (0x7UL << TPI_DEVID_MinBufSz_Pos)           /*!< TPI DEV
1127:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1128:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_AsynClkIn_Pos             5                                          /*!< TPI DEV
1129:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_AsynClkIn_Msk            (0x1UL << TPI_DEVID_AsynClkIn_Pos)          /*!< TPI DEV
1130:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1131:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_NrTraceInput_Pos          0                                          /*!< TPI DEV
1132:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVID_NrTraceInput_Msk         (0x1FUL /*<< TPI_DEVID_NrTraceInput_Pos*/)  /*!< TPI DEV
1133:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1134:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* TPI DEVTYPE Register Definitions */
1135:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVTYPE_MajorType_Pos           4                                          /*!< TPI DEV
1136:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVTYPE_MajorType_Msk          (0xFUL << TPI_DEVTYPE_MajorType_Pos)        /*!< TPI DEV
1137:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1138:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVTYPE_SubType_Pos             0                                          /*!< TPI DEV
1139:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_DEVTYPE_SubType_Msk            (0xFUL /*<< TPI_DEVTYPE_SubType_Pos*/)      /*!< TPI DEV
1140:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1141:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@}*/ /* end of group CMSIS_TPI */
1142:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1143:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1144:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if (__MPU_PRESENT == 1)
1145:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
1146:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_MPU     Memory Protection Unit (MPU)
1147:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the Memory Protection Unit (MPU)
1148:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
1149:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1150:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1151:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the Memory Protection Unit (MPU).
1152:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1153:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
1154:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1155:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t TYPE;                    /*!< Offset: 0x000 (R/ )  MPU Type Register               
1156:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t CTRL;                    /*!< Offset: 0x004 (R/W)  MPU Control Register            
1157:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RNR;                     /*!< Offset: 0x008 (R/W)  MPU Region RNRber Register      
1158:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RBAR;                    /*!< Offset: 0x00C (R/W)  MPU Region Base Address Register
1159:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RASR;                    /*!< Offset: 0x010 (R/W)  MPU Region Attribute and Size Re
1160:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RBAR_A1;                 /*!< Offset: 0x014 (R/W)  MPU Alias 1 Region Base Address 
1161:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RASR_A1;                 /*!< Offset: 0x018 (R/W)  MPU Alias 1 Region Attribute and
1162:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RBAR_A2;                 /*!< Offset: 0x01C (R/W)  MPU Alias 2 Region Base Address 
1163:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RASR_A2;                 /*!< Offset: 0x020 (R/W)  MPU Alias 2 Region Attribute and
1164:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RBAR_A3;                 /*!< Offset: 0x024 (R/W)  MPU Alias 3 Region Base Address 
1165:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t RASR_A3;                 /*!< Offset: 0x028 (R/W)  MPU Alias 3 Region Attribute and
1166:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } MPU_Type;
1167:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1168:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* MPU Type Register */
1169:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_TYPE_IREGION_Pos               16                                             /*!< MPU 
1170:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_TYPE_IREGION_Msk               (0xFFUL << MPU_TYPE_IREGION_Pos)               /*!< MPU 
1171:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1172:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_TYPE_DREGION_Pos                8                                             /*!< MPU 
1173:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_TYPE_DREGION_Msk               (0xFFUL << MPU_TYPE_DREGION_Pos)               /*!< MPU 
1174:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1175:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_TYPE_SEPARATE_Pos               0                                             /*!< MPU 
1176:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_TYPE_SEPARATE_Msk              (1UL /*<< MPU_TYPE_SEPARATE_Pos*/)             /*!< MPU 
1177:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1178:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* MPU Control Register */
1179:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_CTRL_PRIVDEFENA_Pos             2                                             /*!< MPU 
1180:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_CTRL_PRIVDEFENA_Msk            (1UL << MPU_CTRL_PRIVDEFENA_Pos)               /*!< MPU 
1181:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1182:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_CTRL_HFNMIENA_Pos               1                                             /*!< MPU 
1183:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_CTRL_HFNMIENA_Msk              (1UL << MPU_CTRL_HFNMIENA_Pos)                 /*!< MPU 
1184:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1185:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_CTRL_ENABLE_Pos                 0                                             /*!< MPU 
1186:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_CTRL_ENABLE_Msk                (1UL /*<< MPU_CTRL_ENABLE_Pos*/)               /*!< MPU 
1187:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1188:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* MPU Region Number Register */
1189:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RNR_REGION_Pos                  0                                             /*!< MPU 
1190:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RNR_REGION_Msk                 (0xFFUL /*<< MPU_RNR_REGION_Pos*/)             /*!< MPU 
1191:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1192:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* MPU Region Base Address Register */
1193:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RBAR_ADDR_Pos                   5                                             /*!< MPU 
1194:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RBAR_ADDR_Msk                  (0x7FFFFFFUL << MPU_RBAR_ADDR_Pos)             /*!< MPU 
1195:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1196:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RBAR_VALID_Pos                  4                                             /*!< MPU 
1197:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RBAR_VALID_Msk                 (1UL << MPU_RBAR_VALID_Pos)                    /*!< MPU 
1198:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1199:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RBAR_REGION_Pos                 0                                             /*!< MPU 
1200:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RBAR_REGION_Msk                (0xFUL /*<< MPU_RBAR_REGION_Pos*/)             /*!< MPU 
1201:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1202:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* MPU Region Attribute and Size Register */
1203:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_ATTRS_Pos                 16                                             /*!< MPU 
1204:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_ATTRS_Msk                 (0xFFFFUL << MPU_RASR_ATTRS_Pos)               /*!< MPU 
1205:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1206:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_XN_Pos                    28                                             /*!< MPU 
1207:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_XN_Msk                    (1UL << MPU_RASR_XN_Pos)                       /*!< MPU 
1208:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1209:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_AP_Pos                    24                                             /*!< MPU 
1210:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_AP_Msk                    (0x7UL << MPU_RASR_AP_Pos)                     /*!< MPU 
1211:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1212:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_TEX_Pos                   19                                             /*!< MPU 
1213:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_TEX_Msk                   (0x7UL << MPU_RASR_TEX_Pos)                    /*!< MPU 
1214:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1215:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_S_Pos                     18                                             /*!< MPU 
1216:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_S_Msk                     (1UL << MPU_RASR_S_Pos)                        /*!< MPU 
1217:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1218:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_C_Pos                     17                                             /*!< MPU 
1219:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_C_Msk                     (1UL << MPU_RASR_C_Pos)                        /*!< MPU 
1220:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1221:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_B_Pos                     16                                             /*!< MPU 
1222:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_B_Msk                     (1UL << MPU_RASR_B_Pos)                        /*!< MPU 
1223:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1224:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_SRD_Pos                    8                                             /*!< MPU 
1225:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_SRD_Msk                   (0xFFUL << MPU_RASR_SRD_Pos)                   /*!< MPU 
1226:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1227:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_SIZE_Pos                   1                                             /*!< MPU 
1228:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_SIZE_Msk                  (0x1FUL << MPU_RASR_SIZE_Pos)                  /*!< MPU 
1229:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1230:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_ENABLE_Pos                 0                                             /*!< MPU 
1231:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define MPU_RASR_ENABLE_Msk                (1UL /*<< MPU_RASR_ENABLE_Pos*/)               /*!< MPU 
1232:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1233:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_MPU */
1234:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
1235:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1236:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1237:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if (__FPU_PRESENT == 1)
1238:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
1239:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_FPU     Floating Point Unit (FPU)
1240:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the Floating Point Unit (FPU)
1241:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
1242:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1243:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1244:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the Floating Point Unit (FPU).
1245:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1246:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
1247:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1248:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****        uint32_t RESERVED0[1];
1249:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FPCCR;                   /*!< Offset: 0x004 (R/W)  Floating-Point Context Control R
1250:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FPCAR;                   /*!< Offset: 0x008 (R/W)  Floating-Point Context Address R
1251:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t FPDSCR;                  /*!< Offset: 0x00C (R/W)  Floating-Point Default Status Co
1252:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t MVFR0;                   /*!< Offset: 0x010 (R/ )  Media and FP Feature Register 0 
1253:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __I  uint32_t MVFR1;                   /*!< Offset: 0x014 (R/ )  Media and FP Feature Register 1 
1254:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } FPU_Type;
1255:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1256:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Floating-Point Context Control Register */
1257:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_ASPEN_Pos                31                                             /*!< FPCC
1258:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_ASPEN_Msk                (1UL << FPU_FPCCR_ASPEN_Pos)                   /*!< FPCC
1259:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1260:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_LSPEN_Pos                30                                             /*!< FPCC
1261:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_LSPEN_Msk                (1UL << FPU_FPCCR_LSPEN_Pos)                   /*!< FPCC
1262:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1263:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_MONRDY_Pos                8                                             /*!< FPCC
1264:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_MONRDY_Msk               (1UL << FPU_FPCCR_MONRDY_Pos)                  /*!< FPCC
1265:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1266:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_BFRDY_Pos                 6                                             /*!< FPCC
1267:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_BFRDY_Msk                (1UL << FPU_FPCCR_BFRDY_Pos)                   /*!< FPCC
1268:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1269:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_MMRDY_Pos                 5                                             /*!< FPCC
1270:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_MMRDY_Msk                (1UL << FPU_FPCCR_MMRDY_Pos)                   /*!< FPCC
1271:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1272:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_HFRDY_Pos                 4                                             /*!< FPCC
1273:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_HFRDY_Msk                (1UL << FPU_FPCCR_HFRDY_Pos)                   /*!< FPCC
1274:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1275:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_THREAD_Pos                3                                             /*!< FPCC
1276:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_THREAD_Msk               (1UL << FPU_FPCCR_THREAD_Pos)                  /*!< FPCC
1277:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1278:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_USER_Pos                  1                                             /*!< FPCC
1279:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_USER_Msk                 (1UL << FPU_FPCCR_USER_Pos)                    /*!< FPCC
1280:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1281:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_LSPACT_Pos                0                                             /*!< FPCC
1282:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCCR_LSPACT_Msk               (1UL /*<< FPU_FPCCR_LSPACT_Pos*/)              /*!< FPCC
1283:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1284:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Floating-Point Context Address Register */
1285:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCAR_ADDRESS_Pos               3                                             /*!< FPCA
1286:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPCAR_ADDRESS_Msk              (0x1FFFFFFFUL << FPU_FPCAR_ADDRESS_Pos)        /*!< FPCA
1287:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1288:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Floating-Point Default Status Control Register */
1289:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_AHP_Pos                 26                                             /*!< FPDS
1290:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_AHP_Msk                 (1UL << FPU_FPDSCR_AHP_Pos)                    /*!< FPDS
1291:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1292:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_DN_Pos                  25                                             /*!< FPDS
1293:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_DN_Msk                  (1UL << FPU_FPDSCR_DN_Pos)                     /*!< FPDS
1294:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1295:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_FZ_Pos                  24                                             /*!< FPDS
1296:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_FZ_Msk                  (1UL << FPU_FPDSCR_FZ_Pos)                     /*!< FPDS
1297:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1298:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_RMode_Pos               22                                             /*!< FPDS
1299:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_FPDSCR_RMode_Msk               (3UL << FPU_FPDSCR_RMode_Pos)                  /*!< FPDS
1300:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1301:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Media and FP Feature Register 0 */
1302:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_FP_rounding_modes_Pos    28                                             /*!< MVFR
1303:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_FP_rounding_modes_Msk    (0xFUL << FPU_MVFR0_FP_rounding_modes_Pos)     /*!< MVFR
1304:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1305:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Short_vectors_Pos        24                                             /*!< MVFR
1306:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Short_vectors_Msk        (0xFUL << FPU_MVFR0_Short_vectors_Pos)         /*!< MVFR
1307:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1308:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Square_root_Pos          20                                             /*!< MVFR
1309:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Square_root_Msk          (0xFUL << FPU_MVFR0_Square_root_Pos)           /*!< MVFR
1310:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1311:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Divide_Pos               16                                             /*!< MVFR
1312:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Divide_Msk               (0xFUL << FPU_MVFR0_Divide_Pos)                /*!< MVFR
1313:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1314:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_FP_excep_trapping_Pos    12                                             /*!< MVFR
1315:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_FP_excep_trapping_Msk    (0xFUL << FPU_MVFR0_FP_excep_trapping_Pos)     /*!< MVFR
1316:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1317:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Double_precision_Pos      8                                             /*!< MVFR
1318:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Double_precision_Msk     (0xFUL << FPU_MVFR0_Double_precision_Pos)      /*!< MVFR
1319:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1320:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Single_precision_Pos      4                                             /*!< MVFR
1321:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_Single_precision_Msk     (0xFUL << FPU_MVFR0_Single_precision_Pos)      /*!< MVFR
1322:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1323:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_A_SIMD_registers_Pos      0                                             /*!< MVFR
1324:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR0_A_SIMD_registers_Msk     (0xFUL /*<< FPU_MVFR0_A_SIMD_registers_Pos*/)  /*!< MVFR
1325:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1326:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Media and FP Feature Register 1 */
1327:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_FP_fused_MAC_Pos         28                                             /*!< MVFR
1328:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_FP_fused_MAC_Msk         (0xFUL << FPU_MVFR1_FP_fused_MAC_Pos)          /*!< MVFR
1329:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1330:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_FP_HPFP_Pos              24                                             /*!< MVFR
1331:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_FP_HPFP_Msk              (0xFUL << FPU_MVFR1_FP_HPFP_Pos)               /*!< MVFR
1332:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1333:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_D_NaN_mode_Pos            4                                             /*!< MVFR
1334:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_D_NaN_mode_Msk           (0xFUL << FPU_MVFR1_D_NaN_mode_Pos)            /*!< MVFR
1335:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1336:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_FtZ_mode_Pos              0                                             /*!< MVFR
1337:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define FPU_MVFR1_FtZ_mode_Msk             (0xFUL /*<< FPU_MVFR1_FtZ_mode_Pos*/)          /*!< MVFR
1338:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1339:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_FPU */
1340:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
1341:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1342:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1343:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_core_register
1344:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_CoreDebug       Core Debug Registers (CoreDebug)
1345:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Type definitions for the Core Debug Registers
1346:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
1347:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1348:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1349:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Structure type to access the Core Debug Register (CoreDebug).
1350:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1351:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** typedef struct
1352:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1353:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t DHCSR;                   /*!< Offset: 0x000 (R/W)  Debug Halting Control and Status
1354:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __O  uint32_t DCRSR;                   /*!< Offset: 0x004 ( /W)  Debug Core Register Selector Reg
1355:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t DCRDR;                   /*!< Offset: 0x008 (R/W)  Debug Core Register Data Registe
1356:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __IO uint32_t DEMCR;                   /*!< Offset: 0x00C (R/W)  Debug Exception and Monitor Cont
1357:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** } CoreDebug_Type;
1358:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1359:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Debug Halting Control and Status Register */
1360:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_DBGKEY_Pos         16                                             /*!< Core
1361:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_DBGKEY_Msk         (0xFFFFUL << CoreDebug_DHCSR_DBGKEY_Pos)       /*!< Core
1362:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1363:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_RESET_ST_Pos     25                                             /*!< Core
1364:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_RESET_ST_Msk     (1UL << CoreDebug_DHCSR_S_RESET_ST_Pos)        /*!< Core
1365:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1366:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_RETIRE_ST_Pos    24                                             /*!< Core
1367:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_RETIRE_ST_Msk    (1UL << CoreDebug_DHCSR_S_RETIRE_ST_Pos)       /*!< Core
1368:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1369:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_LOCKUP_Pos       19                                             /*!< Core
1370:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_LOCKUP_Msk       (1UL << CoreDebug_DHCSR_S_LOCKUP_Pos)          /*!< Core
1371:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1372:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_SLEEP_Pos        18                                             /*!< Core
1373:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_SLEEP_Msk        (1UL << CoreDebug_DHCSR_S_SLEEP_Pos)           /*!< Core
1374:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1375:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_HALT_Pos         17                                             /*!< Core
1376:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_HALT_Msk         (1UL << CoreDebug_DHCSR_S_HALT_Pos)            /*!< Core
1377:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1378:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_REGRDY_Pos       16                                             /*!< Core
1379:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_S_REGRDY_Msk       (1UL << CoreDebug_DHCSR_S_REGRDY_Pos)          /*!< Core
1380:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1381:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_SNAPSTALL_Pos     5                                             /*!< Core
1382:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_SNAPSTALL_Msk    (1UL << CoreDebug_DHCSR_C_SNAPSTALL_Pos)       /*!< Core
1383:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1384:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_MASKINTS_Pos      3                                             /*!< Core
1385:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_MASKINTS_Msk     (1UL << CoreDebug_DHCSR_C_MASKINTS_Pos)        /*!< Core
1386:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1387:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_STEP_Pos          2                                             /*!< Core
1388:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_STEP_Msk         (1UL << CoreDebug_DHCSR_C_STEP_Pos)            /*!< Core
1389:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1390:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_HALT_Pos          1                                             /*!< Core
1391:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_HALT_Msk         (1UL << CoreDebug_DHCSR_C_HALT_Pos)            /*!< Core
1392:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1393:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_DEBUGEN_Pos       0                                             /*!< Core
1394:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DHCSR_C_DEBUGEN_Msk      (1UL /*<< CoreDebug_DHCSR_C_DEBUGEN_Pos*/)     /*!< Core
1395:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1396:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Debug Core Register Selector Register */
1397:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DCRSR_REGWnR_Pos         16                                             /*!< Core
1398:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DCRSR_REGWnR_Msk         (1UL << CoreDebug_DCRSR_REGWnR_Pos)            /*!< Core
1399:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1400:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DCRSR_REGSEL_Pos          0                                             /*!< Core
1401:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DCRSR_REGSEL_Msk         (0x1FUL /*<< CoreDebug_DCRSR_REGSEL_Pos*/)     /*!< Core
1402:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1403:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Debug Exception and Monitor Control Register */
1404:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_TRCENA_Pos         24                                             /*!< Core
1405:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_TRCENA_Msk         (1UL << CoreDebug_DEMCR_TRCENA_Pos)            /*!< Core
1406:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1407:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_REQ_Pos        19                                             /*!< Core
1408:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_REQ_Msk        (1UL << CoreDebug_DEMCR_MON_REQ_Pos)           /*!< Core
1409:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1410:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_STEP_Pos       18                                             /*!< Core
1411:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_STEP_Msk       (1UL << CoreDebug_DEMCR_MON_STEP_Pos)          /*!< Core
1412:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1413:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_PEND_Pos       17                                             /*!< Core
1414:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_PEND_Msk       (1UL << CoreDebug_DEMCR_MON_PEND_Pos)          /*!< Core
1415:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1416:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_EN_Pos         16                                             /*!< Core
1417:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_MON_EN_Msk         (1UL << CoreDebug_DEMCR_MON_EN_Pos)            /*!< Core
1418:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1419:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_HARDERR_Pos     10                                             /*!< Core
1420:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_HARDERR_Msk     (1UL << CoreDebug_DEMCR_VC_HARDERR_Pos)        /*!< Core
1421:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1422:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_INTERR_Pos       9                                             /*!< Core
1423:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_INTERR_Msk      (1UL << CoreDebug_DEMCR_VC_INTERR_Pos)         /*!< Core
1424:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1425:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_BUSERR_Pos       8                                             /*!< Core
1426:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_BUSERR_Msk      (1UL << CoreDebug_DEMCR_VC_BUSERR_Pos)         /*!< Core
1427:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1428:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_STATERR_Pos      7                                             /*!< Core
1429:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_STATERR_Msk     (1UL << CoreDebug_DEMCR_VC_STATERR_Pos)        /*!< Core
1430:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1431:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_CHKERR_Pos       6                                             /*!< Core
1432:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_CHKERR_Msk      (1UL << CoreDebug_DEMCR_VC_CHKERR_Pos)         /*!< Core
1433:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1434:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_NOCPERR_Pos      5                                             /*!< Core
1435:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_NOCPERR_Msk     (1UL << CoreDebug_DEMCR_VC_NOCPERR_Pos)        /*!< Core
1436:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1437:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_MMERR_Pos        4                                             /*!< Core
1438:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_MMERR_Msk       (1UL << CoreDebug_DEMCR_VC_MMERR_Pos)          /*!< Core
1439:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1440:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_CORERESET_Pos    0                                             /*!< Core
1441:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_DEMCR_VC_CORERESET_Msk   (1UL /*<< CoreDebug_DEMCR_VC_CORERESET_Pos*/)  /*!< Core
1442:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1443:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of group CMSIS_CoreDebug */
1444:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1445:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1446:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup    CMSIS_core_register
1447:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup   CMSIS_core_base     Core Definitions
1448:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Definitions for base addresses, unions, and structures.
1449:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
1450:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1451:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1452:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* Memory mapping of Cortex-M4 Hardware */
1453:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCS_BASE            (0xE000E000UL)                            /*!< System Control Space Bas
1454:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM_BASE            (0xE0000000UL)                            /*!< ITM Base Address        
1455:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT_BASE            (0xE0001000UL)                            /*!< DWT Base Address        
1456:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI_BASE            (0xE0040000UL)                            /*!< TPI Base Address        
1457:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug_BASE      (0xE000EDF0UL)                            /*!< Core Debug Base Address 
1458:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick_BASE        (SCS_BASE +  0x0010UL)                    /*!< SysTick Base Address    
1459:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define NVIC_BASE           (SCS_BASE +  0x0100UL)                    /*!< NVIC Base Address       
1460:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB_BASE            (SCS_BASE +  0x0D00UL)                    /*!< System Control Block Bas
1461:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1462:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCnSCB              ((SCnSCB_Type    *)     SCS_BASE      )   /*!< System control Register 
1463:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SCB                 ((SCB_Type       *)     SCB_BASE      )   /*!< SCB configuration struct
1464:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define SysTick             ((SysTick_Type   *)     SysTick_BASE  )   /*!< SysTick configuration st
1465:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define NVIC                ((NVIC_Type      *)     NVIC_BASE     )   /*!< NVIC configuration struc
1466:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define ITM                 ((ITM_Type       *)     ITM_BASE      )   /*!< ITM configuration struct
1467:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define DWT                 ((DWT_Type       *)     DWT_BASE      )   /*!< DWT configuration struct
1468:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define TPI                 ((TPI_Type       *)     TPI_BASE      )   /*!< TPI configuration struct
1469:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #define CoreDebug           ((CoreDebug_Type *)     CoreDebug_BASE)   /*!< Core Debug configuration
1470:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1471:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if (__MPU_PRESENT == 1)
1472:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define MPU_BASE          (SCS_BASE +  0x0D90UL)                    /*!< Memory Protection Unit  
1473:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define MPU               ((MPU_Type       *)     MPU_BASE      )   /*!< Memory Protection Unit  
1474:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
1475:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1476:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if (__FPU_PRESENT == 1)
1477:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define FPU_BASE          (SCS_BASE +  0x0F30UL)                    /*!< Floating Point Unit     
1478:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   #define FPU               ((FPU_Type       *)     FPU_BASE      )   /*!< Floating Point Unit     
1479:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #endif
1480:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1481:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} */
1482:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1483:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1484:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1485:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*******************************************************************************
1486:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  *                Hardware Abstraction Layer
1487:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   Core Function Interface contains:
1488:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core NVIC Functions
1489:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core SysTick Functions
1490:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core Debug Functions
1491:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   - Core Register Access Functions
1492:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  ******************************************************************************/
1493:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \defgroup CMSIS_Core_FunctionInterface Functions and Instructions Reference
1494:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** */
1495:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1496:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1497:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1498:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ##########################   NVIC functions  #################################### */
1499:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_Core_FunctionInterface
1500:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_Core_NVICFunctions NVIC Functions
1501:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Functions that manage interrupts and exceptions via the NVIC.
1502:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     @{
1503:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1504:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1505:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Set Priority Grouping
1506:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1507:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   The function sets the priority grouping field using the required unlock sequence.
1508:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   The parameter PriorityGroup is assigned to the field SCB->AIRCR [10:8] PRIGROUP field.
1509:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   Only values from 0..7 are used.
1510:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   In case of a conflict between priority grouping and available
1511:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   priority bits (__NVIC_PRIO_BITS), the smallest possible priority group is set.
1512:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1513:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      PriorityGroup  Priority grouping field.
1514:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1515:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
1516:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1517:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t reg_value;
1518:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);             /* only values 0..7 a
1519:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1520:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   reg_value  =  SCB->AIRCR;                                                   /* read old register 
1521:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   reg_value &= ~((uint32_t)(SCB_AIRCR_VECTKEY_Msk | SCB_AIRCR_PRIGROUP_Msk));             /* clear 
1522:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   reg_value  =  (reg_value                                   |
1523:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                 ((uint32_t)0x5FAUL << SCB_AIRCR_VECTKEY_Pos) |
1524:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                 (PriorityGroupTmp << 8)                       );              /* Insert write key a
1525:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SCB->AIRCR =  reg_value;
1526:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1527:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1528:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1529:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Get Priority Grouping
1530:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1531:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   The function reads the priority grouping field from the NVIC Interrupt Controller.
1532:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1533:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return                Priority grouping field (SCB->AIRCR [10:8] PRIGROUP field).
1534:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1535:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE uint32_t NVIC_GetPriorityGrouping(void)
1536:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1537:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   return ((uint32_t)((SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) >> SCB_AIRCR_PRIGROUP_Pos));
1538:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1539:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1540:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1541:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Enable External Interrupt
1542:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1543:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function enables a device-specific interrupt in the NVIC interrupt controller.
1544:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1545:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      IRQn  External interrupt number. Value cannot be negative.
1546:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1547:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_EnableIRQ(IRQn_Type IRQn)
1548:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1549:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   NVIC->ISER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0
1550:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1551:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1552:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1553:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Disable External Interrupt
1554:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1555:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function disables a device-specific interrupt in the NVIC interrupt controller.
1556:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1557:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      IRQn  External interrupt number. Value cannot be negative.
1558:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1559:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_DisableIRQ(IRQn_Type IRQn)
1560:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1561:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   NVIC->ICER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0
1562:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1563:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1564:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1565:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Get Pending Interrupt
1566:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1567:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function reads the pending register in the NVIC and returns the pending bit
1568:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     for the specified interrupt.
1569:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1570:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      IRQn  Interrupt number.
1571:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1572:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return             0  Interrupt status is not pending.
1573:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return             1  Interrupt status is pending.
1574:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1575:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
1576:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1577:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   return((uint32_t)(((NVIC->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t
1578:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1579:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1580:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1581:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Set Pending Interrupt
1582:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1583:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function sets the pending bit of an external interrupt.
1584:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1585:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      IRQn  Interrupt number. Value cannot be negative.
1586:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1587:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_SetPendingIRQ(IRQn_Type IRQn)
1588:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1589:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   NVIC->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0
1590:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1591:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1592:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1593:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Clear Pending Interrupt
1594:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1595:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function clears the pending bit of an external interrupt.
1596:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1597:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      IRQn  External interrupt number. Value cannot be negative.
1598:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1599:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
1600:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1601:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   NVIC->ICPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0
1602:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1603:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1604:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1605:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Get Active Interrupt
1606:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1607:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function reads the active register in NVIC and returns the active bit.
1608:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1609:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      IRQn  Interrupt number.
1610:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1611:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return             0  Interrupt status is not active.
1612:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return             1  Interrupt status is active.
1613:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1614:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE uint32_t NVIC_GetActive(IRQn_Type IRQn)
1615:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1616:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   return((uint32_t)(((NVIC->IABR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t
1617:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1618:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1619:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1620:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Set Interrupt Priority
1621:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1622:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function sets the priority of an interrupt.
1623:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1624:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \note The priority cannot be set for every core interrupt.
1625:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1626:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]      IRQn  Interrupt number.
1627:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]  priority  Priority to set.
1628:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1629:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
1630:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
  57              		.loc 2 1630 0
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
  69 0006 0200     		movs	r2, r0
  70 0008 3960     		str	r1, [r7]
  71 000a FB1D     		adds	r3, r7, #7
  72 000c 1A70     		strb	r2, [r3]
1631:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   if((int32_t)IRQn < 0) {
  73              		.loc 2 1631 0
  74 000e FB1D     		adds	r3, r7, #7
  75 0010 1B78     		ldrb	r3, [r3]
  76 0012 7F2B     		cmp	r3, #127
  77 0014 0DD9     		bls	.L3
1632:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     SCB->SHP[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8 - __NVIC_PRIO_BIT
  78              		.loc 2 1632 0
  79 0016 3B68     		ldr	r3, [r7]
  80 0018 DAB2     		uxtb	r2, r3
  81 001a 0F49     		ldr	r1, .L6
  82 001c FB1D     		adds	r3, r7, #7
  83 001e 1B78     		ldrb	r3, [r3]
  84 0020 1800     		movs	r0, r3
  85 0022 0F23     		movs	r3, #15
  86 0024 0340     		ands	r3, r0
  87 0026 043B     		subs	r3, r3, #4
  88 0028 1201     		lsls	r2, r2, #4
  89 002a D2B2     		uxtb	r2, r2
  90 002c CB18     		adds	r3, r1, r3
  91 002e 1A76     		strb	r2, [r3, #24]
1633:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
1634:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   else {
1635:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     NVIC->IP[((uint32_t)(int32_t)IRQn)]               = (uint8_t)((priority << (8 - __NVIC_PRIO_BIT
1636:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
1637:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
  92              		.loc 2 1637 0
  93 0030 0DE0     		b	.L5
  94              	.L3:
1635:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
  95              		.loc 2 1635 0
  96 0032 3B68     		ldr	r3, [r7]
  97 0034 DBB2     		uxtb	r3, r3
  98 0036 0949     		ldr	r1, .L6+4
  99 0038 FA1D     		adds	r2, r7, #7
 100 003a 1278     		ldrb	r2, [r2]
 101 003c 52B2     		sxtb	r2, r2
 102 003e 1B01     		lsls	r3, r3, #4
 103 0040 D8B2     		uxtb	r0, r3
 104 0042 C023     		movs	r3, #192
 105 0044 9B00     		lsls	r3, r3, #2
 106 0046 8A18     		adds	r2, r1, r2
 107 0048 D318     		adds	r3, r2, r3
 108 004a 021C     		adds	r2, r0, #0
 109 004c 1A70     		strb	r2, [r3]
 110              	.L5:
 111              		.loc 2 1637 0
 112 004e C046     		nop
 113 0050 BD46     		mov	sp, r7
 114 0052 02B0     		add	sp, sp, #8
 115              		@ sp needed
 116 0054 80BD     		pop	{r7, pc}
 117              	.L7:
 118 0056 C046     		.align	2
 119              	.L6:
 120 0058 00ED00E0 		.word	-536810240
 121 005c 00E100E0 		.word	-536813312
 122              		.cfi_endproc
 123              	.LFE117:
 125              		.align	1
 126              		.syntax unified
 127              		.code	16
 128              		.thumb_func
 129              		.fpu softvfp
 131              	SysTick_Config:
 132              	.LFB122:
1638:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1639:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1640:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Get Interrupt Priority
1641:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1642:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function reads the priority of an interrupt. The interrupt
1643:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     number can be positive to specify an external (device specific)
1644:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     interrupt, or negative to specify an internal (core) interrupt.
1645:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1646:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1647:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]   IRQn  Interrupt number.
1648:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return             Interrupt Priority. Value is aligned automatically to the implemented
1649:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                         priority bits of the microcontroller.
1650:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1651:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE uint32_t NVIC_GetPriority(IRQn_Type IRQn)
1652:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1653:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1654:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   if((int32_t)IRQn < 0) {
1655:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     return(((uint32_t)SCB->SHP[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] >> (8 - __NVIC_PRIO_BITS)))
1656:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
1657:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   else {
1658:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     return(((uint32_t)NVIC->IP[((uint32_t)(int32_t)IRQn)]               >> (8 - __NVIC_PRIO_BITS)))
1659:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
1660:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1661:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1662:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1663:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Encode Priority
1664:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1665:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function encodes the priority for an interrupt with the given priority group,
1666:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     preemptive priority value, and subpriority value.
1667:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     In case of a conflict between priority grouping and available
1668:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     priority bits (__NVIC_PRIO_BITS), the smallest possible priority group is set.
1669:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1670:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]     PriorityGroup  Used priority group.
1671:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]   PreemptPriority  Preemptive priority value (starting from 0).
1672:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]       SubPriority  Subpriority value (starting from 0).
1673:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return                        Encoded priority. Value can be used in the function \ref NVIC_Se
1674:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1675:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uin
1676:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1677:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);   /* only values 0..7 are used   
1678:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t PreemptPriorityBits;
1679:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t SubPriorityBits;
1680:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1681:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(__NVIC_PRIO_BITS)) ? (uint32_t)(__NV
1682:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(__NVIC_PRIO_BITS)) < (uint32_t)7UL) ? (uint
1683:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1684:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   return (
1685:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****            ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits
1686:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****            ((SubPriority     & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL)))
1687:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****          );
1688:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1689:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1690:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1691:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  Decode Priority
1692:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1693:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function decodes an interrupt priority value with a given priority group to
1694:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     preemptive priority value and subpriority value.
1695:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     In case of a conflict between priority grouping and available
1696:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     priority bits (__NVIC_PRIO_BITS) the smallest possible priority group is set.
1697:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1698:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]         Priority   Priority value, which can be retrieved with the function \ref NV
1699:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]     PriorityGroup  Used priority group.
1700:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [out] pPreemptPriority  Preemptive priority value (starting from 0).
1701:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [out]     pSubPriority  Subpriority value (starting from 0).
1702:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1703:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPre
1704:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1705:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);   /* only values 0..7 are used   
1706:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t PreemptPriorityBits;
1707:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   uint32_t SubPriorityBits;
1708:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1709:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(__NVIC_PRIO_BITS)) ? (uint32_t)(__NV
1710:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(__NVIC_PRIO_BITS)) < (uint32_t)7UL) ? (uint
1711:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1712:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1
1713:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   *pSubPriority     = (Priority                   ) & (uint32_t)((1UL << (SubPriorityBits    )) - 1
1714:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1715:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1716:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1717:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  System Reset
1718:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1719:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function initiates a system reset request to reset the MCU.
1720:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1721:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE void NVIC_SystemReset(void)
1722:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
1723:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __DSB();                                                          /* Ensure all outstanding memor
1724:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                                                                        buffered write are completed
1725:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SCB->AIRCR  = (uint32_t)((0x5FAUL << SCB_AIRCR_VECTKEY_Pos)    |
1726:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                            (SCB->AIRCR & SCB_AIRCR_PRIGROUP_Msk) |
1727:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                             SCB_AIRCR_SYSRESETREQ_Msk    );         /* Keep priority group unchange
1728:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   __DSB();                                                          /* Ensure completion of memory 
1729:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   while(1) { __NOP(); }                                             /* wait until reset */
1730:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
1731:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1732:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /*@} end of CMSIS_Core_NVICFunctions */
1733:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1734:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1735:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1736:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /* ##################################    SysTick function  ########################################
1737:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \ingroup  CMSIS_Core_FunctionInterface
1738:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \defgroup CMSIS_Core_SysTickFunctions SysTick Functions
1739:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \brief      Functions that configure the System.
1740:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   @{
1741:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1742:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1743:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** #if (__Vendor_SysTickConfig == 0)
1744:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1745:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** /** \brief  System Tick Configuration
1746:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1747:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     The function initializes the System Timer and its interrupt, and starts the System Tick Timer.
1748:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     Counter is in free running mode to generate periodic interrupts.
1749:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1750:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \param [in]  ticks  Number of ticks between two interrupts.
1751:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1752:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return          0  Function succeeded.
1753:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \return          1  Function failed.
1754:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1755:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     \note     When the variable <b>__Vendor_SysTickConfig</b> is set to 1, then the
1756:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     function <b>SysTick_Config</b> is not included. In this case, the file <b><i>device</i>.h</b>
1757:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     must contain a vendor-specific implementation of this function.
1758:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1759:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****  */
1760:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** __STATIC_INLINE uint32_t SysTick_Config(uint32_t ticks)
1761:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** {
 133              		.loc 2 1761 0
 134              		.cfi_startproc
 135              		@ args = 0, pretend = 0, frame = 8
 136              		@ frame_needed = 1, uses_anonymous_args = 0
 137 0060 80B5     		push	{r7, lr}
 138              		.cfi_def_cfa_offset 8
 139              		.cfi_offset 7, -8
 140              		.cfi_offset 14, -4
 141 0062 82B0     		sub	sp, sp, #8
 142              		.cfi_def_cfa_offset 16
 143 0064 00AF     		add	r7, sp, #0
 144              		.cfi_def_cfa_register 7
 145 0066 7860     		str	r0, [r7, #4]
1762:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   if ((ticks - 1UL) > SysTick_LOAD_RELOAD_Msk) { return (1UL); }    /* Reload value impossible */
 146              		.loc 2 1762 0
 147 0068 7B68     		ldr	r3, [r7, #4]
 148 006a 013B     		subs	r3, r3, #1
 149 006c 0C4A     		ldr	r2, .L11
 150 006e 9342     		cmp	r3, r2
 151 0070 01D9     		bls	.L9
 152              		.loc 2 1762 0 is_stmt 0 discriminator 1
 153 0072 0123     		movs	r3, #1
 154 0074 10E0     		b	.L10
 155              	.L9:
1763:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1764:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SysTick->LOAD  = (uint32_t)(ticks - 1UL);                         /* set reload register */
 156              		.loc 2 1764 0 is_stmt 1
 157 0076 0B4B     		ldr	r3, .L11+4
 158 0078 7A68     		ldr	r2, [r7, #4]
 159 007a 013A     		subs	r2, r2, #1
 160 007c 5A60     		str	r2, [r3, #4]
1765:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   NVIC_SetPriority (SysTick_IRQn, (1UL << __NVIC_PRIO_BITS) - 1UL); /* set Priority for Systick Int
 161              		.loc 2 1765 0
 162 007e 0123     		movs	r3, #1
 163 0080 5B42     		rsbs	r3, r3, #0
 164 0082 0F21     		movs	r1, #15
 165 0084 1800     		movs	r0, r3
 166 0086 FFF7BBFF 		bl	NVIC_SetPriority
1766:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SysTick->VAL   = 0UL;                                             /* Load the SysTick Counter Val
 167              		.loc 2 1766 0
 168 008a 064B     		ldr	r3, .L11+4
 169 008c 0022     		movs	r2, #0
 170 008e 9A60     		str	r2, [r3, #8]
1767:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
 171              		.loc 2 1767 0
 172 0090 044B     		ldr	r3, .L11+4
 173 0092 0722     		movs	r2, #7
 174 0094 1A60     		str	r2, [r3]
1768:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                    SysTick_CTRL_TICKINT_Msk   |
1769:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                    SysTick_CTRL_ENABLE_Msk;                         /* Enable SysTick IRQ and SysTi
1770:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   return (0UL);                                                     /* Function successful */
 175              		.loc 2 1770 0
 176 0096 0023     		movs	r3, #0
 177              	.L10:
1771:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
 178              		.loc 2 1771 0
 179 0098 1800     		movs	r0, r3
 180 009a BD46     		mov	sp, r7
 181 009c 02B0     		add	sp, sp, #8
 182              		@ sp needed
 183 009e 80BD     		pop	{r7, pc}
 184              	.L12:
 185              		.align	2
 186              	.L11:
 187 00a0 FFFFFF00 		.word	16777215
 188 00a4 10E000E0 		.word	-536813552
 189              		.cfi_endproc
 190              	.LFE122:
 192              		.comm	motion1,8,4
 193              		.global	msTicks
 194              		.bss
 195              		.align	2
 198              	msTicks:
 199 0000 00000000 		.space	4
 200              		.global	__aeabi_uidivmod
 201              		.text
 202              		.align	1
 203              		.global	SysTick_Handler
 204              		.syntax unified
 205              		.code	16
 206              		.thumb_func
 207              		.fpu softvfp
 209              	SysTick_Handler:
 210              	.LFB127:
  24:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  25:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  26:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  27:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 		
  28:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** typedef struct MotionSensors {
  29:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	char id;
  30:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	char controlbits;		// 8 kontrollbitar tex den minst signifikanta biten är ifall sensorn är aktiv
  31:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	short password;			// 4 sifferig kod för att aktivera/avaktivera sensorn
  32:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	uint16_t trig, echo;	// Pinnar för trig och echo, t.ex GPIO_Pin_0 och GPIO_Pin_1
  33:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** } MotionSensor; 
  34:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** MotionSensor motion1;
  35:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  36:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  37:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** volatile uint32_t msTicks = 0;                              /* Variable to store millisecond ticks 
  38:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c ****   
  39:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** void SysTick_Handler(void)  {                               /* SysTick interrupt Handler. */
 211              		.loc 1 39 0
 212              		.cfi_startproc
 213              		@ args = 0, pretend = 0, frame = 0
 214              		@ frame_needed = 1, uses_anonymous_args = 0
 215 00a8 80B5     		push	{r7, lr}
 216              		.cfi_def_cfa_offset 8
 217              		.cfi_offset 7, -8
 218              		.cfi_offset 14, -4
 219 00aa 00AF     		add	r7, sp, #0
 220              		.cfi_def_cfa_register 7
  40:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	msTicks++;
 221              		.loc 1 40 0
 222 00ac 114B     		ldr	r3, .L17
 223 00ae 1B68     		ldr	r3, [r3]
 224 00b0 5A1C     		adds	r2, r3, #1
 225 00b2 104B     		ldr	r3, .L17
 226 00b4 1A60     		str	r2, [r3]
  41:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	if (msTicks % 1000 == 0) {
 227              		.loc 1 41 0
 228 00b6 0F4B     		ldr	r3, .L17
 229 00b8 1A68     		ldr	r2, [r3]
 230 00ba FA23     		movs	r3, #250
 231 00bc 9900     		lsls	r1, r3, #2
 232 00be 1000     		movs	r0, r2
 233 00c0 FFF7FEFF 		bl	__aeabi_uidivmod
 234              	.LVL0:
 235 00c4 0B1E     		subs	r3, r1, #0
 236 00c6 04D1     		bne	.L14
  42:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 		GPIO_SetBits(GPIOA,GPIO_Pin_1);
 237              		.loc 1 42 0
 238 00c8 0B4B     		ldr	r3, .L17+4
 239 00ca 0221     		movs	r1, #2
 240 00cc 1800     		movs	r0, r3
 241 00ce FFF7FEFF 		bl	GPIO_SetBits
 242              	.L14:
  43:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	}
  44:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	if (msTicks % 2000 == 0) {
 243              		.loc 1 44 0
 244 00d2 084B     		ldr	r3, .L17
 245 00d4 1A68     		ldr	r2, [r3]
 246 00d6 FA23     		movs	r3, #250
 247 00d8 D900     		lsls	r1, r3, #3
 248 00da 1000     		movs	r0, r2
 249 00dc FFF7FEFF 		bl	__aeabi_uidivmod
 250              	.LVL1:
 251 00e0 0B1E     		subs	r3, r1, #0
 252 00e2 04D1     		bne	.L16
  45:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 		GPIO_ResetBits(GPIOA,GPIO_Pin_1);
 253              		.loc 1 45 0
 254 00e4 044B     		ldr	r3, .L17+4
 255 00e6 0221     		movs	r1, #2
 256 00e8 1800     		movs	r0, r3
 257 00ea FFF7FEFF 		bl	GPIO_ResetBits
 258              	.L16:
  46:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	}
  47:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	// Gör en ny Array med dörrar som larmar.
  48:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** }
 259              		.loc 1 48 0
 260 00ee C046     		nop
 261 00f0 BD46     		mov	sp, r7
 262              		@ sp needed
 263 00f2 80BD     		pop	{r7, pc}
 264              	.L18:
 265              		.align	2
 266              	.L17:
 267 00f4 00000000 		.word	msTicks
 268 00f8 00000240 		.word	1073872896
 269              		.cfi_endproc
 270              	.LFE127:
 272              		.align	1
 273              		.global	init_Sensors
 274              		.syntax unified
 275              		.code	16
 276              		.thumb_func
 277              		.fpu softvfp
 279              	init_Sensors:
 280              	.LFB128:
  49:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  50:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  51:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** void init_Sensors(){
 281              		.loc 1 51 0
 282              		.cfi_startproc
 283              		@ args = 0, pretend = 0, frame = 0
 284              		@ frame_needed = 1, uses_anonymous_args = 0
 285 00fc 80B5     		push	{r7, lr}
 286              		.cfi_def_cfa_offset 8
 287              		.cfi_offset 7, -8
 288              		.cfi_offset 14, -4
 289 00fe 00AF     		add	r7, sp, #0
 290              		.cfi_def_cfa_register 7
  52:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	motion1.id = 0;
 291              		.loc 1 52 0
 292 0100 084B     		ldr	r3, .L20
 293 0102 0022     		movs	r2, #0
 294 0104 1A70     		strb	r2, [r3]
  53:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	motion1.controlbits = 1;
 295              		.loc 1 53 0
 296 0106 074B     		ldr	r3, .L20
 297 0108 0122     		movs	r2, #1
 298 010a 5A70     		strb	r2, [r3, #1]
  54:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	motion1.password = 2389;
 299              		.loc 1 54 0
 300 010c 054B     		ldr	r3, .L20
 301 010e 064A     		ldr	r2, .L20+4
 302 0110 5A80     		strh	r2, [r3, #2]
  55:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	motion1.trig = GPIO_Pin_0;
 303              		.loc 1 55 0
 304 0112 044B     		ldr	r3, .L20
 305 0114 0122     		movs	r2, #1
 306 0116 9A80     		strh	r2, [r3, #4]
  56:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	motion1.echo = GPIO_Pin_1;
 307              		.loc 1 56 0
 308 0118 024B     		ldr	r3, .L20
 309 011a 0222     		movs	r2, #2
 310 011c DA80     		strh	r2, [r3, #6]
  57:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	
  58:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** }
 311              		.loc 1 58 0
 312 011e C046     		nop
 313 0120 BD46     		mov	sp, r7
 314              		@ sp needed
 315 0122 80BD     		pop	{r7, pc}
 316              	.L21:
 317              		.align	2
 318              	.L20:
 319 0124 00000000 		.word	motion1
 320 0128 55090000 		.word	2389
 321              		.cfi_endproc
 322              	.LFE128:
 324              		.align	1
 325              		.global	init_GPIO_Ports
 326              		.syntax unified
 327              		.code	16
 328              		.thumb_func
 329              		.fpu softvfp
 331              	init_GPIO_Ports:
 332              	.LFB129:
  59:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  60:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  61:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** void init_GPIO_Ports(){
 333              		.loc 1 61 0
 334              		.cfi_startproc
 335              		@ args = 0, pretend = 0, frame = 8
 336              		@ frame_needed = 1, uses_anonymous_args = 0
 337 012c 80B5     		push	{r7, lr}
 338              		.cfi_def_cfa_offset 8
 339              		.cfi_offset 7, -8
 340              		.cfi_offset 14, -4
 341 012e 82B0     		sub	sp, sp, #8
 342              		.cfi_def_cfa_offset 16
 343 0130 00AF     		add	r7, sp, #0
 344              		.cfi_def_cfa_register 7
  62:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	/*  Function used to set the GPIO configuration to the default reset state ****/
  63:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	GPIO_InitTypeDef init;
  64:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	//GPIO A UTPORTAR
  65:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
 345              		.loc 1 65 0
 346 0132 0121     		movs	r1, #1
 347 0134 0120     		movs	r0, #1
 348 0136 FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  66:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	GPIO_StructInit(&init);
 349              		.loc 1 66 0
 350 013a 3B00     		movs	r3, r7
 351 013c 1800     		movs	r0, r3
 352 013e FFF7FEFF 		bl	GPIO_StructInit
  67:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init.GPIO_Pin = motion1.echo | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
 353              		.loc 1 67 0
 354 0142 184B     		ldr	r3, .L23
 355 0144 DB88     		ldrh	r3, [r3, #6]
 356 0146 A822     		movs	r2, #168
 357 0148 1343     		orrs	r3, r2
 358 014a 9BB2     		uxth	r3, r3
 359 014c 1A00     		movs	r2, r3
 360 014e 3B00     		movs	r3, r7
 361 0150 1A60     		str	r2, [r3]
  68:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init.GPIO_Mode = GPIO_Mode_IN;
 362              		.loc 1 68 0
 363 0152 3B00     		movs	r3, r7
 364 0154 0022     		movs	r2, #0
 365 0156 1A71     		strb	r2, [r3, #4]
  69:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init.GPIO_OType = GPIO_OType_PP;
 366              		.loc 1 69 0
 367 0158 3B00     		movs	r3, r7
 368 015a 0022     		movs	r2, #0
 369 015c 9A71     		strb	r2, [r3, #6]
  70:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	GPIO_Init(GPIOA, &init);
 370              		.loc 1 70 0
 371 015e 3B00     		movs	r3, r7
 372 0160 114A     		ldr	r2, .L23+4
 373 0162 1900     		movs	r1, r3
 374 0164 1000     		movs	r0, r2
 375 0166 FFF7FEFF 		bl	GPIO_Init
  71:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  72:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	//konfigurerar inport GPIO A
  73:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	GPIO_StructInit(&init);
 376              		.loc 1 73 0
 377 016a 3B00     		movs	r3, r7
 378 016c 1800     		movs	r0, r3
 379 016e FFF7FEFF 		bl	GPIO_StructInit
  74:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init.GPIO_Pin = motion1.trig | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
 380              		.loc 1 74 0
 381 0172 0C4B     		ldr	r3, .L23
 382 0174 9B88     		ldrh	r3, [r3, #4]
 383 0176 5422     		movs	r2, #84
 384 0178 1343     		orrs	r3, r2
 385 017a 9BB2     		uxth	r3, r3
 386 017c 1A00     		movs	r2, r3
 387 017e 3B00     		movs	r3, r7
 388 0180 1A60     		str	r2, [r3]
  75:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init.GPIO_Mode = GPIO_Mode_OUT;
 389              		.loc 1 75 0
 390 0182 3B00     		movs	r3, r7
 391 0184 0122     		movs	r2, #1
 392 0186 1A71     		strb	r2, [r3, #4]
  76:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 393              		.loc 1 76 0
 394 0188 3B00     		movs	r3, r7
 395 018a 0122     		movs	r2, #1
 396 018c DA71     		strb	r2, [r3, #7]
  77:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	GPIO_Init(GPIOA, &init);
 397              		.loc 1 77 0
 398 018e 3B00     		movs	r3, r7
 399 0190 054A     		ldr	r2, .L23+4
 400 0192 1900     		movs	r1, r3
 401 0194 1000     		movs	r0, r2
 402 0196 FFF7FEFF 		bl	GPIO_Init
  78:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** }
 403              		.loc 1 78 0
 404 019a C046     		nop
 405 019c BD46     		mov	sp, r7
 406 019e 02B0     		add	sp, sp, #8
 407              		@ sp needed
 408 01a0 80BD     		pop	{r7, pc}
 409              	.L24:
 410 01a2 C046     		.align	2
 411              	.L23:
 412 01a4 00000000 		.word	motion1
 413 01a8 00000240 		.word	1073872896
 414              		.cfi_endproc
 415              	.LFE129:
 417              		.align	1
 418              		.global	main
 419              		.syntax unified
 420              		.code	16
 421              		.thumb_func
 422              		.fpu softvfp
 424              	main:
 425              	.LFB130:
  79:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  80:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  81:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  82:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  83:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** void main(void)
  84:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** {
 426              		.loc 1 84 0
 427              		.cfi_startproc
 428              		@ args = 0, pretend = 0, frame = 8
 429              		@ frame_needed = 1, uses_anonymous_args = 0
 430 01ac 80B5     		push	{r7, lr}
 431              		.cfi_def_cfa_offset 8
 432              		.cfi_offset 7, -8
 433              		.cfi_offset 14, -4
 434 01ae 82B0     		sub	sp, sp, #8
 435              		.cfi_def_cfa_offset 16
 436 01b0 00AF     		add	r7, sp, #0
 437              		.cfi_def_cfa_register 7
  85:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init_Sensors();
 438              		.loc 1 85 0
 439 01b2 FFF7FEFF 		bl	init_Sensors
  86:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	init_GPIO_Ports();
 440              		.loc 1 86 0
 441 01b6 FFF7FEFF 		bl	init_GPIO_Ports
  87:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 
  88:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	
  89:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	//Systick
  90:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
 442              		.loc 1 90 0
 443 01ba 064B     		ldr	r3, .L26
 444 01bc 064A     		ldr	r2, .L26+4
 445 01be 1A60     		str	r2, [r3]
  91:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	uint32_t returnCode;
  92:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c ****   	returnCode = SysTick_Config(168000000/1000);      /* Configure SysTick to generate an interrupt 
 446              		.loc 1 92 0
 447 01c0 064B     		ldr	r3, .L26+8
 448 01c2 1800     		movs	r0, r3
 449 01c4 FFF74CFF 		bl	SysTick_Config
 450 01c8 0300     		movs	r3, r0
 451 01ca 7B60     		str	r3, [r7, #4]
  93:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	
  94:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** 	
  95:C:/Users/Erik/Documents/Datateknisktprojekt/kod/Rorelse\main_rorelse.c **** }
 452              		.loc 1 95 0
 453 01cc C046     		nop
 454 01ce BD46     		mov	sp, r7
 455 01d0 02B0     		add	sp, sp, #8
 456              		@ sp needed
 457 01d2 80BD     		pop	{r7, pc}
 458              	.L27:
 459              		.align	2
 460              	.L26:
 461 01d4 3CC00120 		.word	536985660
 462 01d8 00000000 		.word	SysTick_Handler
 463 01dc 40900200 		.word	168000
 464              		.cfi_endproc
 465              	.LFE130:
 467              	.Letext0:
 468              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 469              		.file 4 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 470              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 471              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 472              		.file 7 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
 473              		.file 8 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 474              		.file 9 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 475              		.file 10 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 476              		.file 11 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
