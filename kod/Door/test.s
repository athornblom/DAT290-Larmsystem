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
  15              		.align	1
  16              		.syntax unified
  17              		.code	16
  18              		.thumb_func
  19              		.fpu softvfp
  21              	NVIC_SetPriority:
  22              	.LFB114:
  23              		.file 1 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
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
  24              		.loc 1 1630 0
  25              		.cfi_startproc
  26              		@ args = 0, pretend = 0, frame = 8
  27              		@ frame_needed = 1, uses_anonymous_args = 0
  28 0000 80B5     		push	{r7, lr}
  29              		.cfi_def_cfa_offset 8
  30              		.cfi_offset 7, -8
  31              		.cfi_offset 14, -4
  32 0002 82B0     		sub	sp, sp, #8
  33              		.cfi_def_cfa_offset 16
  34 0004 00AF     		add	r7, sp, #0
  35              		.cfi_def_cfa_register 7
  36 0006 0200     		movs	r2, r0
  37 0008 3960     		str	r1, [r7]
  38 000a FB1D     		adds	r3, r7, #7
  39 000c 1A70     		strb	r2, [r3]
1631:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   if((int32_t)IRQn < 0) {
  40              		.loc 1 1631 0
  41 000e FB1D     		adds	r3, r7, #7
  42 0010 1B78     		ldrb	r3, [r3]
  43 0012 7F2B     		cmp	r3, #127
  44 0014 0DD9     		bls	.L2
1632:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     SCB->SHP[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8 - __NVIC_PRIO_BIT
  45              		.loc 1 1632 0
  46 0016 3B68     		ldr	r3, [r7]
  47 0018 DAB2     		uxtb	r2, r3
  48 001a 0F49     		ldr	r1, .L5
  49 001c FB1D     		adds	r3, r7, #7
  50 001e 1B78     		ldrb	r3, [r3]
  51 0020 1800     		movs	r0, r3
  52 0022 0F23     		movs	r3, #15
  53 0024 0340     		ands	r3, r0
  54 0026 043B     		subs	r3, r3, #4
  55 0028 1201     		lsls	r2, r2, #4
  56 002a D2B2     		uxtb	r2, r2
  57 002c CB18     		adds	r3, r1, r3
  58 002e 1A76     		strb	r2, [r3, #24]
1633:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
1634:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   else {
1635:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****     NVIC->IP[((uint32_t)(int32_t)IRQn)]               = (uint8_t)((priority << (8 - __NVIC_PRIO_BIT
1636:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
1637:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
  59              		.loc 1 1637 0
  60 0030 0DE0     		b	.L4
  61              	.L2:
1635:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   }
  62              		.loc 1 1635 0
  63 0032 3B68     		ldr	r3, [r7]
  64 0034 DBB2     		uxtb	r3, r3
  65 0036 0949     		ldr	r1, .L5+4
  66 0038 FA1D     		adds	r2, r7, #7
  67 003a 1278     		ldrb	r2, [r2]
  68 003c 52B2     		sxtb	r2, r2
  69 003e 1B01     		lsls	r3, r3, #4
  70 0040 D8B2     		uxtb	r0, r3
  71 0042 C023     		movs	r3, #192
  72 0044 9B00     		lsls	r3, r3, #2
  73 0046 8A18     		adds	r2, r1, r2
  74 0048 D318     		adds	r3, r2, r3
  75 004a 021C     		adds	r2, r0, #0
  76 004c 1A70     		strb	r2, [r3]
  77              	.L4:
  78              		.loc 1 1637 0
  79 004e C046     		nop
  80 0050 BD46     		mov	sp, r7
  81 0052 02B0     		add	sp, sp, #8
  82              		@ sp needed
  83 0054 80BD     		pop	{r7, pc}
  84              	.L6:
  85 0056 C046     		.align	2
  86              	.L5:
  87 0058 00ED00E0 		.word	-536810240
  88 005c 00E100E0 		.word	-536813312
  89              		.cfi_endproc
  90              	.LFE114:
  92              		.align	1
  93              		.syntax unified
  94              		.code	16
  95              		.thumb_func
  96              		.fpu softvfp
  98              	SysTick_Config:
  99              	.LFB119:
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
 100              		.loc 1 1761 0
 101              		.cfi_startproc
 102              		@ args = 0, pretend = 0, frame = 8
 103              		@ frame_needed = 1, uses_anonymous_args = 0
 104 0060 80B5     		push	{r7, lr}
 105              		.cfi_def_cfa_offset 8
 106              		.cfi_offset 7, -8
 107              		.cfi_offset 14, -4
 108 0062 82B0     		sub	sp, sp, #8
 109              		.cfi_def_cfa_offset 16
 110 0064 00AF     		add	r7, sp, #0
 111              		.cfi_def_cfa_register 7
 112 0066 7860     		str	r0, [r7, #4]
1762:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   if ((ticks - 1UL) > SysTick_LOAD_RELOAD_Msk) { return (1UL); }    /* Reload value impossible */
 113              		.loc 1 1762 0
 114 0068 7B68     		ldr	r3, [r7, #4]
 115 006a 013B     		subs	r3, r3, #1
 116 006c 0C4A     		ldr	r2, .L10
 117 006e 9342     		cmp	r3, r2
 118 0070 01D9     		bls	.L8
 119              		.loc 1 1762 0 is_stmt 0 discriminator 1
 120 0072 0123     		movs	r3, #1
 121 0074 10E0     		b	.L9
 122              	.L8:
1763:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** 
1764:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SysTick->LOAD  = (uint32_t)(ticks - 1UL);                         /* set reload register */
 123              		.loc 1 1764 0 is_stmt 1
 124 0076 0B4B     		ldr	r3, .L10+4
 125 0078 7A68     		ldr	r2, [r7, #4]
 126 007a 013A     		subs	r2, r2, #1
 127 007c 5A60     		str	r2, [r3, #4]
1765:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   NVIC_SetPriority (SysTick_IRQn, (1UL << __NVIC_PRIO_BITS) - 1UL); /* set Priority for Systick Int
 128              		.loc 1 1765 0
 129 007e 0123     		movs	r3, #1
 130 0080 5B42     		rsbs	r3, r3, #0
 131 0082 0F21     		movs	r1, #15
 132 0084 1800     		movs	r0, r3
 133 0086 FFF7BBFF 		bl	NVIC_SetPriority
1766:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SysTick->VAL   = 0UL;                                             /* Load the SysTick Counter Val
 134              		.loc 1 1766 0
 135 008a 064B     		ldr	r3, .L10+4
 136 008c 0022     		movs	r2, #0
 137 008e 9A60     		str	r2, [r3, #8]
1767:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
 138              		.loc 1 1767 0
 139 0090 044B     		ldr	r3, .L10+4
 140 0092 0722     		movs	r2, #7
 141 0094 1A60     		str	r2, [r3]
1768:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                    SysTick_CTRL_TICKINT_Msk   |
1769:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****                    SysTick_CTRL_ENABLE_Msk;                         /* Enable SysTick IRQ and SysTi
1770:../lib/STM32F4_lib/CMSIS/include/core_cm4.h ****   return (0UL);                                                     /* Function successful */
 142              		.loc 1 1770 0
 143 0096 0023     		movs	r3, #0
 144              	.L9:
1771:../lib/STM32F4_lib/CMSIS/include/core_cm4.h **** }
 145              		.loc 1 1771 0
 146 0098 1800     		movs	r0, r3
 147 009a BD46     		mov	sp, r7
 148 009c 02B0     		add	sp, sp, #8
 149              		@ sp needed
 150 009e 80BD     		pop	{r7, pc}
 151              	.L11:
 152              		.align	2
 153              	.L10:
 154 00a0 FFFFFF00 		.word	16777215
 155 00a4 10E000E0 		.word	-536813552
 156              		.cfi_endproc
 157              	.LFE119:
 159              		.align	1
 160              		.global	init_GPIO_Ports
 161              		.syntax unified
 162              		.code	16
 163              		.thumb_func
 164              		.fpu softvfp
 166              	init_GPIO_Ports:
 167              	.LFB123:
 168              		.file 2 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/init.h"
   1:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** //======================================GPIO=======================================================
   2:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** void init_GPIO_Ports()
   3:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** {
 169              		.loc 2 3 0
 170              		.cfi_startproc
 171              		@ args = 0, pretend = 0, frame = 8
 172              		@ frame_needed = 1, uses_anonymous_args = 0
 173 00a8 80B5     		push	{r7, lr}
 174              		.cfi_def_cfa_offset 8
 175              		.cfi_offset 7, -8
 176              		.cfi_offset 14, -4
 177 00aa 82B0     		sub	sp, sp, #8
 178              		.cfi_def_cfa_offset 16
 179 00ac 00AF     		add	r7, sp, #0
 180              		.cfi_def_cfa_register 7
   4:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	/*  Function used to set the GPIO configuration to the default reset state ****/
   5:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_InitTypeDef init;
   6:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//GPIO E UTPORTAR
   7:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);
 181              		.loc 2 7 0
 182 00ae 0121     		movs	r1, #1
 183 00b0 1020     		movs	r0, #16
 184 00b2 FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
   8:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 185              		.loc 2 8 0
 186 00b6 3B00     		movs	r3, r7
 187 00b8 1800     		movs	r0, r3
 188 00ba FFF7FEFF 		bl	GPIO_StructInit
   9:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPI
 189              		.loc 2 9 0
 190 00be 3B00     		movs	r3, r7
 191 00c0 644A     		ldr	r2, .L13
 192 00c2 1A60     		str	r2, [r3]
  10:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_OUT;
 193              		.loc 2 10 0
 194 00c4 3B00     		movs	r3, r7
 195 00c6 0122     		movs	r2, #1
 196 00c8 1A71     		strb	r2, [r3, #4]
  11:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_OType = GPIO_OType_PP;
 197              		.loc 2 11 0
 198 00ca 3B00     		movs	r3, r7
 199 00cc 0022     		movs	r2, #0
 200 00ce 9A71     		strb	r2, [r3, #6]
  12:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
 201              		.loc 2 12 0
 202 00d0 3B00     		movs	r3, r7
 203 00d2 0022     		movs	r2, #0
 204 00d4 DA71     		strb	r2, [r3, #7]
  13:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOE, &init);
 205              		.loc 2 13 0
 206 00d6 3B00     		movs	r3, r7
 207 00d8 5F4A     		ldr	r2, .L13+4
 208 00da 1900     		movs	r1, r3
 209 00dc 1000     		movs	r0, r2
 210 00de FFF7FEFF 		bl	GPIO_Init
  14:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	
  15:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//konfigurerar inport GPIO E
  16:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 211              		.loc 2 16 0
 212 00e2 3B00     		movs	r3, r7
 213 00e4 1800     		movs	r0, r3
 214 00e6 FFF7FEFF 		bl	GPIO_StructInit
  17:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPI
 215              		.loc 2 17 0
 216 00ea 3B00     		movs	r3, r7
 217 00ec 5B4A     		ldr	r2, .L13+8
 218 00ee 1A60     		str	r2, [r3]
  18:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_IN;
 219              		.loc 2 18 0
 220 00f0 3B00     		movs	r3, r7
 221 00f2 0022     		movs	r2, #0
 222 00f4 1A71     		strb	r2, [r3, #4]
  19:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 223              		.loc 2 19 0
 224 00f6 3B00     		movs	r3, r7
 225 00f8 0122     		movs	r2, #1
 226 00fa DA71     		strb	r2, [r3, #7]
  20:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOE, &init);
 227              		.loc 2 20 0
 228 00fc 3B00     		movs	r3, r7
 229 00fe 564A     		ldr	r2, .L13+4
 230 0100 1900     		movs	r1, r3
 231 0102 1000     		movs	r0, r2
 232 0104 FFF7FEFF 		bl	GPIO_Init
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h ****     //GPIOA UTPORTAR
  23:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h ****     RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
 233              		.loc 2 23 0
 234 0108 0121     		movs	r1, #1
 235 010a 0120     		movs	r0, #1
 236 010c FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  24:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 237              		.loc 2 24 0
 238 0110 3B00     		movs	r3, r7
 239 0112 1800     		movs	r0, r3
 240 0114 FFF7FEFF 		bl	GPIO_StructInit
  25:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPI
 241              		.loc 2 25 0
 242 0118 3B00     		movs	r3, r7
 243 011a 4E4A     		ldr	r2, .L13
 244 011c 1A60     		str	r2, [r3]
  26:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_OUT;
 245              		.loc 2 26 0
 246 011e 3B00     		movs	r3, r7
 247 0120 0122     		movs	r2, #1
 248 0122 1A71     		strb	r2, [r3, #4]
  27:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_OType = GPIO_OType_PP;
 249              		.loc 2 27 0
 250 0124 3B00     		movs	r3, r7
 251 0126 0022     		movs	r2, #0
 252 0128 9A71     		strb	r2, [r3, #6]
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
 253              		.loc 2 28 0
 254 012a 3B00     		movs	r3, r7
 255 012c 0022     		movs	r2, #0
 256 012e DA71     		strb	r2, [r3, #7]
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOA, &init);
 257              		.loc 2 29 0
 258 0130 3B00     		movs	r3, r7
 259 0132 4B4A     		ldr	r2, .L13+12
 260 0134 1900     		movs	r1, r3
 261 0136 1000     		movs	r0, r2
 262 0138 FFF7FEFF 		bl	GPIO_Init
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//konfigurerar inport GPIO a
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 263              		.loc 2 32 0
 264 013c 3B00     		movs	r3, r7
 265 013e 1800     		movs	r0, r3
 266 0140 FFF7FEFF 		bl	GPIO_StructInit
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPI
 267              		.loc 2 33 0
 268 0144 3B00     		movs	r3, r7
 269 0146 454A     		ldr	r2, .L13+8
 270 0148 1A60     		str	r2, [r3]
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_IN;
 271              		.loc 2 34 0
 272 014a 3B00     		movs	r3, r7
 273 014c 0022     		movs	r2, #0
 274 014e 1A71     		strb	r2, [r3, #4]
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 275              		.loc 2 35 0
 276 0150 3B00     		movs	r3, r7
 277 0152 0122     		movs	r2, #1
 278 0154 DA71     		strb	r2, [r3, #7]
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOA, &init);
 279              		.loc 2 36 0
 280 0156 3B00     		movs	r3, r7
 281 0158 414A     		ldr	r2, .L13+12
 282 015a 1900     		movs	r1, r3
 283 015c 1000     		movs	r0, r2
 284 015e FFF7FEFF 		bl	GPIO_Init
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//GPIO C UTPORTAR
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
 285              		.loc 2 39 0
 286 0162 0121     		movs	r1, #1
 287 0164 0420     		movs	r0, #4
 288 0166 FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 289              		.loc 2 40 0
 290 016a 3B00     		movs	r3, r7
 291 016c 1800     		movs	r0, r3
 292 016e FFF7FEFF 		bl	GPIO_StructInit
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPI
 293              		.loc 2 41 0
 294 0172 3B00     		movs	r3, r7
 295 0174 374A     		ldr	r2, .L13
 296 0176 1A60     		str	r2, [r3]
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_OUT;
 297              		.loc 2 42 0
 298 0178 3B00     		movs	r3, r7
 299 017a 0122     		movs	r2, #1
 300 017c 1A71     		strb	r2, [r3, #4]
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_OType = GPIO_OType_PP;
 301              		.loc 2 43 0
 302 017e 3B00     		movs	r3, r7
 303 0180 0022     		movs	r2, #0
 304 0182 9A71     		strb	r2, [r3, #6]
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
 305              		.loc 2 44 0
 306 0184 3B00     		movs	r3, r7
 307 0186 0022     		movs	r2, #0
 308 0188 DA71     		strb	r2, [r3, #7]
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOC, &init);
 309              		.loc 2 45 0
 310 018a 3B00     		movs	r3, r7
 311 018c 354A     		ldr	r2, .L13+16
 312 018e 1900     		movs	r1, r3
 313 0190 1000     		movs	r0, r2
 314 0192 FFF7FEFF 		bl	GPIO_Init
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//konfigurerar inport GPIO C
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 315              		.loc 2 48 0
 316 0196 3B00     		movs	r3, r7
 317 0198 1800     		movs	r0, r3
 318 019a FFF7FEFF 		bl	GPIO_StructInit
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPI
 319              		.loc 2 49 0
 320 019e 3B00     		movs	r3, r7
 321 01a0 2E4A     		ldr	r2, .L13+8
 322 01a2 1A60     		str	r2, [r3]
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_IN;
 323              		.loc 2 50 0
 324 01a4 3B00     		movs	r3, r7
 325 01a6 0022     		movs	r2, #0
 326 01a8 1A71     		strb	r2, [r3, #4]
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 327              		.loc 2 51 0
 328 01aa 3B00     		movs	r3, r7
 329 01ac 0122     		movs	r2, #1
 330 01ae DA71     		strb	r2, [r3, #7]
  52:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOC, &init);
 331              		.loc 2 52 0
 332 01b0 3B00     		movs	r3, r7
 333 01b2 2C4A     		ldr	r2, .L13+16
 334 01b4 1900     		movs	r1, r3
 335 01b6 1000     		movs	r0, r2
 336 01b8 FFF7FEFF 		bl	GPIO_Init
  53:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 
  54:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//GPIO D UTPORTAR
  55:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
 337              		.loc 2 55 0
 338 01bc 0121     		movs	r1, #1
 339 01be 0820     		movs	r0, #8
 340 01c0 FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  56:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 341              		.loc 2 56 0
 342 01c4 3B00     		movs	r3, r7
 343 01c6 1800     		movs	r0, r3
 344 01c8 FFF7FEFF 		bl	GPIO_StructInit
  57:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPI
 345              		.loc 2 57 0
 346 01cc 3B00     		movs	r3, r7
 347 01ce 214A     		ldr	r2, .L13
 348 01d0 1A60     		str	r2, [r3]
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_OUT;
 349              		.loc 2 58 0
 350 01d2 3B00     		movs	r3, r7
 351 01d4 0122     		movs	r2, #1
 352 01d6 1A71     		strb	r2, [r3, #4]
  59:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_OType = GPIO_OType_PP;
 353              		.loc 2 59 0
 354 01d8 3B00     		movs	r3, r7
 355 01da 0022     		movs	r2, #0
 356 01dc 9A71     		strb	r2, [r3, #6]
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
 357              		.loc 2 60 0
 358 01de 3B00     		movs	r3, r7
 359 01e0 0022     		movs	r2, #0
 360 01e2 DA71     		strb	r2, [r3, #7]
  61:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOD, &init);
 361              		.loc 2 61 0
 362 01e4 3B00     		movs	r3, r7
 363 01e6 204A     		ldr	r2, .L13+20
 364 01e8 1900     		movs	r1, r3
 365 01ea 1000     		movs	r0, r2
 366 01ec FFF7FEFF 		bl	GPIO_Init
  62:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	
  63:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//konfigurerar inport GPIO D
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 367              		.loc 2 64 0
 368 01f0 3B00     		movs	r3, r7
 369 01f2 1800     		movs	r0, r3
 370 01f4 FFF7FEFF 		bl	GPIO_StructInit
  65:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPI
 371              		.loc 2 65 0
 372 01f8 3B00     		movs	r3, r7
 373 01fa 184A     		ldr	r2, .L13+8
 374 01fc 1A60     		str	r2, [r3]
  66:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_IN;
 375              		.loc 2 66 0
 376 01fe 3B00     		movs	r3, r7
 377 0200 0022     		movs	r2, #0
 378 0202 1A71     		strb	r2, [r3, #4]
  67:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 379              		.loc 2 67 0
 380 0204 3B00     		movs	r3, r7
 381 0206 0122     		movs	r2, #1
 382 0208 DA71     		strb	r2, [r3, #7]
  68:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOD, &init);
 383              		.loc 2 68 0
 384 020a 3B00     		movs	r3, r7
 385 020c 164A     		ldr	r2, .L13+20
 386 020e 1900     		movs	r1, r3
 387 0210 1000     		movs	r0, r2
 388 0212 FFF7FEFF 		bl	GPIO_Init
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 
  70:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	//GPIO B UTPORTAR
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
 389              		.loc 2 71 0
 390 0216 0121     		movs	r1, #1
 391 0218 0220     		movs	r0, #2
 392 021a FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  72:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_StructInit(&init);
 393              		.loc 2 72 0
 394 021e 3B00     		movs	r3, r7
 395 0220 1800     		movs	r0, r3
 396 0222 FFF7FEFF 		bl	GPIO_StructInit
  73:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Pin = GPIO_Pin_2;
 397              		.loc 2 73 0
 398 0226 3B00     		movs	r3, r7
 399 0228 0422     		movs	r2, #4
 400 022a 1A60     		str	r2, [r3]
  74:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_Mode = GPIO_Mode_OUT;
 401              		.loc 2 74 0
 402 022c 3B00     		movs	r3, r7
 403 022e 0122     		movs	r2, #1
 404 0230 1A71     		strb	r2, [r3, #4]
  75:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_OType = GPIO_OType_PP;
 405              		.loc 2 75 0
 406 0232 3B00     		movs	r3, r7
 407 0234 0022     		movs	r2, #0
 408 0236 9A71     		strb	r2, [r3, #6]
  76:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
 409              		.loc 2 76 0
 410 0238 3B00     		movs	r3, r7
 411 023a 0022     		movs	r2, #0
 412 023c DA71     		strb	r2, [r3, #7]
  77:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** 	GPIO_Init(GPIOB, &init);
 413              		.loc 2 77 0
 414 023e 3B00     		movs	r3, r7
 415 0240 0A4A     		ldr	r2, .L13+24
 416 0242 1900     		movs	r1, r3
 417 0244 1000     		movs	r0, r2
 418 0246 FFF7FEFF 		bl	GPIO_Init
  78:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\init.h **** }...
 419              		.loc 2 78 0
 420 024a C046     		nop
 421 024c BD46     		mov	sp, r7
 422 024e 02B0     		add	sp, sp, #8
 423              		@ sp needed
 424 0250 80BD     		pop	{r7, pc}
 425              	.L14:
 426 0252 C046     		.align	2
 427              	.L13:
 428 0254 AAAA0000 		.word	43690
 429 0258 00100240 		.word	1073876992
 430 025c 55550000 		.word	21845
 431 0260 00000240 		.word	1073872896
 432 0264 00080240 		.word	1073874944
 433 0268 000C0240 		.word	1073875968
 434 026c 00040240 		.word	1073873920
 435              		.cfi_endproc
 436              	.LFE123:
 438              		.section	.start_section,"ax",%progbits
 439              		.align	1
 440              		.global	startup
 441              		.syntax unified
 442              		.code	16
 443              		.thumb_func
 444              		.fpu softvfp
 446              	startup:
 447              	.LFB124:
 448              		.file 3 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.c"
   1:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx.h"
   2:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx_rcc.h"
   3:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "core_cm4.h"
   4:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx_gpio.h"
   5:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "system_stm32f4xx.h"
   6:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "startup.h"
   7:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "delay.h"
   8:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "init.h"
   9:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  10:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));
  11:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  12:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void startup(void)
  13:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 449              		.loc 3 13 0
 450              		.cfi_startproc
 451              		@ Naked Function: prologue and epilogue provided by programmer.
 452              		@ args = 0, pretend = 0, frame = 0
 453              		@ frame_needed = 1, uses_anonymous_args = 0
  14:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	__asm volatile(
 454              		.loc 3 14 0
 455              		.syntax divided
 456              	@ 14 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.c" 1
 457 0000 0248     		 LDR R0,=0x2001C000
 458 0002 8546     	 MOV SP,R0
 459 0004 FFF7FEFF 	 BL main
 460 0008 FEE7     	_exit: B .
 461              	
 462              	@ 0 "" 2
  15:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		" LDR R0,=0x2001C000\n" /* set stack */
  16:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		" MOV SP,R0\n"
  17:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		" BL main\n"   /* call main */
  18:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		"_exit: B .\n" /* never return */
  19:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	);
  20:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 463              		.loc 3 20 0
 464              		.thumb
 465              		.syntax unified
 466 000a C046     		nop
 467              		.cfi_endproc
 468              	.LFE124:
 470              		.global	GPIO_Pins
 471              		.data
 472              		.align	2
 475              	GPIO_Pins:
 476 0000 0100     		.short	1
 477 0002 0200     		.short	2
 478 0004 0400     		.short	4
 479 0006 0800     		.short	8
 480 0008 1000     		.short	16
 481 000a 2000     		.short	32
 482 000c 4000     		.short	64
 483 000e 8000     		.short	128
 484 0010 0001     		.short	256
 485 0012 0002     		.short	512
 486 0014 0004     		.short	1024
 487 0016 0008     		.short	2048
 488 0018 0010     		.short	4096
 489 001a 0020     		.short	8192
 490 001c 0040     		.short	16384
 491 001e 0080     		.short	-32768
 492              		.global	GPIO_Ports
 493              		.align	2
 496              	GPIO_Ports:
 497 0020 00100240 		.word	1073876992
 498 0024 00000240 		.word	1073872896
 499 0028 00080240 		.word	1073874944
 500 002c 000C0240 		.word	1073875968
 501              		.global	msTicks
 502              		.bss
 503              		.align	2
 506              	msTicks:
 507 0000 00000000 		.space	4
 508              		.text
 509              		.align	1
 510              		.global	SysTick_Handler
 511              		.syntax unified
 512              		.code	16
 513              		.thumb_func
 514              		.fpu softvfp
 516              	SysTick_Handler:
 517              	.LFB125:
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** // ========================================= DOOOOOORS INIT =======================================
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** uint16_t GPIO_Pins[] = {
  23:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
  24:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
  25:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};
  26:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  27:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** GPIO_TypeDef* GPIO_Ports[] = {GPIOE, GPIOA, GPIOC, GPIOD};
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** // ========================================= SYSTICK ==============================================
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** volatile uint32_t msTicks = 0; /* Variable to store millisecond ticks */
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void SysTick_Handler(void)
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** { /* SysTick interrupt Handler. */
 518              		.loc 3 32 0
 519              		.cfi_startproc
 520              		@ args = 0, pretend = 0, frame = 0
 521              		@ frame_needed = 1, uses_anonymous_args = 0
 522 0270 80B5     		push	{r7, lr}
 523              		.cfi_def_cfa_offset 8
 524              		.cfi_offset 7, -8
 525              		.cfi_offset 14, -4
 526 0272 00AF     		add	r7, sp, #0
 527              		.cfi_def_cfa_register 7
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	msTicks++;
 528              		.loc 3 33 0
 529 0274 034B     		ldr	r3, .L17
 530 0276 1B68     		ldr	r3, [r3]
 531 0278 5A1C     		adds	r2, r3, #1
 532 027a 024B     		ldr	r3, .L17
 533 027c 1A60     		str	r2, [r3]
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 534              		.loc 3 34 0
 535 027e C046     		nop
 536 0280 BD46     		mov	sp, r7
 537              		@ sp needed
 538 0282 80BD     		pop	{r7, pc}
 539              	.L18:
 540              		.align	2
 541              	.L17:
 542 0284 00000000 		.word	msTicks
 543              		.cfi_endproc
 544              	.LFE125:
 546              		.align	1
 547              		.global	systick_Init
 548              		.syntax unified
 549              		.code	16
 550              		.thumb_func
 551              		.fpu softvfp
 553              	systick_Init:
 554              	.LFB126:
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void systick_Init(void)
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 555              		.loc 3 36 0
 556              		.cfi_startproc
 557              		@ args = 0, pretend = 0, frame = 8
 558              		@ frame_needed = 1, uses_anonymous_args = 0
 559 0288 80B5     		push	{r7, lr}
 560              		.cfi_def_cfa_offset 8
 561              		.cfi_offset 7, -8
 562              		.cfi_offset 14, -4
 563 028a 82B0     		sub	sp, sp, #8
 564              		.cfi_def_cfa_offset 16
 565 028c 00AF     		add	r7, sp, #0
 566              		.cfi_def_cfa_register 7
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	// Initiera SysTick.
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	*((void (**)(void))0x2001C03C) = SysTick_Handler;
 567              		.loc 3 38 0
 568 028e 064B     		ldr	r3, .L20
 569 0290 064A     		ldr	r2, .L20+4
 570 0292 1A60     		str	r2, [r3]
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	uint32_t returnCode;
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	returnCode = SysTick_Config(168000000 / 1000); // Genererar ett SysTick-avbrott varje ms.
 571              		.loc 3 40 0
 572 0294 064B     		ldr	r3, .L20+8
 573 0296 1800     		movs	r0, r3
 574 0298 FFF7E2FE 		bl	SysTick_Config
 575 029c 0300     		movs	r3, r0
 576 029e 7B60     		str	r3, [r7, #4]
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	if (returnCode != 0)
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{   // Om inte SysTick_Config lyckas...
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		//typ reboot? bootloops är alltid kul
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	}
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 577              		.loc 3 46 0
 578 02a0 C046     		nop
 579 02a2 BD46     		mov	sp, r7
 580 02a4 02B0     		add	sp, sp, #8
 581              		@ sp needed
 582 02a6 80BD     		pop	{r7, pc}
 583              	.L21:
 584              		.align	2
 585              	.L20:
 586 02a8 3CC00120 		.word	536985660
 587 02ac 00000000 		.word	SysTick_Handler
 588 02b0 40900200 		.word	168000
 589              		.cfi_endproc
 590              	.LFE126:
 592              		.align	1
 593              		.global	main
 594              		.syntax unified
 595              		.code	16
 596              		.thumb_func
 597              		.fpu softvfp
 599              	main:
 600              	.LFB127:
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void main(void)
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 601              		.loc 3 49 0
 602              		.cfi_startproc
 603              		@ args = 0, pretend = 0, frame = 2080
 604              		@ frame_needed = 1, uses_anonymous_args = 0
 605 02b4 F0B5     		push	{r4, r5, r6, r7, lr}
 606              		.cfi_def_cfa_offset 20
 607              		.cfi_offset 4, -20
 608              		.cfi_offset 5, -16
 609              		.cfi_offset 6, -12
 610              		.cfi_offset 7, -8
 611              		.cfi_offset 14, -4
 612 02b6 C646     		mov	lr, r8
 613 02b8 00B5     		push	{lr}
 614              		.cfi_def_cfa_offset 24
 615              		.cfi_offset 8, -24
 616 02ba FD4C     		ldr	r4, .L46
 617 02bc A544     		add	sp, sp, r4
 618              		.cfi_def_cfa_offset 2104
 619 02be 00AF     		add	r7, sp, #0
 620              		.cfi_def_cfa_register 7
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init_GPIO_Ports();
 621              		.loc 3 50 0
 622 02c0 FFF7FEFF 		bl	init_GPIO_Ports
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	systick_Init();
 623              		.loc 3 51 0
 624 02c4 FFF7FEFF 		bl	systick_Init
  52:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	while(msTicks < 2000);
 625              		.loc 3 52 0
 626 02c8 C046     		nop
 627              	.L23:
 628              		.loc 3 52 0 is_stmt 0 discriminator 1
 629 02ca FA4B     		ldr	r3, .L46+4
 630 02cc 1B68     		ldr	r3, [r3]
 631 02ce FA4A     		ldr	r2, .L46+8
 632 02d0 9342     		cmp	r3, r2
 633 02d2 FAD9     		bls	.L23
  53:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  54:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	door door1, door2, door3, door4, door5, door6, door8, door9 ,door10, door11, door12, door13,door14
  55:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	door all_doors[32] = {door1, door2, door3, door4, door5, door6, door8, door9 ,door10, door11, door
 634              		.loc 3 55 0 is_stmt 1
 635 02d4 F94B     		ldr	r3, .L46+12
 636 02d6 FA4A     		ldr	r2, .L46+16
 637 02d8 9446     		mov	ip, r2
 638 02da 1822     		movs	r2, #24
 639 02dc 9046     		mov	r8, r2
 640 02de B844     		add	r8, r8, r7
 641 02e0 C444     		add	ip, ip, r8
 642 02e2 6344     		add	r3, r3, ip
 643 02e4 1800     		movs	r0, r3
 644 02e6 8023     		movs	r3, #128
 645 02e8 DB00     		lsls	r3, r3, #3
 646 02ea 1A00     		movs	r2, r3
 647 02ec 0021     		movs	r1, #0
 648 02ee FFF7FEFF 		bl	memset
 649 02f2 F24B     		ldr	r3, .L46+12
 650 02f4 F24E     		ldr	r6, .L46+16
 651 02f6 1822     		movs	r2, #24
 652 02f8 B918     		adds	r1, r7, r2
 653 02fa 8A19     		adds	r2, r1, r6
 654 02fc D218     		adds	r2, r2, r3
 655 02fe F823     		movs	r3, #248
 656 0300 DB00     		lsls	r3, r3, #3
 657 0302 1821     		movs	r1, #24
 658 0304 8C46     		mov	ip, r1
 659 0306 BC44     		add	ip, ip, r7
 660 0308 6344     		add	r3, r3, ip
 661 030a 1000     		movs	r0, r2
 662 030c 1900     		movs	r1, r3
 663 030e 2023     		movs	r3, #32
 664 0310 1A00     		movs	r2, r3
 665 0312 FFF7FEFF 		bl	memcpy
 666 0316 E94B     		ldr	r3, .L46+12
 667 0318 E94A     		ldr	r2, .L46+16
 668 031a 9446     		mov	ip, r2
 669 031c 1821     		movs	r1, #24
 670 031e 8846     		mov	r8, r1
 671 0320 B844     		add	r8, r8, r7
 672 0322 C444     		add	ip, ip, r8
 673 0324 6344     		add	r3, r3, ip
 674 0326 F422     		movs	r2, #244
 675 0328 D200     		lsls	r2, r2, #3
 676 032a 1821     		movs	r1, #24
 677 032c 8C46     		mov	ip, r1
 678 032e BC44     		add	ip, ip, r7
 679 0330 6244     		add	r2, r2, ip
 680 0332 2033     		adds	r3, r3, #32
 681 0334 1100     		movs	r1, r2
 682 0336 2022     		movs	r2, #32
 683 0338 1800     		movs	r0, r3
 684 033a FFF7FEFF 		bl	memcpy
 685 033e DF4B     		ldr	r3, .L46+12
 686 0340 DF4A     		ldr	r2, .L46+16
 687 0342 9446     		mov	ip, r2
 688 0344 1821     		movs	r1, #24
 689 0346 8846     		mov	r8, r1
 690 0348 B844     		add	r8, r8, r7
 691 034a C444     		add	ip, ip, r8
 692 034c 6344     		add	r3, r3, ip
 693 034e F022     		movs	r2, #240
 694 0350 D200     		lsls	r2, r2, #3
 695 0352 1821     		movs	r1, #24
 696 0354 8C46     		mov	ip, r1
 697 0356 BC44     		add	ip, ip, r7
 698 0358 6244     		add	r2, r2, ip
 699 035a 4033     		adds	r3, r3, #64
 700 035c 1100     		movs	r1, r2
 701 035e 2022     		movs	r2, #32
 702 0360 1800     		movs	r0, r3
 703 0362 FFF7FEFF 		bl	memcpy
 704 0366 D54B     		ldr	r3, .L46+12
 705 0368 D54A     		ldr	r2, .L46+16
 706 036a 9446     		mov	ip, r2
 707 036c 1821     		movs	r1, #24
 708 036e 8846     		mov	r8, r1
 709 0370 B844     		add	r8, r8, r7
 710 0372 C444     		add	ip, ip, r8
 711 0374 6344     		add	r3, r3, ip
 712 0376 EC22     		movs	r2, #236
 713 0378 D200     		lsls	r2, r2, #3
 714 037a 1821     		movs	r1, #24
 715 037c 8C46     		mov	ip, r1
 716 037e BC44     		add	ip, ip, r7
 717 0380 6244     		add	r2, r2, ip
 718 0382 6033     		adds	r3, r3, #96
 719 0384 1100     		movs	r1, r2
 720 0386 2022     		movs	r2, #32
 721 0388 1800     		movs	r0, r3
 722 038a FFF7FEFF 		bl	memcpy
 723 038e CB4B     		ldr	r3, .L46+12
 724 0390 CB4A     		ldr	r2, .L46+16
 725 0392 9446     		mov	ip, r2
 726 0394 1821     		movs	r1, #24
 727 0396 8846     		mov	r8, r1
 728 0398 B844     		add	r8, r8, r7
 729 039a C444     		add	ip, ip, r8
 730 039c 6344     		add	r3, r3, ip
 731 039e E822     		movs	r2, #232
 732 03a0 D200     		lsls	r2, r2, #3
 733 03a2 1821     		movs	r1, #24
 734 03a4 8C46     		mov	ip, r1
 735 03a6 BC44     		add	ip, ip, r7
 736 03a8 6244     		add	r2, r2, ip
 737 03aa 8033     		adds	r3, r3, #128
 738 03ac 1100     		movs	r1, r2
 739 03ae 2022     		movs	r2, #32
 740 03b0 1800     		movs	r0, r3
 741 03b2 FFF7FEFF 		bl	memcpy
 742 03b6 C14B     		ldr	r3, .L46+12
 743 03b8 C14A     		ldr	r2, .L46+16
 744 03ba 9446     		mov	ip, r2
 745 03bc 1821     		movs	r1, #24
 746 03be 8846     		mov	r8, r1
 747 03c0 B844     		add	r8, r8, r7
 748 03c2 C444     		add	ip, ip, r8
 749 03c4 6344     		add	r3, r3, ip
 750 03c6 A022     		movs	r2, #160
 751 03c8 E421     		movs	r1, #228
 752 03ca C900     		lsls	r1, r1, #3
 753 03cc 1820     		movs	r0, #24
 754 03ce 8446     		mov	ip, r0
 755 03d0 BC44     		add	ip, ip, r7
 756 03d2 6144     		add	r1, r1, ip
 757 03d4 9B18     		adds	r3, r3, r2
 758 03d6 2022     		movs	r2, #32
 759 03d8 1800     		movs	r0, r3
 760 03da FFF7FEFF 		bl	memcpy
 761 03de B74B     		ldr	r3, .L46+12
 762 03e0 B74A     		ldr	r2, .L46+16
 763 03e2 9446     		mov	ip, r2
 764 03e4 1821     		movs	r1, #24
 765 03e6 8846     		mov	r8, r1
 766 03e8 B844     		add	r8, r8, r7
 767 03ea C444     		add	ip, ip, r8
 768 03ec 6344     		add	r3, r3, ip
 769 03ee C022     		movs	r2, #192
 770 03f0 B449     		ldr	r1, .L46+20
 771 03f2 B348     		ldr	r0, .L46+16
 772 03f4 8446     		mov	ip, r0
 773 03f6 1820     		movs	r0, #24
 774 03f8 8046     		mov	r8, r0
 775 03fa B844     		add	r8, r8, r7
 776 03fc C444     		add	ip, ip, r8
 777 03fe 6144     		add	r1, r1, ip
 778 0400 9B18     		adds	r3, r3, r2
 779 0402 2022     		movs	r2, #32
 780 0404 1800     		movs	r0, r3
 781 0406 FFF7FEFF 		bl	memcpy
 782 040a AC4B     		ldr	r3, .L46+12
 783 040c AC4A     		ldr	r2, .L46+16
 784 040e 9446     		mov	ip, r2
 785 0410 1821     		movs	r1, #24
 786 0412 8846     		mov	r8, r1
 787 0414 B844     		add	r8, r8, r7
 788 0416 C444     		add	ip, ip, r8
 789 0418 6344     		add	r3, r3, ip
 790 041a E022     		movs	r2, #224
 791 041c AA49     		ldr	r1, .L46+24
 792 041e A848     		ldr	r0, .L46+16
 793 0420 8446     		mov	ip, r0
 794 0422 1820     		movs	r0, #24
 795 0424 8046     		mov	r8, r0
 796 0426 B844     		add	r8, r8, r7
 797 0428 C444     		add	ip, ip, r8
 798 042a 6144     		add	r1, r1, ip
 799 042c 9B18     		adds	r3, r3, r2
 800 042e 2022     		movs	r2, #32
 801 0430 1800     		movs	r0, r3
 802 0432 FFF7FEFF 		bl	memcpy
 803 0436 A14B     		ldr	r3, .L46+12
 804 0438 1822     		movs	r2, #24
 805 043a B918     		adds	r1, r7, r2
 806 043c 8A19     		adds	r2, r1, r6
 807 043e D218     		adds	r2, r2, r3
 808 0440 8023     		movs	r3, #128
 809 0442 5B00     		lsls	r3, r3, #1
 810 0444 A149     		ldr	r1, .L46+28
 811 0446 9E48     		ldr	r0, .L46+16
 812 0448 8446     		mov	ip, r0
 813 044a 1820     		movs	r0, #24
 814 044c 8046     		mov	r8, r0
 815 044e B844     		add	r8, r8, r7
 816 0450 C444     		add	ip, ip, r8
 817 0452 6144     		add	r1, r1, ip
 818 0454 D318     		adds	r3, r2, r3
 819 0456 2022     		movs	r2, #32
 820 0458 1800     		movs	r0, r3
 821 045a FFF7FEFF 		bl	memcpy
 822 045e 974B     		ldr	r3, .L46+12
 823 0460 1822     		movs	r2, #24
 824 0462 B918     		adds	r1, r7, r2
 825 0464 8A19     		adds	r2, r1, r6
 826 0466 D218     		adds	r2, r2, r3
 827 0468 9023     		movs	r3, #144
 828 046a 5B00     		lsls	r3, r3, #1
 829 046c 9849     		ldr	r1, .L46+32
 830 046e 9448     		ldr	r0, .L46+16
 831 0470 8446     		mov	ip, r0
 832 0472 1820     		movs	r0, #24
 833 0474 8046     		mov	r8, r0
 834 0476 B844     		add	r8, r8, r7
 835 0478 C444     		add	ip, ip, r8
 836 047a 6144     		add	r1, r1, ip
 837 047c D318     		adds	r3, r2, r3
 838 047e 2022     		movs	r2, #32
 839 0480 1800     		movs	r0, r3
 840 0482 FFF7FEFF 		bl	memcpy
 841 0486 8D4B     		ldr	r3, .L46+12
 842 0488 1822     		movs	r2, #24
 843 048a B918     		adds	r1, r7, r2
 844 048c 8A19     		adds	r2, r1, r6
 845 048e D218     		adds	r2, r2, r3
 846 0490 A023     		movs	r3, #160
 847 0492 5B00     		lsls	r3, r3, #1
 848 0494 8F49     		ldr	r1, .L46+36
 849 0496 8A48     		ldr	r0, .L46+16
 850 0498 8446     		mov	ip, r0
 851 049a 1820     		movs	r0, #24
 852 049c 8046     		mov	r8, r0
 853 049e B844     		add	r8, r8, r7
 854 04a0 C444     		add	ip, ip, r8
 855 04a2 6144     		add	r1, r1, ip
 856 04a4 D318     		adds	r3, r2, r3
 857 04a6 2022     		movs	r2, #32
 858 04a8 1800     		movs	r0, r3
 859 04aa FFF7FEFF 		bl	memcpy
 860 04ae 834B     		ldr	r3, .L46+12
 861 04b0 1822     		movs	r2, #24
 862 04b2 B918     		adds	r1, r7, r2
 863 04b4 8A19     		adds	r2, r1, r6
 864 04b6 D218     		adds	r2, r2, r3
 865 04b8 B023     		movs	r3, #176
 866 04ba 5B00     		lsls	r3, r3, #1
 867 04bc 8649     		ldr	r1, .L46+40
 868 04be 8048     		ldr	r0, .L46+16
 869 04c0 8446     		mov	ip, r0
 870 04c2 1820     		movs	r0, #24
 871 04c4 8046     		mov	r8, r0
 872 04c6 B844     		add	r8, r8, r7
 873 04c8 C444     		add	ip, ip, r8
 874 04ca 6144     		add	r1, r1, ip
 875 04cc D318     		adds	r3, r2, r3
 876 04ce 2022     		movs	r2, #32
 877 04d0 1800     		movs	r0, r3
 878 04d2 FFF7FEFF 		bl	memcpy
 879 04d6 794B     		ldr	r3, .L46+12
 880 04d8 1822     		movs	r2, #24
 881 04da B918     		adds	r1, r7, r2
 882 04dc 8A19     		adds	r2, r1, r6
 883 04de D218     		adds	r2, r2, r3
 884 04e0 C023     		movs	r3, #192
 885 04e2 5B00     		lsls	r3, r3, #1
 886 04e4 7D49     		ldr	r1, .L46+44
 887 04e6 7648     		ldr	r0, .L46+16
 888 04e8 8446     		mov	ip, r0
 889 04ea 1820     		movs	r0, #24
 890 04ec 8046     		mov	r8, r0
 891 04ee B844     		add	r8, r8, r7
 892 04f0 C444     		add	ip, ip, r8
 893 04f2 6144     		add	r1, r1, ip
 894 04f4 D318     		adds	r3, r2, r3
 895 04f6 2022     		movs	r2, #32
 896 04f8 1800     		movs	r0, r3
 897 04fa FFF7FEFF 		bl	memcpy
 898 04fe 6F4B     		ldr	r3, .L46+12
 899 0500 1822     		movs	r2, #24
 900 0502 B918     		adds	r1, r7, r2
 901 0504 8A19     		adds	r2, r1, r6
 902 0506 D218     		adds	r2, r2, r3
 903 0508 D023     		movs	r3, #208
 904 050a 5B00     		lsls	r3, r3, #1
 905 050c 7449     		ldr	r1, .L46+48
 906 050e 6C48     		ldr	r0, .L46+16
 907 0510 8446     		mov	ip, r0
 908 0512 1820     		movs	r0, #24
 909 0514 8046     		mov	r8, r0
 910 0516 B844     		add	r8, r8, r7
 911 0518 C444     		add	ip, ip, r8
 912 051a 6144     		add	r1, r1, ip
 913 051c D318     		adds	r3, r2, r3
 914 051e 2022     		movs	r2, #32
 915 0520 1800     		movs	r0, r3
 916 0522 FFF7FEFF 		bl	memcpy
 917 0526 654B     		ldr	r3, .L46+12
 918 0528 1822     		movs	r2, #24
 919 052a B918     		adds	r1, r7, r2
 920 052c 8A19     		adds	r2, r1, r6
 921 052e D218     		adds	r2, r2, r3
 922 0530 E023     		movs	r3, #224
 923 0532 5B00     		lsls	r3, r3, #1
 924 0534 6B49     		ldr	r1, .L46+52
 925 0536 6248     		ldr	r0, .L46+16
 926 0538 8446     		mov	ip, r0
 927 053a 1820     		movs	r0, #24
 928 053c 8046     		mov	r8, r0
 929 053e B844     		add	r8, r8, r7
 930 0540 C444     		add	ip, ip, r8
 931 0542 6144     		add	r1, r1, ip
 932 0544 D318     		adds	r3, r2, r3
 933 0546 2022     		movs	r2, #32
 934 0548 1800     		movs	r0, r3
 935 054a FFF7FEFF 		bl	memcpy
 936 054e 5B4B     		ldr	r3, .L46+12
 937 0550 1822     		movs	r2, #24
 938 0552 B918     		adds	r1, r7, r2
 939 0554 8A19     		adds	r2, r1, r6
 940 0556 D218     		adds	r2, r2, r3
 941 0558 F023     		movs	r3, #240
 942 055a 5B00     		lsls	r3, r3, #1
 943 055c 6249     		ldr	r1, .L46+56
 944 055e 5848     		ldr	r0, .L46+16
 945 0560 8446     		mov	ip, r0
 946 0562 1820     		movs	r0, #24
 947 0564 8046     		mov	r8, r0
 948 0566 B844     		add	r8, r8, r7
 949 0568 C444     		add	ip, ip, r8
 950 056a 6144     		add	r1, r1, ip
 951 056c D318     		adds	r3, r2, r3
 952 056e 2022     		movs	r2, #32
 953 0570 1800     		movs	r0, r3
 954 0572 FFF7FEFF 		bl	memcpy
 955 0576 514B     		ldr	r3, .L46+12
 956 0578 1822     		movs	r2, #24
 957 057a B918     		adds	r1, r7, r2
 958 057c 8A19     		adds	r2, r1, r6
 959 057e D218     		adds	r2, r2, r3
 960 0580 8023     		movs	r3, #128
 961 0582 9B00     		lsls	r3, r3, #2
 962 0584 5949     		ldr	r1, .L46+60
 963 0586 4E48     		ldr	r0, .L46+16
 964 0588 8446     		mov	ip, r0
 965 058a 1820     		movs	r0, #24
 966 058c 8046     		mov	r8, r0
 967 058e B844     		add	r8, r8, r7
 968 0590 C444     		add	ip, ip, r8
 969 0592 6144     		add	r1, r1, ip
 970 0594 D318     		adds	r3, r2, r3
 971 0596 2022     		movs	r2, #32
 972 0598 1800     		movs	r0, r3
 973 059a FFF7FEFF 		bl	memcpy
 974 059e 474B     		ldr	r3, .L46+12
 975 05a0 1822     		movs	r2, #24
 976 05a2 B918     		adds	r1, r7, r2
 977 05a4 8A19     		adds	r2, r1, r6
 978 05a6 D218     		adds	r2, r2, r3
 979 05a8 8823     		movs	r3, #136
 980 05aa 9B00     		lsls	r3, r3, #2
 981 05ac 5049     		ldr	r1, .L46+64
 982 05ae 4448     		ldr	r0, .L46+16
 983 05b0 8446     		mov	ip, r0
 984 05b2 1820     		movs	r0, #24
 985 05b4 8046     		mov	r8, r0
 986 05b6 B844     		add	r8, r8, r7
 987 05b8 C444     		add	ip, ip, r8
 988 05ba 6144     		add	r1, r1, ip
 989 05bc D318     		adds	r3, r2, r3
 990 05be 2022     		movs	r2, #32
 991 05c0 1800     		movs	r0, r3
 992 05c2 FFF7FEFF 		bl	memcpy
 993 05c6 3D4B     		ldr	r3, .L46+12
 994 05c8 1822     		movs	r2, #24
 995 05ca B918     		adds	r1, r7, r2
 996 05cc 8A19     		adds	r2, r1, r6
 997 05ce D218     		adds	r2, r2, r3
 998 05d0 9023     		movs	r3, #144
 999 05d2 9B00     		lsls	r3, r3, #2
 1000 05d4 4749     		ldr	r1, .L46+68
 1001 05d6 3A48     		ldr	r0, .L46+16
 1002 05d8 8446     		mov	ip, r0
 1003 05da 1820     		movs	r0, #24
 1004 05dc 8046     		mov	r8, r0
 1005 05de B844     		add	r8, r8, r7
 1006 05e0 C444     		add	ip, ip, r8
 1007 05e2 6144     		add	r1, r1, ip
 1008 05e4 D318     		adds	r3, r2, r3
 1009 05e6 2022     		movs	r2, #32
 1010 05e8 1800     		movs	r0, r3
 1011 05ea FFF7FEFF 		bl	memcpy
 1012 05ee 334B     		ldr	r3, .L46+12
 1013 05f0 1822     		movs	r2, #24
 1014 05f2 B918     		adds	r1, r7, r2
 1015 05f4 8A19     		adds	r2, r1, r6
 1016 05f6 D218     		adds	r2, r2, r3
 1017 05f8 9823     		movs	r3, #152
 1018 05fa 9B00     		lsls	r3, r3, #2
 1019 05fc 3E49     		ldr	r1, .L46+72
 1020 05fe 3048     		ldr	r0, .L46+16
 1021 0600 8446     		mov	ip, r0
 1022 0602 1820     		movs	r0, #24
 1023 0604 8046     		mov	r8, r0
 1024 0606 B844     		add	r8, r8, r7
 1025 0608 C444     		add	ip, ip, r8
 1026 060a 6144     		add	r1, r1, ip
 1027 060c D318     		adds	r3, r2, r3
 1028 060e 2022     		movs	r2, #32
 1029 0610 1800     		movs	r0, r3
 1030 0612 FFF7FEFF 		bl	memcpy
 1031 0616 294B     		ldr	r3, .L46+12
 1032 0618 1822     		movs	r2, #24
 1033 061a B918     		adds	r1, r7, r2
 1034 061c 8A19     		adds	r2, r1, r6
 1035 061e D218     		adds	r2, r2, r3
 1036 0620 A023     		movs	r3, #160
 1037 0622 9B00     		lsls	r3, r3, #2
 1038 0624 3549     		ldr	r1, .L46+76
 1039 0626 2648     		ldr	r0, .L46+16
 1040 0628 8446     		mov	ip, r0
 1041 062a 1820     		movs	r0, #24
 1042 062c 8046     		mov	r8, r0
 1043 062e B844     		add	r8, r8, r7
 1044 0630 C444     		add	ip, ip, r8
 1045 0632 6144     		add	r1, r1, ip
 1046 0634 D318     		adds	r3, r2, r3
 1047 0636 2022     		movs	r2, #32
 1048 0638 1800     		movs	r0, r3
 1049 063a FFF7FEFF 		bl	memcpy
 1050 063e 1F4B     		ldr	r3, .L46+12
 1051 0640 1822     		movs	r2, #24
 1052 0642 B918     		adds	r1, r7, r2
 1053 0644 8A19     		adds	r2, r1, r6
 1054 0646 D218     		adds	r2, r2, r3
 1055 0648 A823     		movs	r3, #168
 1056 064a 9B00     		lsls	r3, r3, #2
 1057 064c 2C49     		ldr	r1, .L46+80
 1058 064e 1C48     		ldr	r0, .L46+16
 1059 0650 8446     		mov	ip, r0
 1060 0652 1820     		movs	r0, #24
 1061 0654 8046     		mov	r8, r0
 1062 0656 B844     		add	r8, r8, r7
 1063 0658 C444     		add	ip, ip, r8
 1064 065a 6144     		add	r1, r1, ip
 1065 065c D318     		adds	r3, r2, r3
 1066 065e 2022     		movs	r2, #32
 1067 0660 1800     		movs	r0, r3
 1068 0662 FFF7FEFF 		bl	memcpy
 1069 0666 154B     		ldr	r3, .L46+12
 1070 0668 1822     		movs	r2, #24
 1071 066a B918     		adds	r1, r7, r2
 1072 066c 8A19     		adds	r2, r1, r6
 1073 066e D218     		adds	r2, r2, r3
 1074 0670 B023     		movs	r3, #176
 1075 0672 9B00     		lsls	r3, r3, #2
 1076 0674 2349     		ldr	r1, .L46+84
 1077 0676 1248     		ldr	r0, .L46+16
 1078 0678 8446     		mov	ip, r0
 1079 067a 1820     		movs	r0, #24
 1080 067c 8046     		mov	r8, r0
 1081 067e B844     		add	r8, r8, r7
 1082 0680 C444     		add	ip, ip, r8
 1083 0682 6144     		add	r1, r1, ip
 1084 0684 D318     		adds	r3, r2, r3
 1085 0686 2022     		movs	r2, #32
 1086 0688 1800     		movs	r0, r3
 1087 068a FFF7FEFF 		bl	memcpy
 1088 068e 0B4B     		ldr	r3, .L46+12
 1089 0690 1822     		movs	r2, #24
 1090 0692 B918     		adds	r1, r7, r2
 1091 0694 8A19     		adds	r2, r1, r6
 1092 0696 D218     		adds	r2, r2, r3
 1093 0698 B823     		movs	r3, #184
 1094 069a 9B00     		lsls	r3, r3, #2
 1095 069c 1A49     		ldr	r1, .L46+88
 1096 069e 0848     		ldr	r0, .L46+16
 1097 06a0 8446     		mov	ip, r0
 1098 06a2 1820     		movs	r0, #24
 1099 06a4 8046     		mov	r8, r0
 1100 06a6 B844     		add	r8, r8, r7
 1101 06a8 C444     		add	ip, ip, r8
 1102 06aa 6144     		add	r1, r1, ip
 1103 06ac D318     		adds	r3, r2, r3
 1104 06ae 2DE0     		b	.L47
 1105              	.L48:
 1106              		.align	2
 1107              	.L46:
 1108 06b0 E0F7FFFF 		.word	-2080
 1109 06b4 00000000 		.word	msTicks
 1110 06b8 CF070000 		.word	1999
 1111 06bc F8F7FFFF 		.word	-2056
 1112 06c0 08080000 		.word	2056
 1113 06c4 F8FEFFFF 		.word	-264
 1114 06c8 D8FEFFFF 		.word	-296
 1115 06cc B8FEFFFF 		.word	-328
 1116 06d0 98FEFFFF 		.word	-360
 1117 06d4 78FEFFFF 		.word	-392
 1118 06d8 58FEFFFF 		.word	-424
 1119 06dc 38FEFFFF 		.word	-456
 1120 06e0 18FEFFFF 		.word	-488
 1121 06e4 F8FDFFFF 		.word	-520
 1122 06e8 D8FDFFFF 		.word	-552
 1123 06ec B8FDFFFF 		.word	-584
 1124 06f0 98FDFFFF 		.word	-616
 1125 06f4 78FDFFFF 		.word	-648
 1126 06f8 58FDFFFF 		.word	-680
 1127 06fc 38FDFFFF 		.word	-712
 1128 0700 18FDFFFF 		.word	-744
 1129 0704 F8FCFFFF 		.word	-776
 1130 0708 D8FCFFFF 		.word	-808
 1131              	.L47:
 1132 070c 2022     		movs	r2, #32
 1133 070e 1800     		movs	r0, r3
 1134 0710 FFF7FEFF 		bl	memcpy
 1135 0714 A34B     		ldr	r3, .L49
 1136 0716 1822     		movs	r2, #24
 1137 0718 B918     		adds	r1, r7, r2
 1138 071a 8A19     		adds	r2, r1, r6
 1139 071c D218     		adds	r2, r2, r3
 1140 071e C023     		movs	r3, #192
 1141 0720 9B00     		lsls	r3, r3, #2
 1142 0722 A149     		ldr	r1, .L49+4
 1143 0724 A148     		ldr	r0, .L49+8
 1144 0726 8446     		mov	ip, r0
 1145 0728 1820     		movs	r0, #24
 1146 072a 8046     		mov	r8, r0
 1147 072c B844     		add	r8, r8, r7
 1148 072e C444     		add	ip, ip, r8
 1149 0730 6144     		add	r1, r1, ip
 1150 0732 D318     		adds	r3, r2, r3
 1151 0734 2022     		movs	r2, #32
 1152 0736 1800     		movs	r0, r3
 1153 0738 FFF7FEFF 		bl	memcpy
 1154 073c 994B     		ldr	r3, .L49
 1155 073e 1822     		movs	r2, #24
 1156 0740 B918     		adds	r1, r7, r2
 1157 0742 8A19     		adds	r2, r1, r6
 1158 0744 D218     		adds	r2, r2, r3
 1159 0746 C823     		movs	r3, #200
 1160 0748 9B00     		lsls	r3, r3, #2
 1161 074a 9949     		ldr	r1, .L49+12
 1162 074c 9748     		ldr	r0, .L49+8
 1163 074e 8446     		mov	ip, r0
 1164 0750 1820     		movs	r0, #24
 1165 0752 8046     		mov	r8, r0
 1166 0754 B844     		add	r8, r8, r7
 1167 0756 C444     		add	ip, ip, r8
 1168 0758 6144     		add	r1, r1, ip
 1169 075a D318     		adds	r3, r2, r3
 1170 075c 2022     		movs	r2, #32
 1171 075e 1800     		movs	r0, r3
 1172 0760 FFF7FEFF 		bl	memcpy
 1173 0764 8F4B     		ldr	r3, .L49
 1174 0766 1822     		movs	r2, #24
 1175 0768 B918     		adds	r1, r7, r2
 1176 076a 8A19     		adds	r2, r1, r6
 1177 076c D218     		adds	r2, r2, r3
 1178 076e D023     		movs	r3, #208
 1179 0770 9B00     		lsls	r3, r3, #2
 1180 0772 9049     		ldr	r1, .L49+16
 1181 0774 8D48     		ldr	r0, .L49+8
 1182 0776 8446     		mov	ip, r0
 1183 0778 1820     		movs	r0, #24
 1184 077a 8046     		mov	r8, r0
 1185 077c B844     		add	r8, r8, r7
 1186 077e C444     		add	ip, ip, r8
 1187 0780 6144     		add	r1, r1, ip
 1188 0782 D318     		adds	r3, r2, r3
 1189 0784 2022     		movs	r2, #32
 1190 0786 1800     		movs	r0, r3
 1191 0788 FFF7FEFF 		bl	memcpy
 1192 078c 854B     		ldr	r3, .L49
 1193 078e 1822     		movs	r2, #24
 1194 0790 B918     		adds	r1, r7, r2
 1195 0792 8A19     		adds	r2, r1, r6
 1196 0794 D218     		adds	r2, r2, r3
 1197 0796 D823     		movs	r3, #216
 1198 0798 9B00     		lsls	r3, r3, #2
 1199 079a 8749     		ldr	r1, .L49+20
 1200 079c 8348     		ldr	r0, .L49+8
 1201 079e 8446     		mov	ip, r0
 1202 07a0 1820     		movs	r0, #24
 1203 07a2 8046     		mov	r8, r0
 1204 07a4 B844     		add	r8, r8, r7
 1205 07a6 C444     		add	ip, ip, r8
 1206 07a8 6144     		add	r1, r1, ip
 1207 07aa D318     		adds	r3, r2, r3
 1208 07ac 2022     		movs	r2, #32
 1209 07ae 1800     		movs	r0, r3
 1210 07b0 FFF7FEFF 		bl	memcpy
 1211 07b4 7B4B     		ldr	r3, .L49
 1212 07b6 1822     		movs	r2, #24
 1213 07b8 B918     		adds	r1, r7, r2
 1214 07ba 8A19     		adds	r2, r1, r6
 1215 07bc D218     		adds	r2, r2, r3
 1216 07be E023     		movs	r3, #224
 1217 07c0 9B00     		lsls	r3, r3, #2
 1218 07c2 7E49     		ldr	r1, .L49+24
 1219 07c4 7948     		ldr	r0, .L49+8
 1220 07c6 8446     		mov	ip, r0
 1221 07c8 1820     		movs	r0, #24
 1222 07ca 8046     		mov	r8, r0
 1223 07cc B844     		add	r8, r8, r7
 1224 07ce C444     		add	ip, ip, r8
 1225 07d0 6144     		add	r1, r1, ip
 1226 07d2 D318     		adds	r3, r2, r3
 1227 07d4 2022     		movs	r2, #32
 1228 07d6 1800     		movs	r0, r3
 1229 07d8 FFF7FEFF 		bl	memcpy
 1230 07dc 714B     		ldr	r3, .L49
 1231 07de 1822     		movs	r2, #24
 1232 07e0 B918     		adds	r1, r7, r2
 1233 07e2 8A19     		adds	r2, r1, r6
 1234 07e4 D218     		adds	r2, r2, r3
 1235 07e6 E823     		movs	r3, #232
 1236 07e8 9B00     		lsls	r3, r3, #2
 1237 07ea 7549     		ldr	r1, .L49+28
 1238 07ec 6F48     		ldr	r0, .L49+8
 1239 07ee 8446     		mov	ip, r0
 1240 07f0 1820     		movs	r0, #24
 1241 07f2 8046     		mov	r8, r0
 1242 07f4 B844     		add	r8, r8, r7
 1243 07f6 C444     		add	ip, ip, r8
 1244 07f8 6144     		add	r1, r1, ip
 1245 07fa D318     		adds	r3, r2, r3
 1246 07fc 2022     		movs	r2, #32
 1247 07fe 1800     		movs	r0, r3
 1248 0800 FFF7FEFF 		bl	memcpy
 1249 0804 674B     		ldr	r3, .L49
 1250 0806 1822     		movs	r2, #24
 1251 0808 BA18     		adds	r2, r7, r2
 1252 080a 9219     		adds	r2, r2, r6
 1253 080c D218     		adds	r2, r2, r3
 1254 080e F023     		movs	r3, #240
 1255 0810 9B00     		lsls	r3, r3, #2
 1256 0812 6C49     		ldr	r1, .L49+32
 1257 0814 6548     		ldr	r0, .L49+8
 1258 0816 8446     		mov	ip, r0
 1259 0818 1820     		movs	r0, #24
 1260 081a 8046     		mov	r8, r0
 1261 081c B844     		add	r8, r8, r7
 1262 081e C444     		add	ip, ip, r8
 1263 0820 6144     		add	r1, r1, ip
 1264 0822 D318     		adds	r3, r2, r3
 1265 0824 2022     		movs	r2, #32
 1266 0826 1800     		movs	r0, r3
 1267 0828 FFF7FEFF 		bl	memcpy
  56:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  57:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	int amountOfActiveDoors = 0;
 1268              		.loc 3 57 0
 1269 082c 0023     		movs	r3, #0
 1270 082e 664A     		ldr	r2, .L49+36
 1271 0830 1821     		movs	r1, #24
 1272 0832 8C46     		mov	ip, r1
 1273 0834 BC44     		add	ip, ip, r7
 1274 0836 6244     		add	r2, r2, ip
 1275 0838 1360     		str	r3, [r2]
 1276              	.LBB2:
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	for (int j = 0; j < (sizeof(GPIO_Ports) /sizeof(GPIO_TypeDef *)); j++)
 1277              		.loc 3 58 0
 1278 083a 0023     		movs	r3, #0
 1279 083c 8022     		movs	r2, #128
 1280 083e 1201     		lsls	r2, r2, #4
 1281 0840 1821     		movs	r1, #24
 1282 0842 8C46     		mov	ip, r1
 1283 0844 BC44     		add	ip, ip, r7
 1284 0846 6244     		add	r2, r2, ip
 1285 0848 1360     		str	r3, [r2]
 1286 084a 49E0     		b	.L24
 1287              	.L28:
 1288              	.LBB3:
  59:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
 1289              		.loc 3 60 0
 1290 084c 0023     		movs	r3, #0
 1291 084e 5F4A     		ldr	r2, .L49+40
 1292 0850 1821     		movs	r1, #24
 1293 0852 8C46     		mov	ip, r1
 1294 0854 BC44     		add	ip, ip, r7
 1295 0856 6244     		add	r2, r2, ip
 1296 0858 1360     		str	r3, [r2]
 1297 085a 2DE0     		b	.L25
 1298              	.L27:
  61:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
  62:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			if(!GPIO_ReadInputDataBit(GPIO_Ports[j], GPIO_Pins[i])){
 1299              		.loc 3 62 0
 1300 085c 5C4B     		ldr	r3, .L49+44
 1301 085e 8022     		movs	r2, #128
 1302 0860 1201     		lsls	r2, r2, #4
 1303 0862 1821     		movs	r1, #24
 1304 0864 8C46     		mov	ip, r1
 1305 0866 BC44     		add	ip, ip, r7
 1306 0868 6244     		add	r2, r2, ip
 1307 086a 1268     		ldr	r2, [r2]
 1308 086c 9200     		lsls	r2, r2, #2
 1309 086e D058     		ldr	r0, [r2, r3]
 1310 0870 584B     		ldr	r3, .L49+48
 1311 0872 564A     		ldr	r2, .L49+40
 1312 0874 1821     		movs	r1, #24
 1313 0876 8C46     		mov	ip, r1
 1314 0878 BC44     		add	ip, ip, r7
 1315 087a 6244     		add	r2, r2, ip
 1316 087c 1268     		ldr	r2, [r2]
 1317 087e 5200     		lsls	r2, r2, #1
 1318 0880 D35A     		ldrh	r3, [r2, r3]
 1319 0882 1900     		movs	r1, r3
 1320 0884 FFF7FEFF 		bl	GPIO_ReadInputDataBit
 1321 0888 031E     		subs	r3, r0, #0
 1322 088a 0AD1     		bne	.L26
  63:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				amountOfActiveDoors++;
 1323              		.loc 3 63 0
 1324 088c 4E4A     		ldr	r2, .L49+36
 1325 088e 1823     		movs	r3, #24
 1326 0890 FB18     		adds	r3, r7, r3
 1327 0892 9B18     		adds	r3, r3, r2
 1328 0894 1B68     		ldr	r3, [r3]
 1329 0896 0133     		adds	r3, r3, #1
 1330 0898 1821     		movs	r1, #24
 1331 089a 8C46     		mov	ip, r1
 1332 089c BC44     		add	ip, ip, r7
 1333 089e 6244     		add	r2, r2, ip
 1334 08a0 1360     		str	r3, [r2]
 1335              	.L26:
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 1336              		.loc 3 60 0 discriminator 2
 1337 08a2 4A4A     		ldr	r2, .L49+40
 1338 08a4 1823     		movs	r3, #24
 1339 08a6 FB18     		adds	r3, r7, r3
 1340 08a8 9B18     		adds	r3, r3, r2
 1341 08aa 1B68     		ldr	r3, [r3]
 1342 08ac 0233     		adds	r3, r3, #2
 1343 08ae 1821     		movs	r1, #24
 1344 08b0 8C46     		mov	ip, r1
 1345 08b2 BC44     		add	ip, ip, r7
 1346 08b4 6244     		add	r2, r2, ip
 1347 08b6 1360     		str	r3, [r2]
 1348              	.L25:
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 1349              		.loc 3 60 0 is_stmt 0 discriminator 1
 1350 08b8 444B     		ldr	r3, .L49+40
 1351 08ba 1822     		movs	r2, #24
 1352 08bc 9446     		mov	ip, r2
 1353 08be BC44     		add	ip, ip, r7
 1354 08c0 6344     		add	r3, r3, ip
 1355 08c2 1B68     		ldr	r3, [r3]
 1356 08c4 0F2B     		cmp	r3, #15
 1357 08c6 C9D9     		bls	.L27
 1358              	.LBE3:
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
 1359              		.loc 3 58 0 is_stmt 1 discriminator 2
 1360 08c8 8022     		movs	r2, #128
 1361 08ca 1201     		lsls	r2, r2, #4
 1362 08cc 1823     		movs	r3, #24
 1363 08ce FB18     		adds	r3, r7, r3
 1364 08d0 9B18     		adds	r3, r3, r2
 1365 08d2 1B68     		ldr	r3, [r3]
 1366 08d4 0133     		adds	r3, r3, #1
 1367 08d6 1821     		movs	r1, #24
 1368 08d8 8C46     		mov	ip, r1
 1369 08da BC44     		add	ip, ip, r7
 1370 08dc 6244     		add	r2, r2, ip
 1371 08de 1360     		str	r3, [r2]
 1372              	.L24:
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
 1373              		.loc 3 58 0 is_stmt 0 discriminator 1
 1374 08e0 8023     		movs	r3, #128
 1375 08e2 1B01     		lsls	r3, r3, #4
 1376 08e4 1822     		movs	r2, #24
 1377 08e6 9446     		mov	ip, r2
 1378 08e8 BC44     		add	ip, ip, r7
 1379 08ea 6344     		add	r3, r3, ip
 1380 08ec 1B68     		ldr	r3, [r3]
 1381 08ee 032B     		cmp	r3, #3
 1382 08f0 ACD9     		bls	.L28
 1383              	.LBE2:
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			}
  65:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		}
  66:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	}
  67:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	door active_doors[amountOfActiveDoors];
 1384              		.loc 3 67 0 is_stmt 1
 1385 08f2 354B     		ldr	r3, .L49+36
 1386 08f4 1822     		movs	r2, #24
 1387 08f6 9446     		mov	ip, r2
 1388 08f8 BC44     		add	ip, ip, r7
 1389 08fa 6344     		add	r3, r3, ip
 1390 08fc 1E68     		ldr	r6, [r3]
 1391 08fe 731E     		subs	r3, r6, #1
 1392 0900 354A     		ldr	r2, .L49+52
 1393 0902 1821     		movs	r1, #24
 1394 0904 8C46     		mov	ip, r1
 1395 0906 BC44     		add	ip, ip, r7
 1396 0908 6244     		add	r2, r2, ip
 1397 090a 1360     		str	r3, [r2]
 1398 090c 3300     		movs	r3, r6
 1399 090e BB60     		str	r3, [r7, #8]
 1400 0910 0023     		movs	r3, #0
 1401 0912 FB60     		str	r3, [r7, #12]
 1402 0914 B968     		ldr	r1, [r7, #8]
 1403 0916 FA68     		ldr	r2, [r7, #12]
 1404 0918 0B00     		movs	r3, r1
 1405 091a 1B0E     		lsrs	r3, r3, #24
 1406 091c 1000     		movs	r0, r2
 1407 091e 0002     		lsls	r0, r0, #8
 1408 0920 7861     		str	r0, [r7, #20]
 1409 0922 7869     		ldr	r0, [r7, #20]
 1410 0924 1843     		orrs	r0, r3
 1411 0926 7861     		str	r0, [r7, #20]
 1412 0928 0B00     		movs	r3, r1
 1413 092a 1B02     		lsls	r3, r3, #8
 1414 092c 3B61     		str	r3, [r7, #16]
 1415 092e 3300     		movs	r3, r6
 1416 0930 3B60     		str	r3, [r7]
 1417 0932 0023     		movs	r3, #0
 1418 0934 7B60     		str	r3, [r7, #4]
 1419 0936 3968     		ldr	r1, [r7]
 1420 0938 7A68     		ldr	r2, [r7, #4]
 1421 093a 0B00     		movs	r3, r1
 1422 093c 1B0E     		lsrs	r3, r3, #24
 1423 093e 1000     		movs	r0, r2
 1424 0940 0502     		lsls	r5, r0, #8
 1425 0942 1D43     		orrs	r5, r3
 1426 0944 0B00     		movs	r3, r1
 1427 0946 1C02     		lsls	r4, r3, #8
 1428 0948 3300     		movs	r3, r6
 1429 094a 5B01     		lsls	r3, r3, #5
 1430 094c 0333     		adds	r3, r3, #3
 1431 094e 0733     		adds	r3, r3, #7
 1432 0950 DB08     		lsrs	r3, r3, #3
 1433 0952 DB00     		lsls	r3, r3, #3
 1434 0954 6A46     		mov	r2, sp
 1435 0956 D31A     		subs	r3, r2, r3
 1436 0958 9D46     		mov	sp, r3
 1437 095a 6B46     		mov	r3, sp
 1438 095c 0333     		adds	r3, r3, #3
 1439 095e 9B08     		lsrs	r3, r3, #2
 1440 0960 9B00     		lsls	r3, r3, #2
 1441 0962 FC22     		movs	r2, #252
 1442 0964 D200     		lsls	r2, r2, #3
 1443 0966 1821     		movs	r1, #24
 1444 0968 8C46     		mov	ip, r1
 1445 096a BC44     		add	ip, ip, r7
 1446 096c 6244     		add	r2, r2, ip
 1447 096e 1360     		str	r3, [r2]
  68:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	int counter = 0;
 1448              		.loc 3 68 0
 1449 0970 0023     		movs	r3, #0
 1450 0972 FF22     		movs	r2, #255
 1451 0974 D200     		lsls	r2, r2, #3
 1452 0976 1821     		movs	r1, #24
 1453 0978 8C46     		mov	ip, r1
 1454 097a BC44     		add	ip, ip, r7
 1455 097c 6244     		add	r2, r2, ip
 1456 097e 1360     		str	r3, [r2]
 1457              	.LBB4:
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	for (int j = 0; j < (sizeof(GPIO_Ports) /sizeof(GPIO_TypeDef *)); j++)
 1458              		.loc 3 69 0
 1459 0980 0023     		movs	r3, #0
 1460 0982 164A     		ldr	r2, .L49+56
 1461 0984 1821     		movs	r1, #24
 1462 0986 8C46     		mov	ip, r1
 1463 0988 BC44     		add	ip, ip, r7
 1464 098a 6244     		add	r2, r2, ip
 1465 098c 1360     		str	r3, [r2]
 1466 098e 01E1     		b	.L29
 1467              	.L33:
 1468              	.LBB5:
  70:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		for (int i = 0; i < sizeof(GPIO_Pins) / sizeof(uint16_t); i = i + 2)
 1469              		.loc 3 71 0
 1470 0990 0023     		movs	r3, #0
 1471 0992 FE22     		movs	r2, #254
 1472 0994 D200     		lsls	r2, r2, #3
 1473 0996 1821     		movs	r1, #24
 1474 0998 8C46     		mov	ip, r1
 1475 099a BC44     		add	ip, ip, r7
 1476 099c 6244     		add	r2, r2, ip
 1477 099e 1360     		str	r3, [r2]
 1478 09a0 E3E0     		b	.L30
 1479              	.L50:
 1480 09a2 C046     		.align	2
 1481              	.L49:
 1482 09a4 F8F7FFFF 		.word	-2056
 1483 09a8 B8FCFFFF 		.word	-840
 1484 09ac 08080000 		.word	2056
 1485 09b0 98FCFFFF 		.word	-872
 1486 09b4 78FCFFFF 		.word	-904
 1487 09b8 58FCFFFF 		.word	-936
 1488 09bc 38FCFFFF 		.word	-968
 1489 09c0 18FCFFFF 		.word	-1000
 1490 09c4 F8FBFFFF 		.word	-1032
 1491 09c8 FC070000 		.word	2044
 1492 09cc 04080000 		.word	2052
 1493 09d0 00000000 		.word	GPIO_Ports
 1494 09d4 00000000 		.word	GPIO_Pins
 1495 09d8 E4070000 		.word	2020
 1496 09dc F4070000 		.word	2036
 1497              	.L32:
  72:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
  73:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			if(!GPIO_ReadInputDataBit(GPIO_Ports[j], GPIO_Pins[i])){
 1498              		.loc 3 73 0
 1499 09e0 EE4B     		ldr	r3, .L51
 1500 09e2 EF4A     		ldr	r2, .L51+4
 1501 09e4 1821     		movs	r1, #24
 1502 09e6 8C46     		mov	ip, r1
 1503 09e8 BC44     		add	ip, ip, r7
 1504 09ea 6244     		add	r2, r2, ip
 1505 09ec 1268     		ldr	r2, [r2]
 1506 09ee 9200     		lsls	r2, r2, #2
 1507 09f0 D058     		ldr	r0, [r2, r3]
 1508 09f2 EC4B     		ldr	r3, .L51+8
 1509 09f4 FE22     		movs	r2, #254
 1510 09f6 D200     		lsls	r2, r2, #3
 1511 09f8 1821     		movs	r1, #24
 1512 09fa 8C46     		mov	ip, r1
 1513 09fc BC44     		add	ip, ip, r7
 1514 09fe 6244     		add	r2, r2, ip
 1515 0a00 1268     		ldr	r2, [r2]
 1516 0a02 5200     		lsls	r2, r2, #1
 1517 0a04 D35A     		ldrh	r3, [r2, r3]
 1518 0a06 1900     		movs	r1, r3
 1519 0a08 FFF7FEFF 		bl	GPIO_ReadInputDataBit
 1520 0a0c 031E     		subs	r3, r0, #0
 1521 0a0e 00D0     		beq	.LCB1438
 1522 0a10 9FE0     		b	.L31	@long jump
 1523              	.LCB1438:
  74:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				all_doors[counter].GPIO_read = GPIO_Pins[i];
 1524              		.loc 3 74 0
 1525 0a12 E44B     		ldr	r3, .L51+8
 1526 0a14 FE25     		movs	r5, #254
 1527 0a16 ED00     		lsls	r5, r5, #3
 1528 0a18 1820     		movs	r0, #24
 1529 0a1a 3A18     		adds	r2, r7, r0
 1530 0a1c 5219     		adds	r2, r2, r5
 1531 0a1e 1268     		ldr	r2, [r2]
 1532 0a20 5200     		lsls	r2, r2, #1
 1533 0a22 D35A     		ldrh	r3, [r2, r3]
 1534 0a24 1900     		movs	r1, r3
 1535 0a26 E04B     		ldr	r3, .L51+12
 1536 0a28 E04C     		ldr	r4, .L51+16
 1537 0a2a 3A18     		adds	r2, r7, r0
 1538 0a2c 1219     		adds	r2, r2, r4
 1539 0a2e D218     		adds	r2, r2, r3
 1540 0a30 FF20     		movs	r0, #255
 1541 0a32 C000     		lsls	r0, r0, #3
 1542 0a34 1823     		movs	r3, #24
 1543 0a36 FB18     		adds	r3, r7, r3
 1544 0a38 1B18     		adds	r3, r3, r0
 1545 0a3a 1B68     		ldr	r3, [r3]
 1546 0a3c 5B01     		lsls	r3, r3, #5
 1547 0a3e D318     		adds	r3, r2, r3
 1548 0a40 1433     		adds	r3, r3, #20
 1549 0a42 1960     		str	r1, [r3]
  75:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				all_doors[counter].GPIO_lamp = GPIO_Pins[i+1];
 1550              		.loc 3 75 0
 1551 0a44 1823     		movs	r3, #24
 1552 0a46 FB18     		adds	r3, r7, r3
 1553 0a48 5B19     		adds	r3, r3, r5
 1554 0a4a 1B68     		ldr	r3, [r3]
 1555 0a4c 5A1C     		adds	r2, r3, #1
 1556 0a4e D54B     		ldr	r3, .L51+8
 1557 0a50 5200     		lsls	r2, r2, #1
 1558 0a52 D35A     		ldrh	r3, [r2, r3]
 1559 0a54 1900     		movs	r1, r3
 1560 0a56 D44B     		ldr	r3, .L51+12
 1561 0a58 2500     		movs	r5, r4
 1562 0a5a 1824     		movs	r4, #24
 1563 0a5c 3A19     		adds	r2, r7, r4
 1564 0a5e 5219     		adds	r2, r2, r5
 1565 0a60 D218     		adds	r2, r2, r3
 1566 0a62 3B19     		adds	r3, r7, r4
 1567 0a64 1B18     		adds	r3, r3, r0
 1568 0a66 1B68     		ldr	r3, [r3]
 1569 0a68 5B01     		lsls	r3, r3, #5
 1570 0a6a D318     		adds	r3, r2, r3
 1571 0a6c 1033     		adds	r3, r3, #16
 1572 0a6e 1960     		str	r1, [r3]
  76:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				all_doors[counter].controlbits = 0;
 1573              		.loc 3 76 0
 1574 0a70 CD4B     		ldr	r3, .L51+12
 1575 0a72 2100     		movs	r1, r4
 1576 0a74 7A18     		adds	r2, r7, r1
 1577 0a76 5219     		adds	r2, r2, r5
 1578 0a78 D218     		adds	r2, r2, r3
 1579 0a7a 7B18     		adds	r3, r7, r1
 1580 0a7c 1B18     		adds	r3, r3, r0
 1581 0a7e 1B68     		ldr	r3, [r3]
 1582 0a80 5B01     		lsls	r3, r3, #5
 1583 0a82 D318     		adds	r3, r2, r3
 1584 0a84 0433     		adds	r3, r3, #4
 1585 0a86 0022     		movs	r2, #0
 1586 0a88 1A60     		str	r2, [r3]
  77:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				all_doors[counter].time_larm = 0;
 1587              		.loc 3 77 0
 1588 0a8a C74B     		ldr	r3, .L51+12
 1589 0a8c 7A18     		adds	r2, r7, r1
 1590 0a8e 5219     		adds	r2, r2, r5
 1591 0a90 D218     		adds	r2, r2, r3
 1592 0a92 7B18     		adds	r3, r7, r1
 1593 0a94 1B18     		adds	r3, r3, r0
 1594 0a96 1B68     		ldr	r3, [r3]
 1595 0a98 5B01     		lsls	r3, r3, #5
 1596 0a9a D318     		adds	r3, r2, r3
 1597 0a9c 0833     		adds	r3, r3, #8
 1598 0a9e 0022     		movs	r2, #0
 1599 0aa0 1A70     		strb	r2, [r3]
  78:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				all_doors[counter].time_central_larm = 2;
 1600              		.loc 3 78 0
 1601 0aa2 C14B     		ldr	r3, .L51+12
 1602 0aa4 7A18     		adds	r2, r7, r1
 1603 0aa6 5219     		adds	r2, r2, r5
 1604 0aa8 D218     		adds	r2, r2, r3
 1605 0aaa 7B18     		adds	r3, r7, r1
 1606 0aac 1B18     		adds	r3, r3, r0
 1607 0aae 1B68     		ldr	r3, [r3]
 1608 0ab0 5B01     		lsls	r3, r3, #5
 1609 0ab2 D318     		adds	r3, r2, r3
 1610 0ab4 0933     		adds	r3, r3, #9
 1611 0ab6 0222     		movs	r2, #2
 1612 0ab8 1A70     		strb	r2, [r3]
  79:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				all_doors[counter].GPIO_type = GPIO_Ports[j];
 1613              		.loc 3 79 0
 1614 0aba B84B     		ldr	r3, .L51
 1615 0abc B84A     		ldr	r2, .L51+4
 1616 0abe 1824     		movs	r4, #24
 1617 0ac0 A446     		mov	ip, r4
 1618 0ac2 BC44     		add	ip, ip, r7
 1619 0ac4 6244     		add	r2, r2, ip
 1620 0ac6 1268     		ldr	r2, [r2]
 1621 0ac8 9200     		lsls	r2, r2, #2
 1622 0aca D258     		ldr	r2, [r2, r3]
 1623 0acc B64B     		ldr	r3, .L51+12
 1624 0ace 7C18     		adds	r4, r7, r1
 1625 0ad0 6119     		adds	r1, r4, r5
 1626 0ad2 C918     		adds	r1, r1, r3
 1627 0ad4 0400     		movs	r4, r0
 1628 0ad6 1820     		movs	r0, #24
 1629 0ad8 3B18     		adds	r3, r7, r0
 1630 0ada 1B19     		adds	r3, r3, r4
 1631 0adc 1B68     		ldr	r3, [r3]
 1632 0ade 5B01     		lsls	r3, r3, #5
 1633 0ae0 CB18     		adds	r3, r1, r3
 1634 0ae2 1C33     		adds	r3, r3, #28
 1635 0ae4 1A60     		str	r2, [r3]
  80:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				all_doors[counter].id = counter;
 1636              		.loc 3 80 0
 1637 0ae6 3B18     		adds	r3, r7, r0
 1638 0ae8 1B19     		adds	r3, r3, r4
 1639 0aea 1B68     		ldr	r3, [r3]
 1640 0aec D9B2     		uxtb	r1, r3
 1641 0aee AE4B     		ldr	r3, .L51+12
 1642 0af0 AE4A     		ldr	r2, .L51+16
 1643 0af2 9446     		mov	ip, r2
 1644 0af4 1822     		movs	r2, #24
 1645 0af6 9046     		mov	r8, r2
 1646 0af8 B844     		add	r8, r8, r7
 1647 0afa C444     		add	ip, ip, r8
 1648 0afc 6344     		add	r3, r3, ip
 1649 0afe 3A18     		adds	r2, r7, r0
 1650 0b00 1219     		adds	r2, r2, r4
 1651 0b02 1268     		ldr	r2, [r2]
 1652 0b04 5201     		lsls	r2, r2, #5
 1653 0b06 D154     		strb	r1, [r2, r3]
  81:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				active_doors[counter] = all_doors[counter];
 1654              		.loc 3 81 0
 1655 0b08 FC23     		movs	r3, #252
 1656 0b0a DB00     		lsls	r3, r3, #3
 1657 0b0c 1822     		movs	r2, #24
 1658 0b0e 9446     		mov	ip, r2
 1659 0b10 BC44     		add	ip, ip, r7
 1660 0b12 6344     		add	r3, r3, ip
 1661 0b14 1868     		ldr	r0, [r3]
 1662 0b16 1821     		movs	r1, #24
 1663 0b18 7B18     		adds	r3, r7, r1
 1664 0b1a 1B19     		adds	r3, r3, r4
 1665 0b1c 1B68     		ldr	r3, [r3]
 1666 0b1e 5B01     		lsls	r3, r3, #5
 1667 0b20 A14A     		ldr	r2, .L51+12
 1668 0b22 7918     		adds	r1, r7, r1
 1669 0b24 4919     		adds	r1, r1, r5
 1670 0b26 8918     		adds	r1, r1, r2
 1671 0b28 1822     		movs	r2, #24
 1672 0b2a BD18     		adds	r5, r7, r2
 1673 0b2c 2A19     		adds	r2, r5, r4
 1674 0b2e 1268     		ldr	r2, [r2]
 1675 0b30 5201     		lsls	r2, r2, #5
 1676 0b32 C318     		adds	r3, r0, r3
 1677 0b34 8A18     		adds	r2, r1, r2
 1678 0b36 23CA     		ldmia	r2!, {r0, r1, r5}
 1679 0b38 23C3     		stmia	r3!, {r0, r1, r5}
 1680 0b3a 23CA     		ldmia	r2!, {r0, r1, r5}
 1681 0b3c 23C3     		stmia	r3!, {r0, r1, r5}
 1682 0b3e 03CA     		ldmia	r2!, {r0, r1}
 1683 0b40 03C3     		stmia	r3!, {r0, r1}
  82:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				counter++;
 1684              		.loc 3 82 0
 1685 0b42 1822     		movs	r2, #24
 1686 0b44 BB18     		adds	r3, r7, r2
 1687 0b46 1B19     		adds	r3, r3, r4
 1688 0b48 1B68     		ldr	r3, [r3]
 1689 0b4a 0133     		adds	r3, r3, #1
 1690 0b4c BA18     		adds	r2, r7, r2
 1691 0b4e 1219     		adds	r2, r2, r4
 1692 0b50 1360     		str	r3, [r2]
 1693              	.L31:
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 1694              		.loc 3 71 0 discriminator 2
 1695 0b52 FE22     		movs	r2, #254
 1696 0b54 D200     		lsls	r2, r2, #3
 1697 0b56 1823     		movs	r3, #24
 1698 0b58 FB18     		adds	r3, r7, r3
 1699 0b5a 9B18     		adds	r3, r3, r2
 1700 0b5c 1B68     		ldr	r3, [r3]
 1701 0b5e 0233     		adds	r3, r3, #2
 1702 0b60 1821     		movs	r1, #24
 1703 0b62 8C46     		mov	ip, r1
 1704 0b64 BC44     		add	ip, ip, r7
 1705 0b66 6244     		add	r2, r2, ip
 1706 0b68 1360     		str	r3, [r2]
 1707              	.L30:
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 1708              		.loc 3 71 0 is_stmt 0 discriminator 1
 1709 0b6a FE23     		movs	r3, #254
 1710 0b6c DB00     		lsls	r3, r3, #3
 1711 0b6e 1822     		movs	r2, #24
 1712 0b70 9446     		mov	ip, r2
 1713 0b72 BC44     		add	ip, ip, r7
 1714 0b74 6344     		add	r3, r3, ip
 1715 0b76 1B68     		ldr	r3, [r3]
 1716 0b78 0F2B     		cmp	r3, #15
 1717 0b7a 00D8     		bhi	.LCB1673
 1718 0b7c 30E7     		b	.L32	@long jump
 1719              	.LCB1673:
 1720              	.LBE5:
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
 1721              		.loc 3 69 0 is_stmt 1 discriminator 2
 1722 0b7e 884A     		ldr	r2, .L51+4
 1723 0b80 1823     		movs	r3, #24
 1724 0b82 FB18     		adds	r3, r7, r3
 1725 0b84 9B18     		adds	r3, r3, r2
 1726 0b86 1B68     		ldr	r3, [r3]
 1727 0b88 0133     		adds	r3, r3, #1
 1728 0b8a 1821     		movs	r1, #24
 1729 0b8c 8C46     		mov	ip, r1
 1730 0b8e BC44     		add	ip, ip, r7
 1731 0b90 6244     		add	r2, r2, ip
 1732 0b92 1360     		str	r3, [r2]
 1733              	.L29:
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
 1734              		.loc 3 69 0 is_stmt 0 discriminator 1
 1735 0b94 824B     		ldr	r3, .L51+4
 1736 0b96 1822     		movs	r2, #24
 1737 0b98 9446     		mov	ip, r2
 1738 0b9a BC44     		add	ip, ip, r7
 1739 0b9c 6344     		add	r3, r3, ip
 1740 0b9e 1B68     		ldr	r3, [r3]
 1741 0ba0 032B     		cmp	r3, #3
 1742 0ba2 00D8     		bhi	.LCB1696
 1743 0ba4 F4E6     		b	.L33	@long jump
 1744              	.LCB1696:
 1745              	.LBE4:
  83:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			}
  84:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		}
  85:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	}
  86:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_SetBits(GPIOB, GPIO_Pin_2);
 1746              		.loc 3 86 0 is_stmt 1
 1747 0ba6 824B     		ldr	r3, .L51+20
 1748 0ba8 0421     		movs	r1, #4
 1749 0baa 1800     		movs	r0, r3
 1750 0bac FFF7FEFF 		bl	GPIO_SetBits
 1751              	.L45:
 1752              	.LBB6:
  87:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	//active_doors[2].controlbits |= 4;
  88:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	while (1)
  89:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		for (int i = 0; i < sizeof(active_doors)/sizeof(active_doors[0]); i++)
 1753              		.loc 3 90 0
 1754 0bb0 0023     		movs	r3, #0
 1755 0bb2 804A     		ldr	r2, .L51+24
 1756 0bb4 1821     		movs	r1, #24
 1757 0bb6 8C46     		mov	ip, r1
 1758 0bb8 BC44     		add	ip, ip, r7
 1759 0bba 6244     		add	r2, r2, ip
 1760 0bbc 1360     		str	r3, [r2]
 1761 0bbe A9E1     		b	.L34
 1762              	.L44:
  91:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
  92:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			if (!(active_doors[i].controlbits & 4))
 1763              		.loc 3 92 0
 1764 0bc0 FC23     		movs	r3, #252
 1765 0bc2 DB00     		lsls	r3, r3, #3
 1766 0bc4 1822     		movs	r2, #24
 1767 0bc6 9446     		mov	ip, r2
 1768 0bc8 BC44     		add	ip, ip, r7
 1769 0bca 6344     		add	r3, r3, ip
 1770 0bcc 1A68     		ldr	r2, [r3]
 1771 0bce 794B     		ldr	r3, .L51+24
 1772 0bd0 1821     		movs	r1, #24
 1773 0bd2 8C46     		mov	ip, r1
 1774 0bd4 BC44     		add	ip, ip, r7
 1775 0bd6 6344     		add	r3, r3, ip
 1776 0bd8 1B68     		ldr	r3, [r3]
 1777 0bda 5B01     		lsls	r3, r3, #5
 1778 0bdc D318     		adds	r3, r2, r3
 1779 0bde 0433     		adds	r3, r3, #4
 1780 0be0 1B68     		ldr	r3, [r3]
 1781 0be2 0422     		movs	r2, #4
 1782 0be4 1340     		ands	r3, r2
 1783 0be6 00D0     		beq	.LCB1736
 1784 0be8 89E1     		b	.L35	@long jump
 1785              	.LCB1736:
  93:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				{
  94:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				if (!GPIO_ReadInputDataBit(active_doors[i].GPIO_type, active_doors[i].GPIO_read)){ //GPIO pinne
 1786              		.loc 3 94 0
 1787 0bea FC21     		movs	r1, #252
 1788 0bec C900     		lsls	r1, r1, #3
 1789 0bee 1825     		movs	r5, #24
 1790 0bf0 7B19     		adds	r3, r7, r5
 1791 0bf2 5B18     		adds	r3, r3, r1
 1792 0bf4 1A68     		ldr	r2, [r3]
 1793 0bf6 6F4C     		ldr	r4, .L51+24
 1794 0bf8 7B19     		adds	r3, r7, r5
 1795 0bfa 1B19     		adds	r3, r3, r4
 1796 0bfc 1B68     		ldr	r3, [r3]
 1797 0bfe 5B01     		lsls	r3, r3, #5
 1798 0c00 D318     		adds	r3, r2, r3
 1799 0c02 1C33     		adds	r3, r3, #28
 1800 0c04 1868     		ldr	r0, [r3]
 1801 0c06 7B19     		adds	r3, r7, r5
 1802 0c08 5B18     		adds	r3, r3, r1
 1803 0c0a 1A68     		ldr	r2, [r3]
 1804 0c0c 7B19     		adds	r3, r7, r5
 1805 0c0e 1B19     		adds	r3, r3, r4
 1806 0c10 1B68     		ldr	r3, [r3]
 1807 0c12 5B01     		lsls	r3, r3, #5
 1808 0c14 D318     		adds	r3, r2, r3
 1809 0c16 1433     		adds	r3, r3, #20
 1810 0c18 1B68     		ldr	r3, [r3]
 1811 0c1a 9BB2     		uxth	r3, r3
 1812 0c1c 1900     		movs	r1, r3
 1813 0c1e FFF7FEFF 		bl	GPIO_ReadInputDataBit
 1814 0c22 031E     		subs	r3, r0, #0
 1815 0c24 1AD1     		bne	.L36
  95:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					active_doors[i].controlbits &= 0xFFFC; //Nollställer kontrollbiten för ifall en dörr är ö
 1816              		.loc 3 95 0
 1817 0c26 FC21     		movs	r1, #252
 1818 0c28 C900     		lsls	r1, r1, #3
 1819 0c2a 1824     		movs	r4, #24
 1820 0c2c 3B19     		adds	r3, r7, r4
 1821 0c2e 5B18     		adds	r3, r3, r1
 1822 0c30 1A68     		ldr	r2, [r3]
 1823 0c32 6048     		ldr	r0, .L51+24
 1824 0c34 3B19     		adds	r3, r7, r4
 1825 0c36 1B18     		adds	r3, r3, r0
 1826 0c38 1B68     		ldr	r3, [r3]
 1827 0c3a 5B01     		lsls	r3, r3, #5
 1828 0c3c D318     		adds	r3, r2, r3
 1829 0c3e 0433     		adds	r3, r3, #4
 1830 0c40 1B68     		ldr	r3, [r3]
 1831 0c42 5D4A     		ldr	r2, .L51+28
 1832 0c44 1A40     		ands	r2, r3
 1833 0c46 3B19     		adds	r3, r7, r4
 1834 0c48 5B18     		adds	r3, r3, r1
 1835 0c4a 1968     		ldr	r1, [r3]
 1836 0c4c 3B19     		adds	r3, r7, r4
 1837 0c4e 1B18     		adds	r3, r3, r0
 1838 0c50 1B68     		ldr	r3, [r3]
 1839 0c52 5B01     		lsls	r3, r3, #5
 1840 0c54 CB18     		adds	r3, r1, r3
 1841 0c56 0433     		adds	r3, r3, #4
 1842 0c58 1A60     		str	r2, [r3]
 1843 0c5a 40E0     		b	.L37
 1844              	.L36:
  96:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					//att skicka medelande till centralenheten, när den detekteras som stängd
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					
  98:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				}
  99:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				else{
 100:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					if (!active_doors[i].controlbits & 1) // Kollar så att dörren inte larmar sen innan så larm
 1845              		.loc 3 100 0
 1846 0c5c FC23     		movs	r3, #252
 1847 0c5e DB00     		lsls	r3, r3, #3
 1848 0c60 1822     		movs	r2, #24
 1849 0c62 9446     		mov	ip, r2
 1850 0c64 BC44     		add	ip, ip, r7
 1851 0c66 6344     		add	r3, r3, ip
 1852 0c68 1A68     		ldr	r2, [r3]
 1853 0c6a 524B     		ldr	r3, .L51+24
 1854 0c6c 1821     		movs	r1, #24
 1855 0c6e 8C46     		mov	ip, r1
 1856 0c70 BC44     		add	ip, ip, r7
 1857 0c72 6344     		add	r3, r3, ip
 1858 0c74 1B68     		ldr	r3, [r3]
 1859 0c76 5B01     		lsls	r3, r3, #5
 1860 0c78 D318     		adds	r3, r2, r3
 1861 0c7a 0433     		adds	r3, r3, #4
 1862 0c7c 1B68     		ldr	r3, [r3]
 1863 0c7e 002B     		cmp	r3, #0
 1864 0c80 13D1     		bne	.L38
 101:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					{
 102:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 						active_doors[i].larmTick = msTicks;
 1865              		.loc 3 102 0
 1866 0c82 4E4B     		ldr	r3, .L51+32
 1867 0c84 1B68     		ldr	r3, [r3]
 1868 0c86 1900     		movs	r1, r3
 1869 0c88 FC23     		movs	r3, #252
 1870 0c8a DB00     		lsls	r3, r3, #3
 1871 0c8c 1822     		movs	r2, #24
 1872 0c8e 9446     		mov	ip, r2
 1873 0c90 BC44     		add	ip, ip, r7
 1874 0c92 6344     		add	r3, r3, ip
 1875 0c94 1A68     		ldr	r2, [r3]
 1876 0c96 474B     		ldr	r3, .L51+24
 1877 0c98 1820     		movs	r0, #24
 1878 0c9a 8446     		mov	ip, r0
 1879 0c9c BC44     		add	ip, ip, r7
 1880 0c9e 6344     		add	r3, r3, ip
 1881 0ca0 1B68     		ldr	r3, [r3]
 1882 0ca2 5B01     		lsls	r3, r3, #5
 1883 0ca4 D318     		adds	r3, r2, r3
 1884 0ca6 1833     		adds	r3, r3, #24
 1885 0ca8 1960     		str	r1, [r3]
 1886              	.L38:
 103:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					}
 104:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					active_doors[i].controlbits |= 1; // sätter dörrens larm kontrollbit till 1.
 1887              		.loc 3 104 0
 1888 0caa FC21     		movs	r1, #252
 1889 0cac C900     		lsls	r1, r1, #3
 1890 0cae 1824     		movs	r4, #24
 1891 0cb0 3B19     		adds	r3, r7, r4
 1892 0cb2 5B18     		adds	r3, r3, r1
 1893 0cb4 1A68     		ldr	r2, [r3]
 1894 0cb6 3F48     		ldr	r0, .L51+24
 1895 0cb8 3B19     		adds	r3, r7, r4
 1896 0cba 1B18     		adds	r3, r3, r0
 1897 0cbc 1B68     		ldr	r3, [r3]
 1898 0cbe 5B01     		lsls	r3, r3, #5
 1899 0cc0 D318     		adds	r3, r2, r3
 1900 0cc2 0433     		adds	r3, r3, #4
 1901 0cc4 1B68     		ldr	r3, [r3]
 1902 0cc6 0122     		movs	r2, #1
 1903 0cc8 1A43     		orrs	r2, r3
 1904 0cca 3B19     		adds	r3, r7, r4
 1905 0ccc 5B18     		adds	r3, r3, r1
 1906 0cce 1968     		ldr	r1, [r3]
 1907 0cd0 3B19     		adds	r3, r7, r4
 1908 0cd2 1B18     		adds	r3, r3, r0
 1909 0cd4 1B68     		ldr	r3, [r3]
 1910 0cd6 5B01     		lsls	r3, r3, #5
 1911 0cd8 CB18     		adds	r3, r1, r3
 1912 0cda 0433     		adds	r3, r3, #4
 1913 0cdc 1A60     		str	r2, [r3]
 1914              	.L37:
 1915              	.LBB7:
 105:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				}
 106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				for (int i = 0; i < sizeof(active_doors)/sizeof(active_doors[0]); i++)
 1916              		.loc 3 106 0
 1917 0cde 0023     		movs	r3, #0
 1918 0ce0 FD22     		movs	r2, #253
 1919 0ce2 D200     		lsls	r2, r2, #3
 1920 0ce4 1821     		movs	r1, #24
 1921 0ce6 8C46     		mov	ip, r1
 1922 0ce8 BC44     		add	ip, ip, r7
 1923 0cea 6244     		add	r2, r2, ip
 1924 0cec 1360     		str	r3, [r2]
 1925 0cee F9E0     		b	.L39
 1926              	.L43:
 107:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				{
 108:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * activ
 1927              		.loc 3 108 0
 1928 0cf0 FC23     		movs	r3, #252
 1929 0cf2 DB00     		lsls	r3, r3, #3
 1930 0cf4 1822     		movs	r2, #24
 1931 0cf6 9446     		mov	ip, r2
 1932 0cf8 BC44     		add	ip, ip, r7
 1933 0cfa 6344     		add	r3, r3, ip
 1934 0cfc 1A68     		ldr	r2, [r3]
 1935 0cfe FD23     		movs	r3, #253
 1936 0d00 DB00     		lsls	r3, r3, #3
 1937 0d02 1821     		movs	r1, #24
 1938 0d04 8C46     		mov	ip, r1
 1939 0d06 BC44     		add	ip, ip, r7
 1940 0d08 6344     		add	r3, r3, ip
 1941 0d0a 1B68     		ldr	r3, [r3]
 1942 0d0c 5B01     		lsls	r3, r3, #5
 1943 0d0e D318     		adds	r3, r2, r3
 1944 0d10 0433     		adds	r3, r3, #4
 1945 0d12 1B68     		ldr	r3, [r3]
 1946 0d14 0122     		movs	r2, #1
 1947 0d16 1340     		ands	r3, r2
 1948 0d18 54D0     		beq	.L40
 1949              		.loc 3 108 0 is_stmt 0 discriminator 1
 1950 0d1a FC21     		movs	r1, #252
 1951 0d1c C900     		lsls	r1, r1, #3
 1952 0d1e 1824     		movs	r4, #24
 1953 0d20 3B19     		adds	r3, r7, r4
 1954 0d22 5B18     		adds	r3, r3, r1
 1955 0d24 1A68     		ldr	r2, [r3]
 1956 0d26 FD20     		movs	r0, #253
 1957 0d28 C000     		lsls	r0, r0, #3
 1958 0d2a 3B19     		adds	r3, r7, r4
 1959 0d2c 1B18     		adds	r3, r3, r0
 1960 0d2e 1B68     		ldr	r3, [r3]
 1961 0d30 5B01     		lsls	r3, r3, #5
 1962 0d32 D318     		adds	r3, r2, r3
 1963 0d34 1833     		adds	r3, r3, #24
 1964 0d36 1A68     		ldr	r2, [r3]
 1965 0d38 3B19     		adds	r3, r7, r4
 1966 0d3a 5B18     		adds	r3, r3, r1
 1967 0d3c 1968     		ldr	r1, [r3]
 1968 0d3e 3B19     		adds	r3, r7, r4
 1969 0d40 1B18     		adds	r3, r3, r0
 1970 0d42 1B68     		ldr	r3, [r3]
 1971 0d44 5B01     		lsls	r3, r3, #5
 1972 0d46 CB18     		adds	r3, r1, r3
 1973 0d48 0833     		adds	r3, r3, #8
 1974 0d4a 1B78     		ldrb	r3, [r3]
 1975 0d4c 1900     		movs	r1, r3
 1976 0d4e 1C4B     		ldr	r3, .L51+36
 1977 0d50 4B43     		muls	r3, r1
 1978 0d52 D318     		adds	r3, r2, r3
 1979 0d54 1A00     		movs	r2, r3
 1980 0d56 194B     		ldr	r3, .L51+32
 1981 0d58 1B68     		ldr	r3, [r3]
 1982 0d5a 9A42     		cmp	r2, r3
 1983 0d5c 32D2     		bcs	.L40
 109:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					{
 110:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 						GPIO_SetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp); // tänder lampan ifall t
 1984              		.loc 3 110 0 is_stmt 1
 1985 0d5e FC21     		movs	r1, #252
 1986 0d60 C900     		lsls	r1, r1, #3
 1987 0d62 1825     		movs	r5, #24
 1988 0d64 7B19     		adds	r3, r7, r5
 1989 0d66 5B18     		adds	r3, r3, r1
 1990 0d68 1A68     		ldr	r2, [r3]
 1991 0d6a FD24     		movs	r4, #253
 1992 0d6c E400     		lsls	r4, r4, #3
 1993 0d6e 7B19     		adds	r3, r7, r5
 1994 0d70 1B19     		adds	r3, r3, r4
 1995 0d72 1B68     		ldr	r3, [r3]
 1996 0d74 5B01     		lsls	r3, r3, #5
 1997 0d76 D318     		adds	r3, r2, r3
 1998 0d78 1C33     		adds	r3, r3, #28
 1999 0d7a 1868     		ldr	r0, [r3]
 2000 0d7c 7B19     		adds	r3, r7, r5
 2001 0d7e 5B18     		adds	r3, r3, r1
 2002 0d80 1A68     		ldr	r2, [r3]
 2003 0d82 7B19     		adds	r3, r7, r5
 2004 0d84 1B19     		adds	r3, r3, r4
 2005 0d86 1B68     		ldr	r3, [r3]
 2006 0d88 5B01     		lsls	r3, r3, #5
 2007 0d8a D318     		adds	r3, r2, r3
 2008 0d8c 1033     		adds	r3, r3, #16
 2009 0d8e 1B68     		ldr	r3, [r3]
 2010 0d90 9BB2     		uxth	r3, r3
 2011 0d92 1900     		movs	r1, r3
 2012 0d94 FFF7FEFF 		bl	GPIO_SetBits
 2013 0d98 31E0     		b	.L41
 2014              	.L52:
 2015 0d9a C046     		.align	2
 2016              	.L51:
 2017 0d9c 00000000 		.word	GPIO_Ports
 2018 0da0 F4070000 		.word	2036
 2019 0da4 00000000 		.word	GPIO_Pins
 2020 0da8 F8F7FFFF 		.word	-2056
 2021 0dac 08080000 		.word	2056
 2022 0db0 00040240 		.word	1073873920
 2023 0db4 EC070000 		.word	2028
 2024 0db8 FCFF0000 		.word	65532
 2025 0dbc 00000000 		.word	msTicks
 2026 0dc0 10270000 		.word	10000
 2027              	.L40:
 111:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					}
 112:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					else
 113:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					{
 114:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 						GPIO_ResetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);	// släcker lampan anna
 2028              		.loc 3 114 0
 2029 0dc4 FC21     		movs	r1, #252
 2030 0dc6 C900     		lsls	r1, r1, #3
 2031 0dc8 1825     		movs	r5, #24
 2032 0dca 7B19     		adds	r3, r7, r5
 2033 0dcc 5B18     		adds	r3, r3, r1
 2034 0dce 1A68     		ldr	r2, [r3]
 2035 0dd0 FD24     		movs	r4, #253
 2036 0dd2 E400     		lsls	r4, r4, #3
 2037 0dd4 7B19     		adds	r3, r7, r5
 2038 0dd6 1B19     		adds	r3, r3, r4
 2039 0dd8 1B68     		ldr	r3, [r3]
 2040 0dda 5B01     		lsls	r3, r3, #5
 2041 0ddc D318     		adds	r3, r2, r3
 2042 0dde 1C33     		adds	r3, r3, #28
 2043 0de0 1868     		ldr	r0, [r3]
 2044 0de2 7B19     		adds	r3, r7, r5
 2045 0de4 5B18     		adds	r3, r3, r1
 2046 0de6 1A68     		ldr	r2, [r3]
 2047 0de8 7B19     		adds	r3, r7, r5
 2048 0dea 1B19     		adds	r3, r3, r4
 2049 0dec 1B68     		ldr	r3, [r3]
 2050 0dee 5B01     		lsls	r3, r3, #5
 2051 0df0 D318     		adds	r3, r2, r3
 2052 0df2 1033     		adds	r3, r3, #16
 2053 0df4 1B68     		ldr	r3, [r3]
 2054 0df6 9BB2     		uxth	r3, r3
 2055 0df8 1900     		movs	r1, r3
 2056 0dfa FFF7FEFF 		bl	GPIO_ResetBits
 2057              	.L41:
 115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					}
 116:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * activ
 2058              		.loc 3 116 0
 2059 0dfe FC23     		movs	r3, #252
 2060 0e00 DB00     		lsls	r3, r3, #3
 2061 0e02 1822     		movs	r2, #24
 2062 0e04 9446     		mov	ip, r2
 2063 0e06 BC44     		add	ip, ip, r7
 2064 0e08 6344     		add	r3, r3, ip
 2065 0e0a 1A68     		ldr	r2, [r3]
 2066 0e0c FD23     		movs	r3, #253
 2067 0e0e DB00     		lsls	r3, r3, #3
 2068 0e10 1821     		movs	r1, #24
 2069 0e12 8C46     		mov	ip, r1
 2070 0e14 BC44     		add	ip, ip, r7
 2071 0e16 6344     		add	r3, r3, ip
 2072 0e18 1B68     		ldr	r3, [r3]
 2073 0e1a 5B01     		lsls	r3, r3, #5
 2074 0e1c D318     		adds	r3, r2, r3
 2075 0e1e 0433     		adds	r3, r3, #4
 2076 0e20 1B68     		ldr	r3, [r3]
 2077 0e22 0122     		movs	r2, #1
 2078 0e24 1340     		ands	r3, r2
 2079 0e26 51D0     		beq	.L42
 2080              		.loc 3 116 0 is_stmt 0 discriminator 1
 2081 0e28 FC21     		movs	r1, #252
 2082 0e2a C900     		lsls	r1, r1, #3
 2083 0e2c 1824     		movs	r4, #24
 2084 0e2e 3B19     		adds	r3, r7, r4
 2085 0e30 5B18     		adds	r3, r3, r1
 2086 0e32 1A68     		ldr	r2, [r3]
 2087 0e34 FD20     		movs	r0, #253
 2088 0e36 C000     		lsls	r0, r0, #3
 2089 0e38 3B19     		adds	r3, r7, r4
 2090 0e3a 1B18     		adds	r3, r3, r0
 2091 0e3c 1B68     		ldr	r3, [r3]
 2092 0e3e 5B01     		lsls	r3, r3, #5
 2093 0e40 D318     		adds	r3, r2, r3
 2094 0e42 1833     		adds	r3, r3, #24
 2095 0e44 1A68     		ldr	r2, [r3]
 2096 0e46 3B19     		adds	r3, r7, r4
 2097 0e48 5B18     		adds	r3, r3, r1
 2098 0e4a 1968     		ldr	r1, [r3]
 2099 0e4c 3B19     		adds	r3, r7, r4
 2100 0e4e 1B18     		adds	r3, r3, r0
 2101 0e50 1B68     		ldr	r3, [r3]
 2102 0e52 5B01     		lsls	r3, r3, #5
 2103 0e54 CB18     		adds	r3, r1, r3
 2104 0e56 0933     		adds	r3, r3, #9
 2105 0e58 1B78     		ldrb	r3, [r3]
 2106 0e5a 1900     		movs	r1, r3
 2107 0e5c 344B     		ldr	r3, .L53
 2108 0e5e 4B43     		muls	r3, r1
 2109 0e60 D318     		adds	r3, r2, r3
 2110 0e62 1A00     		movs	r2, r3
 2111 0e64 334B     		ldr	r3, .L53+4
 2112 0e66 1B68     		ldr	r3, [r3]
 2113 0e68 9A42     		cmp	r2, r3
 2114 0e6a 2FD2     		bcs	.L42
 2115              		.loc 3 116 0 discriminator 2
 2116 0e6c FC23     		movs	r3, #252
 2117 0e6e DB00     		lsls	r3, r3, #3
 2118 0e70 1822     		movs	r2, #24
 2119 0e72 9446     		mov	ip, r2
 2120 0e74 BC44     		add	ip, ip, r7
 2121 0e76 6344     		add	r3, r3, ip
 2122 0e78 1A68     		ldr	r2, [r3]
 2123 0e7a FD23     		movs	r3, #253
 2124 0e7c DB00     		lsls	r3, r3, #3
 2125 0e7e 1821     		movs	r1, #24
 2126 0e80 8C46     		mov	ip, r1
 2127 0e82 BC44     		add	ip, ip, r7
 2128 0e84 6344     		add	r3, r3, ip
 2129 0e86 1B68     		ldr	r3, [r3]
 2130 0e88 5B01     		lsls	r3, r3, #5
 2131 0e8a D318     		adds	r3, r2, r3
 2132 0e8c 0433     		adds	r3, r3, #4
 2133 0e8e 1B68     		ldr	r3, [r3]
 2134 0e90 0222     		movs	r2, #2
 2135 0e92 1340     		ands	r3, r2
 2136 0e94 1AD0     		beq	.L42
 117:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					{
 118:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 						active_doors[i].controlbits |= 2;
 2137              		.loc 3 118 0 is_stmt 1
 2138 0e96 FC21     		movs	r1, #252
 2139 0e98 C900     		lsls	r1, r1, #3
 2140 0e9a 1824     		movs	r4, #24
 2141 0e9c 3B19     		adds	r3, r7, r4
 2142 0e9e 5B18     		adds	r3, r3, r1
 2143 0ea0 1A68     		ldr	r2, [r3]
 2144 0ea2 FD20     		movs	r0, #253
 2145 0ea4 C000     		lsls	r0, r0, #3
 2146 0ea6 3B19     		adds	r3, r7, r4
 2147 0ea8 1B18     		adds	r3, r3, r0
 2148 0eaa 1B68     		ldr	r3, [r3]
 2149 0eac 5B01     		lsls	r3, r3, #5
 2150 0eae D318     		adds	r3, r2, r3
 2151 0eb0 0433     		adds	r3, r3, #4
 2152 0eb2 1B68     		ldr	r3, [r3]
 2153 0eb4 0222     		movs	r2, #2
 2154 0eb6 1A43     		orrs	r2, r3
 2155 0eb8 3B19     		adds	r3, r7, r4
 2156 0eba 5B18     		adds	r3, r3, r1
 2157 0ebc 1968     		ldr	r1, [r3]
 2158 0ebe 3B19     		adds	r3, r7, r4
 2159 0ec0 1B18     		adds	r3, r3, r0
 2160 0ec2 1B68     		ldr	r3, [r3]
 2161 0ec4 5B01     		lsls	r3, r3, #5
 2162 0ec6 CB18     		adds	r3, r1, r3
 2163 0ec8 0433     		adds	r3, r3, #4
 2164 0eca 1A60     		str	r2, [r3]
 2165              	.L42:
 106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				{
 2166              		.loc 3 106 0 discriminator 2
 2167 0ecc FD22     		movs	r2, #253
 2168 0ece D200     		lsls	r2, r2, #3
 2169 0ed0 1823     		movs	r3, #24
 2170 0ed2 FB18     		adds	r3, r7, r3
 2171 0ed4 9B18     		adds	r3, r3, r2
 2172 0ed6 1B68     		ldr	r3, [r3]
 2173 0ed8 0133     		adds	r3, r3, #1
 2174 0eda 1821     		movs	r1, #24
 2175 0edc 8C46     		mov	ip, r1
 2176 0ede BC44     		add	ip, ip, r7
 2177 0ee0 6244     		add	r2, r2, ip
 2178 0ee2 1360     		str	r3, [r2]
 2179              	.L39:
 106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				{
 2180              		.loc 3 106 0 is_stmt 0 discriminator 1
 2181 0ee4 3300     		movs	r3, r6
 2182 0ee6 5B01     		lsls	r3, r3, #5
 2183 0ee8 5A09     		lsrs	r2, r3, #5
 2184 0eea FD23     		movs	r3, #253
 2185 0eec DB00     		lsls	r3, r3, #3
 2186 0eee 1821     		movs	r1, #24
 2187 0ef0 8C46     		mov	ip, r1
 2188 0ef2 BC44     		add	ip, ip, r7
 2189 0ef4 6344     		add	r3, r3, ip
 2190 0ef6 1B68     		ldr	r3, [r3]
 2191 0ef8 9A42     		cmp	r2, r3
 2192 0efa 00D9     		bls	.LCB2185
 2193 0efc F8E6     		b	.L43	@long jump
 2194              	.LCB2185:
 2195              	.L35:
 2196              	.LBE7:
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 2197              		.loc 3 90 0 is_stmt 1 discriminator 2
 2198 0efe 0E4A     		ldr	r2, .L53+8
 2199 0f00 1823     		movs	r3, #24
 2200 0f02 FB18     		adds	r3, r7, r3
 2201 0f04 9B18     		adds	r3, r3, r2
 2202 0f06 1B68     		ldr	r3, [r3]
 2203 0f08 0133     		adds	r3, r3, #1
 2204 0f0a 1821     		movs	r1, #24
 2205 0f0c 8C46     		mov	ip, r1
 2206 0f0e BC44     		add	ip, ip, r7
 2207 0f10 6244     		add	r2, r2, ip
 2208 0f12 1360     		str	r3, [r2]
 2209              	.L34:
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 2210              		.loc 3 90 0 is_stmt 0 discriminator 1
 2211 0f14 3300     		movs	r3, r6
 2212 0f16 5B01     		lsls	r3, r3, #5
 2213 0f18 5A09     		lsrs	r2, r3, #5
 2214 0f1a 074B     		ldr	r3, .L53+8
 2215 0f1c 1821     		movs	r1, #24
 2216 0f1e 8C46     		mov	ip, r1
 2217 0f20 BC44     		add	ip, ip, r7
 2218 0f22 6344     		add	r3, r3, ip
 2219 0f24 1B68     		ldr	r3, [r3]
 2220 0f26 9A42     		cmp	r2, r3
 2221 0f28 00D9     		bls	.LCB2212
 2222 0f2a 49E6     		b	.L44	@long jump
 2223              	.LCB2212:
 2224              	.LBE6:
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 2225              		.loc 3 90 0
 2226 0f2c 40E6     		b	.L45
 2227              	.L54:
 2228 0f2e C046     		.align	2
 2229              	.L53:
 2230 0f30 10270000 		.word	10000
 2231 0f34 00000000 		.word	msTicks
 2232 0f38 EC070000 		.word	2028
 2233              		.cfi_endproc
 2234              	.LFE127:
 2236              	.Letext0:
 2237              		.file 4 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 2238              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 2239              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 2240              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 2241              		.file 8 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
 2242              		.file 9 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.h"
