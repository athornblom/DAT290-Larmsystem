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
 159              		.data
 160              		.align	2
 163              	APBAHBPrescTable:
 164 0000 00       		.byte	0
 165 0001 00       		.byte	0
 166 0002 00       		.byte	0
 167 0003 00       		.byte	0
 168 0004 01       		.byte	1
 169 0005 02       		.byte	2
 170 0006 03       		.byte	3
 171 0007 04       		.byte	4
 172 0008 01       		.byte	1
 173 0009 02       		.byte	2
 174 000a 03       		.byte	3
 175 000b 04       		.byte	4
 176 000c 06       		.byte	6
 177 000d 07       		.byte	7
 178 000e 08       		.byte	8
 179 000f 09       		.byte	9
 180              		.text
 181              		.align	1
 182              		.global	RCC_DeInit
 183              		.syntax unified
 184              		.code	16
 185              		.thumb_func
 186              		.fpu softvfp
 188              	RCC_DeInit:
 189              	.LFB123:
 190              		.file 2 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c"
   1:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
   2:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   ******************************************************************************
   3:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @file    stm32f4xx_rcc.c
   4:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @author  MCD Application Team
   5:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @version V1.8.0
   6:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @date    04-November-2016
   7:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief   This file provides firmware functions to manage the following 
   8:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          functionalities of the Reset and clock control (RCC) peripheral:
   9:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           + Internal/external clocks, PLL, CSS and MCO configuration
  10:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           + System, AHB and APB busses clocks configuration
  11:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           + Peripheral clocks configuration
  12:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           + Interrupts and flags management
  13:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
  14:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  @verbatim
  15:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================
  16:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****                       ##### RCC specific features #####
  17:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================
  18:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     [..]  
  19:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       After reset the device is running from Internal High Speed oscillator 
  20:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (HSI 16MHz) with Flash 0 wait state, Flash prefetch buffer, D-Cache 
  21:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       and I-Cache are disabled, and all peripherals are off except internal
  22:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       SRAM, Flash and JTAG.
  23:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) There is no prescaler on High speed (AHB) and Low speed (APB) busses;
  24:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           all peripherals mapped on these busses are running at HSI speed.
  25:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) The clock for all peripherals is switched off, except the SRAM and FLASH.
  26:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) All GPIOs are in input floating state, except the JTAG pins which
  27:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           are assigned to be used for debug purpose.
  28:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     [..]          
  29:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       Once the device started from reset, the user application has to:
  30:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) Configure the clock source to be used to drive the System clock
  31:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           (if the application needs higher frequency/performance)
  32:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) Configure the System clock frequency and Flash settings  
  33:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) Configure the AHB and APB busses prescalers
  34:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) Enable the clock for the peripheral(s) to be used
  35:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (+) Configure the clock source(s) for peripherals which clocks are not
  36:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           derived from the System clock (I2S, RTC, ADC, USB OTG FS/SDIO/RNG)
  37:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  @endverbatim    
  38:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   ******************************************************************************
  39:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @attention
  40:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
  41:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * <h2><center>&copy; COPYRIGHT 2016 STMicroelectronics</center></h2>
  42:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
  43:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  44:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * You may not use this file except in compliance with the License.
  45:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * You may obtain a copy of the License at:
  46:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
  47:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *        http://www.st.com/software_license_agreement_liberty_v2
  48:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
  49:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * Unless required by applicable law or agreed to in writing, software 
  50:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * distributed under the License is distributed on an "AS IS" BASIS, 
  51:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  52:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * See the License for the specific language governing permissions and
  53:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * limitations under the License.
  54:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
  55:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   ******************************************************************************
  56:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
  57:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
  58:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Includes ------------------------------------------------------------------*/
  59:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #include "stm32f4xx_rcc.h"
  60:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
  61:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /** @addtogroup STM32F4xx_StdPeriph_Driver
  62:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @{
  63:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
  64:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
  65:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /** @defgroup RCC 
  66:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief RCC driver modules
  67:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @{
  68:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */ 
  69:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
  70:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Private typedef -----------------------------------------------------------*/
  71:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Private define ------------------------------------------------------------*/
  72:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* ------------ RCC registers bit address in the alias region ----------- */
  73:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define RCC_OFFSET                (RCC_BASE - PERIPH_BASE)
  74:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* --- CR Register ---*/
  75:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of HSION bit */
  76:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CR_OFFSET                 (RCC_OFFSET + 0x00)
  77:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define HSION_BitNumber           0x00
  78:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CR_HSION_BB               (PERIPH_BB_BASE + (CR_OFFSET * 32) + (HSION_BitNumber * 4))
  79:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of CSSON bit */
  80:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CSSON_BitNumber           0x13
  81:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CR_CSSON_BB               (PERIPH_BB_BASE + (CR_OFFSET * 32) + (CSSON_BitNumber * 4))
  82:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of PLLON bit */
  83:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define PLLON_BitNumber           0x18
  84:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CR_PLLON_BB               (PERIPH_BB_BASE + (CR_OFFSET * 32) + (PLLON_BitNumber * 4))
  85:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of PLLI2SON bit */
  86:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define PLLI2SON_BitNumber        0x1A
  87:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CR_PLLI2SON_BB            (PERIPH_BB_BASE + (CR_OFFSET * 32) + (PLLI2SON_BitNumber * 4))
  88:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
  89:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of PLLSAION bit */
  90:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define PLLSAION_BitNumber        0x1C
  91:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CR_PLLSAION_BB            (PERIPH_BB_BASE + (CR_OFFSET * 32) + (PLLSAION_BitNumber * 4))
  92:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
  93:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* --- CFGR Register ---*/
  94:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of I2SSRC bit */
  95:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CFGR_OFFSET               (RCC_OFFSET + 0x08)
  96:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define I2SSRC_BitNumber          0x17
  97:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CFGR_I2SSRC_BB            (PERIPH_BB_BASE + (CFGR_OFFSET * 32) + (I2SSRC_BitNumber * 4))
  98:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
  99:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* --- BDCR Register ---*/
 100:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of RTCEN bit */
 101:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define BDCR_OFFSET               (RCC_OFFSET + 0x70)
 102:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define RTCEN_BitNumber           0x0F
 103:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define BDCR_RTCEN_BB             (PERIPH_BB_BASE + (BDCR_OFFSET * 32) + (RTCEN_BitNumber * 4))
 104:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of BDRST bit */
 105:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define BDRST_BitNumber           0x10
 106:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define BDCR_BDRST_BB             (PERIPH_BB_BASE + (BDCR_OFFSET * 32) + (BDRST_BitNumber * 4))
 107:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 108:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* --- CSR Register ---*/
 109:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of LSION bit */
 110:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CSR_OFFSET                (RCC_OFFSET + 0x74)
 111:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define LSION_BitNumber           0x00
 112:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CSR_LSION_BB              (PERIPH_BB_BASE + (CSR_OFFSET * 32) + (LSION_BitNumber * 4))
 113:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 114:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* --- DCKCFGR Register ---*/
 115:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of TIMPRE bit */
 116:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define DCKCFGR_OFFSET            (RCC_OFFSET + 0x8C)
 117:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define TIMPRE_BitNumber          0x18
 118:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define DCKCFGR_TIMPRE_BB         (PERIPH_BB_BASE + (DCKCFGR_OFFSET * 32) + (TIMPRE_BitNumber * 4))
 119:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
 120:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* --- CFGR Register ---*/
 121:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define RCC_CFGR_OFFSET            (RCC_OFFSET + 0x08)
 122:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  #if defined(STM32F410xx)
 123:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of MCO1EN bit */
 124:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define RCC_MCO1EN_BIT_NUMBER      0x8
 125:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define RCC_CFGR_MCO1EN_BB         (PERIPH_BB_BASE + (RCC_CFGR_OFFSET * 32) + (RCC_MCO1EN_BIT_NUMBE
 126:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 127:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Alias word address of MCO2EN bit */
 128:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define RCC_MCO2EN_BIT_NUMBER      0x9
 129:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define RCC_CFGR_MCO2EN_BB         (PERIPH_BB_BASE + (RCC_CFGR_OFFSET * 32) + (RCC_MCO2EN_BIT_NUMBE
 130:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx */
 131:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* ---------------------- RCC registers bit mask ------------------------ */
 132:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* CFGR register bit mask */
 133:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CFGR_MCO2_RESET_MASK      ((uint32_t)0x07FFFFFF)
 134:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CFGR_MCO1_RESET_MASK      ((uint32_t)0xF89FFFFF)
 135:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 136:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* RCC Flag Mask */
 137:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define FLAG_MASK                 ((uint8_t)0x1F)
 138:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 139:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* CR register byte 3 (Bits[23:16]) base address */
 140:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CR_BYTE3_ADDRESS          ((uint32_t)0x40023802)
 141:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 142:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* CIR register byte 2 (Bits[15:8]) base address */
 143:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CIR_BYTE2_ADDRESS         ((uint32_t)(RCC_BASE + 0x0C + 0x01))
 144:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 145:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* CIR register byte 3 (Bits[23:16]) base address */
 146:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define CIR_BYTE3_ADDRESS         ((uint32_t)(RCC_BASE + 0x0C + 0x02))
 147:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 148:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* BDCR register base address */
 149:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #define BDCR_ADDRESS              (PERIPH_BASE + BDCR_OFFSET)
 150:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 151:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Private macro -------------------------------------------------------------*/
 152:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Private variables ---------------------------------------------------------*/
 153:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** static __I uint8_t APBAHBPrescTable[16] = {0, 0, 0, 0, 1, 2, 3, 4, 1, 2, 3, 4, 6, 7, 8, 9};
 154:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 155:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Private function prototypes -----------------------------------------------*/
 156:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /* Private functions ---------------------------------------------------------*/
 157:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 158:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /** @defgroup RCC_Private_Functions
 159:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @{
 160:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */ 
 161:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 162:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /** @defgroup RCC_Group1 Internal and external clocks, PLL, CSS and MCO configuration functions
 163:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *  @brief   Internal and external clocks, PLL, CSS and MCO configuration functions 
 164:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *
 165:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** @verbatim   
 166:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===================================================================================
 167:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ##### Internal and  external clocks, PLL, CSS and MCO configuration functions #####
 168:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===================================================================================
 169:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     [..]
 170:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       This section provide functions allowing to configure the internal/external clocks,
 171:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       PLLs, CSS and MCO pins.
 172:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 173:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) HSI (high-speed internal), 16 MHz factory-trimmed RC used directly or through
 174:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           the PLL as System clock source.
 175:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 176:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) LSI (low-speed internal), 32 KHz low consumption RC used as IWDG and/or RTC
 177:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           clock source.
 178:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 179:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) HSE (high-speed external), 4 to 26 MHz crystal oscillator used directly or
 180:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           through the PLL as System clock source. Can be used also as RTC clock source.
 181:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 182:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) LSE (low-speed external), 32 KHz oscillator used as RTC clock source.   
 183:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 184:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) PLL (clocked by HSI or HSE), featuring two different output clocks:
 185:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****         (++) The first output is used to generate the high speed system clock (up to 168 MHz)
 186:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****         (++) The second output is used to generate the clock for the USB OTG FS (48 MHz),
 187:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****              the random analog generator (<=48 MHz) and the SDIO (<= 48 MHz).
 188:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 189:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) PLLI2S (clocked by HSI or HSE), used to generate an accurate clock to achieve 
 190:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           high-quality audio performance on the I2S interface or SAI interface in case 
 191:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           of STM32F429x/439x devices.
 192:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****      
 193:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) PLLSAI clocked by (HSI or HSE), used to generate an accurate clock to SAI 
 194:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           interface and LCD TFT controller available only for STM32F42xxx/43xxx/446xx/469xx/479xx d
 195:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 196:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) CSS (Clock security system), once enable and if a HSE clock failure occurs 
 197:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****          (HSE used directly or through PLL as System clock source), the System clock
 198:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****          is automatically switched to HSI and an interrupt is generated if enabled. 
 199:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****          The interrupt is linked to the Cortex-M4 NMI (Non-Maskable Interrupt) 
 200:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****          exception vector.   
 201:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 202:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) MCO1 (microcontroller clock output), used to output HSI, LSE, HSE or PLL
 203:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           clock (through a configurable prescaler) on PA8 pin.
 204:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 205:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) MCO2 (microcontroller clock output), used to output HSE, PLL, SYSCLK or PLLI2S
 206:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           clock (through a configurable prescaler) on PC9 pin.
 207:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  @endverbatim
 208:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @{
 209:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 210:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 211:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 212:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Resets the RCC clock configuration to the default reset state.
 213:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The default reset state of the clock configuration is given below:
 214:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            - HSI ON and used as system clock source
 215:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            - HSE, PLL and PLLI2S OFF
 216:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            - AHB, APB1 and APB2 prescaler set to 1.
 217:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            - CSS, MCO1 and MCO2 OFF
 218:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            - All interrupts disabled
 219:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function doesn't modify the configuration of the
 220:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            - Peripheral clocks  
 221:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            - LSI, LSE and RTC clocks 
 222:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  None
 223:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 224:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 225:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_DeInit(void)
 226:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 191              		.loc 2 226 0
 192              		.cfi_startproc
 193              		@ args = 0, pretend = 0, frame = 0
 194              		@ frame_needed = 1, uses_anonymous_args = 0
 195 00a8 80B5     		push	{r7, lr}
 196              		.cfi_def_cfa_offset 8
 197              		.cfi_offset 7, -8
 198              		.cfi_offset 14, -4
 199 00aa 00AF     		add	r7, sp, #0
 200              		.cfi_def_cfa_register 7
 227:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set HSION bit */
 228:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CR |= (uint32_t)0x00000001;
 201              		.loc 2 228 0
 202 00ac 144B     		ldr	r3, .L13
 203 00ae 1A68     		ldr	r2, [r3]
 204 00b0 134B     		ldr	r3, .L13
 205 00b2 0121     		movs	r1, #1
 206 00b4 0A43     		orrs	r2, r1
 207 00b6 1A60     		str	r2, [r3]
 229:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 230:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset CFGR register */
 231:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CFGR = 0x00000000;
 208              		.loc 2 231 0
 209 00b8 114B     		ldr	r3, .L13
 210 00ba 0022     		movs	r2, #0
 211 00bc 9A60     		str	r2, [r3, #8]
 232:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 233:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset HSEON, CSSON, PLLON, PLLI2S and PLLSAI(STM32F42xxx/43xxx/446xx/469xx/479xx devices) bits
 234:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CR &= (uint32_t)0xEAF6FFFF;
 212              		.loc 2 234 0
 213 00be 104B     		ldr	r3, .L13
 214 00c0 1A68     		ldr	r2, [r3]
 215 00c2 0F4B     		ldr	r3, .L13
 216 00c4 0F49     		ldr	r1, .L13+4
 217 00c6 0A40     		ands	r2, r1
 218 00c8 1A60     		str	r2, [r3]
 235:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 236:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset PLLCFGR register */
 237:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLCFGR = 0x24003010;
 219              		.loc 2 237 0
 220 00ca 0D4B     		ldr	r3, .L13
 221 00cc 0E4A     		ldr	r2, .L13+8
 222 00ce 5A60     		str	r2, [r3, #4]
 238:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 239:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 240:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset PLLI2SCFGR register */
 241:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLI2SCFGR = 0x20003000;
 223              		.loc 2 241 0
 224 00d0 0B4A     		ldr	r2, .L13
 225 00d2 8423     		movs	r3, #132
 226 00d4 0D49     		ldr	r1, .L13+12
 227 00d6 D150     		str	r1, [r2, r3]
 242:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F401xx || STM32F411xE || STM
 243:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 244:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 245:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset PLLSAICFGR register, only available for STM32F42xxx/43xxx/446xx/469xx/479xx devices */
 246:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLSAICFGR = 0x24003000;
 228              		.loc 2 246 0
 229 00d8 094A     		ldr	r2, .L13
 230 00da 8823     		movs	r3, #136
 231 00dc 0C49     		ldr	r1, .L13+16
 232 00de D150     		str	r1, [r2, r3]
 247:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F446xx || STM32F469_479xx */
 248:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 249:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset HSEBYP bit */
 250:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CR &= (uint32_t)0xFFFBFFFF;
 233              		.loc 2 250 0
 234 00e0 074B     		ldr	r3, .L13
 235 00e2 1A68     		ldr	r2, [r3]
 236 00e4 064B     		ldr	r3, .L13
 237 00e6 0B49     		ldr	r1, .L13+20
 238 00e8 0A40     		ands	r2, r1
 239 00ea 1A60     		str	r2, [r3]
 251:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 252:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Disable all interrupts */
 253:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CIR = 0x00000000;
 240              		.loc 2 253 0
 241 00ec 044B     		ldr	r3, .L13
 242 00ee 0022     		movs	r2, #0
 243 00f0 DA60     		str	r2, [r3, #12]
 254:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 255:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Disable Timers clock prescalers selection, only available for STM32F42/43xxx and STM32F413_423
 256:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = 0x00000000;
 244              		.loc 2 256 0
 245 00f2 034A     		ldr	r2, .L13
 246 00f4 8C23     		movs	r3, #140
 247 00f6 0021     		movs	r1, #0
 248 00f8 D150     		str	r1, [r2, r3]
 257:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 258:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx) || defined(STM32F413_423xx)
 259:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Disable LPTIM and FMPI2C clock prescalers selection, only available for STM32F410xx and STM32F
 260:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR2 = 0x00000000;
 261:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx || STM32F413_423xx */  
 262:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 249              		.loc 2 262 0
 250 00fa C046     		nop
 251 00fc BD46     		mov	sp, r7
 252              		@ sp needed
 253 00fe 80BD     		pop	{r7, pc}
 254              	.L14:
 255              		.align	2
 256              	.L13:
 257 0100 00380240 		.word	1073887232
 258 0104 FFFFF6EA 		.word	-352911361
 259 0108 10300024 		.word	603992080
 260 010c 00300020 		.word	536883200
 261 0110 00300024 		.word	603992064
 262 0114 FFFFFBFF 		.word	-262145
 263              		.cfi_endproc
 264              	.LFE123:
 266              		.align	1
 267              		.global	RCC_HSEConfig
 268              		.syntax unified
 269              		.code	16
 270              		.thumb_func
 271              		.fpu softvfp
 273              	RCC_HSEConfig:
 274              	.LFB124:
 263:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 264:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 265:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the External High Speed oscillator (HSE).
 266:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After enabling the HSE (RCC_HSE_ON or RCC_HSE_Bypass), the application
 267:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         software should wait on HSERDY flag to be set indicating that HSE clock
 268:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is stable and can be used to clock the PLL and/or system clock.
 269:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   HSE state can not be changed if it is used directly or through the
 270:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         PLL as system clock. In this case, you have to select another source
 271:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of the system clock then change the HSE state (ex. disable it).
 272:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The HSE is stopped by hardware when entering STOP and STANDBY modes.  
 273:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function reset the CSSON bit, so if the Clock security system(CSS)
 274:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         was previously enabled you have to enable it again after calling this
 275:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         function.    
 276:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_HSE: specifies the new state of the HSE.
 277:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 278:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HSE_OFF: turn OFF the HSE oscillator, HSERDY flag goes low after
 279:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                              6 HSE oscillator clock cycles.
 280:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HSE_ON: turn ON the HSE oscillator
 281:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HSE_Bypass: HSE oscillator bypassed with external clock
 282:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 283:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 284:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_HSEConfig(uint8_t RCC_HSE)
 285:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 275              		.loc 2 285 0
 276              		.cfi_startproc
 277              		@ args = 0, pretend = 0, frame = 8
 278              		@ frame_needed = 1, uses_anonymous_args = 0
 279 0118 80B5     		push	{r7, lr}
 280              		.cfi_def_cfa_offset 8
 281              		.cfi_offset 7, -8
 282              		.cfi_offset 14, -4
 283 011a 82B0     		sub	sp, sp, #8
 284              		.cfi_def_cfa_offset 16
 285 011c 00AF     		add	r7, sp, #0
 286              		.cfi_def_cfa_register 7
 287 011e 0200     		movs	r2, r0
 288 0120 FB1D     		adds	r3, r7, #7
 289 0122 1A70     		strb	r2, [r3]
 286:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 287:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_HSE(RCC_HSE));
 288:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 289:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset HSEON and HSEBYP bits before configuring the HSE ------------------*/
 290:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint8_t *) CR_BYTE3_ADDRESS = RCC_HSE_OFF;
 290              		.loc 2 290 0
 291 0124 054B     		ldr	r3, .L16
 292 0126 0022     		movs	r2, #0
 293 0128 1A70     		strb	r2, [r3]
 291:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 292:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set the new HSE configuration -------------------------------------------*/
 293:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint8_t *) CR_BYTE3_ADDRESS = RCC_HSE;
 294              		.loc 2 293 0
 295 012a 044A     		ldr	r2, .L16
 296 012c FB1D     		adds	r3, r7, #7
 297 012e 1B78     		ldrb	r3, [r3]
 298 0130 1370     		strb	r3, [r2]
 294:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 299              		.loc 2 294 0
 300 0132 C046     		nop
 301 0134 BD46     		mov	sp, r7
 302 0136 02B0     		add	sp, sp, #8
 303              		@ sp needed
 304 0138 80BD     		pop	{r7, pc}
 305              	.L17:
 306 013a C046     		.align	2
 307              	.L16:
 308 013c 02380240 		.word	1073887234
 309              		.cfi_endproc
 310              	.LFE124:
 312              		.align	1
 313              		.global	RCC_WaitForHSEStartUp
 314              		.syntax unified
 315              		.code	16
 316              		.thumb_func
 317              		.fpu softvfp
 319              	RCC_WaitForHSEStartUp:
 320              	.LFB125:
 295:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 296:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 297:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Waits for HSE start-up.
 298:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This functions waits on HSERDY flag to be set and return SUCCESS if 
 299:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         this flag is set, otherwise returns ERROR if the timeout is reached 
 300:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         and this flag is not set. The timeout value is defined by the constant
 301:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         HSE_STARTUP_TIMEOUT in stm32f4xx.h file. You can tailor it depending
 302:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         on the HSE crystal used in your application. 
 303:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  None
 304:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval An ErrorStatus enumeration value:
 305:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          - SUCCESS: HSE oscillator is stable and ready to use
 306:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          - ERROR: HSE oscillator not yet ready
 307:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 308:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** ErrorStatus RCC_WaitForHSEStartUp(void)
 309:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 321              		.loc 2 309 0
 322              		.cfi_startproc
 323              		@ args = 0, pretend = 0, frame = 8
 324              		@ frame_needed = 1, uses_anonymous_args = 0
 325 0140 90B5     		push	{r4, r7, lr}
 326              		.cfi_def_cfa_offset 12
 327              		.cfi_offset 4, -12
 328              		.cfi_offset 7, -8
 329              		.cfi_offset 14, -4
 330 0142 83B0     		sub	sp, sp, #12
 331              		.cfi_def_cfa_offset 24
 332 0144 00AF     		add	r7, sp, #0
 333              		.cfi_def_cfa_register 7
 310:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   __IO uint32_t startupcounter = 0;
 334              		.loc 2 310 0
 335 0146 0023     		movs	r3, #0
 336 0148 3B60     		str	r3, [r7]
 311:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   ErrorStatus status = ERROR;
 337              		.loc 2 311 0
 338 014a FB1D     		adds	r3, r7, #7
 339 014c 0022     		movs	r2, #0
 340 014e 1A70     		strb	r2, [r3]
 312:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   FlagStatus hsestatus = RESET;
 341              		.loc 2 312 0
 342 0150 BB1D     		adds	r3, r7, #6
 343 0152 0022     		movs	r2, #0
 344 0154 1A70     		strb	r2, [r3]
 345              	.L20:
 313:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Wait till HSE is ready and if Time out is reached exit */
 314:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   do
 315:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
 316:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     hsestatus = RCC_GetFlagStatus(RCC_FLAG_HSERDY);
 346              		.loc 2 316 0 discriminator 2
 347 0156 BC1D     		adds	r4, r7, #6
 348 0158 3120     		movs	r0, #49
 349 015a FFF7FEFF 		bl	RCC_GetFlagStatus
 350 015e 0300     		movs	r3, r0
 351 0160 2370     		strb	r3, [r4]
 317:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     startupcounter++;
 352              		.loc 2 317 0 discriminator 2
 353 0162 3B68     		ldr	r3, [r7]
 354 0164 0133     		adds	r3, r3, #1
 355 0166 3B60     		str	r3, [r7]
 318:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   } while((startupcounter != HSE_STARTUP_TIMEOUT) && (hsestatus == RESET));
 356              		.loc 2 318 0 discriminator 2
 357 0168 3A68     		ldr	r2, [r7]
 358 016a A023     		movs	r3, #160
 359 016c DB01     		lsls	r3, r3, #7
 360 016e 9A42     		cmp	r2, r3
 361 0170 03D0     		beq	.L19
 362              		.loc 2 318 0 is_stmt 0 discriminator 1
 363 0172 BB1D     		adds	r3, r7, #6
 364 0174 1B78     		ldrb	r3, [r3]
 365 0176 002B     		cmp	r3, #0
 366 0178 EDD0     		beq	.L20
 367              	.L19:
 319:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 320:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (RCC_GetFlagStatus(RCC_FLAG_HSERDY) != RESET)
 368              		.loc 2 320 0 is_stmt 1
 369 017a 3120     		movs	r0, #49
 370 017c FFF7FEFF 		bl	RCC_GetFlagStatus
 371 0180 031E     		subs	r3, r0, #0
 372 0182 03D0     		beq	.L21
 321:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
 322:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     status = SUCCESS;
 373              		.loc 2 322 0
 374 0184 FB1D     		adds	r3, r7, #7
 375 0186 0122     		movs	r2, #1
 376 0188 1A70     		strb	r2, [r3]
 377 018a 02E0     		b	.L22
 378              	.L21:
 323:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 324:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
 325:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
 326:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     status = ERROR;
 379              		.loc 2 326 0
 380 018c FB1D     		adds	r3, r7, #7
 381 018e 0022     		movs	r2, #0
 382 0190 1A70     		strb	r2, [r3]
 383              	.L22:
 327:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 328:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   return (status);
 384              		.loc 2 328 0
 385 0192 FB1D     		adds	r3, r7, #7
 386 0194 1B78     		ldrb	r3, [r3]
 329:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 387              		.loc 2 329 0
 388 0196 1800     		movs	r0, r3
 389 0198 BD46     		mov	sp, r7
 390 019a 03B0     		add	sp, sp, #12
 391              		@ sp needed
 392 019c 90BD     		pop	{r4, r7, pc}
 393              		.cfi_endproc
 394              	.LFE125:
 396              		.align	1
 397              		.global	RCC_AdjustHSICalibrationValue
 398              		.syntax unified
 399              		.code	16
 400              		.thumb_func
 401              		.fpu softvfp
 403              	RCC_AdjustHSICalibrationValue:
 404              	.LFB126:
 330:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 331:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 332:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Adjusts the Internal High Speed oscillator (HSI) calibration value.
 333:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The calibration is used to compensate for the variations in voltage
 334:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         and temperature that influence the frequency of the internal HSI RC.
 335:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  HSICalibrationValue: specifies the calibration trimming value.
 336:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between 0 and 0x1F.
 337:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 338:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 339:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AdjustHSICalibrationValue(uint8_t HSICalibrationValue)
 340:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 405              		.loc 2 340 0
 406              		.cfi_startproc
 407              		@ args = 0, pretend = 0, frame = 16
 408              		@ frame_needed = 1, uses_anonymous_args = 0
 409 019e 80B5     		push	{r7, lr}
 410              		.cfi_def_cfa_offset 8
 411              		.cfi_offset 7, -8
 412              		.cfi_offset 14, -4
 413 01a0 84B0     		sub	sp, sp, #16
 414              		.cfi_def_cfa_offset 24
 415 01a2 00AF     		add	r7, sp, #0
 416              		.cfi_def_cfa_register 7
 417 01a4 0200     		movs	r2, r0
 418 01a6 FB1D     		adds	r3, r7, #7
 419 01a8 1A70     		strb	r2, [r3]
 341:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 420              		.loc 2 341 0
 421 01aa 0023     		movs	r3, #0
 422 01ac FB60     		str	r3, [r7, #12]
 342:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 343:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_CALIBRATION_VALUE(HSICalibrationValue));
 344:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 345:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->CR;
 423              		.loc 2 345 0
 424 01ae 0A4B     		ldr	r3, .L25
 425 01b0 1B68     		ldr	r3, [r3]
 426 01b2 FB60     		str	r3, [r7, #12]
 346:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 347:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear HSITRIM[4:0] bits */
 348:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_CR_HSITRIM;
 427              		.loc 2 348 0
 428 01b4 FB68     		ldr	r3, [r7, #12]
 429 01b6 F822     		movs	r2, #248
 430 01b8 9343     		bics	r3, r2
 431 01ba FB60     		str	r3, [r7, #12]
 349:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 350:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set the HSITRIM[4:0] bits according to HSICalibrationValue value */
 351:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= (uint32_t)HSICalibrationValue << 3;
 432              		.loc 2 351 0
 433 01bc FB1D     		adds	r3, r7, #7
 434 01be 1B78     		ldrb	r3, [r3]
 435 01c0 DB00     		lsls	r3, r3, #3
 436 01c2 FA68     		ldr	r2, [r7, #12]
 437 01c4 1343     		orrs	r3, r2
 438 01c6 FB60     		str	r3, [r7, #12]
 352:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 353:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
 354:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CR = tmpreg;
 439              		.loc 2 354 0
 440 01c8 034B     		ldr	r3, .L25
 441 01ca FA68     		ldr	r2, [r7, #12]
 442 01cc 1A60     		str	r2, [r3]
 355:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 443              		.loc 2 355 0
 444 01ce C046     		nop
 445 01d0 BD46     		mov	sp, r7
 446 01d2 04B0     		add	sp, sp, #16
 447              		@ sp needed
 448 01d4 80BD     		pop	{r7, pc}
 449              	.L26:
 450 01d6 C046     		.align	2
 451              	.L25:
 452 01d8 00380240 		.word	1073887232
 453              		.cfi_endproc
 454              	.LFE126:
 456              		.align	1
 457              		.global	RCC_HSICmd
 458              		.syntax unified
 459              		.code	16
 460              		.thumb_func
 461              		.fpu softvfp
 463              	RCC_HSICmd:
 464              	.LFB127:
 356:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 357:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 358:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the Internal High Speed oscillator (HSI).
 359:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The HSI is stopped by hardware when entering STOP and STANDBY modes.
 360:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         It is used (enabled by hardware) as system clock source after startup
 361:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         from Reset, wakeup from STOP and STANDBY mode, or in case of failure
 362:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of the HSE used directly or indirectly as system clock (if the Clock
 363:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         Security System CSS is enabled).             
 364:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   HSI can not be stopped if it is used as system clock source. In this case,
 365:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         you have to select another source of the system clock then stop the HSI.  
 366:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After enabling the HSI, the application software should wait on HSIRDY
 367:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         flag to be set indicating that HSI clock is stable and can be used as
 368:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         system clock source.  
 369:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the HSI.
 370:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
 371:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   When the HSI is stopped, HSIRDY flag goes low after 6 HSI oscillator
 372:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         clock cycles.  
 373:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 374:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 375:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_HSICmd(FunctionalState NewState)
 376:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 465              		.loc 2 376 0
 466              		.cfi_startproc
 467              		@ args = 0, pretend = 0, frame = 8
 468              		@ frame_needed = 1, uses_anonymous_args = 0
 469 01dc 80B5     		push	{r7, lr}
 470              		.cfi_def_cfa_offset 8
 471              		.cfi_offset 7, -8
 472              		.cfi_offset 14, -4
 473 01de 82B0     		sub	sp, sp, #8
 474              		.cfi_def_cfa_offset 16
 475 01e0 00AF     		add	r7, sp, #0
 476              		.cfi_def_cfa_register 7
 477 01e2 0200     		movs	r2, r0
 478 01e4 FB1D     		adds	r3, r7, #7
 479 01e6 1A70     		strb	r2, [r3]
 377:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 378:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 379:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 380:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) CR_HSION_BB = (uint32_t)NewState;
 480              		.loc 2 380 0
 481 01e8 034B     		ldr	r3, .L28
 482 01ea FA1D     		adds	r2, r7, #7
 483 01ec 1278     		ldrb	r2, [r2]
 484 01ee 1A60     		str	r2, [r3]
 381:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 485              		.loc 2 381 0
 486 01f0 C046     		nop
 487 01f2 BD46     		mov	sp, r7
 488 01f4 02B0     		add	sp, sp, #8
 489              		@ sp needed
 490 01f6 80BD     		pop	{r7, pc}
 491              	.L29:
 492              		.align	2
 493              	.L28:
 494 01f8 00004742 		.word	1111949312
 495              		.cfi_endproc
 496              	.LFE127:
 498              		.align	1
 499              		.global	RCC_LSEConfig
 500              		.syntax unified
 501              		.code	16
 502              		.thumb_func
 503              		.fpu softvfp
 505              	RCC_LSEConfig:
 506              	.LFB128:
 382:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 383:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 384:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the External Low Speed oscillator (LSE).
 385:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   As the LSE is in the Backup domain and write access is denied to
 386:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         this domain after reset, you have to enable write access using 
 387:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         PWR_BackupAccessCmd(ENABLE) function before to configure the LSE
 388:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         (to be done once after reset).  
 389:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After enabling the LSE (RCC_LSE_ON or RCC_LSE_Bypass), the application
 390:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         software should wait on LSERDY flag to be set indicating that LSE clock
 391:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is stable and can be used to clock the RTC.
 392:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_LSE: specifies the new state of the LSE.
 393:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 394:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LSE_OFF: turn OFF the LSE oscillator, LSERDY flag goes low after
 395:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                              6 LSE oscillator clock cycles.
 396:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LSE_ON: turn ON the LSE oscillator
 397:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LSE_Bypass: LSE oscillator bypassed with external clock
 398:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 399:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 400:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_LSEConfig(uint8_t RCC_LSE)
 401:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 507              		.loc 2 401 0
 508              		.cfi_startproc
 509              		@ args = 0, pretend = 0, frame = 8
 510              		@ frame_needed = 1, uses_anonymous_args = 0
 511 01fc 80B5     		push	{r7, lr}
 512              		.cfi_def_cfa_offset 8
 513              		.cfi_offset 7, -8
 514              		.cfi_offset 14, -4
 515 01fe 82B0     		sub	sp, sp, #8
 516              		.cfi_def_cfa_offset 16
 517 0200 00AF     		add	r7, sp, #0
 518              		.cfi_def_cfa_register 7
 519 0202 0200     		movs	r2, r0
 520 0204 FB1D     		adds	r3, r7, #7
 521 0206 1A70     		strb	r2, [r3]
 402:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 403:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_LSE(RCC_LSE));
 404:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 405:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset LSEON and LSEBYP bits before configuring the LSE ------------------*/
 406:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset LSEON bit */
 407:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
 522              		.loc 2 407 0
 523 0208 0C4B     		ldr	r3, .L35
 524 020a 0022     		movs	r2, #0
 525 020c 1A70     		strb	r2, [r3]
 408:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 409:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Reset LSEBYP bit */
 410:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_OFF;
 526              		.loc 2 410 0
 527 020e 0B4B     		ldr	r3, .L35
 528 0210 0022     		movs	r2, #0
 529 0212 1A70     		strb	r2, [r3]
 411:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 412:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Configure LSE (RCC_LSE_OFF is already covered by the code section above) */
 413:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   switch (RCC_LSE)
 530              		.loc 2 413 0
 531 0214 FB1D     		adds	r3, r7, #7
 532 0216 1B78     		ldrb	r3, [r3]
 533 0218 012B     		cmp	r3, #1
 534 021a 02D0     		beq	.L32
 535 021c 042B     		cmp	r3, #4
 536 021e 04D0     		beq	.L33
 414:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
 415:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     case RCC_LSE_ON:
 416:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       /* Set LSEON bit */
 417:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_ON;
 418:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       break;
 419:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     case RCC_LSE_Bypass:
 420:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       /* Set LSEBYP and LSEON bits */
 421:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       *(__IO uint8_t *) BDCR_ADDRESS = RCC_LSE_Bypass | RCC_LSE_ON;
 422:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       break;
 423:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     default:
 424:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       break;
 537              		.loc 2 424 0
 538 0220 07E0     		b	.L34
 539              	.L32:
 417:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       break;
 540              		.loc 2 417 0
 541 0222 064B     		ldr	r3, .L35
 542 0224 0122     		movs	r2, #1
 543 0226 1A70     		strb	r2, [r3]
 418:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     case RCC_LSE_Bypass:
 544              		.loc 2 418 0
 545 0228 03E0     		b	.L34
 546              	.L33:
 421:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       break;
 547              		.loc 2 421 0
 548 022a 044B     		ldr	r3, .L35
 549 022c 0522     		movs	r2, #5
 550 022e 1A70     		strb	r2, [r3]
 422:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     default:
 551              		.loc 2 422 0
 552 0230 C046     		nop
 553              	.L34:
 425:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 426:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 554              		.loc 2 426 0
 555 0232 C046     		nop
 556 0234 BD46     		mov	sp, r7
 557 0236 02B0     		add	sp, sp, #8
 558              		@ sp needed
 559 0238 80BD     		pop	{r7, pc}
 560              	.L36:
 561 023a C046     		.align	2
 562              	.L35:
 563 023c 70380240 		.word	1073887344
 564              		.cfi_endproc
 565              	.LFE128:
 567              		.align	1
 568              		.global	RCC_LSICmd
 569              		.syntax unified
 570              		.code	16
 571              		.thumb_func
 572              		.fpu softvfp
 574              	RCC_LSICmd:
 575              	.LFB129:
 427:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 428:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 429:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the Internal Low Speed oscillator (LSI).
 430:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After enabling the LSI, the application software should wait on 
 431:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         LSIRDY flag to be set indicating that LSI clock is stable and can
 432:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         be used to clock the IWDG and/or the RTC.
 433:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   LSI can not be disabled if the IWDG is running.  
 434:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the LSI.
 435:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
 436:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   When the LSI is stopped, LSIRDY flag goes low after 6 LSI oscillator
 437:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         clock cycles. 
 438:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 439:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 440:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_LSICmd(FunctionalState NewState)
 441:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 576              		.loc 2 441 0
 577              		.cfi_startproc
 578              		@ args = 0, pretend = 0, frame = 8
 579              		@ frame_needed = 1, uses_anonymous_args = 0
 580 0240 80B5     		push	{r7, lr}
 581              		.cfi_def_cfa_offset 8
 582              		.cfi_offset 7, -8
 583              		.cfi_offset 14, -4
 584 0242 82B0     		sub	sp, sp, #8
 585              		.cfi_def_cfa_offset 16
 586 0244 00AF     		add	r7, sp, #0
 587              		.cfi_def_cfa_register 7
 588 0246 0200     		movs	r2, r0
 589 0248 FB1D     		adds	r3, r7, #7
 590 024a 1A70     		strb	r2, [r3]
 442:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 443:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 444:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 445:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) CSR_LSION_BB = (uint32_t)NewState;
 591              		.loc 2 445 0
 592 024c 034B     		ldr	r3, .L38
 593 024e FA1D     		adds	r2, r7, #7
 594 0250 1278     		ldrb	r2, [r2]
 595 0252 1A60     		str	r2, [r3]
 446:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 596              		.loc 2 446 0
 597 0254 C046     		nop
 598 0256 BD46     		mov	sp, r7
 599 0258 02B0     		add	sp, sp, #8
 600              		@ sp needed
 601 025a 80BD     		pop	{r7, pc}
 602              	.L39:
 603              		.align	2
 604              	.L38:
 605 025c 800E4742 		.word	1111953024
 606              		.cfi_endproc
 607              	.LFE129:
 609              		.align	1
 610              		.global	RCC_PLLConfig
 611              		.syntax unified
 612              		.code	16
 613              		.thumb_func
 614              		.fpu softvfp
 616              	RCC_PLLConfig:
 617              	.LFB130:
 447:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 448:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx) || defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F446xx
 449:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 450:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the main PLL clock source, multiplication and division factors.
 451:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the main PLL is disabled.
 452:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 453:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_PLLSource: specifies the PLL entry clock source.
 454:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 455:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSource_HSI: HSI oscillator clock selected as PLL clock entry
 456:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSource_HSE: HSE oscillator clock selected as PLL clock entry
 457:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This clock source (RCC_PLLSource) is common for the main PLL and PLLI2S.  
 458:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 459:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLM: specifies the division factor for PLL VCO input clock
 460:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 0 and 63.
 461:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLM parameter correctly to ensure that the VCO input
 462:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         frequency ranges from 1 to 2 MHz. It is recommended to select a frequency
 463:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of 2 MHz to limit PLL jitter.
 464:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 465:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLN: specifies the multiplication factor for PLL VCO output clock
 466:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 50 and 432.
 467:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLN parameter correctly to ensure that the VCO
 468:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 469:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 470:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLP: specifies the division factor for main system clock (SYSCLK)
 471:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number in the range {2, 4, 6, or 8}.
 472:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLP parameter correctly to not exceed 168 MHz on
 473:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the System clock frequency.
 474:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 475:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLQ: specifies the division factor for OTG FS, SDIO and RNG clocks
 476:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 4 and 15.
 477:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 478:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLR: specifies the division factor for I2S, SAI, SYSTEM, SPDIF in STM32F446xx devices
 479:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 7.
 480:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 481:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   If the USB OTG FS is used in your application, you have to set the
 482:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         PLLQ parameter correctly to have 48 MHz clock for the USB. However,
 483:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the SDIO and RNG need a frequency lower than or equal to 48 MHz to work
 484:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         correctly.
 485:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 486:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 487:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 488:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t PLLM, uint32_t PLLN, uint32_t PLLP, uint32_t PL
 489:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 490:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 491:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLL_SOURCE(RCC_PLLSource));
 492:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLM_VALUE(PLLM));
 493:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLN_VALUE(PLLN));
 494:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLP_VALUE(PLLP));
 495:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLQ_VALUE(PLLQ));
 496:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLR_VALUE(PLLR));
 497:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 498:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLCFGR = PLLM | (PLLN << 6) | (((PLLP >> 1) -1) << 16) | (RCC_PLLSource) |
 499:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****                  (PLLQ << 24) | (PLLR << 28);
 500:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 501:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx || STM32F412xG || STM32F413_423xx || STM32F446xx || STM32F469_479xx */
 502:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 503:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 504:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 505:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the main PLL clock source, multiplication and division factors.
 506:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the main PLL is disabled.
 507:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 508:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_PLLSource: specifies the PLL entry clock source.
 509:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 510:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSource_HSI: HSI oscillator clock selected as PLL clock entry
 511:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSource_HSE: HSE oscillator clock selected as PLL clock entry
 512:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This clock source (RCC_PLLSource) is common for the main PLL and PLLI2S.  
 513:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 514:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLM: specifies the division factor for PLL VCO input clock
 515:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 0 and 63.
 516:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLM parameter correctly to ensure that the VCO input
 517:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         frequency ranges from 1 to 2 MHz. It is recommended to select a frequency
 518:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of 2 MHz to limit PLL jitter.
 519:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 520:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLN: specifies the multiplication factor for PLL VCO output clock
 521:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 50 and 432.
 522:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLN parameter correctly to ensure that the VCO
 523:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 524:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 525:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLP: specifies the division factor for main system clock (SYSCLK)
 526:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number in the range {2, 4, 6, or 8}.
 527:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLP parameter correctly to not exceed 168 MHz on
 528:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the System clock frequency.
 529:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 530:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLQ: specifies the division factor for OTG FS, SDIO and RNG clocks
 531:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 4 and 15.
 532:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   If the USB OTG FS is used in your application, you have to set the
 533:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         PLLQ parameter correctly to have 48 MHz clock for the USB. However,
 534:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the SDIO and RNG need a frequency lower than or equal to 48 MHz to work
 535:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         correctly.
 536:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 537:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 538:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 539:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLConfig(uint32_t RCC_PLLSource, uint32_t PLLM, uint32_t PLLN, uint32_t PLLP, uint32_t PL
 540:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 618              		.loc 2 540 0
 619              		.cfi_startproc
 620              		@ args = 4, pretend = 0, frame = 16
 621              		@ frame_needed = 1, uses_anonymous_args = 0
 622 0260 80B5     		push	{r7, lr}
 623              		.cfi_def_cfa_offset 8
 624              		.cfi_offset 7, -8
 625              		.cfi_offset 14, -4
 626 0262 84B0     		sub	sp, sp, #16
 627              		.cfi_def_cfa_offset 24
 628 0264 00AF     		add	r7, sp, #0
 629              		.cfi_def_cfa_register 7
 630 0266 F860     		str	r0, [r7, #12]
 631 0268 B960     		str	r1, [r7, #8]
 632 026a 7A60     		str	r2, [r7, #4]
 633 026c 3B60     		str	r3, [r7]
 541:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 542:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLL_SOURCE(RCC_PLLSource));
 543:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLM_VALUE(PLLM));
 544:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLN_VALUE(PLLN));
 545:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLP_VALUE(PLLP));
 546:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLQ_VALUE(PLLQ));
 547:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 548:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLCFGR = PLLM | (PLLN << 6) | (((PLLP >> 1) -1) << 16) | (RCC_PLLSource) |
 634              		.loc 2 548 0
 635 026e 7B68     		ldr	r3, [r7, #4]
 636 0270 9A01     		lsls	r2, r3, #6
 637 0272 BB68     		ldr	r3, [r7, #8]
 638 0274 1A43     		orrs	r2, r3
 639 0276 3B68     		ldr	r3, [r7]
 640 0278 5B08     		lsrs	r3, r3, #1
 641 027a 013B     		subs	r3, r3, #1
 642 027c 1B04     		lsls	r3, r3, #16
 643 027e 1A43     		orrs	r2, r3
 644 0280 FB68     		ldr	r3, [r7, #12]
 645 0282 1A43     		orrs	r2, r3
 646 0284 1100     		movs	r1, r2
 549:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****                  (PLLQ << 24);
 647              		.loc 2 549 0
 648 0286 BB69     		ldr	r3, [r7, #24]
 649 0288 1A06     		lsls	r2, r3, #24
 548:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****                  (PLLQ << 24);
 650              		.loc 2 548 0
 651 028a 034B     		ldr	r3, .L41
 652 028c 0A43     		orrs	r2, r1
 653 028e 5A60     		str	r2, [r3, #4]
 550:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 654              		.loc 2 550 0
 655 0290 C046     		nop
 656 0292 BD46     		mov	sp, r7
 657 0294 04B0     		add	sp, sp, #16
 658              		@ sp needed
 659 0296 80BD     		pop	{r7, pc}
 660              	.L42:
 661              		.align	2
 662              	.L41:
 663 0298 00380240 		.word	1073887232
 664              		.cfi_endproc
 665              	.LFE130:
 667              		.align	1
 668              		.global	RCC_PLLCmd
 669              		.syntax unified
 670              		.code	16
 671              		.thumb_func
 672              		.fpu softvfp
 674              	RCC_PLLCmd:
 675              	.LFB131:
 551:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F401xx || STM32F411xE */
 552:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 553:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 554:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the main PLL.
 555:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After enabling the main PLL, the application software should wait on 
 556:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         PLLRDY flag to be set indicating that PLL clock is stable and can
 557:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         be used as system clock source.
 558:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The main PLL can not be disabled if it is used as system clock source
 559:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The main PLL is disabled by hardware when entering STOP and STANDBY modes.
 560:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the main PLL. This parameter can be: ENABLE or DISABLE.
 561:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 562:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 563:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLCmd(FunctionalState NewState)
 564:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 676              		.loc 2 564 0
 677              		.cfi_startproc
 678              		@ args = 0, pretend = 0, frame = 8
 679              		@ frame_needed = 1, uses_anonymous_args = 0
 680 029c 80B5     		push	{r7, lr}
 681              		.cfi_def_cfa_offset 8
 682              		.cfi_offset 7, -8
 683              		.cfi_offset 14, -4
 684 029e 82B0     		sub	sp, sp, #8
 685              		.cfi_def_cfa_offset 16
 686 02a0 00AF     		add	r7, sp, #0
 687              		.cfi_def_cfa_register 7
 688 02a2 0200     		movs	r2, r0
 689 02a4 FB1D     		adds	r3, r7, #7
 690 02a6 1A70     		strb	r2, [r3]
 565:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 566:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 567:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) CR_PLLON_BB = (uint32_t)NewState;
 691              		.loc 2 567 0
 692 02a8 034B     		ldr	r3, .L44
 693 02aa FA1D     		adds	r2, r7, #7
 694 02ac 1278     		ldrb	r2, [r2]
 695 02ae 1A60     		str	r2, [r3]
 568:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 696              		.loc 2 568 0
 697 02b0 C046     		nop
 698 02b2 BD46     		mov	sp, r7
 699 02b4 02B0     		add	sp, sp, #8
 700              		@ sp needed
 701 02b6 80BD     		pop	{r7, pc}
 702              	.L45:
 703              		.align	2
 704              	.L44:
 705 02b8 60004742 		.word	1111949408
 706              		.cfi_endproc
 707              	.LFE131:
 709              		.align	1
 710              		.global	RCC_PLLI2SConfig
 711              		.syntax unified
 712              		.code	16
 713              		.thumb_func
 714              		.fpu softvfp
 716              	RCC_PLLI2SConfig:
 717              	.LFB132:
 569:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 570:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F401xx)
 571:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 572:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the PLLI2S clock multiplication and division factors.
 573:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 574:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F405xx/407xx, STM32F415xx/417xx 
 575:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         or STM32F401xx devices. 
 576:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *    
 577:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the PLLI2S is disabled.
 578:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PLLI2S clock source is common with the main PLL (configured in 
 579:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_PLLConfig function )  
 580:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *             
 581:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SN: specifies the multiplication factor for PLLI2S VCO output clock
 582:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 50 and 432.
 583:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SN parameter correctly to ensure that the VCO 
 584:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 585:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *    
 586:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SR: specifies the division factor for I2S clock
 587:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 7.
 588:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SR parameter correctly to not exceed 192 MHz
 589:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         on the I2S clock frequency.
 590:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 591:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 592:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 593:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLI2SConfig(uint32_t PLLI2SN, uint32_t PLLI2SR)
 594:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 718              		.loc 2 594 0
 719              		.cfi_startproc
 720              		@ args = 0, pretend = 0, frame = 8
 721              		@ frame_needed = 1, uses_anonymous_args = 0
 722 02bc 80B5     		push	{r7, lr}
 723              		.cfi_def_cfa_offset 8
 724              		.cfi_offset 7, -8
 725              		.cfi_offset 14, -4
 726 02be 82B0     		sub	sp, sp, #8
 727              		.cfi_def_cfa_offset 16
 728 02c0 00AF     		add	r7, sp, #0
 729              		.cfi_def_cfa_register 7
 730 02c2 7860     		str	r0, [r7, #4]
 731 02c4 3960     		str	r1, [r7]
 595:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 596:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SN_VALUE(PLLI2SN));
 597:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SR_VALUE(PLLI2SR));
 598:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 599:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLI2SCFGR = (PLLI2SN << 6) | (PLLI2SR << 28);
 732              		.loc 2 599 0
 733 02c6 7B68     		ldr	r3, [r7, #4]
 734 02c8 9A01     		lsls	r2, r3, #6
 735 02ca 3B68     		ldr	r3, [r7]
 736 02cc 1B07     		lsls	r3, r3, #28
 737 02ce 0449     		ldr	r1, .L47
 738 02d0 1343     		orrs	r3, r2
 739 02d2 8422     		movs	r2, #132
 740 02d4 8B50     		str	r3, [r1, r2]
 600:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 741              		.loc 2 600 0
 742 02d6 C046     		nop
 743 02d8 BD46     		mov	sp, r7
 744 02da 02B0     		add	sp, sp, #8
 745              		@ sp needed
 746 02dc 80BD     		pop	{r7, pc}
 747              	.L48:
 748 02de C046     		.align	2
 749              	.L47:
 750 02e0 00380240 		.word	1073887232
 751              		.cfi_endproc
 752              	.LFE132:
 754              		.align	1
 755              		.global	RCC_PLLI2SCmd
 756              		.syntax unified
 757              		.code	16
 758              		.thumb_func
 759              		.fpu softvfp
 761              	RCC_PLLI2SCmd:
 762              	.LFB133:
 601:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F401xx */
 602:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 603:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F411xE)
 604:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 605:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the PLLI2S clock multiplication and division factors.
 606:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
 607:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F411xE devices. 
 608:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *    
 609:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the PLLI2S is disabled.
 610:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PLLI2S clock source is common with the main PLL (configured in 
 611:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_PLLConfig function )  
 612:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 613:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SM: specifies the division factor for PLLI2S VCO input clock
 614:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between Min_Data = 2 and Max_Data = 63.
 615:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SM parameter correctly to ensure that the VCO input
 616:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         frequency ranges from 1 to 2 MHz. It is recommended to select a frequency
 617:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of 2 MHz to limit PLLI2S jitter.
 618:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 619:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SN: specifies the multiplication factor for PLLI2S VCO output clock
 620:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 50 and 432.
 621:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SN parameter correctly to ensure that the VCO 
 622:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 623:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *    
 624:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SR: specifies the division factor for I2S clock
 625:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 7.
 626:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SR parameter correctly to not exceed 192 MHz
 627:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         on the I2S clock frequency.
 628:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 629:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 630:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 631:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLI2SConfig(uint32_t PLLI2SN, uint32_t PLLI2SR, uint32_t PLLI2SM)
 632:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 633:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 634:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SN_VALUE(PLLI2SN));
 635:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SM_VALUE(PLLI2SM));
 636:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SR_VALUE(PLLI2SR));
 637:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 638:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLI2SCFGR = (PLLI2SN << 6) | (PLLI2SR << 28) | PLLI2SM;
 639:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 640:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F411xE */
 641:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 642:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM32F469_479xx)
 643:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 644:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the PLLI2S clock multiplication and division factors.
 645:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
 646:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx devices 
 647:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         
 648:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the PLLI2S is disabled.
 649:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PLLI2S clock source is common with the main PLL (configured in 
 650:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_PLLConfig function )  
 651:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *             
 652:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SN: specifies the multiplication factor for PLLI2S VCO output clock
 653:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 50 and 432.
 654:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SN parameter correctly to ensure that the VCO 
 655:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 656:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
 657:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SQ: specifies the division factor for SAI1 clock
 658:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 15.
 659:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 
 660:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SR: specifies the division factor for I2S clock
 661:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 7.
 662:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SR parameter correctly to not exceed 192 MHz
 663:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         on the I2S clock frequency.
 664:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 665:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 666:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 667:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLI2SConfig(uint32_t PLLI2SN, uint32_t PLLI2SQ, uint32_t PLLI2SR)
 668:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 669:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 670:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SN_VALUE(PLLI2SN));
 671:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SQ_VALUE(PLLI2SQ));
 672:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SR_VALUE(PLLI2SR));
 673:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 674:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLI2SCFGR = (PLLI2SN << 6) | (PLLI2SQ << 24) | (PLLI2SR << 28);
 675:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 676:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F427_437xx || STM32F429_439xx || STM32F469_479xx */
 677:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 678:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F412xG ) || defined(STM32F413_423xx) || defined(STM32F446xx)
 679:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 680:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the PLLI2S clock multiplication and division factors.
 681:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
 682:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F446xx devices 
 683:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         
 684:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the PLLI2S is disabled.
 685:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PLLI2S clock source is common with the main PLL (configured in 
 686:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_PLLConfig function )  
 687:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
 688:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SM: specifies the division factor for PLLI2S VCO input clock
 689:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between Min_Data = 2 and Max_Data = 63.
 690:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SM parameter correctly to ensure that the VCO input
 691:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         frequency ranges from 1 to 2 MHz. It is recommended to select a frequency
 692:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of 2 MHz to limit PLLI2S jitter.
 693:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 694:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SN: specifies the multiplication factor for PLLI2S VCO output clock
 695:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 50 and 432.
 696:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SN parameter correctly to ensure that the VCO 
 697:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 698:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 699:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SP: specifies the division factor for PLL 48Mhz clock output
 700:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number in the range {2, 4, 6, or 8}.
 701:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 702:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SQ: specifies the division factor for SAI1 clock
 703:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 15.
 704:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 
 705:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLI2SR: specifies the division factor for I2S clock
 706:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 7.
 707:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLI2SR parameter correctly to not exceed 192 MHz
 708:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         on the I2S clock frequency.
 709:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   the PLLI2SR parameter is only available with STM32F42xxx/43xxx devices.  
 710:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 711:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 712:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 713:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLI2SConfig(uint32_t PLLI2SM, uint32_t PLLI2SN, uint32_t PLLI2SP, uint32_t PLLI2SQ, uint3
 714:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 715:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 716:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SM_VALUE(PLLI2SM));
 717:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SN_VALUE(PLLI2SN));
 718:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SP_VALUE(PLLI2SP));
 719:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SQ_VALUE(PLLI2SQ));
 720:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2SR_VALUE(PLLI2SR));
 721:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 722:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLI2SCFGR =  PLLI2SM | (PLLI2SN << 6) | (((PLLI2SP >> 1) -1) << 16) | (PLLI2SQ << 24) | (PL
 723:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 724:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F412xG || STM32F413_423xx || STM32F446xx */
 725:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 726:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 727:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the PLLI2S. 
 728:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The PLLI2S is disabled by hardware when entering STOP and STANDBY modes.  
 729:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the PLLI2S. This parameter can be: ENABLE or DISABLE.
 730:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 731:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 732:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLI2SCmd(FunctionalState NewState)
 733:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 763              		.loc 2 733 0
 764              		.cfi_startproc
 765              		@ args = 0, pretend = 0, frame = 8
 766              		@ frame_needed = 1, uses_anonymous_args = 0
 767 02e4 80B5     		push	{r7, lr}
 768              		.cfi_def_cfa_offset 8
 769              		.cfi_offset 7, -8
 770              		.cfi_offset 14, -4
 771 02e6 82B0     		sub	sp, sp, #8
 772              		.cfi_def_cfa_offset 16
 773 02e8 00AF     		add	r7, sp, #0
 774              		.cfi_def_cfa_register 7
 775 02ea 0200     		movs	r2, r0
 776 02ec FB1D     		adds	r3, r7, #7
 777 02ee 1A70     		strb	r2, [r3]
 734:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 735:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 736:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) CR_PLLI2SON_BB = (uint32_t)NewState;
 778              		.loc 2 736 0
 779 02f0 034B     		ldr	r3, .L50
 780 02f2 FA1D     		adds	r2, r7, #7
 781 02f4 1278     		ldrb	r2, [r2]
 782 02f6 1A60     		str	r2, [r3]
 737:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 783              		.loc 2 737 0
 784 02f8 C046     		nop
 785 02fa BD46     		mov	sp, r7
 786 02fc 02B0     		add	sp, sp, #8
 787              		@ sp needed
 788 02fe 80BD     		pop	{r7, pc}
 789              	.L51:
 790              		.align	2
 791              	.L50:
 792 0300 68004742 		.word	1111949416
 793              		.cfi_endproc
 794              	.LFE133:
 796              		.align	1
 797              		.global	RCC_PLLSAIConfig
 798              		.syntax unified
 799              		.code	16
 800              		.thumb_func
 801              		.fpu softvfp
 803              	RCC_PLLSAIConfig:
 804              	.LFB134:
 738:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 739:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F469_479xx)
 740:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 741:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the PLLSAI clock multiplication and division factors.
 742:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 743:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F469_479xx devices 
 744:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *        
 745:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the PLLSAI is disabled.
 746:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PLLSAI clock source is common with the main PLL (configured in 
 747:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_PLLConfig function )  
 748:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 749:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIN: specifies the multiplication factor for PLLSAI VCO output clock
 750:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between 50 and 432.
 751:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLSAIN parameter correctly to ensure that the VCO 
 752:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 753:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 754:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIP: specifies the division factor for PLL 48Mhz clock output
 755:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number in the range {2, 4, 6, or 8}..
 756:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           
 757:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIQ: specifies the division factor for SAI1 clock
 758:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between 2 and 15.
 759:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            
 760:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIR: specifies the division factor for LTDC clock
 761:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 7.
 762:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 763:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 764:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 765:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLSAIConfig(uint32_t PLLSAIN, uint32_t PLLSAIP, uint32_t PLLSAIQ, uint32_t PLLSAIR)
 766:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 767:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 768:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIN_VALUE(PLLSAIN));
 769:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIP_VALUE(PLLSAIP));
 770:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIQ_VALUE(PLLSAIQ));
 771:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIR_VALUE(PLLSAIR));
 772:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 773:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLSAICFGR = (PLLSAIN << 6) | (((PLLSAIP >> 1) -1) << 16) | (PLLSAIQ << 24) | (PLLSAIR << 28
 774:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 775:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F469_479xx */
 776:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 777:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F446xx)
 778:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 779:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the PLLSAI clock multiplication and division factors.
 780:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 781:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F446xx devices 
 782:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *        
 783:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the PLLSAI is disabled.
 784:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PLLSAI clock source is common with the main PLL (configured in 
 785:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_PLLConfig function )  
 786:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
 787:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIM: specifies the division factor for PLLSAI VCO input clock
 788:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between Min_Data = 2 and Max_Data = 63.
 789:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLSAIM parameter correctly to ensure that the VCO input
 790:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         frequency ranges from 1 to 2 MHz. It is recommended to select a frequency
 791:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of 2 MHz to limit PLLSAI jitter.
 792:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 793:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIN: specifies the multiplication factor for PLLSAI VCO output clock
 794:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between 50 and 432.
 795:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLSAIN parameter correctly to ensure that the VCO 
 796:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 797:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
 798:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIP: specifies the division factor for PLL 48Mhz clock output
 799:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number in the range {2, 4, 6, or 8}.
 800:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 801:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIQ: specifies the division factor for SAI1 clock
 802:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter must be a number between 2 and 15.
 803:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 804:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 805:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 806:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLSAIConfig(uint32_t PLLSAIM, uint32_t PLLSAIN, uint32_t PLLSAIP, uint32_t PLLSAIQ)
 807:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 808:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 809:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIM_VALUE(PLLSAIM));
 810:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIN_VALUE(PLLSAIN));
 811:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIP_VALUE(PLLSAIP));
 812:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIQ_VALUE(PLLSAIQ));
 813:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 814:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLSAICFGR = PLLSAIM | (PLLSAIN << 6) | (((PLLSAIP >> 1) -1) << 16)  | (PLLSAIQ << 24);
 815:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 816:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F446xx */
 817:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 818:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
 819:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 820:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the PLLSAI clock multiplication and division factors.
 821:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
 822:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx devices 
 823:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *        
 824:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only when the PLLSAI is disabled.
 825:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PLLSAI clock source is common with the main PLL (configured in 
 826:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_PLLConfig function )  
 827:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *             
 828:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIN: specifies the multiplication factor for PLLSAI VCO output clock
 829:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 50 and 432.
 830:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   You have to set the PLLSAIN parameter correctly to ensure that the VCO 
 831:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         output frequency is between 100 and 432 MHz.
 832:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           
 833:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIQ: specifies the division factor for SAI1 clock
 834:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 15.
 835:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            
 836:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  PLLSAIR: specifies the division factor for LTDC clock
 837:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 2 and 7.
 838:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
 839:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 840:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 841:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLSAIConfig(uint32_t PLLSAIN, uint32_t PLLSAIQ, uint32_t PLLSAIR)
 842:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 805              		.loc 2 842 0
 806              		.cfi_startproc
 807              		@ args = 0, pretend = 0, frame = 16
 808              		@ frame_needed = 1, uses_anonymous_args = 0
 809 0304 80B5     		push	{r7, lr}
 810              		.cfi_def_cfa_offset 8
 811              		.cfi_offset 7, -8
 812              		.cfi_offset 14, -4
 813 0306 84B0     		sub	sp, sp, #16
 814              		.cfi_def_cfa_offset 24
 815 0308 00AF     		add	r7, sp, #0
 816              		.cfi_def_cfa_register 7
 817 030a F860     		str	r0, [r7, #12]
 818 030c B960     		str	r1, [r7, #8]
 819 030e 7A60     		str	r2, [r7, #4]
 843:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 844:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIN_VALUE(PLLSAIN));
 845:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIR_VALUE(PLLSAIR));
 846:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAIQ_VALUE(PLLSAIQ));
 847:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 848:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->PLLSAICFGR = (PLLSAIN << 6) | (PLLSAIQ << 24) | (PLLSAIR << 28);
 820              		.loc 2 848 0
 821 0310 FB68     		ldr	r3, [r7, #12]
 822 0312 9A01     		lsls	r2, r3, #6
 823 0314 BB68     		ldr	r3, [r7, #8]
 824 0316 1B06     		lsls	r3, r3, #24
 825 0318 1A43     		orrs	r2, r3
 826 031a 7B68     		ldr	r3, [r7, #4]
 827 031c 1B07     		lsls	r3, r3, #28
 828 031e 0449     		ldr	r1, .L53
 829 0320 1343     		orrs	r3, r2
 830 0322 8822     		movs	r2, #136
 831 0324 8B50     		str	r3, [r1, r2]
 849:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 832              		.loc 2 849 0
 833 0326 C046     		nop
 834 0328 BD46     		mov	sp, r7
 835 032a 04B0     		add	sp, sp, #16
 836              		@ sp needed
 837 032c 80BD     		pop	{r7, pc}
 838              	.L54:
 839 032e C046     		.align	2
 840              	.L53:
 841 0330 00380240 		.word	1073887232
 842              		.cfi_endproc
 843              	.LFE134:
 845              		.align	1
 846              		.global	RCC_PLLSAICmd
 847              		.syntax unified
 848              		.code	16
 849              		.thumb_func
 850              		.fpu softvfp
 852              	RCC_PLLSAICmd:
 853              	.LFB135:
 850:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F401xx || STM32F411xE */
 851:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 852:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 853:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the PLLSAI. 
 854:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
 855:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx/446xx/469xx/479xx devices 
 856:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *       
 857:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The PLLSAI is disabled by hardware when entering STOP and STANDBY modes.  
 858:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the PLLSAI. This parameter can be: ENABLE or DISABLE.
 859:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 860:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 861:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PLLSAICmd(FunctionalState NewState)
 862:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 854              		.loc 2 862 0
 855              		.cfi_startproc
 856              		@ args = 0, pretend = 0, frame = 8
 857              		@ frame_needed = 1, uses_anonymous_args = 0
 858 0334 80B5     		push	{r7, lr}
 859              		.cfi_def_cfa_offset 8
 860              		.cfi_offset 7, -8
 861              		.cfi_offset 14, -4
 862 0336 82B0     		sub	sp, sp, #8
 863              		.cfi_def_cfa_offset 16
 864 0338 00AF     		add	r7, sp, #0
 865              		.cfi_def_cfa_register 7
 866 033a 0200     		movs	r2, r0
 867 033c FB1D     		adds	r3, r7, #7
 868 033e 1A70     		strb	r2, [r3]
 863:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 864:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 865:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) CR_PLLSAION_BB = (uint32_t)NewState;
 869              		.loc 2 865 0
 870 0340 034B     		ldr	r3, .L56
 871 0342 FA1D     		adds	r2, r7, #7
 872 0344 1278     		ldrb	r2, [r2]
 873 0346 1A60     		str	r2, [r3]
 866:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 874              		.loc 2 866 0
 875 0348 C046     		nop
 876 034a BD46     		mov	sp, r7
 877 034c 02B0     		add	sp, sp, #8
 878              		@ sp needed
 879 034e 80BD     		pop	{r7, pc}
 880              	.L57:
 881              		.align	2
 882              	.L56:
 883 0350 70004742 		.word	1111949424
 884              		.cfi_endproc
 885              	.LFE135:
 887              		.align	1
 888              		.global	RCC_ClockSecuritySystemCmd
 889              		.syntax unified
 890              		.code	16
 891              		.thumb_func
 892              		.fpu softvfp
 894              	RCC_ClockSecuritySystemCmd:
 895              	.LFB136:
 867:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 868:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 869:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the Clock Security System.
 870:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   If a failure is detected on the HSE oscillator clock, this oscillator
 871:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is automatically disabled and an interrupt is generated to inform the
 872:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         software about the failure (Clock Security System Interrupt, CSSI),
 873:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         allowing the MCU to perform rescue operations. The CSSI is linked to 
 874:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the Cortex-M4 NMI (Non-Maskable Interrupt) exception vector.  
 875:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the Clock Security System.
 876:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter can be: ENABLE or DISABLE.
 877:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 878:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 879:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_ClockSecuritySystemCmd(FunctionalState NewState)
 880:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 896              		.loc 2 880 0
 897              		.cfi_startproc
 898              		@ args = 0, pretend = 0, frame = 8
 899              		@ frame_needed = 1, uses_anonymous_args = 0
 900 0354 80B5     		push	{r7, lr}
 901              		.cfi_def_cfa_offset 8
 902              		.cfi_offset 7, -8
 903              		.cfi_offset 14, -4
 904 0356 82B0     		sub	sp, sp, #8
 905              		.cfi_def_cfa_offset 16
 906 0358 00AF     		add	r7, sp, #0
 907              		.cfi_def_cfa_register 7
 908 035a 0200     		movs	r2, r0
 909 035c FB1D     		adds	r3, r7, #7
 910 035e 1A70     		strb	r2, [r3]
 881:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 882:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 883:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) CR_CSSON_BB = (uint32_t)NewState;
 911              		.loc 2 883 0
 912 0360 034B     		ldr	r3, .L59
 913 0362 FA1D     		adds	r2, r7, #7
 914 0364 1278     		ldrb	r2, [r2]
 915 0366 1A60     		str	r2, [r3]
 884:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 916              		.loc 2 884 0
 917 0368 C046     		nop
 918 036a BD46     		mov	sp, r7
 919 036c 02B0     		add	sp, sp, #8
 920              		@ sp needed
 921 036e 80BD     		pop	{r7, pc}
 922              	.L60:
 923              		.align	2
 924              	.L59:
 925 0370 4C004742 		.word	1111949388
 926              		.cfi_endproc
 927              	.LFE136:
 929              		.align	1
 930              		.global	RCC_MCO1Config
 931              		.syntax unified
 932              		.code	16
 933              		.thumb_func
 934              		.fpu softvfp
 936              	RCC_MCO1Config:
 937              	.LFB137:
 885:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 886:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 887:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Selects the clock source to output on MCO1 pin(PA8).
 888:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PA8 should be configured in alternate function mode.
 889:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_MCO1Source: specifies the clock source to output.
 890:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 891:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Source_HSI: HSI clock selected as MCO1 source
 892:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Source_LSE: LSE clock selected as MCO1 source
 893:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Source_HSE: HSE clock selected as MCO1 source
 894:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Source_PLLCLK: main PLL clock selected as MCO1 source
 895:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_MCO1Div: specifies the MCO1 prescaler.
 896:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 897:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Div_1: no division applied to MCO1 clock
 898:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Div_2: division by 2 applied to MCO1 clock
 899:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Div_3: division by 3 applied to MCO1 clock
 900:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Div_4: division by 4 applied to MCO1 clock
 901:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO1Div_5: division by 5 applied to MCO1 clock
 902:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 903:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 904:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_MCO1Config(uint32_t RCC_MCO1Source, uint32_t RCC_MCO1Div)
 905:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 938              		.loc 2 905 0
 939              		.cfi_startproc
 940              		@ args = 0, pretend = 0, frame = 16
 941              		@ frame_needed = 1, uses_anonymous_args = 0
 942 0374 80B5     		push	{r7, lr}
 943              		.cfi_def_cfa_offset 8
 944              		.cfi_offset 7, -8
 945              		.cfi_offset 14, -4
 946 0376 84B0     		sub	sp, sp, #16
 947              		.cfi_def_cfa_offset 24
 948 0378 00AF     		add	r7, sp, #0
 949              		.cfi_def_cfa_register 7
 950 037a 7860     		str	r0, [r7, #4]
 951 037c 3960     		str	r1, [r7]
 906:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 952              		.loc 2 906 0
 953 037e 0023     		movs	r3, #0
 954 0380 FB60     		str	r3, [r7, #12]
 907:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 908:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 909:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_MCO1SOURCE(RCC_MCO1Source));
 910:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_MCO1DIV(RCC_MCO1Div));  
 911:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 912:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->CFGR;
 955              		.loc 2 912 0
 956 0382 0A4B     		ldr	r3, .L62
 957 0384 9B68     		ldr	r3, [r3, #8]
 958 0386 FB60     		str	r3, [r7, #12]
 913:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 914:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear MCO1[1:0] and MCO1PRE[2:0] bits */
 915:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= CFGR_MCO1_RESET_MASK;
 959              		.loc 2 915 0
 960 0388 FB68     		ldr	r3, [r7, #12]
 961 038a 094A     		ldr	r2, .L62+4
 962 038c 1340     		ands	r3, r2
 963 038e FB60     		str	r3, [r7, #12]
 916:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 917:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Select MCO1 clock source and prescaler */
 918:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_MCO1Source | RCC_MCO1Div;
 964              		.loc 2 918 0
 965 0390 7A68     		ldr	r2, [r7, #4]
 966 0392 3B68     		ldr	r3, [r7]
 967 0394 1343     		orrs	r3, r2
 968 0396 FA68     		ldr	r2, [r7, #12]
 969 0398 1343     		orrs	r3, r2
 970 039a FB60     		str	r3, [r7, #12]
 919:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 920:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
 921:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CFGR = tmpreg;
 971              		.loc 2 921 0
 972 039c 034B     		ldr	r3, .L62
 973 039e FA68     		ldr	r2, [r7, #12]
 974 03a0 9A60     		str	r2, [r3, #8]
 922:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 923:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx)
 924:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC_MCO1Cmd(ENABLE);
 925:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx */   
 926:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 975              		.loc 2 926 0
 976 03a2 C046     		nop
 977 03a4 BD46     		mov	sp, r7
 978 03a6 04B0     		add	sp, sp, #16
 979              		@ sp needed
 980 03a8 80BD     		pop	{r7, pc}
 981              	.L63:
 982 03aa C046     		.align	2
 983              	.L62:
 984 03ac 00380240 		.word	1073887232
 985 03b0 FFFF9FF8 		.word	-123731969
 986              		.cfi_endproc
 987              	.LFE137:
 989              		.align	1
 990              		.global	RCC_MCO2Config
 991              		.syntax unified
 992              		.code	16
 993              		.thumb_func
 994              		.fpu softvfp
 996              	RCC_MCO2Config:
 997              	.LFB138:
 927:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 928:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 929:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Selects the clock source to output on MCO2 pin(PC9).
 930:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   PC9 should be configured in alternate function mode.
 931:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_MCO2Source: specifies the clock source to output.
 932:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 933:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Source_SYSCLK: System clock (SYSCLK) selected as MCO2 source
 934:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2SOURCE_PLLI2SCLK: PLLI2S clock selected as MCO2 source, available for a
 935:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2SOURCE_I2SCLK: I2SCLK clock selected as MCO2 source, available only for
 936:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Source_HSE: HSE clock selected as MCO2 source
 937:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Source_PLLCLK: main PLL clock selected as MCO2 source
 938:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_MCO2Div: specifies the MCO2 prescaler.
 939:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
 940:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Div_1: no division applied to MCO2 clock
 941:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Div_2: division by 2 applied to MCO2 clock
 942:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Div_3: division by 3 applied to MCO2 clock
 943:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Div_4: division by 4 applied to MCO2 clock
 944:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_MCO2Div_5: division by 5 applied to MCO2 clock
 945:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note  For STM32F410xx devices to output I2SCLK clock on MCO2 you should have
 946:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *        at last one of the SPI clocks enabled (SPI1, SPI2 or SPI5).
 947:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
 948:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 949:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_MCO2Config(uint32_t RCC_MCO2Source, uint32_t RCC_MCO2Div)
 950:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 998              		.loc 2 950 0
 999              		.cfi_startproc
 1000              		@ args = 0, pretend = 0, frame = 16
 1001              		@ frame_needed = 1, uses_anonymous_args = 0
 1002 03b4 80B5     		push	{r7, lr}
 1003              		.cfi_def_cfa_offset 8
 1004              		.cfi_offset 7, -8
 1005              		.cfi_offset 14, -4
 1006 03b6 84B0     		sub	sp, sp, #16
 1007              		.cfi_def_cfa_offset 24
 1008 03b8 00AF     		add	r7, sp, #0
 1009              		.cfi_def_cfa_register 7
 1010 03ba 7860     		str	r0, [r7, #4]
 1011 03bc 3960     		str	r1, [r7]
 951:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1012              		.loc 2 951 0
 1013 03be 0023     		movs	r3, #0
 1014 03c0 FB60     		str	r3, [r7, #12]
 952:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 953:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
 954:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_MCO2SOURCE(RCC_MCO2Source));
 955:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_MCO2DIV(RCC_MCO2Div));
 956:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 957:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->CFGR;
 1015              		.loc 2 957 0
 1016 03c2 0A4B     		ldr	r3, .L65
 1017 03c4 9B68     		ldr	r3, [r3, #8]
 1018 03c6 FB60     		str	r3, [r7, #12]
 958:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 959:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear MCO2 and MCO2PRE[2:0] bits */
 960:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= CFGR_MCO2_RESET_MASK;
 1019              		.loc 2 960 0
 1020 03c8 FB68     		ldr	r3, [r7, #12]
 1021 03ca 5B01     		lsls	r3, r3, #5
 1022 03cc 5B09     		lsrs	r3, r3, #5
 1023 03ce FB60     		str	r3, [r7, #12]
 961:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 962:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Select MCO2 clock source and prescaler */
 963:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_MCO2Source | RCC_MCO2Div;
 1024              		.loc 2 963 0
 1025 03d0 7A68     		ldr	r2, [r7, #4]
 1026 03d2 3B68     		ldr	r3, [r7]
 1027 03d4 1343     		orrs	r3, r2
 1028 03d6 FA68     		ldr	r2, [r7, #12]
 1029 03d8 1343     		orrs	r3, r2
 1030 03da FB60     		str	r3, [r7, #12]
 964:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 965:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
 966:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CFGR = tmpreg;
 1031              		.loc 2 966 0
 1032 03dc 034B     		ldr	r3, .L65
 1033 03de FA68     		ldr	r2, [r7, #12]
 1034 03e0 9A60     		str	r2, [r3, #8]
 967:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 968:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx)
 969:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC_MCO2Cmd(ENABLE);
 970:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx */   
 971:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1035              		.loc 2 971 0
 1036 03e2 C046     		nop
 1037 03e4 BD46     		mov	sp, r7
 1038 03e6 04B0     		add	sp, sp, #16
 1039              		@ sp needed
 1040 03e8 80BD     		pop	{r7, pc}
 1041              	.L66:
 1042 03ea C046     		.align	2
 1043              	.L65:
 1044 03ec 00380240 		.word	1073887232
 1045              		.cfi_endproc
 1046              	.LFE138:
 1048              		.align	1
 1049              		.global	RCC_SYSCLKConfig
 1050              		.syntax unified
 1051              		.code	16
 1052              		.thumb_func
 1053              		.fpu softvfp
 1055              	RCC_SYSCLKConfig:
 1056              	.LFB139:
 972:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 973:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
 974:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @}
 975:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
 976:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 977:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /** @defgroup RCC_Group2 System AHB and APB busses clocks configuration functions
 978:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *  @brief   System, AHB and APB busses clocks configuration functions
 979:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *
 980:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** @verbatim   
 981:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================
 982:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       ##### System, AHB and APB busses clocks configuration functions #####
 983:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================  
 984:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     [..]
 985:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       This section provide functions allowing to configure the System, AHB, APB1 and 
 986:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       APB2 busses clocks.
 987:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
 988:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) Several clock sources can be used to drive the System clock (SYSCLK): HSI,
 989:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           HSE and PLL.
 990:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           The AHB clock (HCLK) is derived from System clock through configurable 
 991:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           prescaler and used to clock the CPU, memory and peripherals mapped 
 992:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           on AHB bus (DMA, GPIO...). APB1 (PCLK1) and APB2 (PCLK2) clocks are derived 
 993:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           from AHB clock through configurable prescalers and used to clock 
 994:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           the peripherals mapped on these busses. You can use 
 995:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           "RCC_GetClocksFreq()" function to retrieve the frequencies of these clocks.  
 996:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
 997:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       -@- All the peripheral clocks are derived from the System clock (SYSCLK) except:
 998:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****         (+@) I2S: the I2S clock can be derived either from a specific PLL (PLLI2S) or
 999:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****              from an external clock mapped on the I2S_CKIN pin. 
1000:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****              You have to use RCC_I2SCLKConfig() function to configure this clock. 
1001:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****         (+@) RTC: the RTC clock can be derived either from the LSI, LSE or HSE clock
1002:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****              divided by 2 to 31. You have to use RCC_RTCCLKConfig() and RCC_RTCCLKCmd()
1003:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****              functions to configure this clock. 
1004:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****         (+@) USB OTG FS, SDIO and RTC: USB OTG FS require a frequency equal to 48 MHz
1005:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****              to work correctly, while the SDIO require a frequency equal or lower than
1006:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****              to 48. This clock is derived of the main PLL through PLLQ divider.
1007:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****         (+@) IWDG clock which is always the LSI clock.
1008:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****        
1009:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) For STM32F405xx/407xx and STM32F415xx/417xx devices, the maximum frequency 
1010:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****          of the SYSCLK and HCLK is 168 MHz, PCLK2 84 MHz and PCLK1 42 MHz. Depending 
1011:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****          on the device voltage range, the maximum frequency should be adapted accordingly:
1012:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +-------------------------------------------------------------------------------------+
1013:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  | Latency       |                HCLK clock frequency (MHz)                           |
1014:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               |---------------------------------------------------------------------|
1015:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | voltage range  | voltage range  | voltage range   | voltage range   |
1016:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | 2.7 V - 3.6 V  | 2.4 V - 2.7 V  | 2.1 V - 2.4 V   | 1.8 V - 2.1 V   |
1017:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1018:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |0WS(1CPU cycle)|0 < HCLK <= 30  |0 < HCLK <= 24  |0 < HCLK <= 22   |0 < HCLK <= 20   |
1019:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1020:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |1WS(2CPU cycle)|30 < HCLK <= 60 |24 < HCLK <= 48 |22 < HCLK <= 44  |20 < HCLK <= 40  |
1021:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1022:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |2WS(3CPU cycle)|60 < HCLK <= 90 |48 < HCLK <= 72 |44 < HCLK <= 66  |40 < HCLK <= 60  |
1023:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1024:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |3WS(4CPU cycle)|90 < HCLK <= 120|72 < HCLK <= 96 |66 < HCLK <= 88  |60 < HCLK <= 80  |
1025:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1026:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |4WS(5CPU cycle)|120< HCLK <= 150|96 < HCLK <= 120|88 < HCLK <= 110 |80 < HCLK <= 100 |
1027:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1028:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |5WS(6CPU cycle)|150< HCLK <= 168|120< HCLK <= 144|110 < HCLK <= 132|100 < HCLK <= 120|
1029:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1030:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |6WS(7CPU cycle)|      NA        |144< HCLK <= 168|132 < HCLK <= 154|120 < HCLK <= 140|
1031:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1032:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |7WS(8CPU cycle)|      NA        |      NA        |154 < HCLK <= 168|140 < HCLK <= 160|
1033:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +---------------|----------------|----------------|-----------------|-----------------+
1034:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) For STM32F42xxx/43xxx/469xx/479xx devices, the maximum frequency of the SYSCLK and HCLK i
1035:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           PCLK2 90 MHz and PCLK1 45 MHz. Depending on the device voltage range, the maximum 
1036:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           frequency should be adapted accordingly:
1037:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +-------------------------------------------------------------------------------------+
1038:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  | Latency       |                HCLK clock frequency (MHz)                           |
1039:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               |---------------------------------------------------------------------|
1040:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | voltage range  | voltage range  | voltage range   | voltage range   |
1041:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | 2.7 V - 3.6 V  | 2.4 V - 2.7 V  | 2.1 V - 2.4 V   | 1.8 V - 2.1 V   |
1042:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1043:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |0WS(1CPU cycle)|0 < HCLK <= 30  |0 < HCLK <= 24  |0 < HCLK <= 22   |0 < HCLK <= 20   |
1044:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1045:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |1WS(2CPU cycle)|30 < HCLK <= 60 |24 < HCLK <= 48 |22 < HCLK <= 44  |20 < HCLK <= 40  |
1046:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1047:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |2WS(3CPU cycle)|60 < HCLK <= 90 |48 < HCLK <= 72 |44 < HCLK <= 66  |40 < HCLK <= 60  |
1048:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1049:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |3WS(4CPU cycle)|90 < HCLK <= 120|72 < HCLK <= 96 |66 < HCLK <= 88  |60 < HCLK <= 80  |
1050:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1051:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |4WS(5CPU cycle)|120< HCLK <= 150|96 < HCLK <= 120|88 < HCLK <= 110 |80 < HCLK <= 100 |
1052:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1053:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |5WS(6CPU cycle)|120< HCLK <= 180|120< HCLK <= 144|110 < HCLK <= 132|100 < HCLK <= 120|
1054:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1055:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |6WS(7CPU cycle)|      NA        |144< HCLK <= 168|132 < HCLK <= 154|120 < HCLK <= 140|
1056:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1057:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |7WS(8CPU cycle)|      NA        |168< HCLK <= 180|154 < HCLK <= 176|140 < HCLK <= 160|
1058:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1059:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |8WS(9CPU cycle)|      NA        |      NA        |176 < HCLK <= 180|160 < HCLK <= 168|
1060:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +-------------------------------------------------------------------------------------+
1061:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****    
1062:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) For STM32F401xx devices, the maximum frequency of the SYSCLK and HCLK is 84 MHz, 
1063:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           PCLK2 84 MHz and PCLK1 42 MHz. Depending on the device voltage range, the maximum 
1064:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           frequency should be adapted accordingly:
1065:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +-------------------------------------------------------------------------------------+
1066:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  | Latency       |                HCLK clock frequency (MHz)                           |
1067:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               |---------------------------------------------------------------------|
1068:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | voltage range  | voltage range  | voltage range   | voltage range   |
1069:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | 2.7 V - 3.6 V  | 2.4 V - 2.7 V  | 2.1 V - 2.4 V   | 1.8 V - 2.1 V   |
1070:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1071:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |0WS(1CPU cycle)|0 < HCLK <= 30  |0 < HCLK <= 24  |0 < HCLK <= 22   |0 < HCLK <= 20   |
1072:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1073:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |1WS(2CPU cycle)|30 < HCLK <= 60 |24 < HCLK <= 48 |22 < HCLK <= 44  |20 < HCLK <= 40  |
1074:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1075:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |2WS(3CPU cycle)|60 < HCLK <= 84 |48 < HCLK <= 72 |44 < HCLK <= 66  |40 < HCLK <= 60  |
1076:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1077:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |3WS(4CPU cycle)|      NA        |72 < HCLK <= 84 |66 < HCLK <= 84  |60 < HCLK <= 80  |
1078:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1079:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |4WS(5CPU cycle)|      NA        |      NA        |      NA         |80 < HCLK <= 84  |
1080:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +-------------------------------------------------------------------------------------+
1081:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1082:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) For STM32F410xx/STM32F411xE devices, the maximum frequency of the SYSCLK and HCLK is 100 
1083:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           PCLK2 100 MHz and PCLK1 50 MHz. Depending on the device voltage range, the maximum 
1084:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           frequency should be adapted accordingly:
1085:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +-------------------------------------------------------------------------------------+
1086:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  | Latency       |                HCLK clock frequency (MHz)                           |
1087:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               |---------------------------------------------------------------------|
1088:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | voltage range  | voltage range  | voltage range   | voltage range   |
1089:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |               | 2.7 V - 3.6 V  | 2.4 V - 2.7 V  | 2.1 V - 2.4 V   | 1.8 V - 2.1 V   |
1090:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1091:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |0WS(1CPU cycle)|0 < HCLK <= 30  |0 < HCLK <= 24  |0 < HCLK <= 18   |0 < HCLK <= 16   |
1092:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1093:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |1WS(2CPU cycle)|30 < HCLK <= 64 |24 < HCLK <= 48 |18 < HCLK <= 36  |16 < HCLK <= 32  |
1094:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1095:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |2WS(3CPU cycle)|64 < HCLK <= 90 |48 < HCLK <= 72 |36 < HCLK <= 54  |32 < HCLK <= 48  |
1096:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1097:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |3WS(4CPU cycle)|90 < HCLK <= 100|72 < HCLK <= 96 |54 < HCLK <= 72  |48 < HCLK <= 64  |
1098:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1099:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |4WS(5CPU cycle)|      NA        |96 < HCLK <= 100|72 < HCLK <= 90  |64 < HCLK <= 80  |
1100:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1101:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |5WS(6CPU cycle)|      NA        |       NA       |90 < HCLK <= 100 |80 < HCLK <= 96  |
1102:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |---------------|----------------|----------------|-----------------|-----------------|
1103:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  |6WS(7CPU cycle)|      NA        |       NA       |        NA       |96 < HCLK <= 100 |
1104:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  +-------------------------------------------------------------------------------------+
1105:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1106:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       -@- On STM32F405xx/407xx and STM32F415xx/417xx devices: 
1107:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS = '0', the maximum value of fHCLK = 144MHz. 
1108:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS = '1', the maximum value of fHCLK = 168MHz. 
1109:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           [..] 
1110:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           On STM32F42xxx/43xxx/469xx/479xx devices:
1111:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x01', the maximum value of fHCLK is 120MHz.
1112:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x10', the maximum value of fHCLK is 144MHz.
1113:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x11', the maximum value of f  is 168MHz 
1114:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           [..]  
1115:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           On STM32F401x devices:
1116:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x01', the maximum value of fHCLK is 64MHz.
1117:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x10', the maximum value of fHCLK is 84MHz.
1118:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           On STM32F410xx/STM32F411xE devices:
1119:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x01' the maximum value of fHCLK is 64MHz.
1120:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x10' the maximum value of fHCLK is 84MHz.
1121:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****            (++) when VOS[1:0] = '0x11' the maximum value of fHCLK is 100MHz.
1122:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1123:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****        You can use PWR_MainRegulatorModeConfig() function to control VOS bits.
1124:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1125:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** @endverbatim
1126:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @{
1127:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1128:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1129:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1130:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the system clock (SYSCLK).
1131:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The HSI is used (enabled by hardware) as system clock source after
1132:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         startup from Reset, wake-up from STOP and STANDBY mode, or in case
1133:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of failure of the HSE used directly or indirectly as system clock
1134:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         (if the Clock Security System CSS is enabled).
1135:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   A switch from one clock source to another occurs only if the target
1136:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         clock source is ready (clock stable after startup delay or PLL locked). 
1137:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         If a clock source which is not yet ready is selected, the switch will
1138:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         occur when the clock source will be ready. 
1139:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         You can use RCC_GetSYSCLKSource() function to know which clock is
1140:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         currently used as system clock source. 
1141:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SYSCLKSource: specifies the clock source used as system clock.
1142:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1143:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLKSource_HSI: HSI selected as system clock source
1144:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLKSource_HSE: HSE selected as system clock source
1145:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLKSource_PLLCLK: PLL selected as system clock source (RCC_SYSCLKSource_
1146:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLKSource_PLLRCLK: PLL R selected as system clock source only for STM32F
1147:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1148:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1149:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SYSCLKConfig(uint32_t RCC_SYSCLKSource)
1150:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1057              		.loc 2 1150 0
 1058              		.cfi_startproc
 1059              		@ args = 0, pretend = 0, frame = 16
 1060              		@ frame_needed = 1, uses_anonymous_args = 0
 1061 03f0 80B5     		push	{r7, lr}
 1062              		.cfi_def_cfa_offset 8
 1063              		.cfi_offset 7, -8
 1064              		.cfi_offset 14, -4
 1065 03f2 84B0     		sub	sp, sp, #16
 1066              		.cfi_def_cfa_offset 24
 1067 03f4 00AF     		add	r7, sp, #0
 1068              		.cfi_def_cfa_register 7
 1069 03f6 7860     		str	r0, [r7, #4]
1151:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1070              		.loc 2 1151 0
 1071 03f8 0023     		movs	r3, #0
 1072 03fa FB60     		str	r3, [r7, #12]
1152:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1153:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1154:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SYSCLK_SOURCE(RCC_SYSCLKSource));
1155:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1156:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->CFGR;
 1073              		.loc 2 1156 0
 1074 03fc 084B     		ldr	r3, .L68
 1075 03fe 9B68     		ldr	r3, [r3, #8]
 1076 0400 FB60     		str	r3, [r7, #12]
1157:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1158:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear SW[1:0] bits */
1159:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_CFGR_SW;
 1077              		.loc 2 1159 0
 1078 0402 FB68     		ldr	r3, [r7, #12]
 1079 0404 0322     		movs	r2, #3
 1080 0406 9343     		bics	r3, r2
 1081 0408 FB60     		str	r3, [r7, #12]
1160:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1161:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set SW[1:0] bits according to RCC_SYSCLKSource value */
1162:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_SYSCLKSource;
 1082              		.loc 2 1162 0
 1083 040a FA68     		ldr	r2, [r7, #12]
 1084 040c 7B68     		ldr	r3, [r7, #4]
 1085 040e 1343     		orrs	r3, r2
 1086 0410 FB60     		str	r3, [r7, #12]
1163:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1164:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1165:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CFGR = tmpreg;
 1087              		.loc 2 1165 0
 1088 0412 034B     		ldr	r3, .L68
 1089 0414 FA68     		ldr	r2, [r7, #12]
 1090 0416 9A60     		str	r2, [r3, #8]
1166:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1091              		.loc 2 1166 0
 1092 0418 C046     		nop
 1093 041a BD46     		mov	sp, r7
 1094 041c 04B0     		add	sp, sp, #16
 1095              		@ sp needed
 1096 041e 80BD     		pop	{r7, pc}
 1097              	.L69:
 1098              		.align	2
 1099              	.L68:
 1100 0420 00380240 		.word	1073887232
 1101              		.cfi_endproc
 1102              	.LFE139:
 1104              		.align	1
 1105              		.global	RCC_GetSYSCLKSource
 1106              		.syntax unified
 1107              		.code	16
 1108              		.thumb_func
 1109              		.fpu softvfp
 1111              	RCC_GetSYSCLKSource:
 1112              	.LFB140:
1167:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1168:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1169:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Returns the clock source used as system clock.
1170:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  None
1171:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval The clock source used as system clock. The returned value can be one
1172:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         of the following:
1173:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              - 0x00: HSI used as system clock
1174:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              - 0x04: HSE used as system clock
1175:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              - 0x08: PLL used as system clock (PLL P for STM32F446xx devices)
1176:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              - 0x0C: PLL R used as system clock (only for STM32F412xG, STM32F413_423xx and STM3
1177:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1178:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** uint8_t RCC_GetSYSCLKSource(void)
1179:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1113              		.loc 2 1179 0
 1114              		.cfi_startproc
 1115              		@ args = 0, pretend = 0, frame = 0
 1116              		@ frame_needed = 1, uses_anonymous_args = 0
 1117 0424 80B5     		push	{r7, lr}
 1118              		.cfi_def_cfa_offset 8
 1119              		.cfi_offset 7, -8
 1120              		.cfi_offset 14, -4
 1121 0426 00AF     		add	r7, sp, #0
 1122              		.cfi_def_cfa_register 7
1180:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   return ((uint8_t)(RCC->CFGR & RCC_CFGR_SWS));
 1123              		.loc 2 1180 0
 1124 0428 044B     		ldr	r3, .L72
 1125 042a 9B68     		ldr	r3, [r3, #8]
 1126 042c DBB2     		uxtb	r3, r3
 1127 042e 0C22     		movs	r2, #12
 1128 0430 1340     		ands	r3, r2
 1129 0432 DBB2     		uxtb	r3, r3
1181:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1130              		.loc 2 1181 0
 1131 0434 1800     		movs	r0, r3
 1132 0436 BD46     		mov	sp, r7
 1133              		@ sp needed
 1134 0438 80BD     		pop	{r7, pc}
 1135              	.L73:
 1136 043a C046     		.align	2
 1137              	.L72:
 1138 043c 00380240 		.word	1073887232
 1139              		.cfi_endproc
 1140              	.LFE140:
 1142              		.align	1
 1143              		.global	RCC_HCLKConfig
 1144              		.syntax unified
 1145              		.code	16
 1146              		.thumb_func
 1147              		.fpu softvfp
 1149              	RCC_HCLKConfig:
 1150              	.LFB141:
1182:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1183:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1184:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the AHB clock (HCLK).
1185:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Depending on the device voltage range, the software has to set correctly
1186:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         these bits to ensure that HCLK not exceed the maximum allowed frequency
1187:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         (for more details refer to section above
1188:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           "CPU, AHB and APB busses clocks configuration functions")
1189:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SYSCLK: defines the AHB clock divider. This clock is derived from 
1190:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the system clock (SYSCLK).
1191:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1192:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div1: AHB clock = SYSCLK
1193:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div2: AHB clock = SYSCLK/2
1194:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div4: AHB clock = SYSCLK/4
1195:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div8: AHB clock = SYSCLK/8
1196:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div16: AHB clock = SYSCLK/16
1197:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div64: AHB clock = SYSCLK/64
1198:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div128: AHB clock = SYSCLK/128
1199:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div256: AHB clock = SYSCLK/256
1200:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SYSCLK_Div512: AHB clock = SYSCLK/512
1201:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1202:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1203:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_HCLKConfig(uint32_t RCC_SYSCLK)
1204:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1151              		.loc 2 1204 0
 1152              		.cfi_startproc
 1153              		@ args = 0, pretend = 0, frame = 16
 1154              		@ frame_needed = 1, uses_anonymous_args = 0
 1155 0440 80B5     		push	{r7, lr}
 1156              		.cfi_def_cfa_offset 8
 1157              		.cfi_offset 7, -8
 1158              		.cfi_offset 14, -4
 1159 0442 84B0     		sub	sp, sp, #16
 1160              		.cfi_def_cfa_offset 24
 1161 0444 00AF     		add	r7, sp, #0
 1162              		.cfi_def_cfa_register 7
 1163 0446 7860     		str	r0, [r7, #4]
1205:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1164              		.loc 2 1205 0
 1165 0448 0023     		movs	r3, #0
 1166 044a FB60     		str	r3, [r7, #12]
1206:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1207:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1208:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_HCLK(RCC_SYSCLK));
1209:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1210:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->CFGR;
 1167              		.loc 2 1210 0
 1168 044c 084B     		ldr	r3, .L75
 1169 044e 9B68     		ldr	r3, [r3, #8]
 1170 0450 FB60     		str	r3, [r7, #12]
1211:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1212:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear HPRE[3:0] bits */
1213:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_CFGR_HPRE;
 1171              		.loc 2 1213 0
 1172 0452 FB68     		ldr	r3, [r7, #12]
 1173 0454 F022     		movs	r2, #240
 1174 0456 9343     		bics	r3, r2
 1175 0458 FB60     		str	r3, [r7, #12]
1214:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1215:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set HPRE[3:0] bits according to RCC_SYSCLK value */
1216:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_SYSCLK;
 1176              		.loc 2 1216 0
 1177 045a FA68     		ldr	r2, [r7, #12]
 1178 045c 7B68     		ldr	r3, [r7, #4]
 1179 045e 1343     		orrs	r3, r2
 1180 0460 FB60     		str	r3, [r7, #12]
1217:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1218:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1219:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CFGR = tmpreg;
 1181              		.loc 2 1219 0
 1182 0462 034B     		ldr	r3, .L75
 1183 0464 FA68     		ldr	r2, [r7, #12]
 1184 0466 9A60     		str	r2, [r3, #8]
1220:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1185              		.loc 2 1220 0
 1186 0468 C046     		nop
 1187 046a BD46     		mov	sp, r7
 1188 046c 04B0     		add	sp, sp, #16
 1189              		@ sp needed
 1190 046e 80BD     		pop	{r7, pc}
 1191              	.L76:
 1192              		.align	2
 1193              	.L75:
 1194 0470 00380240 		.word	1073887232
 1195              		.cfi_endproc
 1196              	.LFE141:
 1198              		.align	1
 1199              		.global	RCC_PCLK1Config
 1200              		.syntax unified
 1201              		.code	16
 1202              		.thumb_func
 1203              		.fpu softvfp
 1205              	RCC_PCLK1Config:
 1206              	.LFB142:
1221:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1222:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1223:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the Low Speed APB clock (PCLK1).
1224:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_HCLK: defines the APB1 clock divider. This clock is derived from 
1225:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the AHB clock (HCLK).
1226:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1227:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div1:  APB1 clock = HCLK
1228:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div2:  APB1 clock = HCLK/2
1229:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div4:  APB1 clock = HCLK/4
1230:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div8:  APB1 clock = HCLK/8
1231:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div16: APB1 clock = HCLK/16
1232:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1233:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1234:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PCLK1Config(uint32_t RCC_HCLK)
1235:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1207              		.loc 2 1235 0
 1208              		.cfi_startproc
 1209              		@ args = 0, pretend = 0, frame = 16
 1210              		@ frame_needed = 1, uses_anonymous_args = 0
 1211 0474 80B5     		push	{r7, lr}
 1212              		.cfi_def_cfa_offset 8
 1213              		.cfi_offset 7, -8
 1214              		.cfi_offset 14, -4
 1215 0476 84B0     		sub	sp, sp, #16
 1216              		.cfi_def_cfa_offset 24
 1217 0478 00AF     		add	r7, sp, #0
 1218              		.cfi_def_cfa_register 7
 1219 047a 7860     		str	r0, [r7, #4]
1236:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1220              		.loc 2 1236 0
 1221 047c 0023     		movs	r3, #0
 1222 047e FB60     		str	r3, [r7, #12]
1237:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1238:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1239:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PCLK(RCC_HCLK));
1240:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1241:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->CFGR;
 1223              		.loc 2 1241 0
 1224 0480 084B     		ldr	r3, .L78
 1225 0482 9B68     		ldr	r3, [r3, #8]
 1226 0484 FB60     		str	r3, [r7, #12]
1242:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1243:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear PPRE1[2:0] bits */
1244:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_CFGR_PPRE1;
 1227              		.loc 2 1244 0
 1228 0486 FB68     		ldr	r3, [r7, #12]
 1229 0488 074A     		ldr	r2, .L78+4
 1230 048a 1340     		ands	r3, r2
 1231 048c FB60     		str	r3, [r7, #12]
1245:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1246:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set PPRE1[2:0] bits according to RCC_HCLK value */
1247:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_HCLK;
 1232              		.loc 2 1247 0
 1233 048e FA68     		ldr	r2, [r7, #12]
 1234 0490 7B68     		ldr	r3, [r7, #4]
 1235 0492 1343     		orrs	r3, r2
 1236 0494 FB60     		str	r3, [r7, #12]
1248:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1249:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1250:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CFGR = tmpreg;
 1237              		.loc 2 1250 0
 1238 0496 034B     		ldr	r3, .L78
 1239 0498 FA68     		ldr	r2, [r7, #12]
 1240 049a 9A60     		str	r2, [r3, #8]
1251:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1241              		.loc 2 1251 0
 1242 049c C046     		nop
 1243 049e BD46     		mov	sp, r7
 1244 04a0 04B0     		add	sp, sp, #16
 1245              		@ sp needed
 1246 04a2 80BD     		pop	{r7, pc}
 1247              	.L79:
 1248              		.align	2
 1249              	.L78:
 1250 04a4 00380240 		.word	1073887232
 1251 04a8 FFE3FFFF 		.word	-7169
 1252              		.cfi_endproc
 1253              	.LFE142:
 1255              		.align	1
 1256              		.global	RCC_PCLK2Config
 1257              		.syntax unified
 1258              		.code	16
 1259              		.thumb_func
 1260              		.fpu softvfp
 1262              	RCC_PCLK2Config:
 1263              	.LFB143:
1252:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1253:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1254:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the High Speed APB clock (PCLK2).
1255:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_HCLK: defines the APB2 clock divider. This clock is derived from 
1256:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the AHB clock (HCLK).
1257:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1258:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div1:  APB2 clock = HCLK
1259:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div2:  APB2 clock = HCLK/2
1260:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div4:  APB2 clock = HCLK/4
1261:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div8:  APB2 clock = HCLK/8
1262:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_HCLK_Div16: APB2 clock = HCLK/16
1263:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1264:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1265:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_PCLK2Config(uint32_t RCC_HCLK)
1266:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1264              		.loc 2 1266 0
 1265              		.cfi_startproc
 1266              		@ args = 0, pretend = 0, frame = 16
 1267              		@ frame_needed = 1, uses_anonymous_args = 0
 1268 04ac 80B5     		push	{r7, lr}
 1269              		.cfi_def_cfa_offset 8
 1270              		.cfi_offset 7, -8
 1271              		.cfi_offset 14, -4
 1272 04ae 84B0     		sub	sp, sp, #16
 1273              		.cfi_def_cfa_offset 24
 1274 04b0 00AF     		add	r7, sp, #0
 1275              		.cfi_def_cfa_register 7
 1276 04b2 7860     		str	r0, [r7, #4]
1267:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1277              		.loc 2 1267 0
 1278 04b4 0023     		movs	r3, #0
 1279 04b6 FB60     		str	r3, [r7, #12]
1268:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1269:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1270:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PCLK(RCC_HCLK));
1271:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1272:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->CFGR;
 1280              		.loc 2 1272 0
 1281 04b8 094B     		ldr	r3, .L81
 1282 04ba 9B68     		ldr	r3, [r3, #8]
 1283 04bc FB60     		str	r3, [r7, #12]
1273:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1274:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear PPRE2[2:0] bits */
1275:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_CFGR_PPRE2;
 1284              		.loc 2 1275 0
 1285 04be FB68     		ldr	r3, [r7, #12]
 1286 04c0 084A     		ldr	r2, .L81+4
 1287 04c2 1340     		ands	r3, r2
 1288 04c4 FB60     		str	r3, [r7, #12]
1276:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1277:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set PPRE2[2:0] bits according to RCC_HCLK value */
1278:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_HCLK << 3;
 1289              		.loc 2 1278 0
 1290 04c6 7B68     		ldr	r3, [r7, #4]
 1291 04c8 DB00     		lsls	r3, r3, #3
 1292 04ca FA68     		ldr	r2, [r7, #12]
 1293 04cc 1343     		orrs	r3, r2
 1294 04ce FB60     		str	r3, [r7, #12]
1279:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1280:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1281:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CFGR = tmpreg;
 1295              		.loc 2 1281 0
 1296 04d0 034B     		ldr	r3, .L81
 1297 04d2 FA68     		ldr	r2, [r7, #12]
 1298 04d4 9A60     		str	r2, [r3, #8]
1282:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1299              		.loc 2 1282 0
 1300 04d6 C046     		nop
 1301 04d8 BD46     		mov	sp, r7
 1302 04da 04B0     		add	sp, sp, #16
 1303              		@ sp needed
 1304 04dc 80BD     		pop	{r7, pc}
 1305              	.L82:
 1306 04de C046     		.align	2
 1307              	.L81:
 1308 04e0 00380240 		.word	1073887232
 1309 04e4 FF1FFFFF 		.word	-57345
 1310              		.cfi_endproc
 1311              	.LFE143:
 1313              		.global	__aeabi_uidiv
 1314              		.align	1
 1315              		.global	RCC_GetClocksFreq
 1316              		.syntax unified
 1317              		.code	16
 1318              		.thumb_func
 1319              		.fpu softvfp
 1321              	RCC_GetClocksFreq:
 1322              	.LFB144:
1283:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1284:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1285:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Returns the frequencies of different on chip clocks; SYSCLK, HCLK, 
1286:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         PCLK1 and PCLK2.
1287:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1288:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The system frequency computed by this function is not the real 
1289:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         frequency in the chip. It is calculated based on the predefined 
1290:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         constant and the selected clock source:
1291:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note     If SYSCLK source is HSI, function returns values based on HSI_VALUE(*)
1292:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note     If SYSCLK source is HSE, function returns values based on HSE_VALUE(**)
1293:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note     If SYSCLK source is PLL, function returns values based on HSE_VALUE(**) 
1294:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           or HSI_VALUE(*) multiplied/divided by the PLL factors.         
1295:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note     (*) HSI_VALUE is a constant defined in stm32f4xx.h file (default value
1296:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *               16 MHz) but the real value may vary depending on the variations
1297:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *               in voltage and temperature.
1298:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note     (**) HSE_VALUE is a constant defined in stm32f4xx.h file (default value
1299:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                25 MHz), user has to ensure that HSE_VALUE is same as the real
1300:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                frequency of the crystal used. Otherwise, this function may
1301:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                have wrong result.
1302:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                
1303:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The result of this function could be not correct when using fractional
1304:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         value for HSE crystal.
1305:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
1306:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_Clocks: pointer to a RCC_ClocksTypeDef structure which will hold
1307:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          the clocks frequencies.
1308:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *     
1309:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used by the user application to compute the 
1310:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         baudrate for the communication peripherals or configure other parameters.
1311:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Each time SYSCLK, HCLK, PCLK1 and/or PCLK2 clock changes, this function
1312:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         must be called to update the structure's field. Otherwise, any
1313:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         configuration based on this function will be incorrect.
1314:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *    
1315:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1316:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1317:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_GetClocksFreq(RCC_ClocksTypeDef* RCC_Clocks)
1318:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1323              		.loc 2 1318 0
 1324              		.cfi_startproc
 1325              		@ args = 0, pretend = 0, frame = 32
 1326              		@ frame_needed = 1, uses_anonymous_args = 0
 1327 04e8 80B5     		push	{r7, lr}
 1328              		.cfi_def_cfa_offset 8
 1329              		.cfi_offset 7, -8
 1330              		.cfi_offset 14, -4
 1331 04ea 88B0     		sub	sp, sp, #32
 1332              		.cfi_def_cfa_offset 40
 1333 04ec 00AF     		add	r7, sp, #0
 1334              		.cfi_def_cfa_register 7
 1335 04ee 7860     		str	r0, [r7, #4]
1319:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmp = 0, presc = 0, pllvco = 0, pllp = 2, pllsource = 0, pllm = 2;
 1336              		.loc 2 1319 0
 1337 04f0 0023     		movs	r3, #0
 1338 04f2 BB61     		str	r3, [r7, #24]
 1339 04f4 0023     		movs	r3, #0
 1340 04f6 7B61     		str	r3, [r7, #20]
 1341 04f8 0023     		movs	r3, #0
 1342 04fa FB61     		str	r3, [r7, #28]
 1343 04fc 0223     		movs	r3, #2
 1344 04fe 3B61     		str	r3, [r7, #16]
 1345 0500 0023     		movs	r3, #0
 1346 0502 FB60     		str	r3, [r7, #12]
 1347 0504 0223     		movs	r3, #2
 1348 0506 BB60     		str	r3, [r7, #8]
1320:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F446xx)  
1321:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t pllr = 2;
1322:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F412xG || STM32F413_423xx || STM32F446xx */
1323:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1324:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Get SYSCLK source -------------------------------------------------------*/
1325:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = RCC->CFGR & RCC_CFGR_SWS;
 1349              		.loc 2 1325 0
 1350 0508 494B     		ldr	r3, .L92
 1351 050a 9B68     		ldr	r3, [r3, #8]
 1352 050c 0C22     		movs	r2, #12
 1353 050e 1340     		ands	r3, r2
 1354 0510 BB61     		str	r3, [r7, #24]
1326:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1327:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   switch (tmp)
 1355              		.loc 2 1327 0
 1356 0512 BB69     		ldr	r3, [r7, #24]
 1357 0514 042B     		cmp	r3, #4
 1358 0516 07D0     		beq	.L85
 1359 0518 082B     		cmp	r3, #8
 1360 051a 09D0     		beq	.L86
 1361 051c 002B     		cmp	r3, #0
 1362 051e 41D1     		bne	.L91
1328:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
1329:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   case 0x00:  /* HSI used as system clock source */
1330:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC_Clocks->SYSCLK_Frequency = HSI_VALUE;
 1363              		.loc 2 1330 0
 1364 0520 7B68     		ldr	r3, [r7, #4]
 1365 0522 444A     		ldr	r2, .L92+4
 1366 0524 1A60     		str	r2, [r3]
1331:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     break;
 1367              		.loc 2 1331 0
 1368 0526 41E0     		b	.L88
 1369              	.L85:
1332:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   case 0x04:  /* HSE used as system clock  source */
1333:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC_Clocks->SYSCLK_Frequency = HSE_VALUE;
 1370              		.loc 2 1333 0
 1371 0528 7B68     		ldr	r3, [r7, #4]
 1372 052a 434A     		ldr	r2, .L92+8
 1373 052c 1A60     		str	r2, [r3]
1334:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     break;
 1374              		.loc 2 1334 0
 1375 052e 3DE0     		b	.L88
 1376              	.L86:
1335:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   case 0x08:  /* PLL P used as system clock  source */
1336:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
1337:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* PLL_VCO = (HSE_VALUE or HSI_VALUE / PLLM) * PLLN
1338:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SYSCLK = PLL_VCO / PLLP
1339:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     */    
1340:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     pllsource = (RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) >> 22;
 1377              		.loc 2 1340 0
 1378 0530 3F4B     		ldr	r3, .L92
 1379 0532 5B68     		ldr	r3, [r3, #4]
 1380 0534 9B0D     		lsrs	r3, r3, #22
 1381 0536 0122     		movs	r2, #1
 1382 0538 1340     		ands	r3, r2
 1383 053a FB60     		str	r3, [r7, #12]
1341:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     pllm = RCC->PLLCFGR & RCC_PLLCFGR_PLLM;
 1384              		.loc 2 1341 0
 1385 053c 3C4B     		ldr	r3, .L92
 1386 053e 5B68     		ldr	r3, [r3, #4]
 1387 0540 3F22     		movs	r2, #63
 1388 0542 1340     		ands	r3, r2
 1389 0544 BB60     		str	r3, [r7, #8]
1342:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
1343:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     if (pllsource != 0)
 1390              		.loc 2 1343 0
 1391 0546 FB68     		ldr	r3, [r7, #12]
 1392 0548 002B     		cmp	r3, #0
 1393 054a 0DD0     		beq	.L89
1344:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     {
1345:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       /* HSE used as PLL clock source */
1346:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       pllvco = (HSE_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
 1394              		.loc 2 1346 0
 1395 054c B968     		ldr	r1, [r7, #8]
 1396 054e 3A48     		ldr	r0, .L92+8
 1397 0550 FFF7FEFF 		bl	__aeabi_uidiv
 1398              	.LVL0:
 1399 0554 0300     		movs	r3, r0
 1400 0556 1A00     		movs	r2, r3
 1401 0558 354B     		ldr	r3, .L92
 1402 055a 5B68     		ldr	r3, [r3, #4]
 1403 055c 9B09     		lsrs	r3, r3, #6
 1404 055e DB05     		lsls	r3, r3, #23
 1405 0560 DB0D     		lsrs	r3, r3, #23
 1406 0562 5343     		muls	r3, r2
 1407 0564 FB61     		str	r3, [r7, #28]
 1408 0566 0CE0     		b	.L90
 1409              	.L89:
1347:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     }
1348:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     else
1349:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     {
1350:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       /* HSI used as PLL clock source */
1351:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       pllvco = (HSI_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);      
 1410              		.loc 2 1351 0
 1411 0568 B968     		ldr	r1, [r7, #8]
 1412 056a 3248     		ldr	r0, .L92+4
 1413 056c FFF7FEFF 		bl	__aeabi_uidiv
 1414              	.LVL1:
 1415 0570 0300     		movs	r3, r0
 1416 0572 1A00     		movs	r2, r3
 1417 0574 2E4B     		ldr	r3, .L92
 1418 0576 5B68     		ldr	r3, [r3, #4]
 1419 0578 9B09     		lsrs	r3, r3, #6
 1420 057a DB05     		lsls	r3, r3, #23
 1421 057c DB0D     		lsrs	r3, r3, #23
 1422 057e 5343     		muls	r3, r2
 1423 0580 FB61     		str	r3, [r7, #28]
 1424              	.L90:
1352:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     }
1353:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
1354:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     pllp = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLP) >>16) + 1 ) *2;
 1425              		.loc 2 1354 0
 1426 0582 2B4B     		ldr	r3, .L92
 1427 0584 5B68     		ldr	r3, [r3, #4]
 1428 0586 1B0C     		lsrs	r3, r3, #16
 1429 0588 0322     		movs	r2, #3
 1430 058a 1340     		ands	r3, r2
 1431 058c 0133     		adds	r3, r3, #1
 1432 058e 5B00     		lsls	r3, r3, #1
 1433 0590 3B61     		str	r3, [r7, #16]
1355:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC_Clocks->SYSCLK_Frequency = pllvco/pllp;
 1434              		.loc 2 1355 0
 1435 0592 3969     		ldr	r1, [r7, #16]
 1436 0594 F869     		ldr	r0, [r7, #28]
 1437 0596 FFF7FEFF 		bl	__aeabi_uidiv
 1438              	.LVL2:
 1439 059a 0300     		movs	r3, r0
 1440 059c 1A00     		movs	r2, r3
 1441 059e 7B68     		ldr	r3, [r7, #4]
 1442 05a0 1A60     		str	r2, [r3]
1356:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     break;
 1443              		.loc 2 1356 0
 1444 05a2 03E0     		b	.L88
 1445              	.L91:
1357:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1358:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F446xx)
1359:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   case 0x0C:  /* PLL R used as system clock  source */
1360:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* PLL_VCO = (HSE_VALUE or HSI_VALUE / PLLM) * PLLN
1361:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SYSCLK = PLL_VCO / PLLR
1362:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     */    
1363:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     pllsource = (RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) >> 22;
1364:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     pllm = RCC->PLLCFGR & RCC_PLLCFGR_PLLM;
1365:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
1366:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     if (pllsource != 0)
1367:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     {
1368:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       /* HSE used as PLL clock source */
1369:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       pllvco = (HSE_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);
1370:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     }
1371:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     else
1372:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     {
1373:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       /* HSI used as PLL clock source */
1374:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       pllvco = (HSI_VALUE / pllm) * ((RCC->PLLCFGR & RCC_PLLCFGR_PLLN) >> 6);      
1375:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     }
1376:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
1377:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     pllr = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLR) >>28) + 1 ) *2;
1378:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC_Clocks->SYSCLK_Frequency = pllvco/pllr;    
1379:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     break;
1380:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F412xG || STM32F413_423xx || STM32F446xx */
1381:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
1382:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   default:
1383:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC_Clocks->SYSCLK_Frequency = HSI_VALUE;
 1446              		.loc 2 1383 0
 1447 05a4 7B68     		ldr	r3, [r7, #4]
 1448 05a6 234A     		ldr	r2, .L92+4
 1449 05a8 1A60     		str	r2, [r3]
1384:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     break;
 1450              		.loc 2 1384 0
 1451 05aa C046     		nop
 1452              	.L88:
1385:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
1386:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Compute HCLK, PCLK1 and PCLK2 clocks frequencies ------------------------*/
1387:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1388:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Get HCLK prescaler */
1389:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = RCC->CFGR & RCC_CFGR_HPRE;
 1453              		.loc 2 1389 0
 1454 05ac 204B     		ldr	r3, .L92
 1455 05ae 9B68     		ldr	r3, [r3, #8]
 1456 05b0 F022     		movs	r2, #240
 1457 05b2 1340     		ands	r3, r2
 1458 05b4 BB61     		str	r3, [r7, #24]
1390:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = tmp >> 4;
 1459              		.loc 2 1390 0
 1460 05b6 BB69     		ldr	r3, [r7, #24]
 1461 05b8 1B09     		lsrs	r3, r3, #4
 1462 05ba BB61     		str	r3, [r7, #24]
1391:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   presc = APBAHBPrescTable[tmp];
 1463              		.loc 2 1391 0
 1464 05bc 1F4A     		ldr	r2, .L92+12
 1465 05be BB69     		ldr	r3, [r7, #24]
 1466 05c0 D318     		adds	r3, r2, r3
 1467 05c2 1B78     		ldrb	r3, [r3]
 1468 05c4 DBB2     		uxtb	r3, r3
 1469 05c6 7B61     		str	r3, [r7, #20]
1392:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* HCLK clock frequency */
1393:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC_Clocks->HCLK_Frequency = RCC_Clocks->SYSCLK_Frequency >> presc;
 1470              		.loc 2 1393 0
 1471 05c8 7B68     		ldr	r3, [r7, #4]
 1472 05ca 1A68     		ldr	r2, [r3]
 1473 05cc 7B69     		ldr	r3, [r7, #20]
 1474 05ce DA40     		lsrs	r2, r2, r3
 1475 05d0 7B68     		ldr	r3, [r7, #4]
 1476 05d2 5A60     		str	r2, [r3, #4]
1394:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1395:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Get PCLK1 prescaler */
1396:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = RCC->CFGR & RCC_CFGR_PPRE1;
 1477              		.loc 2 1396 0
 1478 05d4 164B     		ldr	r3, .L92
 1479 05d6 9A68     		ldr	r2, [r3, #8]
 1480 05d8 E023     		movs	r3, #224
 1481 05da 5B01     		lsls	r3, r3, #5
 1482 05dc 1340     		ands	r3, r2
 1483 05de BB61     		str	r3, [r7, #24]
1397:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = tmp >> 10;
 1484              		.loc 2 1397 0
 1485 05e0 BB69     		ldr	r3, [r7, #24]
 1486 05e2 9B0A     		lsrs	r3, r3, #10
 1487 05e4 BB61     		str	r3, [r7, #24]
1398:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   presc = APBAHBPrescTable[tmp];
 1488              		.loc 2 1398 0
 1489 05e6 154A     		ldr	r2, .L92+12
 1490 05e8 BB69     		ldr	r3, [r7, #24]
 1491 05ea D318     		adds	r3, r2, r3
 1492 05ec 1B78     		ldrb	r3, [r3]
 1493 05ee DBB2     		uxtb	r3, r3
 1494 05f0 7B61     		str	r3, [r7, #20]
1399:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* PCLK1 clock frequency */
1400:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC_Clocks->PCLK1_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
 1495              		.loc 2 1400 0
 1496 05f2 7B68     		ldr	r3, [r7, #4]
 1497 05f4 5A68     		ldr	r2, [r3, #4]
 1498 05f6 7B69     		ldr	r3, [r7, #20]
 1499 05f8 DA40     		lsrs	r2, r2, r3
 1500 05fa 7B68     		ldr	r3, [r7, #4]
 1501 05fc 9A60     		str	r2, [r3, #8]
1401:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1402:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Get PCLK2 prescaler */
1403:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = RCC->CFGR & RCC_CFGR_PPRE2;
 1502              		.loc 2 1403 0
 1503 05fe 0C4B     		ldr	r3, .L92
 1504 0600 9A68     		ldr	r2, [r3, #8]
 1505 0602 E023     		movs	r3, #224
 1506 0604 1B02     		lsls	r3, r3, #8
 1507 0606 1340     		ands	r3, r2
 1508 0608 BB61     		str	r3, [r7, #24]
1404:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = tmp >> 13;
 1509              		.loc 2 1404 0
 1510 060a BB69     		ldr	r3, [r7, #24]
 1511 060c 5B0B     		lsrs	r3, r3, #13
 1512 060e BB61     		str	r3, [r7, #24]
1405:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   presc = APBAHBPrescTable[tmp];
 1513              		.loc 2 1405 0
 1514 0610 0A4A     		ldr	r2, .L92+12
 1515 0612 BB69     		ldr	r3, [r7, #24]
 1516 0614 D318     		adds	r3, r2, r3
 1517 0616 1B78     		ldrb	r3, [r3]
 1518 0618 DBB2     		uxtb	r3, r3
 1519 061a 7B61     		str	r3, [r7, #20]
1406:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* PCLK2 clock frequency */
1407:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC_Clocks->PCLK2_Frequency = RCC_Clocks->HCLK_Frequency >> presc;
 1520              		.loc 2 1407 0
 1521 061c 7B68     		ldr	r3, [r7, #4]
 1522 061e 5A68     		ldr	r2, [r3, #4]
 1523 0620 7B69     		ldr	r3, [r7, #20]
 1524 0622 DA40     		lsrs	r2, r2, r3
 1525 0624 7B68     		ldr	r3, [r7, #4]
 1526 0626 DA60     		str	r2, [r3, #12]
1408:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1527              		.loc 2 1408 0
 1528 0628 C046     		nop
 1529 062a BD46     		mov	sp, r7
 1530 062c 08B0     		add	sp, sp, #32
 1531              		@ sp needed
 1532 062e 80BD     		pop	{r7, pc}
 1533              	.L93:
 1534              		.align	2
 1535              	.L92:
 1536 0630 00380240 		.word	1073887232
 1537 0634 0024F400 		.word	16000000
 1538 0638 40787D01 		.word	25000000
 1539 063c 00000000 		.word	APBAHBPrescTable
 1540              		.cfi_endproc
 1541              	.LFE144:
 1543              		.align	1
 1544              		.global	RCC_RTCCLKConfig
 1545              		.syntax unified
 1546              		.code	16
 1547              		.thumb_func
 1548              		.fpu softvfp
 1550              	RCC_RTCCLKConfig:
 1551              	.LFB145:
1409:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1410:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1411:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @}
1412:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1413:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1414:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /** @defgroup RCC_Group3 Peripheral clocks configuration functions
1415:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *  @brief   Peripheral clocks configuration functions 
1416:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *
1417:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** @verbatim   
1418:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================
1419:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****               ##### Peripheral clocks configuration functions #####
1420:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================  
1421:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     [..] This section provide functions allowing to configure the Peripheral clocks. 
1422:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1423:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) The RTC clock which is derived from the LSI, LSE or HSE clock divided 
1424:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           by 2 to 31.
1425:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****      
1426:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) After restart from Reset or wakeup from STANDBY, all peripherals are off
1427:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           except internal SRAM, Flash and JTAG. Before to start using a peripheral 
1428:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           you have to enable its interface clock. You can do this using 
1429:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           RCC_AHBPeriphClockCmd(), RCC_APB2PeriphClockCmd() and RCC_APB1PeriphClockCmd() functions.
1430:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1431:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) To reset the peripherals configuration (to the default state after device reset)
1432:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           you can use RCC_AHBPeriphResetCmd(), RCC_APB2PeriphResetCmd() and 
1433:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           RCC_APB1PeriphResetCmd() functions.
1434:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****      
1435:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****       (#) To further reduce power consumption in SLEEP mode the peripheral clocks 
1436:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           can be disabled prior to executing the WFI or WFE instructions. 
1437:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           You can do this using RCC_AHBPeriphClockLPModeCmd(), 
1438:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****           RCC_APB2PeriphClockLPModeCmd() and RCC_APB1PeriphClockLPModeCmd() functions.  
1439:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1440:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** @endverbatim
1441:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @{
1442:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1443:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1444:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1445:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the RTC clock (RTCCLK).
1446:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   As the RTC clock configuration bits are in the Backup domain and write
1447:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         access is denied to this domain after reset, you have to enable write
1448:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         access using PWR_BackupAccessCmd(ENABLE) function before to configure
1449:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the RTC clock source (to be done once after reset).    
1450:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Once the RTC clock is configured it can't be changed unless the  
1451:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         Backup domain is reset using RCC_BackupResetCmd() function, or by
1452:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         a Power On Reset (POR).
1453:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *    
1454:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_RTCCLKSource: specifies the RTC clock source.
1455:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1456:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_RTCCLKSource_LSE: LSE selected as RTC clock
1457:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_RTCCLKSource_LSI: LSI selected as RTC clock
1458:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_RTCCLKSource_HSE_Divx: HSE clock divided by x selected
1459:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                            as RTC clock, where x:[2,31]
1460:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
1461:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   If the LSE or LSI is used as RTC clock source, the RTC continues to
1462:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         work in STOP and STANDBY modes, and can be used as wakeup source.
1463:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         However, when the HSE clock is used as RTC clock source, the RTC
1464:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         cannot be used in STOP and STANDBY modes.    
1465:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The maximum input clock frequency for RTC is 1MHz (when using HSE as
1466:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RTC clock source).
1467:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *  
1468:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1469:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1470:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_RTCCLKConfig(uint32_t RCC_RTCCLKSource)
1471:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1552              		.loc 2 1471 0
 1553              		.cfi_startproc
 1554              		@ args = 0, pretend = 0, frame = 16
 1555              		@ frame_needed = 1, uses_anonymous_args = 0
 1556 0640 80B5     		push	{r7, lr}
 1557              		.cfi_def_cfa_offset 8
 1558              		.cfi_offset 7, -8
 1559              		.cfi_offset 14, -4
 1560 0642 84B0     		sub	sp, sp, #16
 1561              		.cfi_def_cfa_offset 24
 1562 0644 00AF     		add	r7, sp, #0
 1563              		.cfi_def_cfa_register 7
 1564 0646 7860     		str	r0, [r7, #4]
1472:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1565              		.loc 2 1472 0
 1566 0648 0023     		movs	r3, #0
 1567 064a FB60     		str	r3, [r7, #12]
1473:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1474:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1475:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_RTCCLK_SOURCE(RCC_RTCCLKSource));
1476:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1477:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if ((RCC_RTCCLKSource & 0x00000300) == 0x00000300)
 1568              		.loc 2 1477 0
 1569 064c 7A68     		ldr	r2, [r7, #4]
 1570 064e C023     		movs	r3, #192
 1571 0650 9B00     		lsls	r3, r3, #2
 1572 0652 1A40     		ands	r2, r3
 1573 0654 C023     		movs	r3, #192
 1574 0656 9B00     		lsls	r3, r3, #2
 1575 0658 9A42     		cmp	r2, r3
 1576 065a 0FD1     		bne	.L95
1478:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   { /* If HSE is selected as RTC clock source, configure HSE division factor for RTC clock */
1479:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     tmpreg = RCC->CFGR;
 1577              		.loc 2 1479 0
 1578 065c 0D4B     		ldr	r3, .L96
 1579 065e 9B68     		ldr	r3, [r3, #8]
 1580 0660 FB60     		str	r3, [r7, #12]
1480:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1481:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Clear RTCPRE[4:0] bits */
1482:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     tmpreg &= ~RCC_CFGR_RTCPRE;
 1581              		.loc 2 1482 0
 1582 0662 FB68     		ldr	r3, [r7, #12]
 1583 0664 0C4A     		ldr	r2, .L96+4
 1584 0666 1340     		ands	r3, r2
 1585 0668 FB60     		str	r3, [r7, #12]
1483:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1484:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Configure HSE division factor for RTC clock */
1485:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     tmpreg |= (RCC_RTCCLKSource & 0xFFFFCFF);
 1586              		.loc 2 1485 0
 1587 066a 7B68     		ldr	r3, [r7, #4]
 1588 066c 0B4A     		ldr	r2, .L96+8
 1589 066e 1340     		ands	r3, r2
 1590 0670 FA68     		ldr	r2, [r7, #12]
 1591 0672 1343     		orrs	r3, r2
 1592 0674 FB60     		str	r3, [r7, #12]
1486:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1487:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Store the new value */
1488:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->CFGR = tmpreg;
 1593              		.loc 2 1488 0
 1594 0676 074B     		ldr	r3, .L96
 1595 0678 FA68     		ldr	r2, [r7, #12]
 1596 067a 9A60     		str	r2, [r3, #8]
 1597              	.L95:
1489:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
1490:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     
1491:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Select the RTC clock source */
1492:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->BDCR |= (RCC_RTCCLKSource & 0x00000FFF);
 1598              		.loc 2 1492 0
 1599 067c 054B     		ldr	r3, .L96
 1600 067e 196F     		ldr	r1, [r3, #112]
 1601 0680 7B68     		ldr	r3, [r7, #4]
 1602 0682 1B05     		lsls	r3, r3, #20
 1603 0684 1A0D     		lsrs	r2, r3, #20
 1604 0686 034B     		ldr	r3, .L96
 1605 0688 0A43     		orrs	r2, r1
 1606 068a 1A67     		str	r2, [r3, #112]
1493:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1607              		.loc 2 1493 0
 1608 068c C046     		nop
 1609 068e BD46     		mov	sp, r7
 1610 0690 04B0     		add	sp, sp, #16
 1611              		@ sp needed
 1612 0692 80BD     		pop	{r7, pc}
 1613              	.L97:
 1614              		.align	2
 1615              	.L96:
 1616 0694 00380240 		.word	1073887232
 1617 0698 FFFFE0FF 		.word	-2031617
 1618 069c FFFCFF0F 		.word	268434687
 1619              		.cfi_endproc
 1620              	.LFE145:
 1622              		.align	1
 1623              		.global	RCC_RTCCLKCmd
 1624              		.syntax unified
 1625              		.code	16
 1626              		.thumb_func
 1627              		.fpu softvfp
 1629              	RCC_RTCCLKCmd:
 1630              	.LFB146:
1494:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1495:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1496:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the RTC clock.
1497:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be used only after the RTC clock source was selected
1498:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         using the RCC_RTCCLKConfig function.
1499:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the RTC clock. This parameter can be: ENABLE or DISABLE.
1500:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1501:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1502:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_RTCCLKCmd(FunctionalState NewState)
1503:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1631              		.loc 2 1503 0
 1632              		.cfi_startproc
 1633              		@ args = 0, pretend = 0, frame = 8
 1634              		@ frame_needed = 1, uses_anonymous_args = 0
 1635 06a0 80B5     		push	{r7, lr}
 1636              		.cfi_def_cfa_offset 8
 1637              		.cfi_offset 7, -8
 1638              		.cfi_offset 14, -4
 1639 06a2 82B0     		sub	sp, sp, #8
 1640              		.cfi_def_cfa_offset 16
 1641 06a4 00AF     		add	r7, sp, #0
 1642              		.cfi_def_cfa_register 7
 1643 06a6 0200     		movs	r2, r0
 1644 06a8 FB1D     		adds	r3, r7, #7
 1645 06aa 1A70     		strb	r2, [r3]
1504:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1505:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
1506:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1507:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) BDCR_RTCEN_BB = (uint32_t)NewState;
 1646              		.loc 2 1507 0
 1647 06ac 034B     		ldr	r3, .L99
 1648 06ae FA1D     		adds	r2, r7, #7
 1649 06b0 1278     		ldrb	r2, [r2]
 1650 06b2 1A60     		str	r2, [r3]
1508:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1651              		.loc 2 1508 0
 1652 06b4 C046     		nop
 1653 06b6 BD46     		mov	sp, r7
 1654 06b8 02B0     		add	sp, sp, #8
 1655              		@ sp needed
 1656 06ba 80BD     		pop	{r7, pc}
 1657              	.L100:
 1658              		.align	2
 1659              	.L99:
 1660 06bc 3C0E4742 		.word	1111952956
 1661              		.cfi_endproc
 1662              	.LFE146:
 1664              		.align	1
 1665              		.global	RCC_BackupResetCmd
 1666              		.syntax unified
 1667              		.code	16
 1668              		.thumb_func
 1669              		.fpu softvfp
 1671              	RCC_BackupResetCmd:
 1672              	.LFB147:
1509:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1510:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1511:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Forces or releases the Backup domain reset.
1512:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function resets the RTC peripheral (including the backup registers)
1513:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         and the RTC clock source selection in RCC_CSR register.
1514:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The BKPSRAM is not affected by this reset.    
1515:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the Backup domain reset.
1516:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
1517:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1518:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1519:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_BackupResetCmd(FunctionalState NewState)
1520:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1673              		.loc 2 1520 0
 1674              		.cfi_startproc
 1675              		@ args = 0, pretend = 0, frame = 8
 1676              		@ frame_needed = 1, uses_anonymous_args = 0
 1677 06c0 80B5     		push	{r7, lr}
 1678              		.cfi_def_cfa_offset 8
 1679              		.cfi_offset 7, -8
 1680              		.cfi_offset 14, -4
 1681 06c2 82B0     		sub	sp, sp, #8
 1682              		.cfi_def_cfa_offset 16
 1683 06c4 00AF     		add	r7, sp, #0
 1684              		.cfi_def_cfa_register 7
 1685 06c6 0200     		movs	r2, r0
 1686 06c8 FB1D     		adds	r3, r7, #7
 1687 06ca 1A70     		strb	r2, [r3]
1521:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1522:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
1523:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) BDCR_BDRST_BB = (uint32_t)NewState;
 1688              		.loc 2 1523 0
 1689 06cc 034B     		ldr	r3, .L102
 1690 06ce FA1D     		adds	r2, r7, #7
 1691 06d0 1278     		ldrb	r2, [r2]
 1692 06d2 1A60     		str	r2, [r3]
1524:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1693              		.loc 2 1524 0
 1694 06d4 C046     		nop
 1695 06d6 BD46     		mov	sp, r7
 1696 06d8 02B0     		add	sp, sp, #8
 1697              		@ sp needed
 1698 06da 80BD     		pop	{r7, pc}
 1699              	.L103:
 1700              		.align	2
 1701              	.L102:
 1702 06dc 400E4742 		.word	1111952960
 1703              		.cfi_endproc
 1704              	.LFE147:
 1706              		.align	1
 1707              		.global	RCC_I2SCLKConfig
 1708              		.syntax unified
 1709              		.code	16
 1710              		.thumb_func
 1711              		.fpu softvfp
 1713              	RCC_I2SCLKConfig:
 1714              	.LFB148:
1525:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1526:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined (STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F446xx)
1527:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1528:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the I2S clock source (I2SCLK).
1529:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the I2S APB clock.
1530:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
1531:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_I2SAPBx: specifies the APBx I2S clock source.
1532:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1533:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SBus_APB1: I2S peripheral instance is on APB1 Bus
1534:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SBus_APB2: I2S peripheral instance is on APB2 Bus
1535:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
1536:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_I2SCLKSource: specifies the I2S clock source.
1537:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1538:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SCLKSource_PLLI2S: PLLI2S clock used as I2S clock source
1539:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SCLKSource_Ext: External clock mapped on the I2S_CKIN pin
1540:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                        used as I2S clock source
1541:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SCLKSource_PLL: PLL clock used as I2S clock source
1542:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SCLKSource_HSI_HSE: HSI or HSE depends on PLLSRC used as I2S clock source
1543:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1544:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1545:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_I2SCLKConfig(uint32_t RCC_I2SAPBx, uint32_t RCC_I2SCLKSource)
1546:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1547:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1548:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_I2SCLK_SOURCE(RCC_I2SCLKSource));
1549:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_I2S_APBx(RCC_I2SAPBx));
1550:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1551:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_I2SAPBx == RCC_I2SBus_APB1)
1552:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
1553:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Clear APB1 I2Sx clock source selection bits */
1554:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR &= ~RCC_DCKCFGR_I2S1SRC;
1555:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Set new APB1 I2Sx clock source*/
1556:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR |= RCC_I2SCLKSource;
1557:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
1558:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
1559:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
1560:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Clear APB2 I2Sx clock source selection  bits */
1561:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR &= ~RCC_DCKCFGR_I2S2SRC;
1562:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Set new APB2 I2Sx clock source */
1563:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR |= (RCC_I2SCLKSource << 2);
1564:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
1565:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1566:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F446xx)
1567:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1568:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the SAIx clock source (SAIxCLK).
1569:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the SAIx APB clock.
1570:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
1571:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SAIInstance: specifies the SAIx clock source.
1572:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1573:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIInstance_SAI1: SAI1 clock source selection
1574:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIInstance_SAI2: SAI2 clock source selections
1575:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
1576:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SAICLKSource: specifies the SAI clock source.
1577:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1578:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAICLKSource_PLLSAI: PLLSAI clock used as SAI clock source
1579:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAICLKSource_PLLI2S: PLLI2S clock used as SAI clock source
1580:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAICLKSource_PLL: PLL clock used as SAI clock source
1581:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAICLKSource_HSI_HSE: HSI or HSE depends on PLLSRC used as SAI clock source
1582:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1583:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1584:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAICLKConfig(uint32_t RCC_SAIInstance, uint32_t RCC_SAICLKSource)
1585:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1586:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1587:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SAICLK_SOURCE(RCC_SAICLKSource));
1588:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SAI_INSTANCE(RCC_SAIInstance));
1589:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1590:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_SAIInstance == RCC_SAIInstance_SAI1)
1591:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
1592:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Clear SAI1 clock source selection bits */
1593:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR &= ~RCC_DCKCFGR_SAI1SRC;
1594:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Set new SAI1 clock source */
1595:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR |= RCC_SAICLKSource;
1596:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
1597:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
1598:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
1599:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Clear SAI2 clock source selection bits */
1600:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR &= ~RCC_DCKCFGR_SAI2SRC;
1601:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Set new SAI2 clock source */
1602:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->DCKCFGR |= (RCC_SAICLKSource << 2);
1603:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
1604:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1605:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F446xx */
1606:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1607:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F413_423xx)
1608:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1609:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures SAI1BlockA clock source selection.      
1610:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling PLLSAI, PLLI2S and  
1611:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the SAI clock.
1612:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SAIBlockACLKSource: specifies the SAI Block A clock source.
1613:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1614:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIACLKSource_PLLI2SR: PLLI2SR clock used as SAI clock source
1615:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIACLKSource_PLLI2S: PLLI2S clock used as SAI clock source
1616:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIACLKSource_PLL: PLL clock used as SAI clock source
1617:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIACLKSource_HSI_HSE: HSI or HSE depends on PLLSRC used as SAI clock sourc
1618:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1619:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1620:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIBlockACLKConfig(uint32_t RCC_SAIBlockACLKSource)
1621:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1622:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
1623:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1624:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1625:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SAIACLK_SOURCE(RCC_SAIBlockACLKSource));
1626:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1627:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
1628:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1629:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear RCC_DCKCFGR_SAI1ASRC[1:0] bits */
1630:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_SAI1ASRC;
1631:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1632:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set SAI Block A source selection value */
1633:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_SAIBlockACLKSource;
1634:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1635:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1636:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
1637:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1638:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1639:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1640:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures SAI1BlockB clock source selection.      
1641:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling PLLSAI, PLLI2S and  
1642:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the SAI clock.
1643:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SAIBlockBCLKSource: specifies the SAI Block B clock source.
1644:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1645:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIBCLKSource_PLLI2SR: PLLI2SR clock used as SAI clock source
1646:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIBCLKSource_PLLI2S: PLLI2S clock used as SAI clock source
1647:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIBCLKSource_PLL: PLL clock used as SAI clock source
1648:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIBCLKSource_HSI_HSE: HSI or HSE depends on PLLSRC used as SAI clock sourc
1649:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1650:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1651:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIBlockBCLKConfig(uint32_t RCC_SAIBlockBCLKSource)
1652:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1653:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
1654:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1655:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1656:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SAIBCLK_SOURCE(RCC_SAIBlockBCLKSource));
1657:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1658:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
1659:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1660:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear RCC_DCKCFGR_SAI1ASRC[1:0] bits */
1661:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_SAI1BSRC;
1662:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1663:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set SAI Block B source selection value */
1664:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_SAIBlockBCLKSource;
1665:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1666:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1667:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
1668:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1669:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F413_423xx */
1670:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F412xG || STM32F413_423xx || STM32F446xx */
1671:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1672:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx)
1673:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1674:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the I2S clock source (I2SCLK).
1675:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the I2S clock.
1676:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *
1677:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_I2SCLKSource: specifies the I2S clock source.
1678:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter can be one of the following values:
1679:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SAPBCLKSOURCE_PLLR: PLL VCO output clock divided by PLLR.
1680:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SAPBCLKSOURCE_EXT: External clock mapped on the I2S_CKIN pin.
1681:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2SAPBCLKSOURCE_PLLSRC: HSI/HSE depends on PLLSRC.
1682:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1683:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1684:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_I2SCLKConfig(uint32_t RCC_I2SCLKSource)
1685:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1686:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1687:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_I2SCLK_SOURCE(RCC_I2SCLKSource));
1688:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1689:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear I2Sx clock source selection bits */
1690:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR &= ~RCC_DCKCFGR_I2SSRC;
1691:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set new I2Sx clock source*/
1692:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR |= RCC_I2SCLKSource;
1693:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1694:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx */
1695:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1696:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
1697:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1698:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the I2S clock source (I2SCLK).
1699:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the I2S APB clock.
1700:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_I2SCLKSource: specifies the I2S clock source.
1701:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1702:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2S2CLKSource_PLLI2S: PLLI2S clock used as I2S clock source
1703:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_I2S2CLKSource_Ext: External clock mapped on the I2S_CKIN pin
1704:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                        used as I2S clock source
1705:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1706:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1707:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_I2SCLKConfig(uint32_t RCC_I2SCLKSource)
1708:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1715              		.loc 2 1708 0
 1716              		.cfi_startproc
 1717              		@ args = 0, pretend = 0, frame = 8
 1718              		@ frame_needed = 1, uses_anonymous_args = 0
 1719 06e0 80B5     		push	{r7, lr}
 1720              		.cfi_def_cfa_offset 8
 1721              		.cfi_offset 7, -8
 1722              		.cfi_offset 14, -4
 1723 06e2 82B0     		sub	sp, sp, #8
 1724              		.cfi_def_cfa_offset 16
 1725 06e4 00AF     		add	r7, sp, #0
 1726              		.cfi_def_cfa_register 7
 1727 06e6 7860     		str	r0, [r7, #4]
1709:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1710:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_I2SCLK_SOURCE(RCC_I2SCLKSource));
1711:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1712:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) CFGR_I2SSRC_BB = RCC_I2SCLKSource;  
 1728              		.loc 2 1712 0
 1729 06e8 034B     		ldr	r3, .L105
 1730 06ea 7A68     		ldr	r2, [r7, #4]
 1731 06ec 1A60     		str	r2, [r3]
1713:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1732              		.loc 2 1713 0
 1733 06ee C046     		nop
 1734 06f0 BD46     		mov	sp, r7
 1735 06f2 02B0     		add	sp, sp, #8
 1736              		@ sp needed
 1737 06f4 80BD     		pop	{r7, pc}
 1738              	.L106:
 1739 06f6 C046     		.align	2
 1740              	.L105:
 1741 06f8 5C014742 		.word	1111949660
 1742              		.cfi_endproc
 1743              	.LFE148:
 1745              		.align	1
 1746              		.global	RCC_SAIBlockACLKConfig
 1747              		.syntax unified
 1748              		.code	16
 1749              		.thumb_func
 1750              		.fpu softvfp
 1752              	RCC_SAIBlockACLKConfig:
 1753              	.LFB149:
1714:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F401xx || STM32F411xE || STM
1715:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1716:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F427_437xx) || defined(STM32F429_439xx) || defined(STM3
1717:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1718:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures SAI1BlockA clock source selection.
1719:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1720:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx/469xx/479xx devices.
1721:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *       
1722:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling PLLSAI, PLLI2S and  
1723:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the SAI clock.
1724:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SAIBlockACLKSource: specifies the SAI Block A clock source.
1725:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1726:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIACLKSource_PLLI2S: PLLI2S_Q clock divided by PLLI2SDIVQ used 
1727:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                           as SAI1 Block A clock 
1728:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIACLKSource_PLLSAI: PLLISAI_Q clock divided by PLLSAIDIVQ used 
1729:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                           as SAI1 Block A clock 
1730:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIACLKSource_Ext: External clock mapped on the I2S_CKIN pin
1731:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                        used as SAI1 Block A clock
1732:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1733:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1734:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIBlockACLKConfig(uint32_t RCC_SAIBlockACLKSource)
1735:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1754              		.loc 2 1735 0
 1755              		.cfi_startproc
 1756              		@ args = 0, pretend = 0, frame = 16
 1757              		@ frame_needed = 1, uses_anonymous_args = 0
 1758 06fc 80B5     		push	{r7, lr}
 1759              		.cfi_def_cfa_offset 8
 1760              		.cfi_offset 7, -8
 1761              		.cfi_offset 14, -4
 1762 06fe 84B0     		sub	sp, sp, #16
 1763              		.cfi_def_cfa_offset 24
 1764 0700 00AF     		add	r7, sp, #0
 1765              		.cfi_def_cfa_register 7
 1766 0702 7860     		str	r0, [r7, #4]
1736:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1767              		.loc 2 1736 0
 1768 0704 0023     		movs	r3, #0
 1769 0706 FB60     		str	r3, [r7, #12]
1737:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1738:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1739:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SAIACLK_SOURCE(RCC_SAIBlockACLKSource));
1740:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1741:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
 1770              		.loc 2 1741 0
 1771 0708 094A     		ldr	r2, .L108
 1772 070a 8C23     		movs	r3, #140
 1773 070c D358     		ldr	r3, [r2, r3]
 1774 070e FB60     		str	r3, [r7, #12]
1742:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1743:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear RCC_DCKCFGR_SAI1ASRC[1:0] bits */
1744:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_SAI1ASRC;
 1775              		.loc 2 1744 0
 1776 0710 FB68     		ldr	r3, [r7, #12]
 1777 0712 084A     		ldr	r2, .L108+4
 1778 0714 1340     		ands	r3, r2
 1779 0716 FB60     		str	r3, [r7, #12]
1745:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1746:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set SAI Block A source selection value */
1747:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_SAIBlockACLKSource;
 1780              		.loc 2 1747 0
 1781 0718 FA68     		ldr	r2, [r7, #12]
 1782 071a 7B68     		ldr	r3, [r7, #4]
 1783 071c 1343     		orrs	r3, r2
 1784 071e FB60     		str	r3, [r7, #12]
1748:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1749:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1750:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
 1785              		.loc 2 1750 0
 1786 0720 0349     		ldr	r1, .L108
 1787 0722 8C22     		movs	r2, #140
 1788 0724 FB68     		ldr	r3, [r7, #12]
 1789 0726 8B50     		str	r3, [r1, r2]
1751:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1790              		.loc 2 1751 0
 1791 0728 C046     		nop
 1792 072a BD46     		mov	sp, r7
 1793 072c 04B0     		add	sp, sp, #16
 1794              		@ sp needed
 1795 072e 80BD     		pop	{r7, pc}
 1796              	.L109:
 1797              		.align	2
 1798              	.L108:
 1799 0730 00380240 		.word	1073887232
 1800 0734 FFFFCFFF 		.word	-3145729
 1801              		.cfi_endproc
 1802              	.LFE149:
 1804              		.align	1
 1805              		.global	RCC_SAIBlockBCLKConfig
 1806              		.syntax unified
 1807              		.code	16
 1808              		.thumb_func
 1809              		.fpu softvfp
 1811              	RCC_SAIBlockBCLKConfig:
 1812              	.LFB150:
1752:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1753:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1754:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures SAI1BlockB clock source selection.
1755:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1756:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx/469xx/479xx devices.
1757:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *       
1758:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling PLLSAI, PLLI2S and  
1759:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         the SAI clock.
1760:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_SAIBlockBCLKSource: specifies the SAI Block B clock source.
1761:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1762:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIBCLKSource_PLLI2S: PLLI2S_Q clock divided by PLLI2SDIVQ used 
1763:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                           as SAI1 Block B clock 
1764:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIBCLKSource_PLLSAI: PLLISAI_Q clock divided by PLLSAIDIVQ used 
1765:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                           as SAI1 Block B clock 
1766:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SAIBCLKSource_Ext: External clock mapped on the I2S_CKIN pin
1767:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                        used as SAI1 Block B clock
1768:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1769:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1770:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIBlockBCLKConfig(uint32_t RCC_SAIBlockBCLKSource)
1771:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1813              		.loc 2 1771 0
 1814              		.cfi_startproc
 1815              		@ args = 0, pretend = 0, frame = 16
 1816              		@ frame_needed = 1, uses_anonymous_args = 0
 1817 0738 80B5     		push	{r7, lr}
 1818              		.cfi_def_cfa_offset 8
 1819              		.cfi_offset 7, -8
 1820              		.cfi_offset 14, -4
 1821 073a 84B0     		sub	sp, sp, #16
 1822              		.cfi_def_cfa_offset 24
 1823 073c 00AF     		add	r7, sp, #0
 1824              		.cfi_def_cfa_register 7
 1825 073e 7860     		str	r0, [r7, #4]
1772:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1826              		.loc 2 1772 0
 1827 0740 0023     		movs	r3, #0
 1828 0742 FB60     		str	r3, [r7, #12]
1773:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1774:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1775:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SAIBCLK_SOURCE(RCC_SAIBlockBCLKSource));
1776:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1777:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
 1829              		.loc 2 1777 0
 1830 0744 094A     		ldr	r2, .L111
 1831 0746 8C23     		movs	r3, #140
 1832 0748 D358     		ldr	r3, [r2, r3]
 1833 074a FB60     		str	r3, [r7, #12]
1778:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1779:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear RCC_DCKCFGR_SAI1BSRC[1:0] bits */
1780:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_SAI1BSRC;
 1834              		.loc 2 1780 0
 1835 074c FB68     		ldr	r3, [r7, #12]
 1836 074e 084A     		ldr	r2, .L111+4
 1837 0750 1340     		ands	r3, r2
 1838 0752 FB60     		str	r3, [r7, #12]
1781:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1782:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set SAI Block B source selection value */
1783:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_SAIBlockBCLKSource;
 1839              		.loc 2 1783 0
 1840 0754 FA68     		ldr	r2, [r7, #12]
 1841 0756 7B68     		ldr	r3, [r7, #4]
 1842 0758 1343     		orrs	r3, r2
 1843 075a FB60     		str	r3, [r7, #12]
1784:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1785:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1786:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
 1844              		.loc 2 1786 0
 1845 075c 0349     		ldr	r1, .L111
 1846 075e 8C22     		movs	r2, #140
 1847 0760 FB68     		ldr	r3, [r7, #12]
 1848 0762 8B50     		str	r3, [r1, r2]
1787:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1849              		.loc 2 1787 0
 1850 0764 C046     		nop
 1851 0766 BD46     		mov	sp, r7
 1852 0768 04B0     		add	sp, sp, #16
 1853              		@ sp needed
 1854 076a 80BD     		pop	{r7, pc}
 1855              	.L112:
 1856              		.align	2
 1857              	.L111:
 1858 076c 00380240 		.word	1073887232
 1859 0770 FFFF3FFF 		.word	-12582913
 1860              		.cfi_endproc
 1861              	.LFE150:
 1863              		.align	1
 1864              		.global	RCC_SAIPLLI2SClkDivConfig
 1865              		.syntax unified
 1866              		.code	16
 1867              		.thumb_func
 1868              		.fpu softvfp
 1870              	RCC_SAIPLLI2SClkDivConfig:
 1871              	.LFB151:
1788:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F427_437xx || STM32F429_439xx || STM32F469_479xx */
1789:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1790:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1791:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the SAI clock Divider coming from PLLI2S.
1792:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1793:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx/446xx/469xx/479xx devices.
1794:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
1795:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the PLLI2S.
1796:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              
1797:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_PLLI2SDivQ: specifies the PLLI2S division factor for SAI1 clock .
1798:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 1 and 32.
1799:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          SAI1 clock frequency = f(PLLI2S_Q) / RCC_PLLI2SDivQ 
1800:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              
1801:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1802:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1803:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIPLLI2SClkDivConfig(uint32_t RCC_PLLI2SDivQ)  
1804:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1872              		.loc 2 1804 0
 1873              		.cfi_startproc
 1874              		@ args = 0, pretend = 0, frame = 16
 1875              		@ frame_needed = 1, uses_anonymous_args = 0
 1876 0774 80B5     		push	{r7, lr}
 1877              		.cfi_def_cfa_offset 8
 1878              		.cfi_offset 7, -8
 1879              		.cfi_offset 14, -4
 1880 0776 84B0     		sub	sp, sp, #16
 1881              		.cfi_def_cfa_offset 24
 1882 0778 00AF     		add	r7, sp, #0
 1883              		.cfi_def_cfa_register 7
 1884 077a 7860     		str	r0, [r7, #4]
1805:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1885              		.loc 2 1805 0
 1886 077c 0023     		movs	r3, #0
 1887 077e FB60     		str	r3, [r7, #12]
1806:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1807:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1808:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2S_DIVQ_VALUE(RCC_PLLI2SDivQ));
1809:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1810:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
 1888              		.loc 2 1810 0
 1889 0780 0A4A     		ldr	r2, .L114
 1890 0782 8C23     		movs	r3, #140
 1891 0784 D358     		ldr	r3, [r2, r3]
 1892 0786 FB60     		str	r3, [r7, #12]
1811:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1812:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear PLLI2SDIVQ[4:0] bits */
1813:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~(RCC_DCKCFGR_PLLI2SDIVQ);
 1893              		.loc 2 1813 0
 1894 0788 FB68     		ldr	r3, [r7, #12]
 1895 078a 1F22     		movs	r2, #31
 1896 078c 9343     		bics	r3, r2
 1897 078e FB60     		str	r3, [r7, #12]
1814:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1815:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set PLLI2SDIVQ values */
1816:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= (RCC_PLLI2SDivQ - 1);
 1898              		.loc 2 1816 0
 1899 0790 7B68     		ldr	r3, [r7, #4]
 1900 0792 013B     		subs	r3, r3, #1
 1901 0794 FA68     		ldr	r2, [r7, #12]
 1902 0796 1343     		orrs	r3, r2
 1903 0798 FB60     		str	r3, [r7, #12]
1817:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1818:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1819:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
 1904              		.loc 2 1819 0
 1905 079a 0449     		ldr	r1, .L114
 1906 079c 8C22     		movs	r2, #140
 1907 079e FB68     		ldr	r3, [r7, #12]
 1908 07a0 8B50     		str	r3, [r1, r2]
1820:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1909              		.loc 2 1820 0
 1910 07a2 C046     		nop
 1911 07a4 BD46     		mov	sp, r7
 1912 07a6 04B0     		add	sp, sp, #16
 1913              		@ sp needed
 1914 07a8 80BD     		pop	{r7, pc}
 1915              	.L115:
 1916 07aa C046     		.align	2
 1917              	.L114:
 1918 07ac 00380240 		.word	1073887232
 1919              		.cfi_endproc
 1920              	.LFE151:
 1922              		.align	1
 1923              		.global	RCC_SAIPLLSAIClkDivConfig
 1924              		.syntax unified
 1925              		.code	16
 1926              		.thumb_func
 1927              		.fpu softvfp
 1929              	RCC_SAIPLLSAIClkDivConfig:
 1930              	.LFB152:
1821:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1822:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1823:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the SAI clock Divider coming from PLLSAI.
1824:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1825:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx/446xx/469xx/479xx devices.
1826:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *        
1827:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the PLLSAI.
1828:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
1829:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_PLLSAIDivQ: specifies the PLLSAI division factor for SAI1 clock .
1830:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 1 and 32.
1831:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          SAI1 clock frequency = f(PLLSAI_Q) / RCC_PLLSAIDivQ  
1832:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              
1833:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1834:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1835:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIPLLSAIClkDivConfig(uint32_t RCC_PLLSAIDivQ)  
1836:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1931              		.loc 2 1836 0
 1932              		.cfi_startproc
 1933              		@ args = 0, pretend = 0, frame = 16
 1934              		@ frame_needed = 1, uses_anonymous_args = 0
 1935 07b0 80B5     		push	{r7, lr}
 1936              		.cfi_def_cfa_offset 8
 1937              		.cfi_offset 7, -8
 1938              		.cfi_offset 14, -4
 1939 07b2 84B0     		sub	sp, sp, #16
 1940              		.cfi_def_cfa_offset 24
 1941 07b4 00AF     		add	r7, sp, #0
 1942              		.cfi_def_cfa_register 7
 1943 07b6 7860     		str	r0, [r7, #4]
1837:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 1944              		.loc 2 1837 0
 1945 07b8 0023     		movs	r3, #0
 1946 07ba FB60     		str	r3, [r7, #12]
1838:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1839:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1840:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAI_DIVQ_VALUE(RCC_PLLSAIDivQ));
1841:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1842:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
 1947              		.loc 2 1842 0
 1948 07bc 0A4A     		ldr	r2, .L117
 1949 07be 8C23     		movs	r3, #140
 1950 07c0 D358     		ldr	r3, [r2, r3]
 1951 07c2 FB60     		str	r3, [r7, #12]
1843:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1844:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear PLLI2SDIVQ[4:0] and PLLSAIDIVQ[4:0] bits */
1845:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~(RCC_DCKCFGR_PLLSAIDIVQ);
 1952              		.loc 2 1845 0
 1953 07c4 FB68     		ldr	r3, [r7, #12]
 1954 07c6 094A     		ldr	r2, .L117+4
 1955 07c8 1340     		ands	r3, r2
 1956 07ca FB60     		str	r3, [r7, #12]
1846:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1847:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set PLLSAIDIVQ values */
1848:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= ((RCC_PLLSAIDivQ - 1) << 8);
 1957              		.loc 2 1848 0
 1958 07cc 7B68     		ldr	r3, [r7, #4]
 1959 07ce 013B     		subs	r3, r3, #1
 1960 07d0 1B02     		lsls	r3, r3, #8
 1961 07d2 FA68     		ldr	r2, [r7, #12]
 1962 07d4 1343     		orrs	r3, r2
 1963 07d6 FB60     		str	r3, [r7, #12]
1849:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1850:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1851:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
 1964              		.loc 2 1851 0
 1965 07d8 0349     		ldr	r1, .L117
 1966 07da 8C22     		movs	r2, #140
 1967 07dc FB68     		ldr	r3, [r7, #12]
 1968 07de 8B50     		str	r3, [r1, r2]
1852:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 1969              		.loc 2 1852 0
 1970 07e0 C046     		nop
 1971 07e2 BD46     		mov	sp, r7
 1972 07e4 04B0     		add	sp, sp, #16
 1973              		@ sp needed
 1974 07e6 80BD     		pop	{r7, pc}
 1975              	.L118:
 1976              		.align	2
 1977              	.L117:
 1978 07e8 00380240 		.word	1073887232
 1979 07ec FFE0FFFF 		.word	-7937
 1980              		.cfi_endproc
 1981              	.LFE152:
 1983              		.align	1
 1984              		.global	RCC_LTDCCLKDivConfig
 1985              		.syntax unified
 1986              		.code	16
 1987              		.thumb_func
 1988              		.fpu softvfp
 1990              	RCC_LTDCCLKDivConfig:
 1991              	.LFB153:
1853:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1854:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F413_423xx)
1855:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1856:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the SAI clock Divider coming from PLLI2S.
1857:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1858:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F413_423xx
1859:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
1860:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param   RCC_PLLI2SDivR: specifies the PLLI2S division factor for SAI1 clock.
1861:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 1 and 32.
1862:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          SAI1 clock frequency = f(PLLI2SR) / RCC_PLLI2SDivR 
1863:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1864:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1865:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIPLLI2SRClkDivConfig(uint32_t RCC_PLLI2SDivR)  
1866:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1867:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
1868:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1869:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1870:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLI2S_DIVR_VALUE(RCC_PLLI2SDivR));
1871:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1872:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
1873:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1874:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear PLLI2SDIVR[4:0] bits */
1875:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~(RCC_DCKCFGR_PLLI2SDIVR);
1876:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1877:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set PLLI2SDIVR values */
1878:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= (RCC_PLLI2SDivR-1);
1879:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1880:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1881:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
1882:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1883:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1884:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1885:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the SAI clock Divider coming from PLL.
1886:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1887:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F413_423xx
1888:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *        
1889:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the PLLSAI.
1890:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
1891:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_PLLDivR: specifies the PLL division factor for SAI1 clock.
1892:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be a number between 1 and 32.
1893:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          SAI1 clock frequency = f(PLLR) / RCC_PLLDivR 
1894:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *              
1895:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1896:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1897:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SAIPLLRClkDivConfig(uint32_t RCC_PLLDivR)  
1898:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1899:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
1900:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1901:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1902:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLL_DIVR_VALUE(RCC_PLLDivR));
1903:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1904:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
1905:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1906:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear PLLDIVR[12:8] */
1907:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~(RCC_DCKCFGR_PLLDIVR);
1908:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1909:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set PLLDivR values */
1910:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= ((RCC_PLLDivR - 1 ) << 8);
1911:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1912:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1913:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
1914:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1915:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F413_423xx */
1916:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1917:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1918:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the LTDC clock Divider coming from PLLSAI.
1919:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
1920:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   The LTDC peripheral is only available with STM32F42xxx/43xxx/446xx/469xx/479xx Devices.
1921:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *      
1922:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the PLLSAI.
1923:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
1924:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_PLLSAIDivR: specifies the PLLSAI division factor for LTDC clock .
1925:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          LTDC clock frequency = f(PLLSAI_R) / RCC_PLLSAIDivR  
1926:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1927:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSAIDivR_Div2: LTDC clock = f(PLLSAI_R)/2
1928:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSAIDivR_Div4: LTDC clock = f(PLLSAI_R)/4
1929:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSAIDivR_Div8: LTDC clock = f(PLLSAI_R)/8
1930:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_PLLSAIDivR_Div16: LTDC clock = f(PLLSAI_R)/16
1931:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            
1932:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1933:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1934:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_LTDCCLKDivConfig(uint32_t RCC_PLLSAIDivR)
1935:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 1992              		.loc 2 1935 0
 1993              		.cfi_startproc
 1994              		@ args = 0, pretend = 0, frame = 16
 1995              		@ frame_needed = 1, uses_anonymous_args = 0
 1996 07f0 80B5     		push	{r7, lr}
 1997              		.cfi_def_cfa_offset 8
 1998              		.cfi_offset 7, -8
 1999              		.cfi_offset 14, -4
 2000 07f2 84B0     		sub	sp, sp, #16
 2001              		.cfi_def_cfa_offset 24
 2002 07f4 00AF     		add	r7, sp, #0
 2003              		.cfi_def_cfa_register 7
 2004 07f6 7860     		str	r0, [r7, #4]
1936:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
 2005              		.loc 2 1936 0
 2006 07f8 0023     		movs	r3, #0
 2007 07fa FB60     		str	r3, [r7, #12]
1937:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1938:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1939:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_PLLSAI_DIVR_VALUE(RCC_PLLSAIDivR));
1940:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1941:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
 2008              		.loc 2 1941 0
 2009 07fc 094A     		ldr	r2, .L120
 2010 07fe 8C23     		movs	r3, #140
 2011 0800 D358     		ldr	r3, [r2, r3]
 2012 0802 FB60     		str	r3, [r7, #12]
1942:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1943:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear PLLSAIDIVR[2:0] bits */
1944:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_PLLSAIDIVR;
 2013              		.loc 2 1944 0
 2014 0804 FB68     		ldr	r3, [r7, #12]
 2015 0806 084A     		ldr	r2, .L120+4
 2016 0808 1340     		ands	r3, r2
 2017 080a FB60     		str	r3, [r7, #12]
1945:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1946:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set PLLSAIDIVR values */
1947:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_PLLSAIDivR;
 2018              		.loc 2 1947 0
 2019 080c FA68     		ldr	r2, [r7, #12]
 2020 080e 7B68     		ldr	r3, [r7, #4]
 2021 0810 1343     		orrs	r3, r2
 2022 0812 FB60     		str	r3, [r7, #12]
1948:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1949:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1950:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
 2023              		.loc 2 1950 0
 2024 0814 0349     		ldr	r1, .L120
 2025 0816 8C22     		movs	r2, #140
 2026 0818 FB68     		ldr	r3, [r7, #12]
 2027 081a 8B50     		str	r3, [r1, r2]
1951:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2028              		.loc 2 1951 0
 2029 081c C046     		nop
 2030 081e BD46     		mov	sp, r7
 2031 0820 04B0     		add	sp, sp, #16
 2032              		@ sp needed
 2033 0822 80BD     		pop	{r7, pc}
 2034              	.L121:
 2035              		.align	2
 2036              	.L120:
 2037 0824 00380240 		.word	1073887232
 2038 0828 FFFFFCFF 		.word	-196609
 2039              		.cfi_endproc
 2040              	.LFE153:
 2042              		.align	1
 2043              		.global	RCC_TIMCLKPresConfig
 2044              		.syntax unified
 2045              		.code	16
 2046              		.thumb_func
 2047              		.fpu softvfp
 2049              	RCC_TIMCLKPresConfig:
 2050              	.LFB154:
1952:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1953:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F412xG) || defined(STM32F413_423xx)
1954:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1955:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the DFSDM clock source (DFSDMCLK).
1956:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the DFSDM APB clock.
1957:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_DFSDMCLKSource: specifies the DFSDM clock source.
1958:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1959:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DFSDMCLKSource_APB: APB clock used as DFSDM clock source.
1960:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DFSDMCLKSource_SYS: System clock used as DFSDM clock source.
1961:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                        
1962:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1963:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1964:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_DFSDM1CLKConfig(uint32_t RCC_DFSDMCLKSource)
1965:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1966:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
1967:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1968:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1969:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_DFSDM1CLK_SOURCE(RCC_DFSDMCLKSource));
1970:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1971:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
1972:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1973:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear CKDFSDM-SEL  bit */
1974:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_CKDFSDM1SEL;
1975:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1976:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set CKDFSDM-SEL bit according to RCC_DFSDMCLKSource value */
1977:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= (RCC_DFSDMCLKSource << 31) ;
1978:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1979:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
1980:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
1981:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
1982:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
1983:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
1984:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the DFSDM Audio clock source (DFSDMACLK).
1985:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the DFSDM APB clock.
1986:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_DFSDM1ACLKSource: specifies the DFSDM clock source.
1987:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
1988:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DFSDM1AUDIOCLKSOURCE_I2SAPB1: APB clock used as DFSDM clock source.
1989:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DFSDM1AUDIOCLKSOURCE_I2SAPB2: System clock used as DFSDM clock source.
1990:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                        
1991:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
1992:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
1993:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_DFSDM1ACLKConfig(uint32_t RCC_DFSDM1ACLKSource)
1994:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
1995:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
1996:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
1997:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
1998:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_DFSDMACLK_SOURCE(RCC_DFSDM1ACLKSource));
1999:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
2000:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
2001:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2002:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear CKDFSDMA SEL  bit */
2003:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_CKDFSDM1ASEL;
2004:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2005:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set CKDFSDM-SEL   bt according to RCC_DFSDMCLKSource value */
2006:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_DFSDM1ACLKSource;
2007:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2008:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
2009:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
2010:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2011:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2012:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F413_423xx)
2013:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2014:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the DFSDM Audio clock source (DFSDMACLK).
2015:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function must be called before enabling the DFSDM APB clock.
2016:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_DFSDM2ACLKSource: specifies the DFSDM clock source.
2017:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2018:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DFSDM2AUDIOCLKSOURCE_I2SAPB1: APB clock used as DFSDM clock source.
2019:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DFSDM2AUDIOCLKSOURCE_I2SAPB2: System clock used as DFSDM clock source.
2020:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                                        
2021:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2022:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2023:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_DFSDM2ACLKConfig(uint32_t RCC_DFSDMACLKSource)
2024:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2025:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmpreg = 0;
2026:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
2027:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2028:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_DFSDMCLK_SOURCE(RCC_DFSDMACLKSource));
2029:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
2030:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg = RCC->DCKCFGR;
2031:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2032:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear CKDFSDMA SEL  bit */
2033:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg &= ~RCC_DCKCFGR_CKDFSDM1ASEL;
2034:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2035:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set CKDFSDM-SEL   bt according to RCC_DFSDMCLKSource value */
2036:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmpreg |= RCC_DFSDMACLKSource;
2037:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2038:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Store the new value */
2039:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR = tmpreg;
2040:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2041:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F413_423xx */
2042:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F412xG || STM32F413_423xx */
2043:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2044:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2045:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Configures the Timers clocks prescalers selection.
2046:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * 
2047:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   This function can be used only for STM32F42xxx/43xxx and STM32F401xx/411xE devices. 
2048:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *   
2049:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_TIMCLKPrescaler : specifies the Timers clocks prescalers selection
2050:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         This parameter can be one of the following values:
2051:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_TIMPrescDesactivated: The Timers kernels clocks prescaler is 
2052:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 equal to HPRE if PPREx is corresponding to division by 1 or 2, 
2053:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 else it is equal to [(HPRE * PPREx) / 2] if PPREx is corresponding to 
2054:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 division by 4 or more.
2055:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                   
2056:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_TIMPrescActivated: The Timers kernels clocks prescaler is 
2057:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 equal to HPRE if PPREx is corresponding to division by 1, 2 or 4, 
2058:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 else it is equal to [(HPRE * PPREx) / 4] if PPREx is corresponding 
2059:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *                 to division by 8 or more.
2060:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2061:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2062:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_TIMCLKPresConfig(uint32_t RCC_TIMCLKPrescaler)
2063:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2051              		.loc 2 2063 0
 2052              		.cfi_startproc
 2053              		@ args = 0, pretend = 0, frame = 8
 2054              		@ frame_needed = 1, uses_anonymous_args = 0
 2055 082c 80B5     		push	{r7, lr}
 2056              		.cfi_def_cfa_offset 8
 2057              		.cfi_offset 7, -8
 2058              		.cfi_offset 14, -4
 2059 082e 82B0     		sub	sp, sp, #8
 2060              		.cfi_def_cfa_offset 16
 2061 0830 00AF     		add	r7, sp, #0
 2062              		.cfi_def_cfa_register 7
 2063 0832 7860     		str	r0, [r7, #4]
2064:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2065:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_TIMCLK_PRESCALER(RCC_TIMCLKPrescaler));
2066:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2067:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) DCKCFGR_TIMPRE_BB = RCC_TIMCLKPrescaler;
 2064              		.loc 2 2067 0
 2065 0834 034B     		ldr	r3, .L123
 2066 0836 7A68     		ldr	r2, [r7, #4]
 2067 0838 1A60     		str	r2, [r3]
2068:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2068              		.loc 2 2068 0
 2069 083a C046     		nop
 2070 083c BD46     		mov	sp, r7
 2071 083e 02B0     		add	sp, sp, #8
 2072              		@ sp needed
 2073 0840 80BD     		pop	{r7, pc}
 2074              	.L124:
 2075 0842 C046     		.align	2
 2076              	.L123:
 2077 0844 E0114742 		.word	1111953888
 2078              		.cfi_endproc
 2079              	.LFE154:
 2081              		.align	1
 2082              		.global	RCC_AHB1PeriphClockCmd
 2083              		.syntax unified
 2084              		.code	16
 2085              		.thumb_func
 2086              		.fpu softvfp
 2088              	RCC_AHB1PeriphClockCmd:
 2089              	.LFB155:
2069:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2070:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2071:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the AHB1 peripheral clock.
2072:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After reset, the peripheral clock (used for registers read/write access)
2073:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is disabled and the application software has to enable this clock before 
2074:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         using it.   
2075:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHBPeriph: specifies the AHB1 peripheral to gates its clock.
2076:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2077:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOA:       GPIOA clock
2078:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOB:       GPIOB clock 
2079:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOC:       GPIOC clock
2080:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOD:       GPIOD clock
2081:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOE:       GPIOE clock
2082:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOF:       GPIOF clock
2083:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOG:       GPIOG clock
2084:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOG:       GPIOG clock
2085:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOI:       GPIOI clock
2086:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOJ:       GPIOJ clock (STM32F42xxx/43xxx devices) 
2087:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOK:       GPIOK clock (STM32F42xxx/43xxx devices)  
2088:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_CRC:         CRC clock
2089:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_BKPSRAM:     BKPSRAM interface clock
2090:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_CCMDATARAMEN CCM data RAM interface clock
2091:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA1:        DMA1 clock
2092:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA2:        DMA2 clock
2093:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA2D:       DMA2D clock (STM32F429xx/439xx devices)  
2094:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC:     Ethernet MAC clock
2095:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC_Tx:  Ethernet Transmission clock
2096:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC_Rx:  Ethernet Reception clock
2097:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC_PTP: Ethernet PTP clock
2098:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_OTG_HS:      USB OTG HS clock
2099:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_OTG_HS_ULPI: USB OTG HS ULPI clock
2100:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2101:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2102:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2103:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2104:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB1PeriphClockCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState)
2105:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2090              		.loc 2 2105 0
 2091              		.cfi_startproc
 2092              		@ args = 0, pretend = 0, frame = 8
 2093              		@ frame_needed = 1, uses_anonymous_args = 0
 2094 0848 80B5     		push	{r7, lr}
 2095              		.cfi_def_cfa_offset 8
 2096              		.cfi_offset 7, -8
 2097              		.cfi_offset 14, -4
 2098 084a 82B0     		sub	sp, sp, #8
 2099              		.cfi_def_cfa_offset 16
 2100 084c 00AF     		add	r7, sp, #0
 2101              		.cfi_def_cfa_register 7
 2102 084e 7860     		str	r0, [r7, #4]
 2103 0850 0A00     		movs	r2, r1
 2104 0852 FB1C     		adds	r3, r7, #3
 2105 0854 1A70     		strb	r2, [r3]
2106:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2107:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB1_CLOCK_PERIPH(RCC_AHB1Periph));
2108:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2109:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2110:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2106              		.loc 2 2110 0
 2107 0856 FB1C     		adds	r3, r7, #3
 2108 0858 1B78     		ldrb	r3, [r3]
 2109 085a 002B     		cmp	r3, #0
 2110 085c 06D0     		beq	.L126
2111:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2112:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB1ENR |= RCC_AHB1Periph;
 2111              		.loc 2 2112 0
 2112 085e 094B     		ldr	r3, .L129
 2113 0860 196B     		ldr	r1, [r3, #48]
 2114 0862 084B     		ldr	r3, .L129
 2115 0864 7A68     		ldr	r2, [r7, #4]
 2116 0866 0A43     		orrs	r2, r1
 2117 0868 1A63     		str	r2, [r3, #48]
2113:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2114:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2115:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2116:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB1ENR &= ~RCC_AHB1Periph;
2117:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2118:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2118              		.loc 2 2118 0
 2119 086a 06E0     		b	.L128
 2120              	.L126:
2116:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2121              		.loc 2 2116 0
 2122 086c 054B     		ldr	r3, .L129
 2123 086e 1A6B     		ldr	r2, [r3, #48]
 2124 0870 7B68     		ldr	r3, [r7, #4]
 2125 0872 D943     		mvns	r1, r3
 2126 0874 034B     		ldr	r3, .L129
 2127 0876 0A40     		ands	r2, r1
 2128 0878 1A63     		str	r2, [r3, #48]
 2129              	.L128:
 2130              		.loc 2 2118 0
 2131 087a C046     		nop
 2132 087c BD46     		mov	sp, r7
 2133 087e 02B0     		add	sp, sp, #8
 2134              		@ sp needed
 2135 0880 80BD     		pop	{r7, pc}
 2136              	.L130:
 2137 0882 C046     		.align	2
 2138              	.L129:
 2139 0884 00380240 		.word	1073887232
 2140              		.cfi_endproc
 2141              	.LFE155:
 2143              		.align	1
 2144              		.global	RCC_AHB2PeriphClockCmd
 2145              		.syntax unified
 2146              		.code	16
 2147              		.thumb_func
 2148              		.fpu softvfp
 2150              	RCC_AHB2PeriphClockCmd:
 2151              	.LFB156:
2119:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2120:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2121:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the AHB2 peripheral clock.
2122:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After reset, the peripheral clock (used for registers read/write access)
2123:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is disabled and the application software has to enable this clock before 
2124:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         using it. 
2125:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHBPeriph: specifies the AHB2 peripheral to gates its clock.
2126:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2127:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_DCMI:   DCMI clock
2128:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_CRYP:   CRYP clock
2129:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_HASH:   HASH clock
2130:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_RNG:    RNG clock
2131:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_OTG_FS: USB OTG FS clock
2132:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2133:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2134:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2135:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2136:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB2PeriphClockCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState)
2137:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2152              		.loc 2 2137 0
 2153              		.cfi_startproc
 2154              		@ args = 0, pretend = 0, frame = 8
 2155              		@ frame_needed = 1, uses_anonymous_args = 0
 2156 0888 80B5     		push	{r7, lr}
 2157              		.cfi_def_cfa_offset 8
 2158              		.cfi_offset 7, -8
 2159              		.cfi_offset 14, -4
 2160 088a 82B0     		sub	sp, sp, #8
 2161              		.cfi_def_cfa_offset 16
 2162 088c 00AF     		add	r7, sp, #0
 2163              		.cfi_def_cfa_register 7
 2164 088e 7860     		str	r0, [r7, #4]
 2165 0890 0A00     		movs	r2, r1
 2166 0892 FB1C     		adds	r3, r7, #3
 2167 0894 1A70     		strb	r2, [r3]
2138:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2139:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB2_PERIPH(RCC_AHB2Periph));
2140:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2141:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2142:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2168              		.loc 2 2142 0
 2169 0896 FB1C     		adds	r3, r7, #3
 2170 0898 1B78     		ldrb	r3, [r3]
 2171 089a 002B     		cmp	r3, #0
 2172 089c 06D0     		beq	.L132
2143:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2144:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB2ENR |= RCC_AHB2Periph;
 2173              		.loc 2 2144 0
 2174 089e 094B     		ldr	r3, .L135
 2175 08a0 596B     		ldr	r1, [r3, #52]
 2176 08a2 084B     		ldr	r3, .L135
 2177 08a4 7A68     		ldr	r2, [r7, #4]
 2178 08a6 0A43     		orrs	r2, r1
 2179 08a8 5A63     		str	r2, [r3, #52]
2145:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2146:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2147:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2148:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB2ENR &= ~RCC_AHB2Periph;
2149:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2150:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2180              		.loc 2 2150 0
 2181 08aa 06E0     		b	.L134
 2182              	.L132:
2148:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2183              		.loc 2 2148 0
 2184 08ac 054B     		ldr	r3, .L135
 2185 08ae 5A6B     		ldr	r2, [r3, #52]
 2186 08b0 7B68     		ldr	r3, [r7, #4]
 2187 08b2 D943     		mvns	r1, r3
 2188 08b4 034B     		ldr	r3, .L135
 2189 08b6 0A40     		ands	r2, r1
 2190 08b8 5A63     		str	r2, [r3, #52]
 2191              	.L134:
 2192              		.loc 2 2150 0
 2193 08ba C046     		nop
 2194 08bc BD46     		mov	sp, r7
 2195 08be 02B0     		add	sp, sp, #8
 2196              		@ sp needed
 2197 08c0 80BD     		pop	{r7, pc}
 2198              	.L136:
 2199 08c2 C046     		.align	2
 2200              	.L135:
 2201 08c4 00380240 		.word	1073887232
 2202              		.cfi_endproc
 2203              	.LFE156:
 2205              		.align	1
 2206              		.global	RCC_AHB3PeriphClockCmd
 2207              		.syntax unified
 2208              		.code	16
 2209              		.thumb_func
 2210              		.fpu softvfp
 2212              	RCC_AHB3PeriphClockCmd:
 2213              	.LFB157:
2151:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2152:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F42
2153:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2154:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the AHB3 peripheral clock.
2155:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After reset, the peripheral clock (used for registers read/write access)
2156:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is disabled and the application software has to enable this clock before 
2157:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         using it. 
2158:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHBPeriph: specifies the AHB3 peripheral to gates its clock.
2159:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be: 
2160:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           - RCC_AHB3Periph_FSMC or RCC_AHB3Periph_FMC (STM32F412xG/STM32F413_423xx/STM32F429x/4
2161:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           - RCC_AHB3Periph_QSPI (STM32F412xG/STM32F413_423xx/STM32F446xx/STM32F469_479xx device
2162:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2163:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2164:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2165:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2166:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB3PeriphClockCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState)
2167:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2214              		.loc 2 2167 0
 2215              		.cfi_startproc
 2216              		@ args = 0, pretend = 0, frame = 8
 2217              		@ frame_needed = 1, uses_anonymous_args = 0
 2218 08c8 80B5     		push	{r7, lr}
 2219              		.cfi_def_cfa_offset 8
 2220              		.cfi_offset 7, -8
 2221              		.cfi_offset 14, -4
 2222 08ca 82B0     		sub	sp, sp, #8
 2223              		.cfi_def_cfa_offset 16
 2224 08cc 00AF     		add	r7, sp, #0
 2225              		.cfi_def_cfa_register 7
 2226 08ce 7860     		str	r0, [r7, #4]
 2227 08d0 0A00     		movs	r2, r1
 2228 08d2 FB1C     		adds	r3, r7, #3
 2229 08d4 1A70     		strb	r2, [r3]
2168:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2169:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB3_PERIPH(RCC_AHB3Periph));  
2170:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2171:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2172:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2230              		.loc 2 2172 0
 2231 08d6 FB1C     		adds	r3, r7, #3
 2232 08d8 1B78     		ldrb	r3, [r3]
 2233 08da 002B     		cmp	r3, #0
 2234 08dc 06D0     		beq	.L138
2173:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2174:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB3ENR |= RCC_AHB3Periph;
 2235              		.loc 2 2174 0
 2236 08de 094B     		ldr	r3, .L141
 2237 08e0 996B     		ldr	r1, [r3, #56]
 2238 08e2 084B     		ldr	r3, .L141
 2239 08e4 7A68     		ldr	r2, [r7, #4]
 2240 08e6 0A43     		orrs	r2, r1
 2241 08e8 9A63     		str	r2, [r3, #56]
2175:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2176:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2177:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2178:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB3ENR &= ~RCC_AHB3Periph;
2179:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2180:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2242              		.loc 2 2180 0
 2243 08ea 06E0     		b	.L140
 2244              	.L138:
2178:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2245              		.loc 2 2178 0
 2246 08ec 054B     		ldr	r3, .L141
 2247 08ee 9A6B     		ldr	r2, [r3, #56]
 2248 08f0 7B68     		ldr	r3, [r7, #4]
 2249 08f2 D943     		mvns	r1, r3
 2250 08f4 034B     		ldr	r3, .L141
 2251 08f6 0A40     		ands	r2, r1
 2252 08f8 9A63     		str	r2, [r3, #56]
 2253              	.L140:
 2254              		.loc 2 2180 0
 2255 08fa C046     		nop
 2256 08fc BD46     		mov	sp, r7
 2257 08fe 02B0     		add	sp, sp, #8
 2258              		@ sp needed
 2259 0900 80BD     		pop	{r7, pc}
 2260              	.L142:
 2261 0902 C046     		.align	2
 2262              	.L141:
 2263 0904 00380240 		.word	1073887232
 2264              		.cfi_endproc
 2265              	.LFE157:
 2267              		.align	1
 2268              		.global	RCC_APB1PeriphClockCmd
 2269              		.syntax unified
 2270              		.code	16
 2271              		.thumb_func
 2272              		.fpu softvfp
 2274              	RCC_APB1PeriphClockCmd:
 2275              	.LFB158:
2181:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F412xG || STM32F413_423xx || STM32F427_437xx || STM32F429_439xx ||
2182:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2183:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2184:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the Low Speed APB (APB1) peripheral clock.
2185:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After reset, the peripheral clock (used for registers read/write access)
2186:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is disabled and the application software has to enable this clock before 
2187:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         using it. 
2188:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_APB1Periph: specifies the APB1 peripheral to gates its clock.
2189:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2190:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM2:   TIM2 clock
2191:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM3:   TIM3 clock
2192:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM4:   TIM4 clock
2193:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM5:   TIM5 clock
2194:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM6:   TIM6 clock
2195:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM7:   TIM7 clock
2196:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM12:  TIM12 clock
2197:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM13:  TIM13 clock
2198:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM14:  TIM14 clock
2199:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_LPTIM1: LPTIM1 clock (STM32F410xx and STM32F413_423xx devices) 
2200:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_WWDG:   WWDG clock
2201:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPI2:   SPI2 clock
2202:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPI3:   SPI3 clock
2203:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPDIF:  SPDIF RX clock (STM32F446xx devices) 
2204:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_USART2: USART2 clock
2205:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_USART3: USART3 clock
2206:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART4:  UART4 clock
2207:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART5:  UART5 clock
2208:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C1:   I2C1 clock
2209:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C2:   I2C2 clock
2210:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C3:   I2C3 clock
2211:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_FMPI2C1:FMPI2C1 clock
2212:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CAN1:   CAN1 clock
2213:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CAN2:   CAN2 clock
2214:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CEC:    CEC clock (STM32F446xx devices)
2215:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_PWR:    PWR clock
2216:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_DAC:    DAC clock
2217:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART7:  UART7 clock
2218:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART8:  UART8 clock
2219:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2220:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2221:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2222:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2223:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_APB1PeriphClockCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
2224:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2276              		.loc 2 2224 0
 2277              		.cfi_startproc
 2278              		@ args = 0, pretend = 0, frame = 8
 2279              		@ frame_needed = 1, uses_anonymous_args = 0
 2280 0908 80B5     		push	{r7, lr}
 2281              		.cfi_def_cfa_offset 8
 2282              		.cfi_offset 7, -8
 2283              		.cfi_offset 14, -4
 2284 090a 82B0     		sub	sp, sp, #8
 2285              		.cfi_def_cfa_offset 16
 2286 090c 00AF     		add	r7, sp, #0
 2287              		.cfi_def_cfa_register 7
 2288 090e 7860     		str	r0, [r7, #4]
 2289 0910 0A00     		movs	r2, r1
 2290 0912 FB1C     		adds	r3, r7, #3
 2291 0914 1A70     		strb	r2, [r3]
2225:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2226:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_APB1_PERIPH(RCC_APB1Periph));  
2227:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2228:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2229:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2292              		.loc 2 2229 0
 2293 0916 FB1C     		adds	r3, r7, #3
 2294 0918 1B78     		ldrb	r3, [r3]
 2295 091a 002B     		cmp	r3, #0
 2296 091c 06D0     		beq	.L144
2230:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2231:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB1ENR |= RCC_APB1Periph;
 2297              		.loc 2 2231 0
 2298 091e 094B     		ldr	r3, .L147
 2299 0920 196C     		ldr	r1, [r3, #64]
 2300 0922 084B     		ldr	r3, .L147
 2301 0924 7A68     		ldr	r2, [r7, #4]
 2302 0926 0A43     		orrs	r2, r1
 2303 0928 1A64     		str	r2, [r3, #64]
2232:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2233:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2234:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2235:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB1ENR &= ~RCC_APB1Periph;
2236:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2237:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2304              		.loc 2 2237 0
 2305 092a 06E0     		b	.L146
 2306              	.L144:
2235:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2307              		.loc 2 2235 0
 2308 092c 054B     		ldr	r3, .L147
 2309 092e 1A6C     		ldr	r2, [r3, #64]
 2310 0930 7B68     		ldr	r3, [r7, #4]
 2311 0932 D943     		mvns	r1, r3
 2312 0934 034B     		ldr	r3, .L147
 2313 0936 0A40     		ands	r2, r1
 2314 0938 1A64     		str	r2, [r3, #64]
 2315              	.L146:
 2316              		.loc 2 2237 0
 2317 093a C046     		nop
 2318 093c BD46     		mov	sp, r7
 2319 093e 02B0     		add	sp, sp, #8
 2320              		@ sp needed
 2321 0940 80BD     		pop	{r7, pc}
 2322              	.L148:
 2323 0942 C046     		.align	2
 2324              	.L147:
 2325 0944 00380240 		.word	1073887232
 2326              		.cfi_endproc
 2327              	.LFE158:
 2329              		.align	1
 2330              		.global	RCC_APB2PeriphClockCmd
 2331              		.syntax unified
 2332              		.code	16
 2333              		.thumb_func
 2334              		.fpu softvfp
 2336              	RCC_APB2PeriphClockCmd:
 2337              	.LFB159:
2238:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2239:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2240:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the High Speed APB (APB2) peripheral clock.
2241:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After reset, the peripheral clock (used for registers read/write access)
2242:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         is disabled and the application software has to enable this clock before 
2243:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         using it.
2244:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_APB2Periph: specifies the APB2 peripheral to gates its clock.
2245:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2246:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM1:   TIM1 clock
2247:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM8:   TIM8 clock
2248:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_USART1: USART1 clock
2249:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_USART6: USART6 clock
2250:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC1:   ADC1 clock
2251:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC2:   ADC2 clock
2252:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC3:   ADC3 clock
2253:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SDIO:   SDIO clock
2254:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI1:   SPI1 clock
2255:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI4:   SPI4 clock
2256:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SYSCFG: SYSCFG clock
2257:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_EXTIT:  EXTIIT clock
2258:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM9:   TIM9 clock
2259:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM10:  TIM10 clock
2260:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM11:  TIM11 clock
2261:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI5:   SPI5 clock
2262:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI6:   SPI6 clock
2263:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SAI1:   SAI1 clock (STM32F42xxx/43xxx/446xx/469xx/479xx/413_423x
2264:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SAI2:   SAI2 clock (STM32F446xx devices) 
2265:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_LTDC:   LTDC clock (STM32F429xx/439xx devices)
2266:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DSI:    DSI clock (STM32F469_479xx devices)
2267:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DFSDM1: DFSDM Clock (STM32F412xG and STM32F413_423xx Devices)
2268:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DFSDM2: DFSDM2 Clock (STM32F413_423xx Devices)
2269:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_UART9:  UART9 Clock (STM32F413_423xx Devices)
2270:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_UART10: UART10 Clock (STM32F413_423xx Devices)
2271:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2272:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2273:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2274:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2275:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_APB2PeriphClockCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
2276:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2338              		.loc 2 2276 0
 2339              		.cfi_startproc
 2340              		@ args = 0, pretend = 0, frame = 8
 2341              		@ frame_needed = 1, uses_anonymous_args = 0
 2342 0948 80B5     		push	{r7, lr}
 2343              		.cfi_def_cfa_offset 8
 2344              		.cfi_offset 7, -8
 2345              		.cfi_offset 14, -4
 2346 094a 82B0     		sub	sp, sp, #8
 2347              		.cfi_def_cfa_offset 16
 2348 094c 00AF     		add	r7, sp, #0
 2349              		.cfi_def_cfa_register 7
 2350 094e 7860     		str	r0, [r7, #4]
 2351 0950 0A00     		movs	r2, r1
 2352 0952 FB1C     		adds	r3, r7, #3
 2353 0954 1A70     		strb	r2, [r3]
2277:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2278:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_APB2_PERIPH(RCC_APB2Periph));
2279:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2280:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2281:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2354              		.loc 2 2281 0
 2355 0956 FB1C     		adds	r3, r7, #3
 2356 0958 1B78     		ldrb	r3, [r3]
 2357 095a 002B     		cmp	r3, #0
 2358 095c 06D0     		beq	.L150
2282:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2283:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB2ENR |= RCC_APB2Periph;
 2359              		.loc 2 2283 0
 2360 095e 094B     		ldr	r3, .L153
 2361 0960 596C     		ldr	r1, [r3, #68]
 2362 0962 084B     		ldr	r3, .L153
 2363 0964 7A68     		ldr	r2, [r7, #4]
 2364 0966 0A43     		orrs	r2, r1
 2365 0968 5A64     		str	r2, [r3, #68]
2284:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2285:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2286:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2287:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB2ENR &= ~RCC_APB2Periph;
2288:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2289:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2366              		.loc 2 2289 0
 2367 096a 06E0     		b	.L152
 2368              	.L150:
2287:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2369              		.loc 2 2287 0
 2370 096c 054B     		ldr	r3, .L153
 2371 096e 5A6C     		ldr	r2, [r3, #68]
 2372 0970 7B68     		ldr	r3, [r7, #4]
 2373 0972 D943     		mvns	r1, r3
 2374 0974 034B     		ldr	r3, .L153
 2375 0976 0A40     		ands	r2, r1
 2376 0978 5A64     		str	r2, [r3, #68]
 2377              	.L152:
 2378              		.loc 2 2289 0
 2379 097a C046     		nop
 2380 097c BD46     		mov	sp, r7
 2381 097e 02B0     		add	sp, sp, #8
 2382              		@ sp needed
 2383 0980 80BD     		pop	{r7, pc}
 2384              	.L154:
 2385 0982 C046     		.align	2
 2386              	.L153:
 2387 0984 00380240 		.word	1073887232
 2388              		.cfi_endproc
 2389              	.LFE159:
 2391              		.align	1
 2392              		.global	RCC_AHB1PeriphResetCmd
 2393              		.syntax unified
 2394              		.code	16
 2395              		.thumb_func
 2396              		.fpu softvfp
 2398              	RCC_AHB1PeriphResetCmd:
 2399              	.LFB160:
2290:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2291:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2292:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Forces or releases AHB1 peripheral reset.
2293:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHB1Periph: specifies the AHB1 peripheral to reset.
2294:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2295:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOA:   GPIOA clock
2296:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOB:   GPIOB clock 
2297:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOC:   GPIOC clock
2298:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOD:   GPIOD clock
2299:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOE:   GPIOE clock
2300:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOF:   GPIOF clock
2301:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOG:   GPIOG clock
2302:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOG:   GPIOG clock
2303:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOI:   GPIOI clock
2304:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOJ:   GPIOJ clock (STM32F42xxx/43xxx devices) 
2305:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOK:   GPIOK clock (STM32F42xxx/43xxxdevices)   
2306:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_CRC:     CRC clock
2307:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA1:    DMA1 clock
2308:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA2:    DMA2 clock
2309:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA2D:   DMA2D clock (STM32F429xx/439xx devices)   
2310:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC: Ethernet MAC clock
2311:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_OTG_HS:  USB OTG HS clock
2312:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_RNG:     RNG clock for STM32F410xx devices   
2313:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral reset.
2314:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2315:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2316:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2317:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB1PeriphResetCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState)
2318:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2400              		.loc 2 2318 0
 2401              		.cfi_startproc
 2402              		@ args = 0, pretend = 0, frame = 8
 2403              		@ frame_needed = 1, uses_anonymous_args = 0
 2404 0988 80B5     		push	{r7, lr}
 2405              		.cfi_def_cfa_offset 8
 2406              		.cfi_offset 7, -8
 2407              		.cfi_offset 14, -4
 2408 098a 82B0     		sub	sp, sp, #8
 2409              		.cfi_def_cfa_offset 16
 2410 098c 00AF     		add	r7, sp, #0
 2411              		.cfi_def_cfa_register 7
 2412 098e 7860     		str	r0, [r7, #4]
 2413 0990 0A00     		movs	r2, r1
 2414 0992 FB1C     		adds	r3, r7, #3
 2415 0994 1A70     		strb	r2, [r3]
2319:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2320:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB1_RESET_PERIPH(RCC_AHB1Periph));
2321:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2322:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2323:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2416              		.loc 2 2323 0
 2417 0996 FB1C     		adds	r3, r7, #3
 2418 0998 1B78     		ldrb	r3, [r3]
 2419 099a 002B     		cmp	r3, #0
 2420 099c 06D0     		beq	.L156
2324:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2325:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB1RSTR |= RCC_AHB1Periph;
 2421              		.loc 2 2325 0
 2422 099e 094B     		ldr	r3, .L159
 2423 09a0 1969     		ldr	r1, [r3, #16]
 2424 09a2 084B     		ldr	r3, .L159
 2425 09a4 7A68     		ldr	r2, [r7, #4]
 2426 09a6 0A43     		orrs	r2, r1
 2427 09a8 1A61     		str	r2, [r3, #16]
2326:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2327:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2328:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2329:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB1RSTR &= ~RCC_AHB1Periph;
2330:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2331:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2428              		.loc 2 2331 0
 2429 09aa 06E0     		b	.L158
 2430              	.L156:
2329:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2431              		.loc 2 2329 0
 2432 09ac 054B     		ldr	r3, .L159
 2433 09ae 1A69     		ldr	r2, [r3, #16]
 2434 09b0 7B68     		ldr	r3, [r7, #4]
 2435 09b2 D943     		mvns	r1, r3
 2436 09b4 034B     		ldr	r3, .L159
 2437 09b6 0A40     		ands	r2, r1
 2438 09b8 1A61     		str	r2, [r3, #16]
 2439              	.L158:
 2440              		.loc 2 2331 0
 2441 09ba C046     		nop
 2442 09bc BD46     		mov	sp, r7
 2443 09be 02B0     		add	sp, sp, #8
 2444              		@ sp needed
 2445 09c0 80BD     		pop	{r7, pc}
 2446              	.L160:
 2447 09c2 C046     		.align	2
 2448              	.L159:
 2449 09c4 00380240 		.word	1073887232
 2450              		.cfi_endproc
 2451              	.LFE160:
 2453              		.align	1
 2454              		.global	RCC_AHB2PeriphResetCmd
 2455              		.syntax unified
 2456              		.code	16
 2457              		.thumb_func
 2458              		.fpu softvfp
 2460              	RCC_AHB2PeriphResetCmd:
 2461              	.LFB161:
2332:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2333:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2334:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Forces or releases AHB2 peripheral reset.
2335:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHB2Periph: specifies the AHB2 peripheral to reset.
2336:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2337:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_DCMI:   DCMI clock
2338:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_CRYP:   CRYP clock
2339:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_HASH:   HASH clock
2340:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_RNG:    RNG clock for STM32F40_41xxx/STM32F412xG/STM32F413_423xx
2341:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_OTG_FS: USB OTG FS clock
2342:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral reset.
2343:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2344:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2345:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2346:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB2PeriphResetCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState)
2347:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2462              		.loc 2 2347 0
 2463              		.cfi_startproc
 2464              		@ args = 0, pretend = 0, frame = 8
 2465              		@ frame_needed = 1, uses_anonymous_args = 0
 2466 09c8 80B5     		push	{r7, lr}
 2467              		.cfi_def_cfa_offset 8
 2468              		.cfi_offset 7, -8
 2469              		.cfi_offset 14, -4
 2470 09ca 82B0     		sub	sp, sp, #8
 2471              		.cfi_def_cfa_offset 16
 2472 09cc 00AF     		add	r7, sp, #0
 2473              		.cfi_def_cfa_register 7
 2474 09ce 7860     		str	r0, [r7, #4]
 2475 09d0 0A00     		movs	r2, r1
 2476 09d2 FB1C     		adds	r3, r7, #3
 2477 09d4 1A70     		strb	r2, [r3]
2348:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2349:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB2_PERIPH(RCC_AHB2Periph));
2350:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2351:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2352:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2478              		.loc 2 2352 0
 2479 09d6 FB1C     		adds	r3, r7, #3
 2480 09d8 1B78     		ldrb	r3, [r3]
 2481 09da 002B     		cmp	r3, #0
 2482 09dc 06D0     		beq	.L162
2353:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2354:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB2RSTR |= RCC_AHB2Periph;
 2483              		.loc 2 2354 0
 2484 09de 094B     		ldr	r3, .L165
 2485 09e0 5969     		ldr	r1, [r3, #20]
 2486 09e2 084B     		ldr	r3, .L165
 2487 09e4 7A68     		ldr	r2, [r7, #4]
 2488 09e6 0A43     		orrs	r2, r1
 2489 09e8 5A61     		str	r2, [r3, #20]
2355:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2356:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2357:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2358:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB2RSTR &= ~RCC_AHB2Periph;
2359:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2360:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2490              		.loc 2 2360 0
 2491 09ea 06E0     		b	.L164
 2492              	.L162:
2358:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2493              		.loc 2 2358 0
 2494 09ec 054B     		ldr	r3, .L165
 2495 09ee 5A69     		ldr	r2, [r3, #20]
 2496 09f0 7B68     		ldr	r3, [r7, #4]
 2497 09f2 D943     		mvns	r1, r3
 2498 09f4 034B     		ldr	r3, .L165
 2499 09f6 0A40     		ands	r2, r1
 2500 09f8 5A61     		str	r2, [r3, #20]
 2501              	.L164:
 2502              		.loc 2 2360 0
 2503 09fa C046     		nop
 2504 09fc BD46     		mov	sp, r7
 2505 09fe 02B0     		add	sp, sp, #8
 2506              		@ sp needed
 2507 0a00 80BD     		pop	{r7, pc}
 2508              	.L166:
 2509 0a02 C046     		.align	2
 2510              	.L165:
 2511 0a04 00380240 		.word	1073887232
 2512              		.cfi_endproc
 2513              	.LFE161:
 2515              		.align	1
 2516              		.global	RCC_AHB3PeriphResetCmd
 2517              		.syntax unified
 2518              		.code	16
 2519              		.thumb_func
 2520              		.fpu softvfp
 2522              	RCC_AHB3PeriphResetCmd:
 2523              	.LFB162:
2361:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2362:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F42
2363:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2364:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Forces or releases AHB3 peripheral reset.
2365:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHB3Periph: specifies the AHB3 peripheral to reset.
2366:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be: 
2367:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           - RCC_AHB3Periph_FSMC or RCC_AHB3Periph_FMC (STM32F412xG, STM32F413_423xx and STM32F4
2368:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           - RCC_AHB3Periph_QSPI (STM32F412xG/STM32F446xx/STM32F469_479xx devices)
2369:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral reset.
2370:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2371:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2372:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2373:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB3PeriphResetCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState)
2374:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2524              		.loc 2 2374 0
 2525              		.cfi_startproc
 2526              		@ args = 0, pretend = 0, frame = 8
 2527              		@ frame_needed = 1, uses_anonymous_args = 0
 2528 0a08 80B5     		push	{r7, lr}
 2529              		.cfi_def_cfa_offset 8
 2530              		.cfi_offset 7, -8
 2531              		.cfi_offset 14, -4
 2532 0a0a 82B0     		sub	sp, sp, #8
 2533              		.cfi_def_cfa_offset 16
 2534 0a0c 00AF     		add	r7, sp, #0
 2535              		.cfi_def_cfa_register 7
 2536 0a0e 7860     		str	r0, [r7, #4]
 2537 0a10 0A00     		movs	r2, r1
 2538 0a12 FB1C     		adds	r3, r7, #3
 2539 0a14 1A70     		strb	r2, [r3]
2375:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2376:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB3_PERIPH(RCC_AHB3Periph));
2377:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2378:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2379:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2540              		.loc 2 2379 0
 2541 0a16 FB1C     		adds	r3, r7, #3
 2542 0a18 1B78     		ldrb	r3, [r3]
 2543 0a1a 002B     		cmp	r3, #0
 2544 0a1c 06D0     		beq	.L168
2380:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2381:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB3RSTR |= RCC_AHB3Periph;
 2545              		.loc 2 2381 0
 2546 0a1e 094B     		ldr	r3, .L171
 2547 0a20 9969     		ldr	r1, [r3, #24]
 2548 0a22 084B     		ldr	r3, .L171
 2549 0a24 7A68     		ldr	r2, [r7, #4]
 2550 0a26 0A43     		orrs	r2, r1
 2551 0a28 9A61     		str	r2, [r3, #24]
2382:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2383:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2384:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2385:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB3RSTR &= ~RCC_AHB3Periph;
2386:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2387:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2552              		.loc 2 2387 0
 2553 0a2a 06E0     		b	.L170
 2554              	.L168:
2385:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2555              		.loc 2 2385 0
 2556 0a2c 054B     		ldr	r3, .L171
 2557 0a2e 9A69     		ldr	r2, [r3, #24]
 2558 0a30 7B68     		ldr	r3, [r7, #4]
 2559 0a32 D943     		mvns	r1, r3
 2560 0a34 034B     		ldr	r3, .L171
 2561 0a36 0A40     		ands	r2, r1
 2562 0a38 9A61     		str	r2, [r3, #24]
 2563              	.L170:
 2564              		.loc 2 2387 0
 2565 0a3a C046     		nop
 2566 0a3c BD46     		mov	sp, r7
 2567 0a3e 02B0     		add	sp, sp, #8
 2568              		@ sp needed
 2569 0a40 80BD     		pop	{r7, pc}
 2570              	.L172:
 2571 0a42 C046     		.align	2
 2572              	.L171:
 2573 0a44 00380240 		.word	1073887232
 2574              		.cfi_endproc
 2575              	.LFE162:
 2577              		.align	1
 2578              		.global	RCC_APB1PeriphResetCmd
 2579              		.syntax unified
 2580              		.code	16
 2581              		.thumb_func
 2582              		.fpu softvfp
 2584              	RCC_APB1PeriphResetCmd:
 2585              	.LFB163:
2388:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F412xG || STM32F413_423xx || STM32F427_437xx || STM32F429_439xx ||
2389:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2390:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2391:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Forces or releases Low Speed APB (APB1) peripheral reset.
2392:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_APB1Periph: specifies the APB1 peripheral to reset.
2393:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2394:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM2:   TIM2 clock
2395:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM3:   TIM3 clock
2396:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM4:   TIM4 clock
2397:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM5:   TIM5 clock
2398:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM6:   TIM6 clock
2399:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM7:   TIM7 clock
2400:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM12:  TIM12 clock
2401:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM13:  TIM13 clock
2402:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM14:  TIM14 clock
2403:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_LPTIM1: LPTIM1 clock (STM32F410xx and STM32F413_423xx devices) 
2404:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_WWDG:   WWDG clock
2405:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPI2:   SPI2 clock
2406:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPI3:   SPI3 clock
2407:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPDIF:  SPDIF RX clock (STM32F446xx devices) 
2408:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_USART2: USART2 clock
2409:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_USART3: USART3 clock
2410:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART4:  UART4 clock
2411:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART5:  UART5 clock
2412:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C1:   I2C1 clock
2413:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C2:   I2C2 clock
2414:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C3:   I2C3 clock
2415:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_FMPI2C1:FMPI2C1 clock
2416:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CAN1:   CAN1 clock
2417:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CAN2:   CAN2 clock
2418:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CEC:    CEC clock(STM32F446xx devices)
2419:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_PWR:    PWR clock
2420:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_DAC:    DAC clock
2421:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART7:  UART7 clock
2422:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART8:  UART8 clock  
2423:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral reset.
2424:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2425:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2426:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2427:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_APB1PeriphResetCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
2428:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2586              		.loc 2 2428 0
 2587              		.cfi_startproc
 2588              		@ args = 0, pretend = 0, frame = 8
 2589              		@ frame_needed = 1, uses_anonymous_args = 0
 2590 0a48 80B5     		push	{r7, lr}
 2591              		.cfi_def_cfa_offset 8
 2592              		.cfi_offset 7, -8
 2593              		.cfi_offset 14, -4
 2594 0a4a 82B0     		sub	sp, sp, #8
 2595              		.cfi_def_cfa_offset 16
 2596 0a4c 00AF     		add	r7, sp, #0
 2597              		.cfi_def_cfa_register 7
 2598 0a4e 7860     		str	r0, [r7, #4]
 2599 0a50 0A00     		movs	r2, r1
 2600 0a52 FB1C     		adds	r3, r7, #3
 2601 0a54 1A70     		strb	r2, [r3]
2429:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2430:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_APB1_PERIPH(RCC_APB1Periph));
2431:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2432:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2602              		.loc 2 2432 0
 2603 0a56 FB1C     		adds	r3, r7, #3
 2604 0a58 1B78     		ldrb	r3, [r3]
 2605 0a5a 002B     		cmp	r3, #0
 2606 0a5c 06D0     		beq	.L174
2433:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2434:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB1RSTR |= RCC_APB1Periph;
 2607              		.loc 2 2434 0
 2608 0a5e 094B     		ldr	r3, .L177
 2609 0a60 196A     		ldr	r1, [r3, #32]
 2610 0a62 084B     		ldr	r3, .L177
 2611 0a64 7A68     		ldr	r2, [r7, #4]
 2612 0a66 0A43     		orrs	r2, r1
 2613 0a68 1A62     		str	r2, [r3, #32]
2435:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2436:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2437:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2438:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB1RSTR &= ~RCC_APB1Periph;
2439:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2440:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2614              		.loc 2 2440 0
 2615 0a6a 06E0     		b	.L176
 2616              	.L174:
2438:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2617              		.loc 2 2438 0
 2618 0a6c 054B     		ldr	r3, .L177
 2619 0a6e 1A6A     		ldr	r2, [r3, #32]
 2620 0a70 7B68     		ldr	r3, [r7, #4]
 2621 0a72 D943     		mvns	r1, r3
 2622 0a74 034B     		ldr	r3, .L177
 2623 0a76 0A40     		ands	r2, r1
 2624 0a78 1A62     		str	r2, [r3, #32]
 2625              	.L176:
 2626              		.loc 2 2440 0
 2627 0a7a C046     		nop
 2628 0a7c BD46     		mov	sp, r7
 2629 0a7e 02B0     		add	sp, sp, #8
 2630              		@ sp needed
 2631 0a80 80BD     		pop	{r7, pc}
 2632              	.L178:
 2633 0a82 C046     		.align	2
 2634              	.L177:
 2635 0a84 00380240 		.word	1073887232
 2636              		.cfi_endproc
 2637              	.LFE163:
 2639              		.align	1
 2640              		.global	RCC_APB2PeriphResetCmd
 2641              		.syntax unified
 2642              		.code	16
 2643              		.thumb_func
 2644              		.fpu softvfp
 2646              	RCC_APB2PeriphResetCmd:
 2647              	.LFB164:
2441:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2442:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2443:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Forces or releases High Speed APB (APB2) peripheral reset.
2444:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_APB2Periph: specifies the APB2 peripheral to reset.
2445:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2446:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM1:   TIM1 clock
2447:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM8:   TIM8 clock
2448:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_USART1: USART1 clock
2449:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_USART6: USART6 clock
2450:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC1:   ADC1 clock
2451:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC2:   ADC2 clock
2452:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC3:   ADC3 clock
2453:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SDIO:   SDIO clock
2454:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI1:   SPI1 clock
2455:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI4:   SPI4 clock  
2456:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SYSCFG: SYSCFG clock
2457:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM9:   TIM9 clock
2458:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM10:  TIM10 clock
2459:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM11:  TIM11 clock
2460:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI5:   SPI5 clock
2461:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI6:   SPI6 clock
2462:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SAI1:   SAI1 clock (STM32F42xxx/43xxx/446xx/469xx/479xx/413_423x
2463:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SAI2:   SAI2 clock (STM32F446xx devices) 
2464:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_LTDC:   LTDC clock (STM32F429xx/439xx devices)
2465:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DSI:    DSI clock (STM32F469_479xx devices)
2466:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DFSDM1: DFSDM Clock (STM32F412xG and STM32F413_423xx Devices)
2467:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DFSDM2: DFSDM2 Clock (STM32F413_423xx Devices)
2468:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_UART9:  UART9 Clock (STM32F413_423xx Devices)
2469:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_UART10: UART10 Clock (STM32F413_423xx Devices)
2470:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral reset.
2471:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2472:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2473:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2474:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_APB2PeriphResetCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
2475:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2648              		.loc 2 2475 0
 2649              		.cfi_startproc
 2650              		@ args = 0, pretend = 0, frame = 8
 2651              		@ frame_needed = 1, uses_anonymous_args = 0
 2652 0a88 80B5     		push	{r7, lr}
 2653              		.cfi_def_cfa_offset 8
 2654              		.cfi_offset 7, -8
 2655              		.cfi_offset 14, -4
 2656 0a8a 82B0     		sub	sp, sp, #8
 2657              		.cfi_def_cfa_offset 16
 2658 0a8c 00AF     		add	r7, sp, #0
 2659              		.cfi_def_cfa_register 7
 2660 0a8e 7860     		str	r0, [r7, #4]
 2661 0a90 0A00     		movs	r2, r1
 2662 0a92 FB1C     		adds	r3, r7, #3
 2663 0a94 1A70     		strb	r2, [r3]
2476:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2477:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_APB2_RESET_PERIPH(RCC_APB2Periph));
2478:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2479:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2664              		.loc 2 2479 0
 2665 0a96 FB1C     		adds	r3, r7, #3
 2666 0a98 1B78     		ldrb	r3, [r3]
 2667 0a9a 002B     		cmp	r3, #0
 2668 0a9c 06D0     		beq	.L180
2480:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2481:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB2RSTR |= RCC_APB2Periph;
 2669              		.loc 2 2481 0
 2670 0a9e 094B     		ldr	r3, .L183
 2671 0aa0 596A     		ldr	r1, [r3, #36]
 2672 0aa2 084B     		ldr	r3, .L183
 2673 0aa4 7A68     		ldr	r2, [r7, #4]
 2674 0aa6 0A43     		orrs	r2, r1
 2675 0aa8 5A62     		str	r2, [r3, #36]
2482:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2483:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2484:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2485:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB2RSTR &= ~RCC_APB2Periph;
2486:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2487:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2676              		.loc 2 2487 0
 2677 0aaa 06E0     		b	.L182
 2678              	.L180:
2485:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2679              		.loc 2 2485 0
 2680 0aac 054B     		ldr	r3, .L183
 2681 0aae 5A6A     		ldr	r2, [r3, #36]
 2682 0ab0 7B68     		ldr	r3, [r7, #4]
 2683 0ab2 D943     		mvns	r1, r3
 2684 0ab4 034B     		ldr	r3, .L183
 2685 0ab6 0A40     		ands	r2, r1
 2686 0ab8 5A62     		str	r2, [r3, #36]
 2687              	.L182:
 2688              		.loc 2 2487 0
 2689 0aba C046     		nop
 2690 0abc BD46     		mov	sp, r7
 2691 0abe 02B0     		add	sp, sp, #8
 2692              		@ sp needed
 2693 0ac0 80BD     		pop	{r7, pc}
 2694              	.L184:
 2695 0ac2 C046     		.align	2
 2696              	.L183:
 2697 0ac4 00380240 		.word	1073887232
 2698              		.cfi_endproc
 2699              	.LFE164:
 2701              		.align	1
 2702              		.global	RCC_AHB1PeriphClockLPModeCmd
 2703              		.syntax unified
 2704              		.code	16
 2705              		.thumb_func
 2706              		.fpu softvfp
 2708              	RCC_AHB1PeriphClockLPModeCmd:
 2709              	.LFB165:
2488:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2489:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2490:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the AHB1 peripheral clock during Low Power (Sleep) mode.
2491:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Peripheral clock gating in SLEEP mode can be used to further reduce
2492:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         power consumption.
2493:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After wakeup from SLEEP mode, the peripheral clock is enabled again.
2494:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   By default, all peripheral clocks are enabled during SLEEP mode.
2495:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHBPeriph: specifies the AHB1 peripheral to gates its clock.
2496:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2497:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOA:       GPIOA clock
2498:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOB:       GPIOB clock 
2499:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOC:       GPIOC clock
2500:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOD:       GPIOD clock
2501:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOE:       GPIOE clock
2502:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOF:       GPIOF clock
2503:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOG:       GPIOG clock
2504:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOG:       GPIOG clock
2505:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOI:       GPIOI clock
2506:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOJ:       GPIOJ clock (STM32F42xxx/43xxx devices) 
2507:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_GPIOK:       GPIOK clock (STM32F42xxx/43xxx devices)   
2508:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_CRC:         CRC clock
2509:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_BKPSRAM:     BKPSRAM interface clock
2510:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA1:        DMA1 clock
2511:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA2:        DMA2 clock
2512:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_DMA2D:       DMA2D clock (STM32F429xx/439xx devices) 
2513:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC:     Ethernet MAC clock
2514:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC_Tx:  Ethernet Transmission clock
2515:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC_Rx:  Ethernet Reception clock
2516:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_ETH_MAC_PTP: Ethernet PTP clock
2517:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_OTG_HS:      USB OTG HS clock
2518:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1Periph_OTG_HS_ULPI: USB OTG HS ULPI clock
2519:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2520:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2521:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2522:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2523:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB1PeriphClockLPModeCmd(uint32_t RCC_AHB1Periph, FunctionalState NewState)
2524:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2710              		.loc 2 2524 0
 2711              		.cfi_startproc
 2712              		@ args = 0, pretend = 0, frame = 8
 2713              		@ frame_needed = 1, uses_anonymous_args = 0
 2714 0ac8 80B5     		push	{r7, lr}
 2715              		.cfi_def_cfa_offset 8
 2716              		.cfi_offset 7, -8
 2717              		.cfi_offset 14, -4
 2718 0aca 82B0     		sub	sp, sp, #8
 2719              		.cfi_def_cfa_offset 16
 2720 0acc 00AF     		add	r7, sp, #0
 2721              		.cfi_def_cfa_register 7
 2722 0ace 7860     		str	r0, [r7, #4]
 2723 0ad0 0A00     		movs	r2, r1
 2724 0ad2 FB1C     		adds	r3, r7, #3
 2725 0ad4 1A70     		strb	r2, [r3]
2525:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2526:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB1_LPMODE_PERIPH(RCC_AHB1Periph));
2527:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2528:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2726              		.loc 2 2528 0
 2727 0ad6 FB1C     		adds	r3, r7, #3
 2728 0ad8 1B78     		ldrb	r3, [r3]
 2729 0ada 002B     		cmp	r3, #0
 2730 0adc 06D0     		beq	.L186
2529:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2530:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB1LPENR |= RCC_AHB1Periph;
 2731              		.loc 2 2530 0
 2732 0ade 094B     		ldr	r3, .L189
 2733 0ae0 196D     		ldr	r1, [r3, #80]
 2734 0ae2 084B     		ldr	r3, .L189
 2735 0ae4 7A68     		ldr	r2, [r7, #4]
 2736 0ae6 0A43     		orrs	r2, r1
 2737 0ae8 1A65     		str	r2, [r3, #80]
2531:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2532:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2533:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2534:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB1LPENR &= ~RCC_AHB1Periph;
2535:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2536:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2738              		.loc 2 2536 0
 2739 0aea 06E0     		b	.L188
 2740              	.L186:
2534:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2741              		.loc 2 2534 0
 2742 0aec 054B     		ldr	r3, .L189
 2743 0aee 1A6D     		ldr	r2, [r3, #80]
 2744 0af0 7B68     		ldr	r3, [r7, #4]
 2745 0af2 D943     		mvns	r1, r3
 2746 0af4 034B     		ldr	r3, .L189
 2747 0af6 0A40     		ands	r2, r1
 2748 0af8 1A65     		str	r2, [r3, #80]
 2749              	.L188:
 2750              		.loc 2 2536 0
 2751 0afa C046     		nop
 2752 0afc BD46     		mov	sp, r7
 2753 0afe 02B0     		add	sp, sp, #8
 2754              		@ sp needed
 2755 0b00 80BD     		pop	{r7, pc}
 2756              	.L190:
 2757 0b02 C046     		.align	2
 2758              	.L189:
 2759 0b04 00380240 		.word	1073887232
 2760              		.cfi_endproc
 2761              	.LFE165:
 2763              		.align	1
 2764              		.global	RCC_AHB2PeriphClockLPModeCmd
 2765              		.syntax unified
 2766              		.code	16
 2767              		.thumb_func
 2768              		.fpu softvfp
 2770              	RCC_AHB2PeriphClockLPModeCmd:
 2771              	.LFB166:
2537:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2538:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2539:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the AHB2 peripheral clock during Low Power (Sleep) mode.
2540:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Peripheral clock gating in SLEEP mode can be used to further reduce
2541:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           power consumption.
2542:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After wakeup from SLEEP mode, the peripheral clock is enabled again.
2543:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   By default, all peripheral clocks are enabled during SLEEP mode.
2544:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHBPeriph: specifies the AHB2 peripheral to gates its clock.
2545:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2546:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_DCMI:   DCMI clock
2547:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_CRYP:   CRYP clock
2548:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_HASH:   HASH clock
2549:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_RNG:    RNG clock
2550:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB2Periph_OTG_FS: USB OTG FS clock  
2551:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2552:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2553:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2554:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2555:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB2PeriphClockLPModeCmd(uint32_t RCC_AHB2Periph, FunctionalState NewState)
2556:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2772              		.loc 2 2556 0
 2773              		.cfi_startproc
 2774              		@ args = 0, pretend = 0, frame = 8
 2775              		@ frame_needed = 1, uses_anonymous_args = 0
 2776 0b08 80B5     		push	{r7, lr}
 2777              		.cfi_def_cfa_offset 8
 2778              		.cfi_offset 7, -8
 2779              		.cfi_offset 14, -4
 2780 0b0a 82B0     		sub	sp, sp, #8
 2781              		.cfi_def_cfa_offset 16
 2782 0b0c 00AF     		add	r7, sp, #0
 2783              		.cfi_def_cfa_register 7
 2784 0b0e 7860     		str	r0, [r7, #4]
 2785 0b10 0A00     		movs	r2, r1
 2786 0b12 FB1C     		adds	r3, r7, #3
 2787 0b14 1A70     		strb	r2, [r3]
2557:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2558:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB2_PERIPH(RCC_AHB2Periph));
2559:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2560:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2788              		.loc 2 2560 0
 2789 0b16 FB1C     		adds	r3, r7, #3
 2790 0b18 1B78     		ldrb	r3, [r3]
 2791 0b1a 002B     		cmp	r3, #0
 2792 0b1c 06D0     		beq	.L192
2561:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2562:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB2LPENR |= RCC_AHB2Periph;
 2793              		.loc 2 2562 0
 2794 0b1e 094B     		ldr	r3, .L195
 2795 0b20 596D     		ldr	r1, [r3, #84]
 2796 0b22 084B     		ldr	r3, .L195
 2797 0b24 7A68     		ldr	r2, [r7, #4]
 2798 0b26 0A43     		orrs	r2, r1
 2799 0b28 5A65     		str	r2, [r3, #84]
2563:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2564:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2565:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2566:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB2LPENR &= ~RCC_AHB2Periph;
2567:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2568:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2800              		.loc 2 2568 0
 2801 0b2a 06E0     		b	.L194
 2802              	.L192:
2566:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2803              		.loc 2 2566 0
 2804 0b2c 054B     		ldr	r3, .L195
 2805 0b2e 5A6D     		ldr	r2, [r3, #84]
 2806 0b30 7B68     		ldr	r3, [r7, #4]
 2807 0b32 D943     		mvns	r1, r3
 2808 0b34 034B     		ldr	r3, .L195
 2809 0b36 0A40     		ands	r2, r1
 2810 0b38 5A65     		str	r2, [r3, #84]
 2811              	.L194:
 2812              		.loc 2 2568 0
 2813 0b3a C046     		nop
 2814 0b3c BD46     		mov	sp, r7
 2815 0b3e 02B0     		add	sp, sp, #8
 2816              		@ sp needed
 2817 0b40 80BD     		pop	{r7, pc}
 2818              	.L196:
 2819 0b42 C046     		.align	2
 2820              	.L195:
 2821 0b44 00380240 		.word	1073887232
 2822              		.cfi_endproc
 2823              	.LFE166:
 2825              		.align	1
 2826              		.global	RCC_AHB3PeriphClockLPModeCmd
 2827              		.syntax unified
 2828              		.code	16
 2829              		.thumb_func
 2830              		.fpu softvfp
 2832              	RCC_AHB3PeriphClockLPModeCmd:
 2833              	.LFB167:
2569:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2570:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F40_41xxx) || defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F42
2571:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2572:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the AHB3 peripheral clock during Low Power (Sleep) mode.
2573:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Peripheral clock gating in SLEEP mode can be used to further reduce
2574:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         power consumption.
2575:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After wakeup from SLEEP mode, the peripheral clock is enabled again.
2576:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   By default, all peripheral clocks are enabled during SLEEP mode.
2577:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHBPeriph: specifies the AHB3 peripheral to gates its clock.
2578:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter must be: 
2579:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           - RCC_AHB3Periph_FSMC or RCC_AHB3Periph_FMC (STM32F412xG/STM32F413_423xx/STM32F429x/4
2580:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *           - RCC_AHB3Periph_QSPI (STM32F412xG/STM32F413_423xx/STM32F446xx/STM32F469_479xx device
2581:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2582:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2583:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2584:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2585:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB3PeriphClockLPModeCmd(uint32_t RCC_AHB3Periph, FunctionalState NewState)
2586:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2834              		.loc 2 2586 0
 2835              		.cfi_startproc
 2836              		@ args = 0, pretend = 0, frame = 8
 2837              		@ frame_needed = 1, uses_anonymous_args = 0
 2838 0b48 80B5     		push	{r7, lr}
 2839              		.cfi_def_cfa_offset 8
 2840              		.cfi_offset 7, -8
 2841              		.cfi_offset 14, -4
 2842 0b4a 82B0     		sub	sp, sp, #8
 2843              		.cfi_def_cfa_offset 16
 2844 0b4c 00AF     		add	r7, sp, #0
 2845              		.cfi_def_cfa_register 7
 2846 0b4e 7860     		str	r0, [r7, #4]
 2847 0b50 0A00     		movs	r2, r1
 2848 0b52 FB1C     		adds	r3, r7, #3
 2849 0b54 1A70     		strb	r2, [r3]
2587:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2588:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB3_PERIPH(RCC_AHB3Periph));
2589:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2590:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2850              		.loc 2 2590 0
 2851 0b56 FB1C     		adds	r3, r7, #3
 2852 0b58 1B78     		ldrb	r3, [r3]
 2853 0b5a 002B     		cmp	r3, #0
 2854 0b5c 06D0     		beq	.L198
2591:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2592:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB3LPENR |= RCC_AHB3Periph;
 2855              		.loc 2 2592 0
 2856 0b5e 094B     		ldr	r3, .L201
 2857 0b60 996D     		ldr	r1, [r3, #88]
 2858 0b62 084B     		ldr	r3, .L201
 2859 0b64 7A68     		ldr	r2, [r7, #4]
 2860 0b66 0A43     		orrs	r2, r1
 2861 0b68 9A65     		str	r2, [r3, #88]
2593:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2594:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2595:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2596:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->AHB3LPENR &= ~RCC_AHB3Periph;
2597:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2598:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2862              		.loc 2 2598 0
 2863 0b6a 06E0     		b	.L200
 2864              	.L198:
2596:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2865              		.loc 2 2596 0
 2866 0b6c 054B     		ldr	r3, .L201
 2867 0b6e 9A6D     		ldr	r2, [r3, #88]
 2868 0b70 7B68     		ldr	r3, [r7, #4]
 2869 0b72 D943     		mvns	r1, r3
 2870 0b74 034B     		ldr	r3, .L201
 2871 0b76 0A40     		ands	r2, r1
 2872 0b78 9A65     		str	r2, [r3, #88]
 2873              	.L200:
 2874              		.loc 2 2598 0
 2875 0b7a C046     		nop
 2876 0b7c BD46     		mov	sp, r7
 2877 0b7e 02B0     		add	sp, sp, #8
 2878              		@ sp needed
 2879 0b80 80BD     		pop	{r7, pc}
 2880              	.L202:
 2881 0b82 C046     		.align	2
 2882              	.L201:
 2883 0b84 00380240 		.word	1073887232
 2884              		.cfi_endproc
 2885              	.LFE167:
 2887              		.align	1
 2888              		.global	RCC_APB1PeriphClockLPModeCmd
 2889              		.syntax unified
 2890              		.code	16
 2891              		.thumb_func
 2892              		.fpu softvfp
 2894              	RCC_APB1PeriphClockLPModeCmd:
 2895              	.LFB168:
2599:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F40_41xxx || STM32F412xG || STM32F413_423xx || STM32F427_437xx || STM32F429_439xx ||
2600:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2601:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2602:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the APB1 peripheral clock during Low Power (Sleep) mode.
2603:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Peripheral clock gating in SLEEP mode can be used to further reduce
2604:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         power consumption.
2605:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After wakeup from SLEEP mode, the peripheral clock is enabled again.
2606:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   By default, all peripheral clocks are enabled during SLEEP mode.
2607:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_APB1Periph: specifies the APB1 peripheral to gates its clock.
2608:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2609:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM2:   TIM2 clock
2610:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM3:   TIM3 clock
2611:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM4:   TIM4 clock
2612:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM5:   TIM5 clock
2613:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM6:   TIM6 clock
2614:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM7:   TIM7 clock
2615:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM12:  TIM12 clock
2616:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM13:  TIM13 clock
2617:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_TIM14:  TIM14 clock
2618:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_LPTIM1: LPTIM1 clock (STM32F410xx and STM32F413_423xx devices) 
2619:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_WWDG:   WWDG clock
2620:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPI2:   SPI2 clock
2621:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPI3:   SPI3 clock
2622:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_SPDIF:   SPDIF RX clock (STM32F446xx devices) 
2623:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_USART2: USART2 clock
2624:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_USART3: USART3 clock
2625:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART4:  UART4 clock
2626:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART5:  UART5 clock
2627:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C1:   I2C1 clock
2628:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C2:   I2C2 clock
2629:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_I2C3:   I2C3 clock
2630:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_FMPI2C1:   FMPI2C1 clock
2631:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CAN1:   CAN1 clock
2632:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CAN2:   CAN2 clock
2633:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_CEC:    CEC clock (STM32F446xx devices)
2634:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_PWR:    PWR clock
2635:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_DAC:    DAC clock
2636:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART7:  UART7 clock
2637:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB1Periph_UART8:  UART8 clock
2638:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2639:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2640:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2641:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2642:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_APB1PeriphClockLPModeCmd(uint32_t RCC_APB1Periph, FunctionalState NewState)
2643:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2896              		.loc 2 2643 0
 2897              		.cfi_startproc
 2898              		@ args = 0, pretend = 0, frame = 8
 2899              		@ frame_needed = 1, uses_anonymous_args = 0
 2900 0b88 80B5     		push	{r7, lr}
 2901              		.cfi_def_cfa_offset 8
 2902              		.cfi_offset 7, -8
 2903              		.cfi_offset 14, -4
 2904 0b8a 82B0     		sub	sp, sp, #8
 2905              		.cfi_def_cfa_offset 16
 2906 0b8c 00AF     		add	r7, sp, #0
 2907              		.cfi_def_cfa_register 7
 2908 0b8e 7860     		str	r0, [r7, #4]
 2909 0b90 0A00     		movs	r2, r1
 2910 0b92 FB1C     		adds	r3, r7, #3
 2911 0b94 1A70     		strb	r2, [r3]
2644:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2645:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_APB1_PERIPH(RCC_APB1Periph));
2646:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2647:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2912              		.loc 2 2647 0
 2913 0b96 FB1C     		adds	r3, r7, #3
 2914 0b98 1B78     		ldrb	r3, [r3]
 2915 0b9a 002B     		cmp	r3, #0
 2916 0b9c 06D0     		beq	.L204
2648:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2649:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB1LPENR |= RCC_APB1Periph;
 2917              		.loc 2 2649 0
 2918 0b9e 094B     		ldr	r3, .L207
 2919 0ba0 196E     		ldr	r1, [r3, #96]
 2920 0ba2 084B     		ldr	r3, .L207
 2921 0ba4 7A68     		ldr	r2, [r7, #4]
 2922 0ba6 0A43     		orrs	r2, r1
 2923 0ba8 1A66     		str	r2, [r3, #96]
2650:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2651:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2652:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2653:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB1LPENR &= ~RCC_APB1Periph;
2654:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2655:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2924              		.loc 2 2655 0
 2925 0baa 06E0     		b	.L206
 2926              	.L204:
2653:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2927              		.loc 2 2653 0
 2928 0bac 054B     		ldr	r3, .L207
 2929 0bae 1A6E     		ldr	r2, [r3, #96]
 2930 0bb0 7B68     		ldr	r3, [r7, #4]
 2931 0bb2 D943     		mvns	r1, r3
 2932 0bb4 034B     		ldr	r3, .L207
 2933 0bb6 0A40     		ands	r2, r1
 2934 0bb8 1A66     		str	r2, [r3, #96]
 2935              	.L206:
 2936              		.loc 2 2655 0
 2937 0bba C046     		nop
 2938 0bbc BD46     		mov	sp, r7
 2939 0bbe 02B0     		add	sp, sp, #8
 2940              		@ sp needed
 2941 0bc0 80BD     		pop	{r7, pc}
 2942              	.L208:
 2943 0bc2 C046     		.align	2
 2944              	.L207:
 2945 0bc4 00380240 		.word	1073887232
 2946              		.cfi_endproc
 2947              	.LFE168:
 2949              		.align	1
 2950              		.global	RCC_APB2PeriphClockLPModeCmd
 2951              		.syntax unified
 2952              		.code	16
 2953              		.thumb_func
 2954              		.fpu softvfp
 2956              	RCC_APB2PeriphClockLPModeCmd:
 2957              	.LFB169:
2656:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2657:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2658:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the APB2 peripheral clock during Low Power (Sleep) mode.
2659:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   Peripheral clock gating in SLEEP mode can be used to further reduce
2660:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         power consumption.
2661:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   After wakeup from SLEEP mode, the peripheral clock is enabled again.
2662:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note   By default, all peripheral clocks are enabled during SLEEP mode.
2663:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_APB2Periph: specifies the APB2 peripheral to gates its clock.
2664:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2665:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM1:   TIM1 clock
2666:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM8:   TIM8 clock
2667:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_USART1: USART1 clock
2668:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_USART6: USART6 clock
2669:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC1:   ADC1 clock
2670:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC2:   ADC2 clock
2671:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_ADC3:   ADC3 clock
2672:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SDIO:   SDIO clock
2673:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI1:   SPI1 clock
2674:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI4:   SPI4 clock
2675:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SYSCFG: SYSCFG clock
2676:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_EXTIT:  EXTIIT clock
2677:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM9:   TIM9 clock
2678:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM10:  TIM10 clock
2679:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_TIM11:  TIM11 clock
2680:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI5:   SPI5 clock
2681:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SPI6:   SPI6 clock
2682:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SAI1:   SAI1 clock (STM32F42xxx/43xxx/446xx/469xx/479xx/413_423x
2683:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_SAI2:   SAI2 clock (STM32F446xx devices)
2684:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_LTDC:   LTDC clock (STM32F429xx/439xx devices)
2685:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DSI:    DSI clock (STM32F469_479xx devices)
2686:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DFSDM1: DFSDM Clock (STM32F412xG and STM32F413_423xx Devices)
2687:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_DFSDM2: DFSDM2 Clock (STM32F413_423xx Devices)
2688:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_UART9:  UART9 Clock (STM32F413_423xx Devices)
2689:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_APB2Periph_UART10: UART10 Clock (STM32F413_423xx Devices)
2690:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2691:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2692:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2693:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2694:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_APB2PeriphClockLPModeCmd(uint32_t RCC_APB2Periph, FunctionalState NewState)
2695:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 2958              		.loc 2 2695 0
 2959              		.cfi_startproc
 2960              		@ args = 0, pretend = 0, frame = 8
 2961              		@ frame_needed = 1, uses_anonymous_args = 0
 2962 0bc8 80B5     		push	{r7, lr}
 2963              		.cfi_def_cfa_offset 8
 2964              		.cfi_offset 7, -8
 2965              		.cfi_offset 14, -4
 2966 0bca 82B0     		sub	sp, sp, #8
 2967              		.cfi_def_cfa_offset 16
 2968 0bcc 00AF     		add	r7, sp, #0
 2969              		.cfi_def_cfa_register 7
 2970 0bce 7860     		str	r0, [r7, #4]
 2971 0bd0 0A00     		movs	r2, r1
 2972 0bd2 FB1C     		adds	r3, r7, #3
 2973 0bd4 1A70     		strb	r2, [r3]
2696:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2697:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_APB2_PERIPH(RCC_APB2Periph));
2698:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2699:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 2974              		.loc 2 2699 0
 2975 0bd6 FB1C     		adds	r3, r7, #3
 2976 0bd8 1B78     		ldrb	r3, [r3]
 2977 0bda 002B     		cmp	r3, #0
 2978 0bdc 06D0     		beq	.L210
2700:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2701:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB2LPENR |= RCC_APB2Periph;
 2979              		.loc 2 2701 0
 2980 0bde 094B     		ldr	r3, .L213
 2981 0be0 596E     		ldr	r1, [r3, #100]
 2982 0be2 084B     		ldr	r3, .L213
 2983 0be4 7A68     		ldr	r2, [r7, #4]
 2984 0be6 0A43     		orrs	r2, r1
 2985 0be8 5A66     		str	r2, [r3, #100]
2702:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2703:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2704:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2705:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->APB2LPENR &= ~RCC_APB2Periph;
2706:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2707:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 2986              		.loc 2 2707 0
 2987 0bea 06E0     		b	.L212
 2988              	.L210:
2705:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 2989              		.loc 2 2705 0
 2990 0bec 054B     		ldr	r3, .L213
 2991 0bee 5A6E     		ldr	r2, [r3, #100]
 2992 0bf0 7B68     		ldr	r3, [r7, #4]
 2993 0bf2 D943     		mvns	r1, r3
 2994 0bf4 034B     		ldr	r3, .L213
 2995 0bf6 0A40     		ands	r2, r1
 2996 0bf8 5A66     		str	r2, [r3, #100]
 2997              	.L212:
 2998              		.loc 2 2707 0
 2999 0bfa C046     		nop
 3000 0bfc BD46     		mov	sp, r7
 3001 0bfe 02B0     		add	sp, sp, #8
 3002              		@ sp needed
 3003 0c00 80BD     		pop	{r7, pc}
 3004              	.L214:
 3005 0c02 C046     		.align	2
 3006              	.L213:
 3007 0c04 00380240 		.word	1073887232
 3008              		.cfi_endproc
 3009              	.LFE169:
 3011              		.align	1
 3012              		.global	RCC_LSEModeConfig
 3013              		.syntax unified
 3014              		.code	16
 3015              		.thumb_func
 3016              		.fpu softvfp
 3018              	RCC_LSEModeConfig:
 3019              	.LFB170:
2708:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2709:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2710:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the External Low Speed oscillator mode (LSE mode).
2711:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This mode is only available for STM32F410xx/STM32F411xx/STM32F446xx/STM32F469_479xx devic
2712:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  Mode: specifies the LSE mode.
2713:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2714:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LSE_LOWPOWER_MODE:  LSE oscillator in low power mode.
2715:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LSE_HIGHDRIVE_MODE: LSE oscillator in High Drive mode.
2716:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2717:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2718:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_LSEModeConfig(uint8_t RCC_Mode)
2719:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 3020              		.loc 2 2719 0
 3021              		.cfi_startproc
 3022              		@ args = 0, pretend = 0, frame = 8
 3023              		@ frame_needed = 1, uses_anonymous_args = 0
 3024 0c08 80B5     		push	{r7, lr}
 3025              		.cfi_def_cfa_offset 8
 3026              		.cfi_offset 7, -8
 3027              		.cfi_offset 14, -4
 3028 0c0a 82B0     		sub	sp, sp, #8
 3029              		.cfi_def_cfa_offset 16
 3030 0c0c 00AF     		add	r7, sp, #0
 3031              		.cfi_def_cfa_register 7
 3032 0c0e 0200     		movs	r2, r0
 3033 0c10 FB1D     		adds	r3, r7, #7
 3034 0c12 1A70     		strb	r2, [r3]
2720:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2721:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_LSE_MODE(RCC_Mode));
2722:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
2723:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_Mode == RCC_LSE_HIGHDRIVE_MODE)
 3035              		.loc 2 2723 0
 3036 0c14 FB1D     		adds	r3, r7, #7
 3037 0c16 1B78     		ldrb	r3, [r3]
 3038 0c18 012B     		cmp	r3, #1
 3039 0c1a 06D1     		bne	.L216
2724:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2725:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->BDCR, RCC_BDCR_LSEMOD);
 3040              		.loc 2 2725 0
 3041 0c1c 084B     		ldr	r3, .L219
 3042 0c1e 1A6F     		ldr	r2, [r3, #112]
 3043 0c20 074B     		ldr	r3, .L219
 3044 0c22 0821     		movs	r1, #8
 3045 0c24 0A43     		orrs	r2, r1
 3046 0c26 1A67     		str	r2, [r3, #112]
2726:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2727:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2728:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2729:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->BDCR, RCC_BDCR_LSEMOD);
2730:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2731:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 3047              		.loc 2 2731 0
 3048 0c28 05E0     		b	.L218
 3049              	.L216:
2729:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 3050              		.loc 2 2729 0
 3051 0c2a 054B     		ldr	r3, .L219
 3052 0c2c 1A6F     		ldr	r2, [r3, #112]
 3053 0c2e 044B     		ldr	r3, .L219
 3054 0c30 0821     		movs	r1, #8
 3055 0c32 8A43     		bics	r2, r1
 3056 0c34 1A67     		str	r2, [r3, #112]
 3057              	.L218:
 3058              		.loc 2 2731 0
 3059 0c36 C046     		nop
 3060 0c38 BD46     		mov	sp, r7
 3061 0c3a 02B0     		add	sp, sp, #8
 3062              		@ sp needed
 3063 0c3c 80BD     		pop	{r7, pc}
 3064              	.L220:
 3065 0c3e C046     		.align	2
 3066              	.L219:
 3067 0c40 00380240 		.word	1073887232
 3068              		.cfi_endproc
 3069              	.LFE170:
 3071              		.align	1
 3072              		.global	RCC_ITConfig
 3073              		.syntax unified
 3074              		.code	16
 3075              		.thumb_func
 3076              		.fpu softvfp
 3078              	RCC_ITConfig:
 3079              	.LFB171:
2732:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2733:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx) || defined(STM32F413_423xx)
2734:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2735:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the LPTIM1 clock Source.
2736:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F410xx devices.
2737:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param RCC_ClockSource: specifies the LPTIM1 clock Source.
2738:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2739:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LPTIM1CLKSOURCE_PCLK: LPTIM1 clock from APB1 selected.
2740:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LPTIM1CLKSOURCE_HSI:  LPTIM1 clock from HSI selected.
2741:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LPTIM1CLKSOURCE_LSI:  LPTIM1 clock from LSI selected.
2742:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_LPTIM1CLKSOURCE_LSE:  LPTIM1 clock from LSE selected.
2743:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2744:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2745:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_LPTIM1ClockSourceConfig(uint32_t RCC_ClockSource)
2746:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2747:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2748:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_LPTIM1_CLOCKSOURCE(RCC_ClockSource));
2749:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2750:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear LPTIM1 clock source selection source bits */
2751:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR2 &= ~RCC_DCKCFGR2_LPTIM1SEL;
2752:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set new LPTIM1 clock source */
2753:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR2 |= RCC_ClockSource;
2754:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2755:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx || STM32F413_423xx */
2756:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2757:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F469_479xx)
2758:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2759:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the DSI clock Source.
2760:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F469_479xx devices.
2761:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param RCC_ClockSource: specifies the DSI clock Source.
2762:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2763:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DSICLKSource_PHY: DSI-PHY used as DSI byte lane clock source (usual case).
2764:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_DSICLKSource_PLLR: PLL_R used as DSI byte lane clock source, used in case D
2765:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2766:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2767:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_DSIClockSourceConfig(uint8_t RCC_ClockSource)
2768:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2769:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2770:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_DSI_CLOCKSOURCE(RCC_ClockSource));
2771:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
2772:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_DSICLKSource_PLLR)
2773:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2774:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR, RCC_DCKCFGR_DSISEL);
2775:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2776:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2777:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2778:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR, RCC_DCKCFGR_DSISEL);
2779:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2780:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2781:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /*  STM32F469_479xx */
2782:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2783:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F446xx) || defined(STM32F469_4
2784:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2785:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the 48MHz clock Source.
2786:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F446xx/STM32F469_479xx devices.
2787:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param RCC_ClockSource: specifies the 48MHz clock Source.
2788:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2789:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_48MHZCLKSource_PLL: 48MHz from PLL selected.
2790:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_48MHZCLKSource_PLLSAI: 48MHz from PLLSAI selected.
2791:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_CK48CLKSOURCE_PLLI2SQ : 48MHz from PLLI2SQ
2792:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2793:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2794:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_48MHzClockSourceConfig(uint8_t RCC_ClockSource)
2795:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2796:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2797:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_48MHZ_CLOCKSOURCE(RCC_ClockSource));
2798:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F469_479xx) 
2799:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_48MHZCLKSource_PLLSAI)
2800:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2801:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR, RCC_DCKCFGR_CK48MSEL);
2802:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2803:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2804:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2805:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR, RCC_DCKCFGR_CK48MSEL);
2806:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2807:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #elif  defined(STM32F446xx)
2808:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_48MHZCLKSource_PLLSAI)
2809:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2810:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_CK48MSEL);
2811:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2812:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2813:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2814:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_CK48MSEL);
2815:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2816:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #elif defined(STM32F412xG) || defined(STM32F413_423xx)
2817:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_CK48CLKSOURCE_PLLI2SQ)
2818:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2819:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_CK48MSEL);
2820:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2821:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2822:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2823:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_CK48MSEL);
2824:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2825:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #else
2826:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F469_479xx */  
2827:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2828:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2829:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2830:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the SDIO clock Source.
2831:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F469_479xx/STM32F446xx devices.
2832:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param RCC_ClockSource: specifies the SDIO clock Source.
2833:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2834:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SDIOCLKSource_48MHZ: 48MHz clock selected.
2835:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SDIOCLKSource_SYSCLK: system clock selected.
2836:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2837:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2838:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SDIOClockSourceConfig(uint8_t RCC_ClockSource)
2839:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2840:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2841:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SDIO_CLOCKSOURCE(RCC_ClockSource));
2842:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F469_479xx)   
2843:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_SDIOCLKSource_SYSCLK)
2844:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2845:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR, RCC_DCKCFGR_SDIOSEL);
2846:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2847:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2848:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2849:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR, RCC_DCKCFGR_SDIOSEL);
2850:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2851:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #elif defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F446xx)
2852:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_SDIOCLKSource_SYSCLK)
2853:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2854:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_SDIOSEL);
2855:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2856:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2857:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2858:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_SDIOSEL);
2859:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2860:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #else
2861:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F469_479xx */ 
2862:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2863:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F412xG || STM32F413_423xx || STM32F446xx || STM32F469_479xx */
2864:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2865:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F446xx)
2866:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2867:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the AHB1 clock gating for the specified IPs.
2868:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F446xx devices.
2869:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_AHB1ClockGating: specifies the AHB1 clock gating.
2870:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
2871:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1ClockGating_APB1Bridge: AHB1 to APB1 clock
2872:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1ClockGating_APB2Bridge: AHB1 to APB2 clock 
2873:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1ClockGating_CM4DBG: Cortex M4 ETM clock
2874:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1ClockGating_SPARE: Spare clock
2875:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1ClockGating_SRAM: SRAM controller clock
2876:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1ClockGating_FLITF: Flash interface clock
2877:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_AHB1ClockGating_RCC: RCC clock
2878:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified peripheral clock.
2879:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2880:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2881:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2882:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_AHB1ClockGatingCmd(uint32_t RCC_AHB1ClockGating, FunctionalState NewState)
2883:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2884:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2885:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_AHB1_CLOCKGATING(RCC_AHB1ClockGating));
2886:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2887:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2888:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
2889:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2890:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->CKGATENR &= ~RCC_AHB1ClockGating;
2891:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2892:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2893:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2894:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     RCC->CKGATENR |= RCC_AHB1ClockGating;
2895:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2896:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2897:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2898:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2899:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the SPDIFRX clock Source.
2900:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F446xx devices.
2901:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param RCC_ClockSource: specifies the SPDIFRX clock Source.
2902:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2903:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SPDIFRXCLKSource_PLLR: SPDIFRX clock from PLL_R selected.
2904:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_SPDIFRXCLKSource_PLLI2SP: SPDIFRX clock from PLLI2S_P selected.
2905:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2906:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2907:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_SPDIFRXClockSourceConfig(uint8_t RCC_ClockSource)
2908:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2909:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2910:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_SPDIFRX_CLOCKSOURCE(RCC_ClockSource));
2911:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
2912:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_SPDIFRXCLKSource_PLLI2SP)
2913:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2914:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_SPDIFRXSEL);
2915:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2916:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2917:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2918:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_SPDIFRXSEL);
2919:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2920:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2921:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2922:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2923:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the CEC clock Source.
2924:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F446xx devices.
2925:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param RCC_ClockSource: specifies the CEC clock Source.
2926:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2927:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_CECCLKSource_HSIDiv488: CEC clock from HSI/488 selected.
2928:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_CECCLKSource_LSE: CEC clock from LSE selected.
2929:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2930:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2931:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_CECClockSourceConfig(uint8_t RCC_ClockSource)
2932:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2933:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2934:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_CEC_CLOCKSOURCE(RCC_ClockSource));
2935:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   
2936:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if(RCC_ClockSource == RCC_CECCLKSource_LSE)
2937:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2938:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     SET_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_CECSEL);
2939:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2940:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
2941:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
2942:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     CLEAR_BIT(RCC->DCKCFGR2, RCC_DCKCFGR2_CECSEL);
2943:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
2944:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2945:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F446xx */
2946:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2947:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx) || defined(STM32F412xG) || defined(STM32F413_423xx) || defined(STM32F446xx
2948:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2949:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief Configures the FMPI2C1 clock Source.
2950:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @note This feature is only available for STM32F446xx devices.
2951:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param RCC_ClockSource: specifies the FMPI2C1 clock Source.
2952:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
2953:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FMPI2C1CLKSource_APB1: FMPI2C1 clock from APB1 selected.
2954:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FMPI2C1CLKSource_SYSCLK: FMPI2C1 clock from Sytem clock selected.
2955:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FMPI2C1CLKSource_HSI: FMPI2C1 clock from HSI selected.
2956:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2957:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2958:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_FMPI2C1ClockSourceConfig(uint32_t RCC_ClockSource)
2959:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2960:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2961:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_FMPI2C1_CLOCKSOURCE(RCC_ClockSource));
2962:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2963:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Clear FMPI2C1 clock source selection source bits */
2964:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR2 &= ~RCC_DCKCFGR2_FMPI2C1SEL;
2965:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set new FMPI2C1 clock source */
2966:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->DCKCFGR2 |= RCC_ClockSource;
2967:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2968:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx || STM32F412xG || STM32F413_423xx || STM32F446xx */
2969:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2970:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @}
2971:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2972:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2973:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #if defined(STM32F410xx)
2974:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2975:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the MCO1.
2976:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the MCO1.
2977:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2978:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2979:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2980:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_MCO1Cmd(FunctionalState NewState)
2981:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2982:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2983:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2984:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2985:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) RCC_CFGR_MCO1EN_BB = (uint32_t)NewState;
2986:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
2987:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2988:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
2989:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the MCO2.
2990:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the MCO2.
2991:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
2992:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
2993:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
2994:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_MCO2Cmd(FunctionalState NewState)
2995:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
2996:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
2997:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
2998:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
2999:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint32_t *) RCC_CFGR_MCO2EN_BB = (uint32_t)NewState;
3000:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
3001:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** #endif /* STM32F410xx */
3002:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3003:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /** @defgroup RCC_Group4 Interrupts and flags management functions
3004:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *  @brief   Interrupts and flags management functions 
3005:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  *
3006:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** @verbatim   
3007:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================
3008:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****                 ##### Interrupts and flags management functions #####
3009:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****  ===============================================================================  
3010:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3011:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** @endverbatim
3012:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @{
3013:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
3014:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3015:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
3016:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Enables or disables the specified RCC interrupts.
3017:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_IT: specifies the RCC interrupt sources to be enabled or disabled.
3018:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
3019:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_LSIRDY: LSI ready interrupt
3020:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_LSERDY: LSE ready interrupt
3021:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_HSIRDY: HSI ready interrupt
3022:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_HSERDY: HSE ready interrupt
3023:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLRDY: main PLL ready interrupt
3024:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLI2SRDY: PLLI2S ready interrupt
3025:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLSAIRDY: PLLSAI ready interrupt (only for STM32F42xxx/43xxx/446xx/469x
3026:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  NewState: new state of the specified RCC interrupts.
3027:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be: ENABLE or DISABLE.
3028:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
3029:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
3030:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_ITConfig(uint8_t RCC_IT, FunctionalState NewState)
3031:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 3080              		.loc 2 3031 0
 3081              		.cfi_startproc
 3082              		@ args = 0, pretend = 0, frame = 8
 3083              		@ frame_needed = 1, uses_anonymous_args = 0
 3084 0c44 80B5     		push	{r7, lr}
 3085              		.cfi_def_cfa_offset 8
 3086              		.cfi_offset 7, -8
 3087              		.cfi_offset 14, -4
 3088 0c46 82B0     		sub	sp, sp, #8
 3089              		.cfi_def_cfa_offset 16
 3090 0c48 00AF     		add	r7, sp, #0
 3091              		.cfi_def_cfa_register 7
 3092 0c4a 0200     		movs	r2, r0
 3093 0c4c FB1D     		adds	r3, r7, #7
 3094 0c4e 1A70     		strb	r2, [r3]
 3095 0c50 BB1D     		adds	r3, r7, #6
 3096 0c52 0A1C     		adds	r2, r1, #0
 3097 0c54 1A70     		strb	r2, [r3]
3032:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
3033:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_IT(RCC_IT));
3034:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
3035:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (NewState != DISABLE)
 3098              		.loc 2 3035 0
 3099 0c56 BB1D     		adds	r3, r7, #6
 3100 0c58 1B78     		ldrb	r3, [r3]
 3101 0c5a 002B     		cmp	r3, #0
 3102 0c5c 09D0     		beq	.L222
3036:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3037:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Perform Byte access to RCC_CIR[14:8] bits to enable the selected interrupts */
3038:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     *(__IO uint8_t *) CIR_BYTE2_ADDRESS |= RCC_IT;
 3103              		.loc 2 3038 0
 3104 0c5e 0C4B     		ldr	r3, .L225
 3105 0c60 1B78     		ldrb	r3, [r3]
 3106 0c62 DAB2     		uxtb	r2, r3
 3107 0c64 0A49     		ldr	r1, .L225
 3108 0c66 FB1D     		adds	r3, r7, #7
 3109 0c68 1B78     		ldrb	r3, [r3]
 3110 0c6a 1343     		orrs	r3, r2
 3111 0c6c DBB2     		uxtb	r3, r3
 3112 0c6e 0B70     		strb	r3, [r1]
3039:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3040:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
3041:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3042:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     /* Perform Byte access to RCC_CIR[14:8] bits to disable the selected interrupts */
3043:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     *(__IO uint8_t *) CIR_BYTE2_ADDRESS &= (uint8_t)~RCC_IT;
3044:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3045:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 3113              		.loc 2 3045 0
 3114 0c70 0AE0     		b	.L224
 3115              	.L222:
3043:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
 3116              		.loc 2 3043 0
 3117 0c72 074B     		ldr	r3, .L225
 3118 0c74 1B78     		ldrb	r3, [r3]
 3119 0c76 DBB2     		uxtb	r3, r3
 3120 0c78 FA1D     		adds	r2, r7, #7
 3121 0c7a 1278     		ldrb	r2, [r2]
 3122 0c7c D243     		mvns	r2, r2
 3123 0c7e D2B2     		uxtb	r2, r2
 3124 0c80 0349     		ldr	r1, .L225
 3125 0c82 1340     		ands	r3, r2
 3126 0c84 DBB2     		uxtb	r3, r3
 3127 0c86 0B70     		strb	r3, [r1]
 3128              	.L224:
 3129              		.loc 2 3045 0
 3130 0c88 C046     		nop
 3131 0c8a BD46     		mov	sp, r7
 3132 0c8c 02B0     		add	sp, sp, #8
 3133              		@ sp needed
 3134 0c8e 80BD     		pop	{r7, pc}
 3135              	.L226:
 3136              		.align	2
 3137              	.L225:
 3138 0c90 0D380240 		.word	1073887245
 3139              		.cfi_endproc
 3140              	.LFE171:
 3142              		.align	1
 3143              		.global	RCC_GetFlagStatus
 3144              		.syntax unified
 3145              		.code	16
 3146              		.thumb_func
 3147              		.fpu softvfp
 3149              	RCC_GetFlagStatus:
 3150              	.LFB172:
3046:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3047:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
3048:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Checks whether the specified RCC flag is set or not.
3049:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_FLAG: specifies the flag to check.
3050:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
3051:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_HSIRDY: HSI oscillator clock ready
3052:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_HSERDY: HSE oscillator clock ready
3053:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_PLLRDY: main PLL clock ready
3054:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_PLLI2SRDY: PLLI2S clock ready
3055:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_PLLSAIRDY: PLLSAI clock ready (only for STM32F42xxx/43xxx/446xx/469xx/
3056:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_LSERDY: LSE oscillator clock ready
3057:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_LSIRDY: LSI oscillator clock ready
3058:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_BORRST: POR/PDR or BOR reset
3059:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_PINRST: Pin reset
3060:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_PORRST: POR/PDR reset
3061:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_SFTRST: Software reset
3062:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_IWDGRST: Independent Watchdog reset
3063:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_WWDGRST: Window Watchdog reset
3064:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_FLAG_LPWRRST: Low Power reset
3065:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval The new state of RCC_FLAG (SET or RESET).
3066:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
3067:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** FlagStatus RCC_GetFlagStatus(uint8_t RCC_FLAG)
3068:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 3151              		.loc 2 3068 0
 3152              		.cfi_startproc
 3153              		@ args = 0, pretend = 0, frame = 24
 3154              		@ frame_needed = 1, uses_anonymous_args = 0
 3155 0c94 80B5     		push	{r7, lr}
 3156              		.cfi_def_cfa_offset 8
 3157              		.cfi_offset 7, -8
 3158              		.cfi_offset 14, -4
 3159 0c96 86B0     		sub	sp, sp, #24
 3160              		.cfi_def_cfa_offset 32
 3161 0c98 00AF     		add	r7, sp, #0
 3162              		.cfi_def_cfa_register 7
 3163 0c9a 0200     		movs	r2, r0
 3164 0c9c FB1D     		adds	r3, r7, #7
 3165 0c9e 1A70     		strb	r2, [r3]
3069:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t tmp = 0;
 3166              		.loc 2 3069 0
 3167 0ca0 0023     		movs	r3, #0
 3168 0ca2 FB60     		str	r3, [r7, #12]
3070:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   uint32_t statusreg = 0;
 3169              		.loc 2 3070 0
 3170 0ca4 0023     		movs	r3, #0
 3171 0ca6 7B61     		str	r3, [r7, #20]
3071:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   FlagStatus bitstatus = RESET;
 3172              		.loc 2 3071 0
 3173 0ca8 1323     		movs	r3, #19
 3174 0caa FB18     		adds	r3, r7, r3
 3175 0cac 0022     		movs	r2, #0
 3176 0cae 1A70     		strb	r2, [r3]
3072:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3073:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
3074:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_FLAG(RCC_FLAG));
3075:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3076:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Get the RCC register index */
3077:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = RCC_FLAG >> 5;
 3177              		.loc 2 3077 0
 3178 0cb0 FB1D     		adds	r3, r7, #7
 3179 0cb2 1B78     		ldrb	r3, [r3]
 3180 0cb4 5B09     		lsrs	r3, r3, #5
 3181 0cb6 DBB2     		uxtb	r3, r3
 3182 0cb8 FB60     		str	r3, [r7, #12]
3078:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if (tmp == 1)               /* The flag to check is in CR register */
 3183              		.loc 2 3078 0
 3184 0cba FB68     		ldr	r3, [r7, #12]
 3185 0cbc 012B     		cmp	r3, #1
 3186 0cbe 03D1     		bne	.L228
3079:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3080:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     statusreg = RCC->CR;
 3187              		.loc 2 3080 0
 3188 0cc0 144B     		ldr	r3, .L234
 3189 0cc2 1B68     		ldr	r3, [r3]
 3190 0cc4 7B61     		str	r3, [r7, #20]
 3191 0cc6 09E0     		b	.L229
 3192              	.L228:
3081:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3082:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else if (tmp == 2)          /* The flag to check is in BDCR register */
 3193              		.loc 2 3082 0
 3194 0cc8 FB68     		ldr	r3, [r7, #12]
 3195 0cca 022B     		cmp	r3, #2
 3196 0ccc 03D1     		bne	.L230
3083:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3084:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     statusreg = RCC->BDCR;
 3197              		.loc 2 3084 0
 3198 0cce 114B     		ldr	r3, .L234
 3199 0cd0 1B6F     		ldr	r3, [r3, #112]
 3200 0cd2 7B61     		str	r3, [r7, #20]
 3201 0cd4 02E0     		b	.L229
 3202              	.L230:
3085:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3086:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else                       /* The flag to check is in CSR register */
3087:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3088:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     statusreg = RCC->CSR;
 3203              		.loc 2 3088 0
 3204 0cd6 0F4B     		ldr	r3, .L234
 3205 0cd8 5B6F     		ldr	r3, [r3, #116]
 3206 0cda 7B61     		str	r3, [r7, #20]
 3207              	.L229:
3089:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3090:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3091:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Get the flag position */
3092:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   tmp = RCC_FLAG & FLAG_MASK;
 3208              		.loc 2 3092 0
 3209 0cdc FB1D     		adds	r3, r7, #7
 3210 0cde 1B78     		ldrb	r3, [r3]
 3211 0ce0 1F22     		movs	r2, #31
 3212 0ce2 1340     		ands	r3, r2
 3213 0ce4 FB60     		str	r3, [r7, #12]
3093:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if ((statusreg & ((uint32_t)1 << tmp)) != (uint32_t)RESET)
 3214              		.loc 2 3093 0
 3215 0ce6 7A69     		ldr	r2, [r7, #20]
 3216 0ce8 FB68     		ldr	r3, [r7, #12]
 3217 0cea DA40     		lsrs	r2, r2, r3
 3218 0cec 1300     		movs	r3, r2
 3219 0cee 0122     		movs	r2, #1
 3220 0cf0 1340     		ands	r3, r2
 3221 0cf2 04D0     		beq	.L231
3094:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3095:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     bitstatus = SET;
 3222              		.loc 2 3095 0
 3223 0cf4 1323     		movs	r3, #19
 3224 0cf6 FB18     		adds	r3, r7, r3
 3225 0cf8 0122     		movs	r2, #1
 3226 0cfa 1A70     		strb	r2, [r3]
 3227 0cfc 03E0     		b	.L232
 3228              	.L231:
3096:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3097:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
3098:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3099:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     bitstatus = RESET;
 3229              		.loc 2 3099 0
 3230 0cfe 1323     		movs	r3, #19
 3231 0d00 FB18     		adds	r3, r7, r3
 3232 0d02 0022     		movs	r2, #0
 3233 0d04 1A70     		strb	r2, [r3]
 3234              	.L232:
3100:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3101:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Return the flag status */
3102:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   return bitstatus;
 3235              		.loc 2 3102 0
 3236 0d06 1323     		movs	r3, #19
 3237 0d08 FB18     		adds	r3, r7, r3
 3238 0d0a 1B78     		ldrb	r3, [r3]
3103:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 3239              		.loc 2 3103 0
 3240 0d0c 1800     		movs	r0, r3
 3241 0d0e BD46     		mov	sp, r7
 3242 0d10 06B0     		add	sp, sp, #24
 3243              		@ sp needed
 3244 0d12 80BD     		pop	{r7, pc}
 3245              	.L235:
 3246              		.align	2
 3247              	.L234:
 3248 0d14 00380240 		.word	1073887232
 3249              		.cfi_endproc
 3250              	.LFE172:
 3252              		.align	1
 3253              		.global	RCC_ClearFlag
 3254              		.syntax unified
 3255              		.code	16
 3256              		.thumb_func
 3257              		.fpu softvfp
 3259              	RCC_ClearFlag:
 3260              	.LFB173:
3104:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3105:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
3106:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Clears the RCC reset flags.
3107:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         The reset flags are: RCC_FLAG_PINRST, RCC_FLAG_PORRST,  RCC_FLAG_SFTRST,
3108:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *         RCC_FLAG_IWDGRST, RCC_FLAG_WWDGRST, RCC_FLAG_LPWRRST
3109:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  None
3110:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
3111:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
3112:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_ClearFlag(void)
3113:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 3261              		.loc 2 3113 0
 3262              		.cfi_startproc
 3263              		@ args = 0, pretend = 0, frame = 0
 3264              		@ frame_needed = 1, uses_anonymous_args = 0
 3265 0d18 80B5     		push	{r7, lr}
 3266              		.cfi_def_cfa_offset 8
 3267              		.cfi_offset 7, -8
 3268              		.cfi_offset 14, -4
 3269 0d1a 00AF     		add	r7, sp, #0
 3270              		.cfi_def_cfa_register 7
3114:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Set RMVF bit to clear the reset flags */
3115:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   RCC->CSR |= RCC_CSR_RMVF;
 3271              		.loc 2 3115 0
 3272 0d1c 044B     		ldr	r3, .L237
 3273 0d1e 5A6F     		ldr	r2, [r3, #116]
 3274 0d20 034B     		ldr	r3, .L237
 3275 0d22 8021     		movs	r1, #128
 3276 0d24 4904     		lsls	r1, r1, #17
 3277 0d26 0A43     		orrs	r2, r1
 3278 0d28 5A67     		str	r2, [r3, #116]
3116:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 3279              		.loc 2 3116 0
 3280 0d2a C046     		nop
 3281 0d2c BD46     		mov	sp, r7
 3282              		@ sp needed
 3283 0d2e 80BD     		pop	{r7, pc}
 3284              	.L238:
 3285              		.align	2
 3286              	.L237:
 3287 0d30 00380240 		.word	1073887232
 3288              		.cfi_endproc
 3289              	.LFE173:
 3291              		.align	1
 3292              		.global	RCC_GetITStatus
 3293              		.syntax unified
 3294              		.code	16
 3295              		.thumb_func
 3296              		.fpu softvfp
 3298              	RCC_GetITStatus:
 3299              	.LFB174:
3117:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3118:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
3119:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Checks whether the specified RCC interrupt has occurred or not.
3120:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_IT: specifies the RCC interrupt source to check.
3121:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be one of the following values:
3122:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_LSIRDY: LSI ready interrupt
3123:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_LSERDY: LSE ready interrupt
3124:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_HSIRDY: HSI ready interrupt
3125:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_HSERDY: HSE ready interrupt
3126:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLRDY: main PLL ready interrupt
3127:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLI2SRDY: PLLI2S ready interrupt
3128:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLSAIRDY: PLLSAI clock ready interrupt (only for STM32F42xxx/43xxx/446x
3129:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_CSS: Clock Security System interrupt
3130:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval The new state of RCC_IT (SET or RESET).
3131:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
3132:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** ITStatus RCC_GetITStatus(uint8_t RCC_IT)
3133:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 3300              		.loc 2 3133 0
 3301              		.cfi_startproc
 3302              		@ args = 0, pretend = 0, frame = 16
 3303              		@ frame_needed = 1, uses_anonymous_args = 0
 3304 0d34 80B5     		push	{r7, lr}
 3305              		.cfi_def_cfa_offset 8
 3306              		.cfi_offset 7, -8
 3307              		.cfi_offset 14, -4
 3308 0d36 84B0     		sub	sp, sp, #16
 3309              		.cfi_def_cfa_offset 24
 3310 0d38 00AF     		add	r7, sp, #0
 3311              		.cfi_def_cfa_register 7
 3312 0d3a 0200     		movs	r2, r0
 3313 0d3c FB1D     		adds	r3, r7, #7
 3314 0d3e 1A70     		strb	r2, [r3]
3134:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   ITStatus bitstatus = RESET;
 3315              		.loc 2 3134 0
 3316 0d40 0F23     		movs	r3, #15
 3317 0d42 FB18     		adds	r3, r7, r3
 3318 0d44 0022     		movs	r2, #0
 3319 0d46 1A70     		strb	r2, [r3]
3135:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3136:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
3137:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_GET_IT(RCC_IT));
3138:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3139:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the status of the specified RCC interrupt */
3140:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   if ((RCC->CIR & RCC_IT) != (uint32_t)RESET)
 3320              		.loc 2 3140 0
 3321 0d48 0A4B     		ldr	r3, .L243
 3322 0d4a DB68     		ldr	r3, [r3, #12]
 3323 0d4c FA1D     		adds	r2, r7, #7
 3324 0d4e 1278     		ldrb	r2, [r2]
 3325 0d50 1340     		ands	r3, r2
 3326 0d52 04D0     		beq	.L240
3141:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3142:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     bitstatus = SET;
 3327              		.loc 2 3142 0
 3328 0d54 0F23     		movs	r3, #15
 3329 0d56 FB18     		adds	r3, r7, r3
 3330 0d58 0122     		movs	r2, #1
 3331 0d5a 1A70     		strb	r2, [r3]
 3332 0d5c 03E0     		b	.L241
 3333              	.L240:
3143:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3144:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   else
3145:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   {
3146:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****     bitstatus = RESET;
 3334              		.loc 2 3146 0
 3335 0d5e 0F23     		movs	r3, #15
 3336 0d60 FB18     		adds	r3, r7, r3
 3337 0d62 0022     		movs	r2, #0
 3338 0d64 1A70     		strb	r2, [r3]
 3339              	.L241:
3147:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   }
3148:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Return the RCC_IT status */
3149:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   return  bitstatus;
 3340              		.loc 2 3149 0
 3341 0d66 0F23     		movs	r3, #15
 3342 0d68 FB18     		adds	r3, r7, r3
 3343 0d6a 1B78     		ldrb	r3, [r3]
3150:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 3344              		.loc 2 3150 0
 3345 0d6c 1800     		movs	r0, r3
 3346 0d6e BD46     		mov	sp, r7
 3347 0d70 04B0     		add	sp, sp, #16
 3348              		@ sp needed
 3349 0d72 80BD     		pop	{r7, pc}
 3350              	.L244:
 3351              		.align	2
 3352              	.L243:
 3353 0d74 00380240 		.word	1073887232
 3354              		.cfi_endproc
 3355              	.LFE174:
 3357              		.align	1
 3358              		.global	RCC_ClearITPendingBit
 3359              		.syntax unified
 3360              		.code	16
 3361              		.thumb_func
 3362              		.fpu softvfp
 3364              	RCC_ClearITPendingBit:
 3365              	.LFB175:
3151:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3152:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** /**
3153:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @brief  Clears the RCC's interrupt pending bits.
3154:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @param  RCC_IT: specifies the interrupt pending bit to clear.
3155:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *          This parameter can be any combination of the following values:
3156:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_LSIRDY: LSI ready interrupt
3157:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_LSERDY: LSE ready interrupt
3158:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_HSIRDY: HSI ready interrupt
3159:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_HSERDY: HSE ready interrupt
3160:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLRDY: main PLL ready interrupt
3161:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLI2SRDY: PLLI2S ready interrupt  
3162:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_PLLSAIRDY: PLLSAI ready interrupt (only for STM32F42xxx/43xxx/446xx/469x
3163:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *            @arg RCC_IT_CSS: Clock Security System interrupt
3164:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   * @retval None
3165:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   */
3166:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** void RCC_ClearITPendingBit(uint8_t RCC_IT)
3167:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** {
 3366              		.loc 2 3167 0
 3367              		.cfi_startproc
 3368              		@ args = 0, pretend = 0, frame = 8
 3369              		@ frame_needed = 1, uses_anonymous_args = 0
 3370 0d78 80B5     		push	{r7, lr}
 3371              		.cfi_def_cfa_offset 8
 3372              		.cfi_offset 7, -8
 3373              		.cfi_offset 14, -4
 3374 0d7a 82B0     		sub	sp, sp, #8
 3375              		.cfi_def_cfa_offset 16
 3376 0d7c 00AF     		add	r7, sp, #0
 3377              		.cfi_def_cfa_register 7
 3378 0d7e 0200     		movs	r2, r0
 3379 0d80 FB1D     		adds	r3, r7, #7
 3380 0d82 1A70     		strb	r2, [r3]
3168:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Check the parameters */
3169:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   assert_param(IS_RCC_CLEAR_IT(RCC_IT));
3170:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** 
3171:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   /* Perform Byte access to RCC_CIR[23:16] bits to clear the selected interrupt
3172:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****      pending bits */
3173:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c ****   *(__IO uint8_t *) CIR_BYTE3_ADDRESS = RCC_IT;
 3381              		.loc 2 3173 0
 3382 0d84 034A     		ldr	r2, .L246
 3383 0d86 FB1D     		adds	r3, r7, #7
 3384 0d88 1B78     		ldrb	r3, [r3]
 3385 0d8a 1370     		strb	r3, [r2]
3174:../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c **** }
 3386              		.loc 2 3174 0
 3387 0d8c C046     		nop
 3388 0d8e BD46     		mov	sp, r7
 3389 0d90 02B0     		add	sp, sp, #8
 3390              		@ sp needed
 3391 0d92 80BD     		pop	{r7, pc}
 3392              	.L247:
 3393              		.align	2
 3394              	.L246:
 3395 0d94 0E380240 		.word	1073887246
 3396              		.cfi_endproc
 3397              	.LFE175:
 3399              		.section	.start_section,"ax",%progbits
 3400              		.align	1
 3401              		.global	startup
 3402              		.syntax unified
 3403              		.code	16
 3404              		.thumb_func
 3405              		.fpu softvfp
 3407              	startup:
 3408              	.LFB176:
 3409              		.file 3 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.c"
   1:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** /*
   2:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****  * 	startup.c
   3:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****  *
   4:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****  */
   5:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx.h"
   6:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx_rcc.h"
   7:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx_rcc.c"
   8:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "core_cm4.h"
   9:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "stm32f4xx_gpio.h"
  10:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** #include "system_stm32f4xx.h"
  11:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  12:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));
  13:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  14:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void startup(void)
  15:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 3410              		.loc 3 15 0
 3411              		.cfi_startproc
 3412              		@ Naked Function: prologue and epilogue provided by programmer.
 3413              		@ args = 0, pretend = 0, frame = 0
 3414              		@ frame_needed = 1, uses_anonymous_args = 0
  16:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	__asm volatile(
 3415              		.loc 3 16 0
 3416              		.syntax divided
 3417              	@ 16 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door/startup.c" 1
 3418 0000 0248     		 LDR R0,=0x2001C000
 3419 0002 8546     	 MOV SP,R0
 3420 0004 FFF7FEFF 	 BL main
 3421 0008 FEE7     	_exit: B .
 3422              	
 3423              	@ 0 "" 2
  17:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		" LDR R0,=0x2001C000\n" /* set stack */
  18:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		" MOV SP,R0\n"
  19:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		" BL main\n"   /* call main */
  20:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		"_exit: B .\n" /* never return */
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	);
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 3424              		.loc 3 22 0
 3425              		.thumb
 3426              		.syntax unified
 3427 000a C046     		nop
 3428              		.cfi_endproc
 3429              	.LFE176:
 3431              		.global	msTicks
 3432              		.bss
 3433              		.align	2
 3436              	msTicks:
 3437 0000 00000000 		.space	4
 3438              		.text
 3439              		.align	1
 3440              		.global	init_GPIO_Ports
 3441              		.syntax unified
 3442              		.code	16
 3443              		.thumb_func
 3444              		.fpu softvfp
 3446              	init_GPIO_Ports:
 3447              	.LFB177:
  23:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	// Globala variabler.
  24:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** /*uint16_t GPIO_Pins[] = {
  25:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3,
  26:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_4, GPIO_Pin_5, GPIO_Pin_6, GPIO_Pin_7,
  27:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		};*/
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** volatile uint32_t msTicks = 0;                              /* Variable to store millisecond ticks 
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** typedef struct doors
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	char id;
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	char controlbits;		// 8 kontrollbitar tex den minst signifikanta biten är ifall dörren är uppl�
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	char time_larm;			// tid i 10 sekunders intervall innan dörr larmar lokalt
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	char time_central_larm; // tid i 10 sekunders intervall innan dörr larmar centralenheten
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	int password;			//4 sifferig kod för att låsa upp dörrarna
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	int GPIO_lamp;
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	int GPIO_read;
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	int larmTick;        // msTick == larmState ? Larm
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** } door; 
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void init_GPIO_Ports()
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 3448              		.loc 3 44 0
 3449              		.cfi_startproc
 3450              		@ args = 0, pretend = 0, frame = 8
 3451              		@ frame_needed = 1, uses_anonymous_args = 0
 3452 0d98 80B5     		push	{r7, lr}
 3453              		.cfi_def_cfa_offset 8
 3454              		.cfi_offset 7, -8
 3455              		.cfi_offset 14, -4
 3456 0d9a 82B0     		sub	sp, sp, #8
 3457              		.cfi_def_cfa_offset 16
 3458 0d9c 00AF     		add	r7, sp, #0
 3459              		.cfi_def_cfa_register 7
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	/*  Function used to set the GPIO configuration to the default reset state ****/
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_InitTypeDef init;
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	//GPIO A UTPORTAR
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
 3460              		.loc 3 48 0
 3461 0d9e 0121     		movs	r1, #1
 3462 0da0 0120     		movs	r0, #1
 3463 0da2 FFF7FEFF 		bl	RCC_AHB1PeriphClockCmd
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_StructInit(&init);
 3464              		.loc 3 49 0
 3465 0da6 3B00     		movs	r3, r7
 3466 0da8 1800     		movs	r0, r3
 3467 0daa FFF7FEFF 		bl	GPIO_StructInit
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
 3468              		.loc 3 50 0
 3469 0dae 3B00     		movs	r3, r7
 3470 0db0 AA22     		movs	r2, #170
 3471 0db2 1A60     		str	r2, [r3]
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Mode = GPIO_Mode_OUT;
 3472              		.loc 3 51 0
 3473 0db4 3B00     		movs	r3, r7
 3474 0db6 0122     		movs	r2, #1
 3475 0db8 1A71     		strb	r2, [r3, #4]
  52:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_OType = GPIO_OType_PP;
 3476              		.loc 3 52 0
 3477 0dba 3B00     		movs	r3, r7
 3478 0dbc 0022     		movs	r2, #0
 3479 0dbe 9A71     		strb	r2, [r3, #6]
  53:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Init(GPIOA, &init);
 3480              		.loc 3 53 0
 3481 0dc0 3B00     		movs	r3, r7
 3482 0dc2 0E4A     		ldr	r2, .L250
 3483 0dc4 1900     		movs	r1, r3
 3484 0dc6 1000     		movs	r0, r2
 3485 0dc8 FFF7FEFF 		bl	GPIO_Init
  54:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  55:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	//konfigurerar inport GPIO A
  56:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_StructInit(&init);
 3486              		.loc 3 56 0
 3487 0dcc 3B00     		movs	r3, r7
 3488 0dce 1800     		movs	r0, r3
 3489 0dd0 FFF7FEFF 		bl	GPIO_StructInit
  57:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
 3490              		.loc 3 57 0
 3491 0dd4 3B00     		movs	r3, r7
 3492 0dd6 5522     		movs	r2, #85
 3493 0dd8 1A60     		str	r2, [r3]
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_Mode = GPIO_Mode_IN;
 3494              		.loc 3 58 0
 3495 0dda 3B00     		movs	r3, r7
 3496 0ddc 0022     		movs	r2, #0
 3497 0dde 1A71     		strb	r2, [r3, #4]
  59:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init.GPIO_PuPd = GPIO_PuPd_UP;
 3498              		.loc 3 59 0
 3499 0de0 3B00     		movs	r3, r7
 3500 0de2 0122     		movs	r2, #1
 3501 0de4 DA71     		strb	r2, [r3, #7]
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	GPIO_Init(GPIOA, &init);
 3502              		.loc 3 60 0
 3503 0de6 3B00     		movs	r3, r7
 3504 0de8 044A     		ldr	r2, .L250
 3505 0dea 1900     		movs	r1, r3
 3506 0dec 1000     		movs	r0, r2
 3507 0dee FFF7FEFF 		bl	GPIO_Init
  61:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 3508              		.loc 3 61 0
 3509 0df2 C046     		nop
 3510 0df4 BD46     		mov	sp, r7
 3511 0df6 02B0     		add	sp, sp, #8
 3512              		@ sp needed
 3513 0df8 80BD     		pop	{r7, pc}
 3514              	.L251:
 3515 0dfa C046     		.align	2
 3516              	.L250:
 3517 0dfc 00000240 		.word	1073872896
 3518              		.cfi_endproc
 3519              	.LFE177:
 3521              		.align	1
 3522              		.global	SysTick_Handler
 3523              		.syntax unified
 3524              		.code	16
 3525              		.thumb_func
 3526              		.fpu softvfp
 3528              	SysTick_Handler:
 3529              	.LFB178:
  62:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  63:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****   
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void SysTick_Handler(void)  {                               /* SysTick interrupt Handler. */
 3530              		.loc 3 64 0
 3531              		.cfi_startproc
 3532              		@ args = 0, pretend = 0, frame = 0
 3533              		@ frame_needed = 1, uses_anonymous_args = 0
 3534 0e00 80B5     		push	{r7, lr}
 3535              		.cfi_def_cfa_offset 8
 3536              		.cfi_offset 7, -8
 3537              		.cfi_offset 14, -4
 3538 0e02 00AF     		add	r7, sp, #0
 3539              		.cfi_def_cfa_register 7
  65:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	msTicks++;
 3540              		.loc 3 65 0
 3541 0e04 034B     		ldr	r3, .L253
 3542 0e06 1B68     		ldr	r3, [r3]
 3543 0e08 5A1C     		adds	r2, r3, #1
 3544 0e0a 024B     		ldr	r3, .L253
 3545 0e0c 1A60     		str	r2, [r3]
  66:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 3546              		.loc 3 66 0
 3547 0e0e C046     		nop
 3548 0e10 BD46     		mov	sp, r7
 3549              		@ sp needed
 3550 0e12 80BD     		pop	{r7, pc}
 3551              	.L254:
 3552              		.align	2
 3553              	.L253:
 3554 0e14 00000000 		.word	msTicks
 3555              		.cfi_endproc
 3556              	.LFE178:
 3558              		.align	1
 3559              		.global	app_Init
 3560              		.syntax unified
 3561              		.code	16
 3562              		.thumb_func
 3563              		.fpu softvfp
 3565              	app_Init:
 3566              	.LFB179:
  67:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  68:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void app_Init(void){
 3567              		.loc 3 68 0
 3568              		.cfi_startproc
 3569              		@ args = 0, pretend = 0, frame = 8
 3570              		@ frame_needed = 1, uses_anonymous_args = 0
 3571 0e18 80B5     		push	{r7, lr}
 3572              		.cfi_def_cfa_offset 8
 3573              		.cfi_offset 7, -8
 3574              		.cfi_offset 14, -4
 3575 0e1a 82B0     		sub	sp, sp, #8
 3576              		.cfi_def_cfa_offset 16
 3577 0e1c 00AF     		add	r7, sp, #0
 3578              		.cfi_def_cfa_register 7
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  70:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	// Initiera SysTick.
  72:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
 3579              		.loc 3 72 0
 3580 0e1e 064B     		ldr	r3, .L256
 3581 0e20 064A     		ldr	r2, .L256+4
 3582 0e22 1A60     		str	r2, [r3]
  73:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	uint32_t returnCode;
  74:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	returnCode = SysTick_Config(168000000/1000);      // Genererar ett SysTick-avbrott varje ms.
 3583              		.loc 3 74 0
 3584 0e24 064B     		ldr	r3, .L256+8
 3585 0e26 1800     		movs	r0, r3
 3586 0e28 FFF71AF9 		bl	SysTick_Config
 3587 0e2c 0300     		movs	r3, r0
 3588 0e2e 7B60     		str	r3, [r7, #4]
  75:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****   
  76:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	if (returnCode != 0)  {                          // Om inte SysTick_Config lyckas...
  77:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	//typ reboot? bootloops är alltid kul 
  78:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****   }
  79:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  80:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  81:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** }
 3589              		.loc 3 81 0
 3590 0e30 C046     		nop
 3591 0e32 BD46     		mov	sp, r7
 3592 0e34 02B0     		add	sp, sp, #8
 3593              		@ sp needed
 3594 0e36 80BD     		pop	{r7, pc}
 3595              	.L257:
 3596              		.align	2
 3597              	.L256:
 3598 0e38 3CC00120 		.word	536985660
 3599 0e3c 00000000 		.word	SysTick_Handler
 3600 0e40 40900200 		.word	168000
 3601              		.cfi_endproc
 3602              	.LFE179:
 3604              		.section	.rodata
 3605              		.align	2
 3606              	.LC0:
 3607 0000 00       		.byte	0
 3608 0001 00       		.byte	0
 3609 0002 01       		.byte	1
 3610 0003 03       		.byte	3
 3611 0004 00000000 		.word	0
 3612 0008 08000000 		.word	8
 3613 000c 04000000 		.word	4
 3614 0010 00000000 		.word	0
 3615              		.align	2
 3616              	.LC1:
 3617 0014 01       		.byte	1
 3618 0015 00       		.byte	0
 3619 0016 01       		.byte	1
 3620 0017 03       		.byte	3
 3621 0018 00000000 		.word	0
 3622 001c 20000000 		.word	32
 3623 0020 10000000 		.word	16
 3624 0024 00000000 		.word	0
 3625              		.align	2
 3626              	.LC2:
 3627 0028 02       		.byte	2
 3628 0029 00       		.byte	0
 3629 002a 01       		.byte	1
 3630 002b 03       		.byte	3
 3631 002c 00000000 		.word	0
 3632 0030 02000000 		.word	2
 3633 0034 01000000 		.word	1
 3634 0038 00000000 		.word	0
 3635              		.text
 3636              		.align	1
 3637              		.global	main
 3638              		.syntax unified
 3639              		.code	16
 3640              		.thumb_func
 3641              		.fpu softvfp
 3643              	main:
 3644              	.LFB180:
  82:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  83:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** void main(void)
  84:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** {
 3645              		.loc 3 84 0
 3646              		.cfi_startproc
 3647              		@ args = 0, pretend = 0, frame = 128
 3648              		@ frame_needed = 1, uses_anonymous_args = 0
 3649 0e44 F0B5     		push	{r4, r5, r6, r7, lr}
 3650              		.cfi_def_cfa_offset 20
 3651              		.cfi_offset 4, -20
 3652              		.cfi_offset 5, -16
 3653              		.cfi_offset 6, -12
 3654              		.cfi_offset 7, -8
 3655              		.cfi_offset 14, -4
 3656 0e46 A1B0     		sub	sp, sp, #132
 3657              		.cfi_def_cfa_offset 152
 3658 0e48 00AF     		add	r7, sp, #0
 3659              		.cfi_def_cfa_register 7
  85:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	init_GPIO_Ports();
 3660              		.loc 3 85 0
 3661 0e4a FFF7FEFF 		bl	init_GPIO_Ports
  86:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	app_Init();
 3662              		.loc 3 86 0
 3663 0e4e FFF7FEFF 		bl	app_Init
  87:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 
  88:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	door test1 = {.id = 0, .controlbits = 0, .time_larm = 1, .time_central_larm = 3, .password = 0, .G
 3664              		.loc 3 88 0
 3665 0e52 6421     		movs	r1, #100
 3666 0e54 7B18     		adds	r3, r7, r1
 3667 0e56 514A     		ldr	r2, .L267
 3668 0e58 31CA     		ldmia	r2!, {r0, r4, r5}
 3669 0e5a 31C3     		stmia	r3!, {r0, r4, r5}
 3670 0e5c 11CA     		ldmia	r2!, {r0, r4}
 3671 0e5e 11C3     		stmia	r3!, {r0, r4}
  89:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	door test2 = {.id = 1, .controlbits = 0, .time_larm = 1, .time_central_larm = 3, .password = 0, .G
 3672              		.loc 3 89 0
 3673 0e60 5020     		movs	r0, #80
 3674 0e62 3B18     		adds	r3, r7, r0
 3675 0e64 4E4A     		ldr	r2, .L267+4
 3676 0e66 70CA     		ldmia	r2!, {r4, r5, r6}
 3677 0e68 70C3     		stmia	r3!, {r4, r5, r6}
 3678 0e6a 30CA     		ldmia	r2!, {r4, r5}
 3679 0e6c 30C3     		stmia	r3!, {r4, r5}
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	door test3 = {.id = 2, .controlbits = 0, .time_larm = 1, .time_central_larm = 3, .password = 0, .G
 3680              		.loc 3 90 0
 3681 0e6e 3C24     		movs	r4, #60
 3682 0e70 3B19     		adds	r3, r7, r4
 3683 0e72 4C4A     		ldr	r2, .L267+8
 3684 0e74 62CA     		ldmia	r2!, {r1, r5, r6}
 3685 0e76 62C3     		stmia	r3!, {r1, r5, r6}
 3686 0e78 22CA     		ldmia	r2!, {r1, r5}
 3687 0e7a 22C3     		stmia	r3!, {r1, r5}
  91:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	door active_doors[3] = {test1, test2,test3};
 3688              		.loc 3 91 0
 3689 0e7c 3B00     		movs	r3, r7
 3690 0e7e 6421     		movs	r1, #100
 3691 0e80 7A18     		adds	r2, r7, r1
 3692 0e82 62CA     		ldmia	r2!, {r1, r5, r6}
 3693 0e84 62C3     		stmia	r3!, {r1, r5, r6}
 3694 0e86 22CA     		ldmia	r2!, {r1, r5}
 3695 0e88 22C3     		stmia	r3!, {r1, r5}
 3696 0e8a 3B00     		movs	r3, r7
 3697 0e8c 3A18     		adds	r2, r7, r0
 3698 0e8e 1433     		adds	r3, r3, #20
 3699 0e90 23CA     		ldmia	r2!, {r0, r1, r5}
 3700 0e92 23C3     		stmia	r3!, {r0, r1, r5}
 3701 0e94 03CA     		ldmia	r2!, {r0, r1}
 3702 0e96 03C3     		stmia	r3!, {r0, r1}
 3703 0e98 3B00     		movs	r3, r7
 3704 0e9a 3A19     		adds	r2, r7, r4
 3705 0e9c 2833     		adds	r3, r3, #40
 3706 0e9e 13CA     		ldmia	r2!, {r0, r1, r4}
 3707 0ea0 13C3     		stmia	r3!, {r0, r1, r4}
 3708 0ea2 03CA     		ldmia	r2!, {r0, r1}
 3709 0ea4 03C3     		stmia	r3!, {r0, r1}
 3710              	.L266:
 3711              	.LBB2:
  92:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
  93:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****   //lista för msticks (VIKTIGT ATT DESSA HAR SAMMA INDEX)
  94:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****   
  95:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c ****   while (1)
  96:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	{
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		for (int j = 0; j < sizeof(active_doors); j++)
 3712              		.loc 3 97 0
 3713 0ea6 0023     		movs	r3, #0
 3714 0ea8 FB67     		str	r3, [r7, #124]
 3715 0eaa 2AE0     		b	.L259
 3716              	.L261:
  98:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
  99:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			if(active_doors[j].controlbits == 1){
 3717              		.loc 3 99 0
 3718 0eac 3900     		movs	r1, r7
 3719 0eae FA6F     		ldr	r2, [r7, #124]
 3720 0eb0 1300     		movs	r3, r2
 3721 0eb2 9B00     		lsls	r3, r3, #2
 3722 0eb4 9B18     		adds	r3, r3, r2
 3723 0eb6 9B00     		lsls	r3, r3, #2
 3724 0eb8 CB18     		adds	r3, r1, r3
 3725 0eba 0133     		adds	r3, r3, #1
 3726 0ebc 1B78     		ldrb	r3, [r3]
 3727 0ebe 012B     		cmp	r3, #1
 3728 0ec0 1CD1     		bne	.L260
 100:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				if (active_doors[j].larmTick < msTicks)
 3729              		.loc 3 100 0
 3730 0ec2 3900     		movs	r1, r7
 3731 0ec4 FA6F     		ldr	r2, [r7, #124]
 3732 0ec6 1300     		movs	r3, r2
 3733 0ec8 9B00     		lsls	r3, r3, #2
 3734 0eca 9B18     		adds	r3, r3, r2
 3735 0ecc 9B00     		lsls	r3, r3, #2
 3736 0ece CB18     		adds	r3, r1, r3
 3737 0ed0 1033     		adds	r3, r3, #16
 3738 0ed2 1B68     		ldr	r3, [r3]
 3739 0ed4 1A00     		movs	r2, r3
 3740 0ed6 344B     		ldr	r3, .L267+12
 3741 0ed8 1B68     		ldr	r3, [r3]
 3742 0eda 9A42     		cmp	r2, r3
 3743 0edc 0ED2     		bcs	.L260
 101:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				{
 102:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					GPIO_SetBits(GPIOA, active_doors[j].GPIO_lamp);
 3744              		.loc 3 102 0
 3745 0ede 3900     		movs	r1, r7
 3746 0ee0 FA6F     		ldr	r2, [r7, #124]
 3747 0ee2 1300     		movs	r3, r2
 3748 0ee4 9B00     		lsls	r3, r3, #2
 3749 0ee6 9B18     		adds	r3, r3, r2
 3750 0ee8 9B00     		lsls	r3, r3, #2
 3751 0eea CB18     		adds	r3, r1, r3
 3752 0eec 0833     		adds	r3, r3, #8
 3753 0eee 1B68     		ldr	r3, [r3]
 3754 0ef0 9BB2     		uxth	r3, r3
 3755 0ef2 2E4A     		ldr	r2, .L267+16
 3756 0ef4 1900     		movs	r1, r3
 3757 0ef6 1000     		movs	r0, r2
 3758 0ef8 FFF7FEFF 		bl	GPIO_SetBits
 3759              	.L260:
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 3760              		.loc 3 97 0 discriminator 2
 3761 0efc FB6F     		ldr	r3, [r7, #124]
 3762 0efe 0133     		adds	r3, r3, #1
 3763 0f00 FB67     		str	r3, [r7, #124]
 3764              	.L259:
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 3765              		.loc 3 97 0 is_stmt 0 discriminator 1
 3766 0f02 FB6F     		ldr	r3, [r7, #124]
 3767 0f04 3B2B     		cmp	r3, #59
 3768 0f06 D1D9     		bls	.L261
 3769              	.LBE2:
 3770              	.LBB3:
 103:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				}else{
 104:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 					//GPIO_ResetBits(GPIOA, active_doors[j].GPIO_lamp);
 105:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				}
 106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				
 107:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			}else
 108:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			{
 109:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			}
 110:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			
 111:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		}
 112:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		
 113:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 	
 114:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		
 115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		for (int i = 0; i < sizeof(active_doors); i = i + 1)
 3771              		.loc 3 115 0 is_stmt 1
 3772 0f08 0023     		movs	r3, #0
 3773 0f0a BB67     		str	r3, [r7, #120]
 3774 0f0c 42E0     		b	.L262
 3775              	.L265:
 116:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 117:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			if (GPIO_ReadInputDataBit(GPIOA, active_doors[i].GPIO_read))
 3776              		.loc 3 117 0
 3777 0f0e 3900     		movs	r1, r7
 3778 0f10 BA6F     		ldr	r2, [r7, #120]
 3779 0f12 1300     		movs	r3, r2
 3780 0f14 9B00     		lsls	r3, r3, #2
 3781 0f16 9B18     		adds	r3, r3, r2
 3782 0f18 9B00     		lsls	r3, r3, #2
 3783 0f1a CB18     		adds	r3, r1, r3
 3784 0f1c 0C33     		adds	r3, r3, #12
 3785 0f1e 1B68     		ldr	r3, [r3]
 3786 0f20 9BB2     		uxth	r3, r3
 3787 0f22 224A     		ldr	r2, .L267+16
 3788 0f24 1900     		movs	r1, r3
 3789 0f26 1000     		movs	r0, r2
 3790 0f28 FFF7FEFF 		bl	GPIO_ReadInputDataBit
 3791 0f2c 031E     		subs	r3, r0, #0
 3792 0f2e 0AD0     		beq	.L263
 118:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			{
 119:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				//tarbort larmad GPIO PIN 
 120:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				active_doors[i].controlbits = 0;
 3793              		.loc 3 120 0
 3794 0f30 3900     		movs	r1, r7
 3795 0f32 BA6F     		ldr	r2, [r7, #120]
 3796 0f34 1300     		movs	r3, r2
 3797 0f36 9B00     		lsls	r3, r3, #2
 3798 0f38 9B18     		adds	r3, r3, r2
 3799 0f3a 9B00     		lsls	r3, r3, #2
 3800 0f3c CB18     		adds	r3, r1, r3
 3801 0f3e 0133     		adds	r3, r3, #1
 3802 0f40 0022     		movs	r2, #0
 3803 0f42 1A70     		strb	r2, [r3]
 3804 0f44 23E0     		b	.L264
 3805              	.L263:
 121:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				//GPIO_ResetBits(GPIOA, active_doors[i].GPIO_lamp);
 122:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			}
 123:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			else
 124:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 			{
 125:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				active_doors[i].controlbits = 1;
 3806              		.loc 3 125 0
 3807 0f46 3900     		movs	r1, r7
 3808 0f48 BA6F     		ldr	r2, [r7, #120]
 3809 0f4a 1300     		movs	r3, r2
 3810 0f4c 9B00     		lsls	r3, r3, #2
 3811 0f4e 9B18     		adds	r3, r3, r2
 3812 0f50 9B00     		lsls	r3, r3, #2
 3813 0f52 CB18     		adds	r3, r1, r3
 3814 0f54 0133     		adds	r3, r3, #1
 3815 0f56 0122     		movs	r2, #1
 3816 0f58 1A70     		strb	r2, [r3]
 126:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 				active_doors[i].larmTick = msTicks + 10*1000*active_doors[i].time_larm;
 3817              		.loc 3 126 0
 3818 0f5a 3900     		movs	r1, r7
 3819 0f5c BA6F     		ldr	r2, [r7, #120]
 3820 0f5e 1300     		movs	r3, r2
 3821 0f60 9B00     		lsls	r3, r3, #2
 3822 0f62 9B18     		adds	r3, r3, r2
 3823 0f64 9B00     		lsls	r3, r3, #2
 3824 0f66 CB18     		adds	r3, r1, r3
 3825 0f68 0233     		adds	r3, r3, #2
 3826 0f6a 1B78     		ldrb	r3, [r3]
 3827 0f6c 1A00     		movs	r2, r3
 3828 0f6e 104B     		ldr	r3, .L267+20
 3829 0f70 5343     		muls	r3, r2
 3830 0f72 1A00     		movs	r2, r3
 3831 0f74 0C4B     		ldr	r3, .L267+12
 3832 0f76 1B68     		ldr	r3, [r3]
 3833 0f78 D318     		adds	r3, r2, r3
 3834 0f7a 1800     		movs	r0, r3
 3835 0f7c 3900     		movs	r1, r7
 3836 0f7e BA6F     		ldr	r2, [r7, #120]
 3837 0f80 1300     		movs	r3, r2
 3838 0f82 9B00     		lsls	r3, r3, #2
 3839 0f84 9B18     		adds	r3, r3, r2
 3840 0f86 9B00     		lsls	r3, r3, #2
 3841 0f88 CB18     		adds	r3, r1, r3
 3842 0f8a 1033     		adds	r3, r3, #16
 3843 0f8c 1860     		str	r0, [r3]
 3844              	.L264:
 115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 3845              		.loc 3 115 0 discriminator 2
 3846 0f8e BB6F     		ldr	r3, [r7, #120]
 3847 0f90 0133     		adds	r3, r3, #1
 3848 0f92 BB67     		str	r3, [r7, #120]
 3849              	.L262:
 115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 3850              		.loc 3 115 0 is_stmt 0 discriminator 1
 3851 0f94 BB6F     		ldr	r3, [r7, #120]
 3852 0f96 3B2B     		cmp	r3, #59
 3853 0f98 B9D9     		bls	.L265
 3854              	.LBE3:
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/Door\startup.c **** 		{
 3855              		.loc 3 97 0 is_stmt 1
 3856 0f9a 84E7     		b	.L266
 3857              	.L268:
 3858              		.align	2
 3859              	.L267:
 3860 0f9c 00000000 		.word	.LC0
 3861 0fa0 14000000 		.word	.LC1
 3862 0fa4 28000000 		.word	.LC2
 3863 0fa8 00000000 		.word	msTicks
 3864 0fac 00000240 		.word	1073872896
 3865 0fb0 10270000 		.word	10000
 3866              		.cfi_endproc
 3867              	.LFE180:
 3869              	.Letext0:
 3870              		.file 4 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 3871              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 3872              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 3873              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 3874              		.file 8 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_rcc.h"
 3875              		.file 9 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
