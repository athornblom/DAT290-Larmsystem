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
  11              		.file	"stm32f4xx_usart.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	USART_DeInit
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	USART_DeInit:
  23              	.LFB123:
  24              		.file 1 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_S
   1:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
   2:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   ******************************************************************************
   3:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @file    stm32f4xx_usart.c
   4:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @author  MCD Application Team
   5:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @version V1.8.0
   6:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @date    04-November-2016
   7:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief   This file provides firmware functions to manage the following 
   8:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          functionalities of the Universal synchronous asynchronous receiver
   9:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          transmitter (USART):           
  10:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + Initialization and Configuration
  11:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + Data transfers
  12:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + Multi-Processor Communication
  13:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + LIN mode
  14:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + Half-duplex mode
  15:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + Smartcard mode
  16:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + IrDA mode
  17:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + DMA transfers management
  18:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           + Interrupts and flags management 
  19:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *           
  20:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   @verbatim       
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                         ##### How to use this driver #####
  23:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
  24:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
  25:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable peripheral clock using the following functions
  26:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           RCC_APB2PeriphClockCmd(RCC_APB2Periph_USARTx, ENABLE) for USART1 and USART6 
  27:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           RCC_APB1PeriphClockCmd(RCC_APB1Periph_USARTx, ENABLE) for USART2, USART3, 
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           UART4 or UART5.
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) According to the USART mode, enable the GPIO clocks using 
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           RCC_AHB1PeriphClockCmd() function. (The I/O can be TX, RX, CTS, 
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           or/and SCLK). 
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Peripheral's alternate function: 
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Connect the pin to the desired peripherals' Alternate 
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             Function (AF) using GPIO_PinAFConfig() function
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Configure the desired pin in alternate function by:
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             GPIO_InitStruct->GPIO_Mode = GPIO_Mode_AF
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Select the type, pull-up/pull-down and output speed via 
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             GPIO_PuPd, GPIO_OType and GPIO_Speed members
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Call GPIO_Init() function
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the Baud Rate, Word Length , Stop Bit, Parity, Hardware 
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           flow control and Mode(Receiver/Transmitter) using the USART_Init()
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           function.
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) For synchronous mode, enable the clock and program the polarity,
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           phase and last bit using the USART_ClockInit() function.
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the NVIC and the corresponding interrupt using the function 
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****          USART_ITConfig() if you need to use interrupt mode. 
  52:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
  53:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) When using the DMA mode 
  54:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Configure the DMA using DMA_Init() function
  55:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Active the needed channel Request using USART_DMACmd() function
  56:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    
  57:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the USART using the USART_Cmd() function.
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    
  59:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the DMA using the DMA_Cmd() function, when using DMA mode. 
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
  61:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- Refer to Multi-Processor, LIN, half-duplex, Smartcard, IrDA sub-sections
  62:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           for more details
  63:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]        
  65:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In order to reach higher communication baudrates, it is possible to
  66:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     enable the oversampling by 8 mode using the function USART_OverSampling8Cmd().
  67:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This function should be called after enabling the USART clock (RCC_APBxPeriphClockCmd())
  68:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     and before calling the function USART_Init().
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             
  70:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     @endverbatim        
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   ******************************************************************************
  72:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @attention
  73:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *
  74:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * <h2><center>&copy; COPYRIGHT 2016 STMicroelectronics</center></h2>
  75:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *
  76:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  77:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * You may not use this file except in compliance with the License.
  78:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * You may obtain a copy of the License at:
  79:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *
  80:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *        http://www.st.com/software_license_agreement_liberty_v2
  81:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *
  82:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * Unless required by applicable law or agreed to in writing, software 
  83:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * distributed under the License is distributed on an "AS IS" BASIS, 
  84:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  85:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * See the License for the specific language governing permissions and
  86:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * limitations under the License.
  87:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *
  88:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   ******************************************************************************  
  89:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */ 
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
  91:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /* Includes ------------------------------------------------------------------*/
  92:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** #include "stm32f4xx_usart.h"
  93:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** #include "stm32f4xx_rcc.h"
  94:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
  95:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @addtogroup STM32F4xx_StdPeriph_Driver
  96:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
  98:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
  99:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART 
 100:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief USART driver modules
 101:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 102:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 103:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 104:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /* Private typedef -----------------------------------------------------------*/
 105:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /* Private define ------------------------------------------------------------*/
 106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 107:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*!< USART CR1 register clear Mask ((~(uint16_t)0xE9F3)) */
 108:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** #define CR1_CLEAR_MASK            ((uint16_t)(USART_CR1_M | USART_CR1_PCE | \
 109:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                                               USART_CR1_PS | USART_CR1_TE | \
 110:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                                               USART_CR1_RE))
 111:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 112:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*!< USART CR2 register clock bits clear Mask ((~(uint16_t)0xF0FF)) */
 113:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** #define CR2_CLOCK_CLEAR_MASK      ((uint16_t)(USART_CR2_CLKEN | USART_CR2_CPOL | \
 114:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                                               USART_CR2_CPHA | USART_CR2_LBCL))
 115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 116:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*!< USART CR3 register clear Mask ((~(uint16_t)0xFCFF)) */
 117:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** #define CR3_CLEAR_MASK            ((uint16_t)(USART_CR3_RTSE | USART_CR3_CTSE))
 118:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 119:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*!< USART Interrupts mask */
 120:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** #define IT_MASK                   ((uint16_t)0x001F)
 121:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 122:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /* Private macro -------------------------------------------------------------*/
 123:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /* Private variables ---------------------------------------------------------*/
 124:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /* Private function prototypes -----------------------------------------------*/
 125:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /* Private functions ---------------------------------------------------------*/
 126:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 127:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Private_Functions
 128:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 129:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 130:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 131:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group1 Initialization and Configuration functions
 132:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   Initialization and Configuration functions 
 133:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
 134:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
 135:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
 136:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             ##### Initialization and Configuration functions #####
 137:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
 138:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 139:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to initialize the USART 
 140:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     in asynchronous and in synchronous modes.
 141:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) For the asynchronous mode only these parameters can be configured: 
 142:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Baud Rate
 143:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Word Length 
 144:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Stop Bit
 145:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Parity: If the parity is enabled, then the MSB bit of the data written
 146:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****              in the data register is transmitted but is changed by the parity bit.
 147:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****              Depending on the frame length defined by the M bit (8-bits or 9-bits),
 148:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****              the possible USART frame formats are as listed in the following table:
 149:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    +-------------------------------------------------------------+     
 150:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |   M bit |  PCE bit  |            USART frame                |
 151:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |---------------------|---------------------------------------|             
 152:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |    0    |    0      |    | SB | 8 bit data | STB |          |
 153:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |---------|-----------|---------------------------------------|  
 154:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |    0    |    1      |    | SB | 7 bit data | PB | STB |     |
 155:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |---------|-----------|---------------------------------------|  
 156:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |    1    |    0      |    | SB | 9 bit data | STB |          |
 157:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |---------|-----------|---------------------------------------|  
 158:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    |    1    |    1      |    | SB | 8 bit data | PB | STB |     |
 159:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****    +-------------------------------------------------------------+            
 160:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Hardware flow control
 161:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Receiver/transmitter modes
 162:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 163:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 164:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     The USART_Init() function follows the USART  asynchronous configuration 
 165:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     procedure (details for the procedure are available in reference manual (RM0090)).
 166:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 167:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****      (+) For the synchronous mode in addition to the asynchronous mode parameters these 
 168:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****          parameters should be also configured:
 169:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART Clock Enabled
 170:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART polarity
 171:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART phase
 172:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART LastBit
 173:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 174:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 175:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     These parameters can be configured using the USART_ClockInit() function.
 176:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 177:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
 178:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 179:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 180:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 181:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 182:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Deinitializes the USARTx peripheral registers to their default reset values.
 183:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 184:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 185:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 186:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 187:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_DeInit(USART_TypeDef* USARTx)
 188:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
  25              		.loc 1 188 0
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
 189:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 190:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 191:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 192:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (USARTx == USART1)
  38              		.loc 1 192 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 414A     		ldr	r2, .L11
  41 000c 9342     		cmp	r3, r2
  42 000e 08D1     		bne	.L2
 193:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 194:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, ENABLE);
  43              		.loc 1 194 0
  44 0010 0121     		movs	r1, #1
  45 0012 1020     		movs	r0, #16
  46 0014 FFF7FEFF 		bl	RCC_APB2PeriphResetCmd
 195:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART1, DISABLE);
  47              		.loc 1 195 0
  48 0018 0021     		movs	r1, #0
  49 001a 1020     		movs	r0, #16
  50 001c FFF7FEFF 		bl	RCC_APB2PeriphResetCmd
 196:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 197:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (USARTx == USART2)
 198:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 199:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, ENABLE);
 200:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, DISABLE);
 201:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 202:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (USARTx == USART3)
 203:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 204:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, ENABLE);
 205:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, DISABLE);
 206:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }    
 207:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (USARTx == UART4)
 208:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 209:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, ENABLE);
 210:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, DISABLE);
 211:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 212:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (USARTx == UART5)
 213:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 214:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, ENABLE);
 215:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, DISABLE);
 216:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }  
 217:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (USARTx == USART6)
 218:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 219:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART6, ENABLE);
 220:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART6, DISABLE);
 221:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 222:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (USARTx == UART7)
 223:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 224:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART7, ENABLE);
 225:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART7, DISABLE);
 226:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }     
 227:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 228:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 229:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     if (USARTx == UART8)
 230:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     { 
 231:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART8, ENABLE);
 232:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART8, DISABLE);
 233:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     }
 234:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 235:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
  51              		.loc 1 235 0
  52 0020 71E0     		b	.L10
  53              	.L2:
 197:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
  54              		.loc 1 197 0
  55 0022 7B68     		ldr	r3, [r7, #4]
  56 0024 3B4A     		ldr	r2, .L11+4
  57 0026 9342     		cmp	r3, r2
  58 0028 0CD1     		bne	.L4
 199:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART2, DISABLE);
  59              		.loc 1 199 0
  60 002a 8023     		movs	r3, #128
  61 002c 9B02     		lsls	r3, r3, #10
  62 002e 0121     		movs	r1, #1
  63 0030 1800     		movs	r0, r3
  64 0032 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 200:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
  65              		.loc 1 200 0
  66 0036 8023     		movs	r3, #128
  67 0038 9B02     		lsls	r3, r3, #10
  68 003a 0021     		movs	r1, #0
  69 003c 1800     		movs	r0, r3
  70 003e FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
  71              		.loc 1 235 0
  72 0042 60E0     		b	.L10
  73              	.L4:
 202:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
  74              		.loc 1 202 0
  75 0044 7B68     		ldr	r3, [r7, #4]
  76 0046 344A     		ldr	r2, .L11+8
  77 0048 9342     		cmp	r3, r2
  78 004a 0CD1     		bne	.L5
 204:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_USART3, DISABLE);
  79              		.loc 1 204 0
  80 004c 8023     		movs	r3, #128
  81 004e DB02     		lsls	r3, r3, #11
  82 0050 0121     		movs	r1, #1
  83 0052 1800     		movs	r0, r3
  84 0054 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 205:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }    
  85              		.loc 1 205 0
  86 0058 8023     		movs	r3, #128
  87 005a DB02     		lsls	r3, r3, #11
  88 005c 0021     		movs	r1, #0
  89 005e 1800     		movs	r0, r3
  90 0060 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
  91              		.loc 1 235 0
  92 0064 4FE0     		b	.L10
  93              	.L5:
 207:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
  94              		.loc 1 207 0
  95 0066 7B68     		ldr	r3, [r7, #4]
  96 0068 2C4A     		ldr	r2, .L11+12
  97 006a 9342     		cmp	r3, r2
  98 006c 0CD1     		bne	.L6
 209:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART4, DISABLE);
  99              		.loc 1 209 0
 100 006e 8023     		movs	r3, #128
 101 0070 1B03     		lsls	r3, r3, #12
 102 0072 0121     		movs	r1, #1
 103 0074 1800     		movs	r0, r3
 104 0076 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 210:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 105              		.loc 1 210 0
 106 007a 8023     		movs	r3, #128
 107 007c 1B03     		lsls	r3, r3, #12
 108 007e 0021     		movs	r1, #0
 109 0080 1800     		movs	r0, r3
 110 0082 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 111              		.loc 1 235 0
 112 0086 3EE0     		b	.L10
 113              	.L6:
 212:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 114              		.loc 1 212 0
 115 0088 7B68     		ldr	r3, [r7, #4]
 116 008a 254A     		ldr	r2, .L11+16
 117 008c 9342     		cmp	r3, r2
 118 008e 0CD1     		bne	.L7
 214:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART5, DISABLE);
 119              		.loc 1 214 0
 120 0090 8023     		movs	r3, #128
 121 0092 5B03     		lsls	r3, r3, #13
 122 0094 0121     		movs	r1, #1
 123 0096 1800     		movs	r0, r3
 124 0098 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 215:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }  
 125              		.loc 1 215 0
 126 009c 8023     		movs	r3, #128
 127 009e 5B03     		lsls	r3, r3, #13
 128 00a0 0021     		movs	r1, #0
 129 00a2 1800     		movs	r0, r3
 130 00a4 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 131              		.loc 1 235 0
 132 00a8 2DE0     		b	.L10
 133              	.L7:
 217:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 134              		.loc 1 217 0
 135 00aa 7B68     		ldr	r3, [r7, #4]
 136 00ac 1D4A     		ldr	r2, .L11+20
 137 00ae 9342     		cmp	r3, r2
 138 00b0 08D1     		bne	.L8
 219:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB2PeriphResetCmd(RCC_APB2Periph_USART6, DISABLE);
 139              		.loc 1 219 0
 140 00b2 0121     		movs	r1, #1
 141 00b4 2020     		movs	r0, #32
 142 00b6 FFF7FEFF 		bl	RCC_APB2PeriphResetCmd
 220:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 143              		.loc 1 220 0
 144 00ba 0021     		movs	r1, #0
 145 00bc 2020     		movs	r0, #32
 146 00be FFF7FEFF 		bl	RCC_APB2PeriphResetCmd
 147              		.loc 1 235 0
 148 00c2 20E0     		b	.L10
 149              	.L8:
 222:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 150              		.loc 1 222 0
 151 00c4 7B68     		ldr	r3, [r7, #4]
 152 00c6 184A     		ldr	r2, .L11+24
 153 00c8 9342     		cmp	r3, r2
 154 00ca 0CD1     		bne	.L9
 224:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART7, DISABLE);
 155              		.loc 1 224 0
 156 00cc 8023     		movs	r3, #128
 157 00ce DB05     		lsls	r3, r3, #23
 158 00d0 0121     		movs	r1, #1
 159 00d2 1800     		movs	r0, r3
 160 00d4 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 225:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }     
 161              		.loc 1 225 0
 162 00d8 8023     		movs	r3, #128
 163 00da DB05     		lsls	r3, r3, #23
 164 00dc 0021     		movs	r1, #0
 165 00de 1800     		movs	r0, r3
 166 00e0 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 167              		.loc 1 235 0
 168 00e4 0FE0     		b	.L10
 169              	.L9:
 229:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     { 
 170              		.loc 1 229 0
 171 00e6 7B68     		ldr	r3, [r7, #4]
 172 00e8 104A     		ldr	r2, .L11+28
 173 00ea 9342     		cmp	r3, r2
 174 00ec 0BD1     		bne	.L10
 231:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       RCC_APB1PeriphResetCmd(RCC_APB1Periph_UART8, DISABLE);
 175              		.loc 1 231 0
 176 00ee 8023     		movs	r3, #128
 177 00f0 1B06     		lsls	r3, r3, #24
 178 00f2 0121     		movs	r1, #1
 179 00f4 1800     		movs	r0, r3
 180 00f6 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 232:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     }
 181              		.loc 1 232 0
 182 00fa 8023     		movs	r3, #128
 183 00fc 1B06     		lsls	r3, r3, #24
 184 00fe 0021     		movs	r1, #0
 185 0100 1800     		movs	r0, r3
 186 0102 FFF7FEFF 		bl	RCC_APB1PeriphResetCmd
 187              	.L10:
 188              		.loc 1 235 0
 189 0106 C046     		nop
 190 0108 BD46     		mov	sp, r7
 191 010a 02B0     		add	sp, sp, #8
 192              		@ sp needed
 193 010c 80BD     		pop	{r7, pc}
 194              	.L12:
 195 010e C046     		.align	2
 196              	.L11:
 197 0110 00100140 		.word	1073811456
 198 0114 00440040 		.word	1073759232
 199 0118 00480040 		.word	1073760256
 200 011c 004C0040 		.word	1073761280
 201 0120 00500040 		.word	1073762304
 202 0124 00140140 		.word	1073812480
 203 0128 00780040 		.word	1073772544
 204 012c 007C0040 		.word	1073773568
 205              		.cfi_endproc
 206              	.LFE123:
 208              		.global	__aeabi_uidiv
 209              		.align	1
 210              		.global	USART_Init
 211              		.syntax unified
 212              		.code	16
 213              		.thumb_func
 214              		.fpu softvfp
 216              	USART_Init:
 217              	.LFB124:
 236:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 237:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 238:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Initializes the USARTx peripheral according to the specified
 239:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         parameters in the USART_InitStruct .
 240:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 241:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 242:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_InitStruct: pointer to a USART_InitTypeDef structure that contains
 243:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         the configuration information for the specified USART peripheral.
 244:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 245:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 246:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_Init(USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct)
 247:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 218              		.loc 1 247 0
 219              		.cfi_startproc
 220              		@ args = 0, pretend = 0, frame = 40
 221              		@ frame_needed = 1, uses_anonymous_args = 0
 222 0130 80B5     		push	{r7, lr}
 223              		.cfi_def_cfa_offset 8
 224              		.cfi_offset 7, -8
 225              		.cfi_offset 14, -4
 226 0132 8AB0     		sub	sp, sp, #40
 227              		.cfi_def_cfa_offset 48
 228 0134 00AF     		add	r7, sp, #0
 229              		.cfi_def_cfa_register 7
 230 0136 7860     		str	r0, [r7, #4]
 231 0138 3960     		str	r1, [r7]
 248:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint32_t tmpreg = 0x00, apbclock = 0x00;
 232              		.loc 1 248 0
 233 013a 0023     		movs	r3, #0
 234 013c 7B62     		str	r3, [r7, #36]
 235 013e 0023     		movs	r3, #0
 236 0140 3B62     		str	r3, [r7, #32]
 249:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint32_t integerdivider = 0x00;
 237              		.loc 1 249 0
 238 0142 0023     		movs	r3, #0
 239 0144 FB61     		str	r3, [r7, #28]
 250:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint32_t fractionaldivider = 0x00;
 240              		.loc 1 250 0
 241 0146 0023     		movs	r3, #0
 242 0148 BB61     		str	r3, [r7, #24]
 251:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   RCC_ClocksTypeDef RCC_ClocksStatus;
 252:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 253:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 254:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 255:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_BAUDRATE(USART_InitStruct->USART_BaudRate));  
 256:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_WORD_LENGTH(USART_InitStruct->USART_WordLength));
 257:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_STOPBITS(USART_InitStruct->USART_StopBits));
 258:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_PARITY(USART_InitStruct->USART_Parity));
 259:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_MODE(USART_InitStruct->USART_Mode));
 260:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_HARDWARE_FLOW_CONTROL(USART_InitStruct->USART_HardwareFlowControl));
 261:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 262:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* The hardware flow control is available only for USART1, USART2, USART3 and USART6 */
 263:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (USART_InitStruct->USART_HardwareFlowControl != USART_HardwareFlowControl_None)
 264:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 265:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     assert_param(IS_USART_1236_PERIPH(USARTx));
 266:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 267:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 268:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*---------------------------- USART CR2 Configuration -----------------------*/
 269:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg = USARTx->CR2;
 243              		.loc 1 269 0
 244 014a 7B68     		ldr	r3, [r7, #4]
 245 014c 1B8A     		ldrh	r3, [r3, #16]
 246 014e 9BB2     		uxth	r3, r3
 247 0150 7B62     		str	r3, [r7, #36]
 270:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 271:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Clear STOP[13:12] bits */
 272:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg &= (uint32_t)~((uint32_t)USART_CR2_STOP);
 248              		.loc 1 272 0
 249 0152 7B6A     		ldr	r3, [r7, #36]
 250 0154 564A     		ldr	r2, .L21
 251 0156 1340     		ands	r3, r2
 252 0158 7B62     		str	r3, [r7, #36]
 273:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 274:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Configure the USART Stop Bits, Clock, CPOL, CPHA and LastBit :
 275:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       Set STOP[13:12] bits according to USART_StopBits value */
 276:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg |= (uint32_t)USART_InitStruct->USART_StopBits;
 253              		.loc 1 276 0
 254 015a 3B68     		ldr	r3, [r7]
 255 015c DB88     		ldrh	r3, [r3, #6]
 256 015e 1A00     		movs	r2, r3
 257 0160 7B6A     		ldr	r3, [r7, #36]
 258 0162 1343     		orrs	r3, r2
 259 0164 7B62     		str	r3, [r7, #36]
 277:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 278:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Write to USART CR2 */
 279:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR2 = (uint16_t)tmpreg;
 260              		.loc 1 279 0
 261 0166 7B6A     		ldr	r3, [r7, #36]
 262 0168 9AB2     		uxth	r2, r3
 263 016a 7B68     		ldr	r3, [r7, #4]
 264 016c 1A82     		strh	r2, [r3, #16]
 280:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 281:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*---------------------------- USART CR1 Configuration -----------------------*/
 282:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg = USARTx->CR1;
 265              		.loc 1 282 0
 266 016e 7B68     		ldr	r3, [r7, #4]
 267 0170 9B89     		ldrh	r3, [r3, #12]
 268 0172 9BB2     		uxth	r3, r3
 269 0174 7B62     		str	r3, [r7, #36]
 283:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 284:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Clear M, PCE, PS, TE and RE bits */
 285:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg &= (uint32_t)~((uint32_t)CR1_CLEAR_MASK);
 270              		.loc 1 285 0
 271 0176 7B6A     		ldr	r3, [r7, #36]
 272 0178 4E4A     		ldr	r2, .L21+4
 273 017a 1340     		ands	r3, r2
 274 017c 7B62     		str	r3, [r7, #36]
 286:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 287:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Configure the USART Word Length, Parity and mode: 
 288:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****      Set the M bits according to USART_WordLength value 
 289:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****      Set PCE and PS bits according to USART_Parity value
 290:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****      Set TE and RE bits according to USART_Mode value */
 291:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg |= (uint32_t)USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity |
 275              		.loc 1 291 0
 276 017e 3B68     		ldr	r3, [r7]
 277 0180 9A88     		ldrh	r2, [r3, #4]
 278 0182 3B68     		ldr	r3, [r7]
 279 0184 1B89     		ldrh	r3, [r3, #8]
 280 0186 1343     		orrs	r3, r2
 281 0188 9AB2     		uxth	r2, r3
 292:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             USART_InitStruct->USART_Mode;
 282              		.loc 1 292 0
 283 018a 3B68     		ldr	r3, [r7]
 284 018c 5B89     		ldrh	r3, [r3, #10]
 291:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             USART_InitStruct->USART_Mode;
 285              		.loc 1 291 0
 286 018e 1343     		orrs	r3, r2
 287 0190 9BB2     		uxth	r3, r3
 288 0192 1A00     		movs	r2, r3
 289 0194 7B6A     		ldr	r3, [r7, #36]
 290 0196 1343     		orrs	r3, r2
 291 0198 7B62     		str	r3, [r7, #36]
 293:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 294:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Write to USART CR1 */
 295:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR1 = (uint16_t)tmpreg;
 292              		.loc 1 295 0
 293 019a 7B6A     		ldr	r3, [r7, #36]
 294 019c 9AB2     		uxth	r2, r3
 295 019e 7B68     		ldr	r3, [r7, #4]
 296 01a0 9A81     		strh	r2, [r3, #12]
 296:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 297:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*---------------------------- USART CR3 Configuration -----------------------*/  
 298:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg = USARTx->CR3;
 297              		.loc 1 298 0
 298 01a2 7B68     		ldr	r3, [r7, #4]
 299 01a4 9B8A     		ldrh	r3, [r3, #20]
 300 01a6 9BB2     		uxth	r3, r3
 301 01a8 7B62     		str	r3, [r7, #36]
 299:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 300:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Clear CTSE and RTSE bits */
 301:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg &= (uint32_t)~((uint32_t)CR3_CLEAR_MASK);
 302              		.loc 1 301 0
 303 01aa 7B6A     		ldr	r3, [r7, #36]
 304 01ac 424A     		ldr	r2, .L21+8
 305 01ae 1340     		ands	r3, r2
 306 01b0 7B62     		str	r3, [r7, #36]
 302:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 303:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Configure the USART HFC : 
 304:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       Set CTSE and RTSE bits according to USART_HardwareFlowControl value */
 305:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg |= USART_InitStruct->USART_HardwareFlowControl;
 307              		.loc 1 305 0
 308 01b2 3B68     		ldr	r3, [r7]
 309 01b4 9B89     		ldrh	r3, [r3, #12]
 310 01b6 1A00     		movs	r2, r3
 311 01b8 7B6A     		ldr	r3, [r7, #36]
 312 01ba 1343     		orrs	r3, r2
 313 01bc 7B62     		str	r3, [r7, #36]
 306:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 307:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Write to USART CR3 */
 308:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR3 = (uint16_t)tmpreg;
 314              		.loc 1 308 0
 315 01be 7B6A     		ldr	r3, [r7, #36]
 316 01c0 9AB2     		uxth	r2, r3
 317 01c2 7B68     		ldr	r3, [r7, #4]
 318 01c4 9A82     		strh	r2, [r3, #20]
 309:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 310:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*---------------------------- USART BRR Configuration -----------------------*/
 311:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Configure the USART Baud Rate */
 312:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   RCC_GetClocksFreq(&RCC_ClocksStatus);
 319              		.loc 1 312 0
 320 01c6 0823     		movs	r3, #8
 321 01c8 FB18     		adds	r3, r7, r3
 322 01ca 1800     		movs	r0, r3
 323 01cc FFF7FEFF 		bl	RCC_GetClocksFreq
 313:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 314:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if ((USARTx == USART1) || (USARTx == USART6))
 324              		.loc 1 314 0
 325 01d0 7B68     		ldr	r3, [r7, #4]
 326 01d2 3A4A     		ldr	r2, .L21+12
 327 01d4 9342     		cmp	r3, r2
 328 01d6 03D0     		beq	.L14
 329              		.loc 1 314 0 is_stmt 0 discriminator 1
 330 01d8 7B68     		ldr	r3, [r7, #4]
 331 01da 394A     		ldr	r2, .L21+16
 332 01dc 9342     		cmp	r3, r2
 333 01de 04D1     		bne	.L15
 334              	.L14:
 315:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 316:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     apbclock = RCC_ClocksStatus.PCLK2_Frequency;
 335              		.loc 1 316 0 is_stmt 1
 336 01e0 0823     		movs	r3, #8
 337 01e2 FB18     		adds	r3, r7, r3
 338 01e4 DB68     		ldr	r3, [r3, #12]
 339 01e6 3B62     		str	r3, [r7, #32]
 340 01e8 03E0     		b	.L16
 341              	.L15:
 317:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 318:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 319:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 320:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     apbclock = RCC_ClocksStatus.PCLK1_Frequency;
 342              		.loc 1 320 0
 343 01ea 0823     		movs	r3, #8
 344 01ec FB18     		adds	r3, r7, r3
 345 01ee 9B68     		ldr	r3, [r3, #8]
 346 01f0 3B62     		str	r3, [r7, #32]
 347              	.L16:
 321:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 322:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 323:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Determine the integer part */
 324:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if ((USARTx->CR1 & USART_CR1_OVER8) != 0)
 348              		.loc 1 324 0
 349 01f2 7B68     		ldr	r3, [r7, #4]
 350 01f4 9B89     		ldrh	r3, [r3, #12]
 351 01f6 9BB2     		uxth	r3, r3
 352 01f8 1BB2     		sxth	r3, r3
 353 01fa 002B     		cmp	r3, #0
 354 01fc 0FDA     		bge	.L17
 325:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 326:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Integer part computing in case Oversampling mode is 8 Samples */
 327:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     integerdivider = ((25 * apbclock) / (2 * (USART_InitStruct->USART_BaudRate)));    
 355              		.loc 1 327 0
 356 01fe 3A6A     		ldr	r2, [r7, #32]
 357 0200 1300     		movs	r3, r2
 358 0202 9B00     		lsls	r3, r3, #2
 359 0204 9B18     		adds	r3, r3, r2
 360 0206 9A00     		lsls	r2, r3, #2
 361 0208 9A18     		adds	r2, r3, r2
 362 020a 3B68     		ldr	r3, [r7]
 363 020c 1B68     		ldr	r3, [r3]
 364 020e 5B00     		lsls	r3, r3, #1
 365 0210 1900     		movs	r1, r3
 366 0212 1000     		movs	r0, r2
 367 0214 FFF7FEFF 		bl	__aeabi_uidiv
 368              	.LVL0:
 369 0218 0300     		movs	r3, r0
 370 021a FB61     		str	r3, [r7, #28]
 371 021c 0EE0     		b	.L18
 372              	.L17:
 328:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 329:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else /* if ((USARTx->CR1 & USART_CR1_OVER8) == 0) */
 330:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 331:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Integer part computing in case Oversampling mode is 16 Samples */
 332:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     integerdivider = ((25 * apbclock) / (4 * (USART_InitStruct->USART_BaudRate)));    
 373              		.loc 1 332 0
 374 021e 3A6A     		ldr	r2, [r7, #32]
 375 0220 1300     		movs	r3, r2
 376 0222 9B00     		lsls	r3, r3, #2
 377 0224 9B18     		adds	r3, r3, r2
 378 0226 9A00     		lsls	r2, r3, #2
 379 0228 9A18     		adds	r2, r3, r2
 380 022a 3B68     		ldr	r3, [r7]
 381 022c 1B68     		ldr	r3, [r3]
 382 022e 9B00     		lsls	r3, r3, #2
 383 0230 1900     		movs	r1, r3
 384 0232 1000     		movs	r0, r2
 385 0234 FFF7FEFF 		bl	__aeabi_uidiv
 386              	.LVL1:
 387 0238 0300     		movs	r3, r0
 388 023a FB61     		str	r3, [r7, #28]
 389              	.L18:
 333:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 334:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg = (integerdivider / 100) << 4;
 390              		.loc 1 334 0
 391 023c FB69     		ldr	r3, [r7, #28]
 392 023e 6421     		movs	r1, #100
 393 0240 1800     		movs	r0, r3
 394 0242 FFF7FEFF 		bl	__aeabi_uidiv
 395              	.LVL2:
 396 0246 0300     		movs	r3, r0
 397 0248 1B01     		lsls	r3, r3, #4
 398 024a 7B62     		str	r3, [r7, #36]
 335:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 336:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Determine the fractional part */
 337:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   fractionaldivider = integerdivider - (100 * (tmpreg >> 4));
 399              		.loc 1 337 0
 400 024c 7B6A     		ldr	r3, [r7, #36]
 401 024e 1B09     		lsrs	r3, r3, #4
 402 0250 6422     		movs	r2, #100
 403 0252 5343     		muls	r3, r2
 404 0254 FA69     		ldr	r2, [r7, #28]
 405 0256 D31A     		subs	r3, r2, r3
 406 0258 BB61     		str	r3, [r7, #24]
 338:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 339:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Implement the fractional part in the register */
 340:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if ((USARTx->CR1 & USART_CR1_OVER8) != 0)
 407              		.loc 1 340 0
 408 025a 7B68     		ldr	r3, [r7, #4]
 409 025c 9B89     		ldrh	r3, [r3, #12]
 410 025e 9BB2     		uxth	r3, r3
 411 0260 1BB2     		sxth	r3, r3
 412 0262 002B     		cmp	r3, #0
 413 0264 0EDA     		bge	.L19
 341:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 342:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     tmpreg |= ((((fractionaldivider * 8) + 50) / 100)) & ((uint8_t)0x07);
 414              		.loc 1 342 0
 415 0266 BB69     		ldr	r3, [r7, #24]
 416 0268 DB00     		lsls	r3, r3, #3
 417 026a 3233     		adds	r3, r3, #50
 418 026c 6421     		movs	r1, #100
 419 026e 1800     		movs	r0, r3
 420 0270 FFF7FEFF 		bl	__aeabi_uidiv
 421              	.LVL3:
 422 0274 0300     		movs	r3, r0
 423 0276 1A00     		movs	r2, r3
 424 0278 0723     		movs	r3, #7
 425 027a 1340     		ands	r3, r2
 426 027c 7A6A     		ldr	r2, [r7, #36]
 427 027e 1343     		orrs	r3, r2
 428 0280 7B62     		str	r3, [r7, #36]
 429 0282 0DE0     		b	.L20
 430              	.L19:
 343:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 344:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else /* if ((USARTx->CR1 & USART_CR1_OVER8) == 0) */
 345:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 346:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     tmpreg |= ((((fractionaldivider * 16) + 50) / 100)) & ((uint8_t)0x0F);
 431              		.loc 1 346 0
 432 0284 BB69     		ldr	r3, [r7, #24]
 433 0286 1B01     		lsls	r3, r3, #4
 434 0288 3233     		adds	r3, r3, #50
 435 028a 6421     		movs	r1, #100
 436 028c 1800     		movs	r0, r3
 437 028e FFF7FEFF 		bl	__aeabi_uidiv
 438              	.LVL4:
 439 0292 0300     		movs	r3, r0
 440 0294 1A00     		movs	r2, r3
 441 0296 0F23     		movs	r3, #15
 442 0298 1340     		ands	r3, r2
 443 029a 7A6A     		ldr	r2, [r7, #36]
 444 029c 1343     		orrs	r3, r2
 445 029e 7B62     		str	r3, [r7, #36]
 446              	.L20:
 347:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 348:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 349:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Write to USART BRR register */
 350:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->BRR = (uint16_t)tmpreg;
 447              		.loc 1 350 0
 448 02a0 7B6A     		ldr	r3, [r7, #36]
 449 02a2 9AB2     		uxth	r2, r3
 450 02a4 7B68     		ldr	r3, [r7, #4]
 451 02a6 1A81     		strh	r2, [r3, #8]
 351:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 452              		.loc 1 351 0
 453 02a8 C046     		nop
 454 02aa BD46     		mov	sp, r7
 455 02ac 0AB0     		add	sp, sp, #40
 456              		@ sp needed
 457 02ae 80BD     		pop	{r7, pc}
 458              	.L22:
 459              		.align	2
 460              	.L21:
 461 02b0 FFCFFFFF 		.word	-12289
 462 02b4 F3E9FFFF 		.word	-5645
 463 02b8 FFFCFFFF 		.word	-769
 464 02bc 00100140 		.word	1073811456
 465 02c0 00140140 		.word	1073812480
 466              		.cfi_endproc
 467              	.LFE124:
 469              		.align	1
 470              		.global	USART_StructInit
 471              		.syntax unified
 472              		.code	16
 473              		.thumb_func
 474              		.fpu softvfp
 476              	USART_StructInit:
 477              	.LFB125:
 352:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 353:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 354:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Fills each USART_InitStruct member with its default value.
 355:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_InitStruct: pointer to a USART_InitTypeDef structure which will
 356:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         be initialized.
 357:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 358:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 359:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_StructInit(USART_InitTypeDef* USART_InitStruct)
 360:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 478              		.loc 1 360 0
 479              		.cfi_startproc
 480              		@ args = 0, pretend = 0, frame = 8
 481              		@ frame_needed = 1, uses_anonymous_args = 0
 482 02c4 80B5     		push	{r7, lr}
 483              		.cfi_def_cfa_offset 8
 484              		.cfi_offset 7, -8
 485              		.cfi_offset 14, -4
 486 02c6 82B0     		sub	sp, sp, #8
 487              		.cfi_def_cfa_offset 16
 488 02c8 00AF     		add	r7, sp, #0
 489              		.cfi_def_cfa_register 7
 490 02ca 7860     		str	r0, [r7, #4]
 361:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* USART_InitStruct members default value */
 362:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_InitStruct->USART_BaudRate = 9600;
 491              		.loc 1 362 0
 492 02cc 7B68     		ldr	r3, [r7, #4]
 493 02ce 9622     		movs	r2, #150
 494 02d0 9201     		lsls	r2, r2, #6
 495 02d2 1A60     		str	r2, [r3]
 363:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_InitStruct->USART_WordLength = USART_WordLength_8b;
 496              		.loc 1 363 0
 497 02d4 7B68     		ldr	r3, [r7, #4]
 498 02d6 0022     		movs	r2, #0
 499 02d8 9A80     		strh	r2, [r3, #4]
 364:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_InitStruct->USART_StopBits = USART_StopBits_1;
 500              		.loc 1 364 0
 501 02da 7B68     		ldr	r3, [r7, #4]
 502 02dc 0022     		movs	r2, #0
 503 02de DA80     		strh	r2, [r3, #6]
 365:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_InitStruct->USART_Parity = USART_Parity_No ;
 504              		.loc 1 365 0
 505 02e0 7B68     		ldr	r3, [r7, #4]
 506 02e2 0022     		movs	r2, #0
 507 02e4 1A81     		strh	r2, [r3, #8]
 366:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_InitStruct->USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 508              		.loc 1 366 0
 509 02e6 7B68     		ldr	r3, [r7, #4]
 510 02e8 0C22     		movs	r2, #12
 511 02ea 5A81     		strh	r2, [r3, #10]
 367:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_InitStruct->USART_HardwareFlowControl = USART_HardwareFlowControl_None;  
 512              		.loc 1 367 0
 513 02ec 7B68     		ldr	r3, [r7, #4]
 514 02ee 0022     		movs	r2, #0
 515 02f0 9A81     		strh	r2, [r3, #12]
 368:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 516              		.loc 1 368 0
 517 02f2 C046     		nop
 518 02f4 BD46     		mov	sp, r7
 519 02f6 02B0     		add	sp, sp, #8
 520              		@ sp needed
 521 02f8 80BD     		pop	{r7, pc}
 522              		.cfi_endproc
 523              	.LFE125:
 525              		.align	1
 526              		.global	USART_ClockInit
 527              		.syntax unified
 528              		.code	16
 529              		.thumb_func
 530              		.fpu softvfp
 532              	USART_ClockInit:
 533              	.LFB126:
 369:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 370:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 371:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Initializes the USARTx peripheral Clock according to the 
 372:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         specified parameters in the USART_ClockInitStruct .
 373:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3 or 6 to select the USART peripheral.
 374:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_ClockInitStruct: pointer to a USART_ClockInitTypeDef structure that
 375:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         contains the configuration information for the specified  USART peripheral.
 376:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   The Smart Card and Synchronous modes are not available for UART4 and UART5.    
 377:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 378:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 379:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_ClockInit(USART_TypeDef* USARTx, USART_ClockInitTypeDef* USART_ClockInitStruct)
 380:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 534              		.loc 1 380 0
 535              		.cfi_startproc
 536              		@ args = 0, pretend = 0, frame = 16
 537              		@ frame_needed = 1, uses_anonymous_args = 0
 538 02fa 80B5     		push	{r7, lr}
 539              		.cfi_def_cfa_offset 8
 540              		.cfi_offset 7, -8
 541              		.cfi_offset 14, -4
 542 02fc 84B0     		sub	sp, sp, #16
 543              		.cfi_def_cfa_offset 24
 544 02fe 00AF     		add	r7, sp, #0
 545              		.cfi_def_cfa_register 7
 546 0300 7860     		str	r0, [r7, #4]
 547 0302 3960     		str	r1, [r7]
 381:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint32_t tmpreg = 0x00;
 548              		.loc 1 381 0
 549 0304 0023     		movs	r3, #0
 550 0306 FB60     		str	r3, [r7, #12]
 382:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 383:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_1236_PERIPH(USARTx));
 384:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_CLOCK(USART_ClockInitStruct->USART_Clock));
 385:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_CPOL(USART_ClockInitStruct->USART_CPOL));
 386:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_CPHA(USART_ClockInitStruct->USART_CPHA));
 387:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_LASTBIT(USART_ClockInitStruct->USART_LastBit));
 388:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 389:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /*---------------------------- USART CR2 Configuration -----------------------*/
 390:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg = USARTx->CR2;
 551              		.loc 1 390 0
 552 0308 7B68     		ldr	r3, [r7, #4]
 553 030a 1B8A     		ldrh	r3, [r3, #16]
 554 030c 9BB2     		uxth	r3, r3
 555 030e FB60     		str	r3, [r7, #12]
 391:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Clear CLKEN, CPOL, CPHA and LBCL bits */
 392:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg &= (uint32_t)~((uint32_t)CR2_CLOCK_CLEAR_MASK);
 556              		.loc 1 392 0
 557 0310 FB68     		ldr	r3, [r7, #12]
 558 0312 0E4A     		ldr	r2, .L25
 559 0314 1340     		ands	r3, r2
 560 0316 FB60     		str	r3, [r7, #12]
 393:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Configure the USART Clock, CPOL, CPHA and LastBit ------------*/
 394:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Set CLKEN bit according to USART_Clock value */
 395:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Set CPOL bit according to USART_CPOL value */
 396:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Set CPHA bit according to USART_CPHA value */
 397:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Set LBCL bit according to USART_LastBit value */
 398:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   tmpreg |= (uint32_t)USART_ClockInitStruct->USART_Clock | USART_ClockInitStruct->USART_CPOL | 
 561              		.loc 1 398 0
 562 0318 3B68     		ldr	r3, [r7]
 563 031a 1A88     		ldrh	r2, [r3]
 564 031c 3B68     		ldr	r3, [r7]
 565 031e 5B88     		ldrh	r3, [r3, #2]
 399:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                  USART_ClockInitStruct->USART_CPHA | USART_ClockInitStruct->USART_LastBit;
 566              		.loc 1 399 0
 567 0320 1343     		orrs	r3, r2
 568 0322 9AB2     		uxth	r2, r3
 569 0324 3B68     		ldr	r3, [r7]
 570 0326 9B88     		ldrh	r3, [r3, #4]
 571 0328 1343     		orrs	r3, r2
 572 032a 9AB2     		uxth	r2, r3
 573 032c 3B68     		ldr	r3, [r7]
 574 032e DB88     		ldrh	r3, [r3, #6]
 575 0330 1343     		orrs	r3, r2
 576 0332 9BB2     		uxth	r3, r3
 577 0334 1A00     		movs	r2, r3
 398:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                  USART_ClockInitStruct->USART_CPHA | USART_ClockInitStruct->USART_LastBit;
 578              		.loc 1 398 0
 579 0336 FB68     		ldr	r3, [r7, #12]
 580 0338 1343     		orrs	r3, r2
 581 033a FB60     		str	r3, [r7, #12]
 400:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Write to USART CR2 */
 401:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR2 = (uint16_t)tmpreg;
 582              		.loc 1 401 0
 583 033c FB68     		ldr	r3, [r7, #12]
 584 033e 9AB2     		uxth	r2, r3
 585 0340 7B68     		ldr	r3, [r7, #4]
 586 0342 1A82     		strh	r2, [r3, #16]
 402:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 587              		.loc 1 402 0
 588 0344 C046     		nop
 589 0346 BD46     		mov	sp, r7
 590 0348 04B0     		add	sp, sp, #16
 591              		@ sp needed
 592 034a 80BD     		pop	{r7, pc}
 593              	.L26:
 594              		.align	2
 595              	.L25:
 596 034c FFF0FFFF 		.word	-3841
 597              		.cfi_endproc
 598              	.LFE126:
 600              		.align	1
 601              		.global	USART_ClockStructInit
 602              		.syntax unified
 603              		.code	16
 604              		.thumb_func
 605              		.fpu softvfp
 607              	USART_ClockStructInit:
 608              	.LFB127:
 403:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 404:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 405:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Fills each USART_ClockInitStruct member with its default value.
 406:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_ClockInitStruct: pointer to a USART_ClockInitTypeDef structure
 407:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         which will be initialized.
 408:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 409:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 410:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_ClockStructInit(USART_ClockInitTypeDef* USART_ClockInitStruct)
 411:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 609              		.loc 1 411 0
 610              		.cfi_startproc
 611              		@ args = 0, pretend = 0, frame = 8
 612              		@ frame_needed = 1, uses_anonymous_args = 0
 613 0350 80B5     		push	{r7, lr}
 614              		.cfi_def_cfa_offset 8
 615              		.cfi_offset 7, -8
 616              		.cfi_offset 14, -4
 617 0352 82B0     		sub	sp, sp, #8
 618              		.cfi_def_cfa_offset 16
 619 0354 00AF     		add	r7, sp, #0
 620              		.cfi_def_cfa_register 7
 621 0356 7860     		str	r0, [r7, #4]
 412:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* USART_ClockInitStruct members default value */
 413:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_ClockInitStruct->USART_Clock = USART_Clock_Disable;
 622              		.loc 1 413 0
 623 0358 7B68     		ldr	r3, [r7, #4]
 624 035a 0022     		movs	r2, #0
 625 035c 1A80     		strh	r2, [r3]
 414:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_ClockInitStruct->USART_CPOL = USART_CPOL_Low;
 626              		.loc 1 414 0
 627 035e 7B68     		ldr	r3, [r7, #4]
 628 0360 0022     		movs	r2, #0
 629 0362 5A80     		strh	r2, [r3, #2]
 415:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_ClockInitStruct->USART_CPHA = USART_CPHA_1Edge;
 630              		.loc 1 415 0
 631 0364 7B68     		ldr	r3, [r7, #4]
 632 0366 0022     		movs	r2, #0
 633 0368 9A80     		strh	r2, [r3, #4]
 416:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USART_ClockInitStruct->USART_LastBit = USART_LastBit_Disable;
 634              		.loc 1 416 0
 635 036a 7B68     		ldr	r3, [r7, #4]
 636 036c 0022     		movs	r2, #0
 637 036e DA80     		strh	r2, [r3, #6]
 417:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 638              		.loc 1 417 0
 639 0370 C046     		nop
 640 0372 BD46     		mov	sp, r7
 641 0374 02B0     		add	sp, sp, #8
 642              		@ sp needed
 643 0376 80BD     		pop	{r7, pc}
 644              		.cfi_endproc
 645              	.LFE127:
 647              		.align	1
 648              		.global	USART_Cmd
 649              		.syntax unified
 650              		.code	16
 651              		.thumb_func
 652              		.fpu softvfp
 654              	USART_Cmd:
 655              	.LFB128:
 418:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 419:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 420:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the specified USART peripheral.
 421:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 422:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 423:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the USARTx peripheral.
 424:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
 425:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 426:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 427:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 428:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 656              		.loc 1 428 0
 657              		.cfi_startproc
 658              		@ args = 0, pretend = 0, frame = 8
 659              		@ frame_needed = 1, uses_anonymous_args = 0
 660 0378 80B5     		push	{r7, lr}
 661              		.cfi_def_cfa_offset 8
 662              		.cfi_offset 7, -8
 663              		.cfi_offset 14, -4
 664 037a 82B0     		sub	sp, sp, #8
 665              		.cfi_def_cfa_offset 16
 666 037c 00AF     		add	r7, sp, #0
 667              		.cfi_def_cfa_register 7
 668 037e 7860     		str	r0, [r7, #4]
 669 0380 0A00     		movs	r2, r1
 670 0382 FB1C     		adds	r3, r7, #3
 671 0384 1A70     		strb	r2, [r3]
 429:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 430:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 431:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 432:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 433:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 672              		.loc 1 433 0
 673 0386 FB1C     		adds	r3, r7, #3
 674 0388 1B78     		ldrb	r3, [r3]
 675 038a 002B     		cmp	r3, #0
 676 038c 09D0     		beq	.L29
 434:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 435:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the selected USART by setting the UE bit in the CR1 register */
 436:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR1 |= USART_CR1_UE;
 677              		.loc 1 436 0
 678 038e 7B68     		ldr	r3, [r7, #4]
 679 0390 9B89     		ldrh	r3, [r3, #12]
 680 0392 9BB2     		uxth	r3, r3
 681 0394 8022     		movs	r2, #128
 682 0396 9201     		lsls	r2, r2, #6
 683 0398 1343     		orrs	r3, r2
 684 039a 9AB2     		uxth	r2, r3
 685 039c 7B68     		ldr	r3, [r7, #4]
 686 039e 9A81     		strh	r2, [r3, #12]
 437:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 438:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 439:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 440:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the selected USART by clearing the UE bit in the CR1 register */
 441:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_UE);
 442:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 443:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 687              		.loc 1 443 0
 688 03a0 07E0     		b	.L31
 689              	.L29:
 441:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 690              		.loc 1 441 0
 691 03a2 7B68     		ldr	r3, [r7, #4]
 692 03a4 9B89     		ldrh	r3, [r3, #12]
 693 03a6 9BB2     		uxth	r3, r3
 694 03a8 044A     		ldr	r2, .L32
 695 03aa 1340     		ands	r3, r2
 696 03ac 9AB2     		uxth	r2, r3
 697 03ae 7B68     		ldr	r3, [r7, #4]
 698 03b0 9A81     		strh	r2, [r3, #12]
 699              	.L31:
 700              		.loc 1 443 0
 701 03b2 C046     		nop
 702 03b4 BD46     		mov	sp, r7
 703 03b6 02B0     		add	sp, sp, #8
 704              		@ sp needed
 705 03b8 80BD     		pop	{r7, pc}
 706              	.L33:
 707 03ba C046     		.align	2
 708              	.L32:
 709 03bc FFDFFFFF 		.word	-8193
 710              		.cfi_endproc
 711              	.LFE128:
 713              		.align	1
 714              		.global	USART_SetPrescaler
 715              		.syntax unified
 716              		.code	16
 717              		.thumb_func
 718              		.fpu softvfp
 720              	USART_SetPrescaler:
 721              	.LFB129:
 444:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 445:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 446:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Sets the system clock prescaler.
 447:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 448:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 449:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_Prescaler: specifies the prescaler clock. 
 450:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   The function is used for IrDA mode with UART4 and UART5.   
 451:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 452:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 453:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 454:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** { 
 722              		.loc 1 454 0
 723              		.cfi_startproc
 724              		@ args = 0, pretend = 0, frame = 8
 725              		@ frame_needed = 1, uses_anonymous_args = 0
 726 03c0 80B5     		push	{r7, lr}
 727              		.cfi_def_cfa_offset 8
 728              		.cfi_offset 7, -8
 729              		.cfi_offset 14, -4
 730 03c2 82B0     		sub	sp, sp, #8
 731              		.cfi_def_cfa_offset 16
 732 03c4 00AF     		add	r7, sp, #0
 733              		.cfi_def_cfa_register 7
 734 03c6 7860     		str	r0, [r7, #4]
 735 03c8 0A00     		movs	r2, r1
 736 03ca FB1C     		adds	r3, r7, #3
 737 03cc 1A70     		strb	r2, [r3]
 455:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 456:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 457:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 458:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Clear the USART prescaler */
 459:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->GTPR &= USART_GTPR_GT;
 738              		.loc 1 459 0
 739 03ce 7B68     		ldr	r3, [r7, #4]
 740 03d0 1B8B     		ldrh	r3, [r3, #24]
 741 03d2 9BB2     		uxth	r3, r3
 742 03d4 FF22     		movs	r2, #255
 743 03d6 9343     		bics	r3, r2
 744 03d8 9AB2     		uxth	r2, r3
 745 03da 7B68     		ldr	r3, [r7, #4]
 746 03dc 1A83     		strh	r2, [r3, #24]
 460:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Set the USART prescaler */
 461:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->GTPR |= USART_Prescaler;
 747              		.loc 1 461 0
 748 03de 7B68     		ldr	r3, [r7, #4]
 749 03e0 1B8B     		ldrh	r3, [r3, #24]
 750 03e2 9AB2     		uxth	r2, r3
 751 03e4 FB1C     		adds	r3, r7, #3
 752 03e6 1B78     		ldrb	r3, [r3]
 753 03e8 9BB2     		uxth	r3, r3
 754 03ea 1343     		orrs	r3, r2
 755 03ec 9AB2     		uxth	r2, r3
 756 03ee 7B68     		ldr	r3, [r7, #4]
 757 03f0 1A83     		strh	r2, [r3, #24]
 462:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 758              		.loc 1 462 0
 759 03f2 C046     		nop
 760 03f4 BD46     		mov	sp, r7
 761 03f6 02B0     		add	sp, sp, #8
 762              		@ sp needed
 763 03f8 80BD     		pop	{r7, pc}
 764              		.cfi_endproc
 765              	.LFE129:
 767              		.align	1
 768              		.global	USART_OverSampling8Cmd
 769              		.syntax unified
 770              		.code	16
 771              		.thumb_func
 772              		.fpu softvfp
 774              	USART_OverSampling8Cmd:
 775              	.LFB130:
 463:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 464:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 465:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the USART's 8x oversampling mode.
 466:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   This function has to be called before calling USART_Init() function
 467:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         in order to have correct baudrate Divider value.
 468:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 469:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 470:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the USART 8x oversampling mode.
 471:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
 472:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 473:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 474:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_OverSampling8Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 475:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 776              		.loc 1 475 0
 777              		.cfi_startproc
 778              		@ args = 0, pretend = 0, frame = 8
 779              		@ frame_needed = 1, uses_anonymous_args = 0
 780 03fa 80B5     		push	{r7, lr}
 781              		.cfi_def_cfa_offset 8
 782              		.cfi_offset 7, -8
 783              		.cfi_offset 14, -4
 784 03fc 82B0     		sub	sp, sp, #8
 785              		.cfi_def_cfa_offset 16
 786 03fe 00AF     		add	r7, sp, #0
 787              		.cfi_def_cfa_register 7
 788 0400 7860     		str	r0, [r7, #4]
 789 0402 0A00     		movs	r2, r1
 790 0404 FB1C     		adds	r3, r7, #3
 791 0406 1A70     		strb	r2, [r3]
 476:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 477:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 478:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 479:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 480:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 792              		.loc 1 480 0
 793 0408 FB1C     		adds	r3, r7, #3
 794 040a 1B78     		ldrb	r3, [r3]
 795 040c 002B     		cmp	r3, #0
 796 040e 08D0     		beq	.L36
 481:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 482:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the 8x Oversampling mode by setting the OVER8 bit in the CR1 register */
 483:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR1 |= USART_CR1_OVER8;
 797              		.loc 1 483 0
 798 0410 7B68     		ldr	r3, [r7, #4]
 799 0412 9B89     		ldrh	r3, [r3, #12]
 800 0414 9BB2     		uxth	r3, r3
 801 0416 094A     		ldr	r2, .L39
 802 0418 1343     		orrs	r3, r2
 803 041a 9AB2     		uxth	r2, r3
 804 041c 7B68     		ldr	r3, [r7, #4]
 805 041e 9A81     		strh	r2, [r3, #12]
 484:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 485:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 486:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 487:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the 8x Oversampling mode by clearing the OVER8 bit in the CR1 register */
 488:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_OVER8);
 489:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 490:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }  
 806              		.loc 1 490 0
 807 0420 07E0     		b	.L38
 808              	.L36:
 488:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 809              		.loc 1 488 0
 810 0422 7B68     		ldr	r3, [r7, #4]
 811 0424 9B89     		ldrh	r3, [r3, #12]
 812 0426 9BB2     		uxth	r3, r3
 813 0428 5B04     		lsls	r3, r3, #17
 814 042a 5B0C     		lsrs	r3, r3, #17
 815 042c 9AB2     		uxth	r2, r3
 816 042e 7B68     		ldr	r3, [r7, #4]
 817 0430 9A81     		strh	r2, [r3, #12]
 818              	.L38:
 819              		.loc 1 490 0
 820 0432 C046     		nop
 821 0434 BD46     		mov	sp, r7
 822 0436 02B0     		add	sp, sp, #8
 823              		@ sp needed
 824 0438 80BD     		pop	{r7, pc}
 825              	.L40:
 826 043a C046     		.align	2
 827              	.L39:
 828 043c 0080FFFF 		.word	-32768
 829              		.cfi_endproc
 830              	.LFE130:
 832              		.align	1
 833              		.global	USART_OneBitMethodCmd
 834              		.syntax unified
 835              		.code	16
 836              		.thumb_func
 837              		.fpu softvfp
 839              	USART_OneBitMethodCmd:
 840              	.LFB131:
 491:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 492:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 493:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the USART's one bit sampling method.
 494:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 495:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 496:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the USART one bit sampling method.
 497:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
 498:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 499:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 500:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_OneBitMethodCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 501:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 841              		.loc 1 501 0
 842              		.cfi_startproc
 843              		@ args = 0, pretend = 0, frame = 8
 844              		@ frame_needed = 1, uses_anonymous_args = 0
 845 0440 80B5     		push	{r7, lr}
 846              		.cfi_def_cfa_offset 8
 847              		.cfi_offset 7, -8
 848              		.cfi_offset 14, -4
 849 0442 82B0     		sub	sp, sp, #8
 850              		.cfi_def_cfa_offset 16
 851 0444 00AF     		add	r7, sp, #0
 852              		.cfi_def_cfa_register 7
 853 0446 7860     		str	r0, [r7, #4]
 854 0448 0A00     		movs	r2, r1
 855 044a FB1C     		adds	r3, r7, #3
 856 044c 1A70     		strb	r2, [r3]
 502:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 503:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 504:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 505:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 506:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 857              		.loc 1 506 0
 858 044e FB1C     		adds	r3, r7, #3
 859 0450 1B78     		ldrb	r3, [r3]
 860 0452 002B     		cmp	r3, #0
 861 0454 09D0     		beq	.L42
 507:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 508:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the one bit method by setting the ONEBITE bit in the CR3 register */
 509:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 |= USART_CR3_ONEBIT;
 862              		.loc 1 509 0
 863 0456 7B68     		ldr	r3, [r7, #4]
 864 0458 9B8A     		ldrh	r3, [r3, #20]
 865 045a 9BB2     		uxth	r3, r3
 866 045c 8022     		movs	r2, #128
 867 045e 1201     		lsls	r2, r2, #4
 868 0460 1343     		orrs	r3, r2
 869 0462 9AB2     		uxth	r2, r3
 870 0464 7B68     		ldr	r3, [r7, #4]
 871 0466 9A82     		strh	r2, [r3, #20]
 510:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 511:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 512:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 513:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the one bit method by clearing the ONEBITE bit in the CR3 register */
 514:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_ONEBIT);
 515:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 516:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 872              		.loc 1 516 0
 873 0468 07E0     		b	.L44
 874              	.L42:
 514:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 875              		.loc 1 514 0
 876 046a 7B68     		ldr	r3, [r7, #4]
 877 046c 9B8A     		ldrh	r3, [r3, #20]
 878 046e 9BB2     		uxth	r3, r3
 879 0470 044A     		ldr	r2, .L45
 880 0472 1340     		ands	r3, r2
 881 0474 9AB2     		uxth	r2, r3
 882 0476 7B68     		ldr	r3, [r7, #4]
 883 0478 9A82     		strh	r2, [r3, #20]
 884              	.L44:
 885              		.loc 1 516 0
 886 047a C046     		nop
 887 047c BD46     		mov	sp, r7
 888 047e 02B0     		add	sp, sp, #8
 889              		@ sp needed
 890 0480 80BD     		pop	{r7, pc}
 891              	.L46:
 892 0482 C046     		.align	2
 893              	.L45:
 894 0484 FFF7FFFF 		.word	-2049
 895              		.cfi_endproc
 896              	.LFE131:
 898              		.align	1
 899              		.global	USART_SendData
 900              		.syntax unified
 901              		.code	16
 902              		.thumb_func
 903              		.fpu softvfp
 905              	USART_SendData:
 906              	.LFB132:
 517:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 518:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 519:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
 520:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 521:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 522:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group2 Data transfers functions
 523:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   Data transfers functions 
 524:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
 525:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
 526:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
 527:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                       ##### Data transfers functions #####
 528:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
 529:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 530:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to manage the USART data 
 531:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     transfers.
 532:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 533:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     During an USART reception, data shifts in least significant bit first through 
 534:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     the RX pin. In this mode, the USART_DR register consists of a buffer (RDR) 
 535:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     between the internal bus and the received shift register.
 536:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 537:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     When a transmission is taking place, a write instruction to the USART_DR register 
 538:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     stores the data in the TDR register and which is copied in the shift register 
 539:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     at the end of the current transmission.
 540:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 541:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     The read access of the USART_DR register can be done using the USART_ReceiveData()
 542:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     function and returns the RDR buffered value. Whereas a write access to the USART_DR 
 543:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     can be done using USART_SendData() function and stores the written data into 
 544:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     TDR buffer.
 545:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 546:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
 547:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 548:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 549:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 550:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 551:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Transmits single data through the USARTx peripheral.
 552:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 553:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 554:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  Data: the data to transmit.
 555:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 556:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 557:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_SendData(USART_TypeDef* USARTx, uint16_t Data)
 558:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 907              		.loc 1 558 0
 908              		.cfi_startproc
 909              		@ args = 0, pretend = 0, frame = 8
 910              		@ frame_needed = 1, uses_anonymous_args = 0
 911 0488 80B5     		push	{r7, lr}
 912              		.cfi_def_cfa_offset 8
 913              		.cfi_offset 7, -8
 914              		.cfi_offset 14, -4
 915 048a 82B0     		sub	sp, sp, #8
 916              		.cfi_def_cfa_offset 16
 917 048c 00AF     		add	r7, sp, #0
 918              		.cfi_def_cfa_register 7
 919 048e 7860     		str	r0, [r7, #4]
 920 0490 0A00     		movs	r2, r1
 921 0492 BB1C     		adds	r3, r7, #2
 922 0494 1A80     		strh	r2, [r3]
 559:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 560:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 561:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_DATA(Data)); 
 562:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
 563:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Transmit Data */
 564:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->DR = (Data & (uint16_t)0x01FF);
 923              		.loc 1 564 0
 924 0496 BB1C     		adds	r3, r7, #2
 925 0498 1B88     		ldrh	r3, [r3]
 926 049a DB05     		lsls	r3, r3, #23
 927 049c DB0D     		lsrs	r3, r3, #23
 928 049e 9AB2     		uxth	r2, r3
 929 04a0 7B68     		ldr	r3, [r7, #4]
 930 04a2 9A80     		strh	r2, [r3, #4]
 565:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 931              		.loc 1 565 0
 932 04a4 C046     		nop
 933 04a6 BD46     		mov	sp, r7
 934 04a8 02B0     		add	sp, sp, #8
 935              		@ sp needed
 936 04aa 80BD     		pop	{r7, pc}
 937              		.cfi_endproc
 938              	.LFE132:
 940              		.align	1
 941              		.global	USART_ReceiveData
 942              		.syntax unified
 943              		.code	16
 944              		.thumb_func
 945              		.fpu softvfp
 947              	USART_ReceiveData:
 948              	.LFB133:
 566:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 567:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 568:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Returns the most recent received data by the USARTx peripheral.
 569:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 570:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 571:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval The received data.
 572:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 573:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** uint16_t USART_ReceiveData(USART_TypeDef* USARTx)
 574:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 949              		.loc 1 574 0
 950              		.cfi_startproc
 951              		@ args = 0, pretend = 0, frame = 8
 952              		@ frame_needed = 1, uses_anonymous_args = 0
 953 04ac 80B5     		push	{r7, lr}
 954              		.cfi_def_cfa_offset 8
 955              		.cfi_offset 7, -8
 956              		.cfi_offset 14, -4
 957 04ae 82B0     		sub	sp, sp, #8
 958              		.cfi_def_cfa_offset 16
 959 04b0 00AF     		add	r7, sp, #0
 960              		.cfi_def_cfa_register 7
 961 04b2 7860     		str	r0, [r7, #4]
 575:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 576:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 577:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 578:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Receive Data */
 579:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   return (uint16_t)(USARTx->DR & (uint16_t)0x01FF);
 962              		.loc 1 579 0
 963 04b4 7B68     		ldr	r3, [r7, #4]
 964 04b6 9B88     		ldrh	r3, [r3, #4]
 965 04b8 9BB2     		uxth	r3, r3
 966 04ba DB05     		lsls	r3, r3, #23
 967 04bc DB0D     		lsrs	r3, r3, #23
 968 04be 9BB2     		uxth	r3, r3
 580:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 969              		.loc 1 580 0
 970 04c0 1800     		movs	r0, r3
 971 04c2 BD46     		mov	sp, r7
 972 04c4 02B0     		add	sp, sp, #8
 973              		@ sp needed
 974 04c6 80BD     		pop	{r7, pc}
 975              		.cfi_endproc
 976              	.LFE133:
 978              		.align	1
 979              		.global	USART_SetAddress
 980              		.syntax unified
 981              		.code	16
 982              		.thumb_func
 983              		.fpu softvfp
 985              	USART_SetAddress:
 986              	.LFB134:
 581:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 582:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 583:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
 584:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 585:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 586:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group3 MultiProcessor Communication functions
 587:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   Multi-Processor Communication functions 
 588:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
 589:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
 590:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
 591:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****               ##### Multi-Processor Communication functions #####
 592:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
 593:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 594:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to manage the USART 
 595:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     multiprocessor communication.
 596:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 597:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     For instance one of the USARTs can be the master, its TX output is connected 
 598:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     to the RX input of the other USART. The others are slaves, their respective 
 599:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     TX outputs are logically ANDed together and connected to the RX input of the 
 600:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     master.
 601:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 602:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USART multiprocessor communication is possible through the following procedure:
 603:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the Baud rate, Word length = 9 bits, Stop bits, Parity, Mode 
 604:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           transmitter or Mode receiver and hardware flow control values using 
 605:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           the USART_Init() function.
 606:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the USART address using the USART_SetAddress() function.
 607:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the wake up method (USART_WakeUp_IdleLine or USART_WakeUp_AddressMark)
 608:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           using USART_WakeUpConfig() function only for the slaves.
 609:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the USART using the USART_Cmd() function.
 610:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enter the USART slaves in mute mode using USART_ReceiverWakeUpCmd() function.
 611:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 612:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     The USART Slave exit from mute mode when receive the wake up condition.
 613:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 614:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
 615:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 616:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 617:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 618:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 619:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Sets the address of the USART node.
 620:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 621:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 622:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_Address: Indicates the address of the USART node.
 623:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 624:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 625:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
 626:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 987              		.loc 1 626 0
 988              		.cfi_startproc
 989              		@ args = 0, pretend = 0, frame = 8
 990              		@ frame_needed = 1, uses_anonymous_args = 0
 991 04c8 80B5     		push	{r7, lr}
 992              		.cfi_def_cfa_offset 8
 993              		.cfi_offset 7, -8
 994              		.cfi_offset 14, -4
 995 04ca 82B0     		sub	sp, sp, #8
 996              		.cfi_def_cfa_offset 16
 997 04cc 00AF     		add	r7, sp, #0
 998              		.cfi_def_cfa_register 7
 999 04ce 7860     		str	r0, [r7, #4]
 1000 04d0 0A00     		movs	r2, r1
 1001 04d2 FB1C     		adds	r3, r7, #3
 1002 04d4 1A70     		strb	r2, [r3]
 627:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 628:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 629:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ADDRESS(USART_Address)); 
 630:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
 631:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Clear the USART address */
 632:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_ADD);
 1003              		.loc 1 632 0
 1004 04d6 7B68     		ldr	r3, [r7, #4]
 1005 04d8 1B8A     		ldrh	r3, [r3, #16]
 1006 04da 9BB2     		uxth	r3, r3
 1007 04dc 0F22     		movs	r2, #15
 1008 04de 9343     		bics	r3, r2
 1009 04e0 9AB2     		uxth	r2, r3
 1010 04e2 7B68     		ldr	r3, [r7, #4]
 1011 04e4 1A82     		strh	r2, [r3, #16]
 633:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Set the USART address node */
 634:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR2 |= USART_Address;
 1012              		.loc 1 634 0
 1013 04e6 7B68     		ldr	r3, [r7, #4]
 1014 04e8 1B8A     		ldrh	r3, [r3, #16]
 1015 04ea 9AB2     		uxth	r2, r3
 1016 04ec FB1C     		adds	r3, r7, #3
 1017 04ee 1B78     		ldrb	r3, [r3]
 1018 04f0 9BB2     		uxth	r3, r3
 1019 04f2 1343     		orrs	r3, r2
 1020 04f4 9AB2     		uxth	r2, r3
 1021 04f6 7B68     		ldr	r3, [r7, #4]
 1022 04f8 1A82     		strh	r2, [r3, #16]
 635:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1023              		.loc 1 635 0
 1024 04fa C046     		nop
 1025 04fc BD46     		mov	sp, r7
 1026 04fe 02B0     		add	sp, sp, #8
 1027              		@ sp needed
 1028 0500 80BD     		pop	{r7, pc}
 1029              		.cfi_endproc
 1030              	.LFE134:
 1032              		.align	1
 1033              		.global	USART_ReceiverWakeUpCmd
 1034              		.syntax unified
 1035              		.code	16
 1036              		.thumb_func
 1037              		.fpu softvfp
 1039              	USART_ReceiverWakeUpCmd:
 1040              	.LFB135:
 636:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 637:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 638:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Determines if the USART is in mute mode or not.
 639:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 640:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 641:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the USART mute mode.
 642:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
 643:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 644:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 645:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 646:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1041              		.loc 1 646 0
 1042              		.cfi_startproc
 1043              		@ args = 0, pretend = 0, frame = 8
 1044              		@ frame_needed = 1, uses_anonymous_args = 0
 1045 0502 80B5     		push	{r7, lr}
 1046              		.cfi_def_cfa_offset 8
 1047              		.cfi_offset 7, -8
 1048              		.cfi_offset 14, -4
 1049 0504 82B0     		sub	sp, sp, #8
 1050              		.cfi_def_cfa_offset 16
 1051 0506 00AF     		add	r7, sp, #0
 1052              		.cfi_def_cfa_register 7
 1053 0508 7860     		str	r0, [r7, #4]
 1054 050a 0A00     		movs	r2, r1
 1055 050c FB1C     		adds	r3, r7, #3
 1056 050e 1A70     		strb	r2, [r3]
 647:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 648:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 649:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState)); 
 650:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 651:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1057              		.loc 1 651 0
 1058 0510 FB1C     		adds	r3, r7, #3
 1059 0512 1B78     		ldrb	r3, [r3]
 1060 0514 002B     		cmp	r3, #0
 1061 0516 08D0     		beq	.L52
 652:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 653:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the USART mute mode  by setting the RWU bit in the CR1 register */
 654:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR1 |= USART_CR1_RWU;
 1062              		.loc 1 654 0
 1063 0518 7B68     		ldr	r3, [r7, #4]
 1064 051a 9B89     		ldrh	r3, [r3, #12]
 1065 051c 9BB2     		uxth	r3, r3
 1066 051e 0222     		movs	r2, #2
 1067 0520 1343     		orrs	r3, r2
 1068 0522 9AB2     		uxth	r2, r3
 1069 0524 7B68     		ldr	r3, [r7, #4]
 1070 0526 9A81     		strh	r2, [r3, #12]
 655:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 656:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 657:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 658:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the USART mute mode by clearing the RWU bit in the CR1 register */
 659:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_RWU);
 660:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 661:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1071              		.loc 1 661 0
 1072 0528 07E0     		b	.L54
 1073              	.L52:
 659:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1074              		.loc 1 659 0
 1075 052a 7B68     		ldr	r3, [r7, #4]
 1076 052c 9B89     		ldrh	r3, [r3, #12]
 1077 052e 9BB2     		uxth	r3, r3
 1078 0530 0222     		movs	r2, #2
 1079 0532 9343     		bics	r3, r2
 1080 0534 9AB2     		uxth	r2, r3
 1081 0536 7B68     		ldr	r3, [r7, #4]
 1082 0538 9A81     		strh	r2, [r3, #12]
 1083              	.L54:
 1084              		.loc 1 661 0
 1085 053a C046     		nop
 1086 053c BD46     		mov	sp, r7
 1087 053e 02B0     		add	sp, sp, #8
 1088              		@ sp needed
 1089 0540 80BD     		pop	{r7, pc}
 1090              		.cfi_endproc
 1091              	.LFE135:
 1093              		.align	1
 1094              		.global	USART_WakeUpConfig
 1095              		.syntax unified
 1096              		.code	16
 1097              		.thumb_func
 1098              		.fpu softvfp
 1100              	USART_WakeUpConfig:
 1101              	.LFB136:
 662:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 663:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Selects the USART WakeUp method.
 664:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 665:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 666:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_WakeUp: specifies the USART wakeup method.
 667:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be one of the following values:
 668:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_WakeUp_IdleLine: WakeUp by an idle line detection
 669:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_WakeUp_AddressMark: WakeUp by an address mark
 670:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 671:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 672:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_WakeUpConfig(USART_TypeDef* USARTx, uint16_t USART_WakeUp)
 673:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1102              		.loc 1 673 0
 1103              		.cfi_startproc
 1104              		@ args = 0, pretend = 0, frame = 8
 1105              		@ frame_needed = 1, uses_anonymous_args = 0
 1106 0542 80B5     		push	{r7, lr}
 1107              		.cfi_def_cfa_offset 8
 1108              		.cfi_offset 7, -8
 1109              		.cfi_offset 14, -4
 1110 0544 82B0     		sub	sp, sp, #8
 1111              		.cfi_def_cfa_offset 16
 1112 0546 00AF     		add	r7, sp, #0
 1113              		.cfi_def_cfa_register 7
 1114 0548 7860     		str	r0, [r7, #4]
 1115 054a 0A00     		movs	r2, r1
 1116 054c BB1C     		adds	r3, r7, #2
 1117 054e 1A80     		strh	r2, [r3]
 674:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 675:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 676:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_WAKEUP(USART_WakeUp));
 677:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 678:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR1 &= (uint16_t)~((uint16_t)USART_CR1_WAKE);
 1118              		.loc 1 678 0
 1119 0550 7B68     		ldr	r3, [r7, #4]
 1120 0552 9B89     		ldrh	r3, [r3, #12]
 1121 0554 9BB2     		uxth	r3, r3
 1122 0556 094A     		ldr	r2, .L56
 1123 0558 1340     		ands	r3, r2
 1124 055a 9AB2     		uxth	r2, r3
 1125 055c 7B68     		ldr	r3, [r7, #4]
 1126 055e 9A81     		strh	r2, [r3, #12]
 679:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR1 |= USART_WakeUp;
 1127              		.loc 1 679 0
 1128 0560 7B68     		ldr	r3, [r7, #4]
 1129 0562 9B89     		ldrh	r3, [r3, #12]
 1130 0564 9AB2     		uxth	r2, r3
 1131 0566 BB1C     		adds	r3, r7, #2
 1132 0568 1B88     		ldrh	r3, [r3]
 1133 056a 1343     		orrs	r3, r2
 1134 056c 9AB2     		uxth	r2, r3
 1135 056e 7B68     		ldr	r3, [r7, #4]
 1136 0570 9A81     		strh	r2, [r3, #12]
 680:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1137              		.loc 1 680 0
 1138 0572 C046     		nop
 1139 0574 BD46     		mov	sp, r7
 1140 0576 02B0     		add	sp, sp, #8
 1141              		@ sp needed
 1142 0578 80BD     		pop	{r7, pc}
 1143              	.L57:
 1144 057a C046     		.align	2
 1145              	.L56:
 1146 057c FFF7FFFF 		.word	-2049
 1147              		.cfi_endproc
 1148              	.LFE136:
 1150              		.align	1
 1151              		.global	USART_LINBreakDetectLengthConfig
 1152              		.syntax unified
 1153              		.code	16
 1154              		.thumb_func
 1155              		.fpu softvfp
 1157              	USART_LINBreakDetectLengthConfig:
 1158              	.LFB137:
 681:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 682:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 683:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
 684:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 685:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 686:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group4 LIN mode functions
 687:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   LIN mode functions 
 688:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
 689:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
 690:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
 691:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                         ##### LIN mode functions #####
 692:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
 693:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 694:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to manage the USART LIN 
 695:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     Mode communication.
 696:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 697:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In LIN mode, 8-bit data format with 1 stop bit is required in accordance with 
 698:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     the LIN standard.
 699:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 700:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     Only this LIN Feature is supported by the USART IP:
 701:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) LIN Master Synchronous Break send capability and LIN slave break detection
 702:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           capability :  13-bit break generation and 10/11 bit break detection
 703:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 704:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 705:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USART LIN Master transmitter communication is possible through the following 
 706:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     procedure:
 707:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the Baud rate, Word length = 8bits, Stop bits = 1bit, Parity, 
 708:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         Mode transmitter or Mode receiver and hardware flow control values using 
 709:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         the USART_Init() function.
 710:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the USART using the USART_Cmd() function.
 711:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the LIN mode using the USART_LINCmd() function.
 712:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Send the break character using USART_SendBreak() function.
 713:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 714:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USART LIN Master receiver communication is possible through the following procedure:
 715:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the Baud rate, Word length = 8bits, Stop bits = 1bit, Parity, 
 716:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           Mode transmitter or Mode receiver and hardware flow control values using 
 717:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           the USART_Init() function.
 718:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the USART using the USART_Cmd() function.
 719:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the break detection length using the USART_LINBreakDetectLengthConfig()
 720:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           function.
 721:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the LIN mode using the USART_LINCmd() function.
 722:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 723:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- In LIN mode, the following bits must be kept cleared:
 724:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****        (+@) CLKEN in the USART_CR2 register,
 725:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****        (+@) STOP[1:0], SCEN, HDSEL and IREN in the USART_CR3 register.
 726:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 727:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
 728:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 729:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 730:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 731:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 732:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Sets the USART LIN Break detection length.
 733:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 734:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 735:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_LINBreakDetectLength: specifies the LIN break detection length.
 736:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be one of the following values:
 737:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_LINBreakDetectLength_10b: 10-bit break detection
 738:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_LINBreakDetectLength_11b: 11-bit break detection
 739:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 740:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 741:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_LINBreakDetectLengthConfig(USART_TypeDef* USARTx, uint16_t USART_LINBreakDetectLength)
 742:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1159              		.loc 1 742 0
 1160              		.cfi_startproc
 1161              		@ args = 0, pretend = 0, frame = 8
 1162              		@ frame_needed = 1, uses_anonymous_args = 0
 1163 0580 80B5     		push	{r7, lr}
 1164              		.cfi_def_cfa_offset 8
 1165              		.cfi_offset 7, -8
 1166              		.cfi_offset 14, -4
 1167 0582 82B0     		sub	sp, sp, #8
 1168              		.cfi_def_cfa_offset 16
 1169 0584 00AF     		add	r7, sp, #0
 1170              		.cfi_def_cfa_register 7
 1171 0586 7860     		str	r0, [r7, #4]
 1172 0588 0A00     		movs	r2, r1
 1173 058a BB1C     		adds	r3, r7, #2
 1174 058c 1A80     		strh	r2, [r3]
 743:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 744:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 745:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_LIN_BREAK_DETECT_LENGTH(USART_LINBreakDetectLength));
 746:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 747:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LBDL);
 1175              		.loc 1 747 0
 1176 058e 7B68     		ldr	r3, [r7, #4]
 1177 0590 1B8A     		ldrh	r3, [r3, #16]
 1178 0592 9BB2     		uxth	r3, r3
 1179 0594 2022     		movs	r2, #32
 1180 0596 9343     		bics	r3, r2
 1181 0598 9AB2     		uxth	r2, r3
 1182 059a 7B68     		ldr	r3, [r7, #4]
 1183 059c 1A82     		strh	r2, [r3, #16]
 748:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR2 |= USART_LINBreakDetectLength;  
 1184              		.loc 1 748 0
 1185 059e 7B68     		ldr	r3, [r7, #4]
 1186 05a0 1B8A     		ldrh	r3, [r3, #16]
 1187 05a2 9AB2     		uxth	r2, r3
 1188 05a4 BB1C     		adds	r3, r7, #2
 1189 05a6 1B88     		ldrh	r3, [r3]
 1190 05a8 1343     		orrs	r3, r2
 1191 05aa 9AB2     		uxth	r2, r3
 1192 05ac 7B68     		ldr	r3, [r7, #4]
 1193 05ae 1A82     		strh	r2, [r3, #16]
 749:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1194              		.loc 1 749 0
 1195 05b0 C046     		nop
 1196 05b2 BD46     		mov	sp, r7
 1197 05b4 02B0     		add	sp, sp, #8
 1198              		@ sp needed
 1199 05b6 80BD     		pop	{r7, pc}
 1200              		.cfi_endproc
 1201              	.LFE137:
 1203              		.align	1
 1204              		.global	USART_LINCmd
 1205              		.syntax unified
 1206              		.code	16
 1207              		.thumb_func
 1208              		.fpu softvfp
 1210              	USART_LINCmd:
 1211              	.LFB138:
 750:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 751:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 752:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the USART's LIN mode.
 753:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 754:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 755:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the USART LIN mode.
 756:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
 757:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 758:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 759:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_LINCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 760:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1212              		.loc 1 760 0
 1213              		.cfi_startproc
 1214              		@ args = 0, pretend = 0, frame = 8
 1215              		@ frame_needed = 1, uses_anonymous_args = 0
 1216 05b8 80B5     		push	{r7, lr}
 1217              		.cfi_def_cfa_offset 8
 1218              		.cfi_offset 7, -8
 1219              		.cfi_offset 14, -4
 1220 05ba 82B0     		sub	sp, sp, #8
 1221              		.cfi_def_cfa_offset 16
 1222 05bc 00AF     		add	r7, sp, #0
 1223              		.cfi_def_cfa_register 7
 1224 05be 7860     		str	r0, [r7, #4]
 1225 05c0 0A00     		movs	r2, r1
 1226 05c2 FB1C     		adds	r3, r7, #3
 1227 05c4 1A70     		strb	r2, [r3]
 761:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 762:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 763:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 764:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 765:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1228              		.loc 1 765 0
 1229 05c6 FB1C     		adds	r3, r7, #3
 1230 05c8 1B78     		ldrb	r3, [r3]
 1231 05ca 002B     		cmp	r3, #0
 1232 05cc 09D0     		beq	.L60
 766:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 767:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the LIN mode by setting the LINEN bit in the CR2 register */
 768:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR2 |= USART_CR2_LINEN;
 1233              		.loc 1 768 0
 1234 05ce 7B68     		ldr	r3, [r7, #4]
 1235 05d0 1B8A     		ldrh	r3, [r3, #16]
 1236 05d2 9BB2     		uxth	r3, r3
 1237 05d4 8022     		movs	r2, #128
 1238 05d6 D201     		lsls	r2, r2, #7
 1239 05d8 1343     		orrs	r3, r2
 1240 05da 9AB2     		uxth	r2, r3
 1241 05dc 7B68     		ldr	r3, [r7, #4]
 1242 05de 1A82     		strh	r2, [r3, #16]
 769:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 770:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 771:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 772:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the LIN mode by clearing the LINEN bit in the CR2 register */
 773:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR2 &= (uint16_t)~((uint16_t)USART_CR2_LINEN);
 774:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 775:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1243              		.loc 1 775 0
 1244 05e0 07E0     		b	.L62
 1245              	.L60:
 773:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1246              		.loc 1 773 0
 1247 05e2 7B68     		ldr	r3, [r7, #4]
 1248 05e4 1B8A     		ldrh	r3, [r3, #16]
 1249 05e6 9BB2     		uxth	r3, r3
 1250 05e8 044A     		ldr	r2, .L63
 1251 05ea 1340     		ands	r3, r2
 1252 05ec 9AB2     		uxth	r2, r3
 1253 05ee 7B68     		ldr	r3, [r7, #4]
 1254 05f0 1A82     		strh	r2, [r3, #16]
 1255              	.L62:
 1256              		.loc 1 775 0
 1257 05f2 C046     		nop
 1258 05f4 BD46     		mov	sp, r7
 1259 05f6 02B0     		add	sp, sp, #8
 1260              		@ sp needed
 1261 05f8 80BD     		pop	{r7, pc}
 1262              	.L64:
 1263 05fa C046     		.align	2
 1264              	.L63:
 1265 05fc FFBFFFFF 		.word	-16385
 1266              		.cfi_endproc
 1267              	.LFE138:
 1269              		.align	1
 1270              		.global	USART_SendBreak
 1271              		.syntax unified
 1272              		.code	16
 1273              		.thumb_func
 1274              		.fpu softvfp
 1276              	USART_SendBreak:
 1277              	.LFB139:
 776:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 777:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 778:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Transmits break characters.
 779:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 780:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 781:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 782:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 783:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_SendBreak(USART_TypeDef* USARTx)
 784:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1278              		.loc 1 784 0
 1279              		.cfi_startproc
 1280              		@ args = 0, pretend = 0, frame = 8
 1281              		@ frame_needed = 1, uses_anonymous_args = 0
 1282 0600 80B5     		push	{r7, lr}
 1283              		.cfi_def_cfa_offset 8
 1284              		.cfi_offset 7, -8
 1285              		.cfi_offset 14, -4
 1286 0602 82B0     		sub	sp, sp, #8
 1287              		.cfi_def_cfa_offset 16
 1288 0604 00AF     		add	r7, sp, #0
 1289              		.cfi_def_cfa_register 7
 1290 0606 7860     		str	r0, [r7, #4]
 785:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 786:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 787:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 788:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Send break characters */
 789:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR1 |= USART_CR1_SBK;
 1291              		.loc 1 789 0
 1292 0608 7B68     		ldr	r3, [r7, #4]
 1293 060a 9B89     		ldrh	r3, [r3, #12]
 1294 060c 9BB2     		uxth	r3, r3
 1295 060e 0122     		movs	r2, #1
 1296 0610 1343     		orrs	r3, r2
 1297 0612 9AB2     		uxth	r2, r3
 1298 0614 7B68     		ldr	r3, [r7, #4]
 1299 0616 9A81     		strh	r2, [r3, #12]
 790:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1300              		.loc 1 790 0
 1301 0618 C046     		nop
 1302 061a BD46     		mov	sp, r7
 1303 061c 02B0     		add	sp, sp, #8
 1304              		@ sp needed
 1305 061e 80BD     		pop	{r7, pc}
 1306              		.cfi_endproc
 1307              	.LFE139:
 1309              		.align	1
 1310              		.global	USART_HalfDuplexCmd
 1311              		.syntax unified
 1312              		.code	16
 1313              		.thumb_func
 1314              		.fpu softvfp
 1316              	USART_HalfDuplexCmd:
 1317              	.LFB140:
 791:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 792:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 793:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
 794:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 795:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 796:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group5 Halfduplex mode function
 797:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   Half-duplex mode function 
 798:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
 799:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
 800:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
 801:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                     ##### Half-duplex mode function #####
 802:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
 803:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 804:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to manage the USART 
 805:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     Half-duplex communication.
 806:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 807:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     The USART can be configured to follow a single-wire half-duplex protocol where 
 808:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     the TX and RX lines are internally connected.
 809:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 810:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USART Half duplex communication is possible through the following procedure:
 811:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the Baud rate, Word length, Stop bits, Parity, Mode transmitter 
 812:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           or Mode receiver and hardware flow control values using the USART_Init()
 813:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           function.
 814:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the USART address using the USART_SetAddress() function.
 815:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the USART using the USART_Cmd() function.
 816:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the half duplex mode using USART_HalfDuplexCmd() function.
 817:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 818:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 819:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     -@- The RX pin is no longer used
 820:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     -@- In Half-duplex mode the following bits must be kept cleared:
 821:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+@) LINEN and CLKEN bits in the USART_CR2 register.
 822:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+@) SCEN and IREN bits in the USART_CR3 register.
 823:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 824:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
 825:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 826:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 827:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 828:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 829:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the USART's Half Duplex communication.
 830:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
 831:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 832:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the USART Communication.
 833:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
 834:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 835:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 836:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 837:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1318              		.loc 1 837 0
 1319              		.cfi_startproc
 1320              		@ args = 0, pretend = 0, frame = 8
 1321              		@ frame_needed = 1, uses_anonymous_args = 0
 1322 0620 80B5     		push	{r7, lr}
 1323              		.cfi_def_cfa_offset 8
 1324              		.cfi_offset 7, -8
 1325              		.cfi_offset 14, -4
 1326 0622 82B0     		sub	sp, sp, #8
 1327              		.cfi_def_cfa_offset 16
 1328 0624 00AF     		add	r7, sp, #0
 1329              		.cfi_def_cfa_register 7
 1330 0626 7860     		str	r0, [r7, #4]
 1331 0628 0A00     		movs	r2, r1
 1332 062a FB1C     		adds	r3, r7, #3
 1333 062c 1A70     		strb	r2, [r3]
 838:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 839:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
 840:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 841:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 842:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1334              		.loc 1 842 0
 1335 062e FB1C     		adds	r3, r7, #3
 1336 0630 1B78     		ldrb	r3, [r3]
 1337 0632 002B     		cmp	r3, #0
 1338 0634 08D0     		beq	.L67
 843:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 844:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the Half-Duplex mode by setting the HDSEL bit in the CR3 register */
 845:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 |= USART_CR3_HDSEL;
 1339              		.loc 1 845 0
 1340 0636 7B68     		ldr	r3, [r7, #4]
 1341 0638 9B8A     		ldrh	r3, [r3, #20]
 1342 063a 9BB2     		uxth	r3, r3
 1343 063c 0822     		movs	r2, #8
 1344 063e 1343     		orrs	r3, r2
 1345 0640 9AB2     		uxth	r2, r3
 1346 0642 7B68     		ldr	r3, [r7, #4]
 1347 0644 9A82     		strh	r2, [r3, #20]
 846:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 847:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 848:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 849:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the Half-Duplex mode by clearing the HDSEL bit in the CR3 register */
 850:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_HDSEL);
 851:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 852:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1348              		.loc 1 852 0
 1349 0646 07E0     		b	.L69
 1350              	.L67:
 850:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1351              		.loc 1 850 0
 1352 0648 7B68     		ldr	r3, [r7, #4]
 1353 064a 9B8A     		ldrh	r3, [r3, #20]
 1354 064c 9BB2     		uxth	r3, r3
 1355 064e 0822     		movs	r2, #8
 1356 0650 9343     		bics	r3, r2
 1357 0652 9AB2     		uxth	r2, r3
 1358 0654 7B68     		ldr	r3, [r7, #4]
 1359 0656 9A82     		strh	r2, [r3, #20]
 1360              	.L69:
 1361              		.loc 1 852 0
 1362 0658 C046     		nop
 1363 065a BD46     		mov	sp, r7
 1364 065c 02B0     		add	sp, sp, #8
 1365              		@ sp needed
 1366 065e 80BD     		pop	{r7, pc}
 1367              		.cfi_endproc
 1368              	.LFE140:
 1370              		.align	1
 1371              		.global	USART_SetGuardTime
 1372              		.syntax unified
 1373              		.code	16
 1374              		.thumb_func
 1375              		.fpu softvfp
 1377              	USART_SetGuardTime:
 1378              	.LFB141:
 853:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 854:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 855:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
 856:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 857:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 858:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 859:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group6 Smartcard mode functions
 860:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   Smartcard mode functions 
 861:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
 862:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
 863:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
 864:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                               ##### Smartcard mode functions #####
 865:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
 866:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 867:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to manage the USART 
 868:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     Smartcard communication.
 869:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 870:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     The Smartcard interface is designed to support asynchronous protocol Smartcards as
 871:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     defined in the ISO 7816-3 standard.
 872:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 873:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     The USART can provide a clock to the smartcard through the SCLK output.
 874:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In smartcard mode, SCLK is not associated to the communication but is simply derived 
 875:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     from the internal peripheral input clock through a 5-bit prescaler.
 876:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 877:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     Smartcard communication is possible through the following procedure:
 878:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the Smartcard Prescaler using the USART_SetPrescaler() function.
 879:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the Smartcard Guard Time using the USART_SetGuardTime() function.
 880:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the USART clock using the USART_ClockInit() function as following:
 881:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART Clock enabled
 882:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART CPOL Low
 883:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART CPHA on first edge
 884:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) USART Last Bit Clock Enabled
 885:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the Smartcard interface using the USART_Init() function as following:
 886:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Word Length = 9 Bits
 887:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) 1.5 Stop Bit
 888:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Even parity
 889:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) BaudRate = 12096 baud
 890:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Hardware flow control disabled (RTS and CTS signals)
 891:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (++) Tx and Rx enabled
 892:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) POptionally you can enable the parity error interrupt using the USART_ITConfig()
 893:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           function
 894:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) PEnable the USART using the USART_Cmd() function.
 895:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) PEnable the Smartcard NACK using the USART_SmartCardNACKCmd() function.
 896:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) PEnable the Smartcard interface using the USART_SmartCardCmd() function.
 897:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 898:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     Please refer to the ISO 7816-3 specification for more details.
 899:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 900:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- It is also possible to choose 0.5 stop bit for receiving but it is recommended 
 901:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           to use 1.5 stop bits for both transmitting and receiving to avoid switching 
 902:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           between the two configurations.
 903:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- In smartcard mode, the following bits must be kept cleared:
 904:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (+@) LINEN bit in the USART_CR2 register.
 905:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (+@) HDSEL and IREN bits in the USART_CR3 register.
 906:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- Smartcard mode is available on USART peripherals only (not available on UART4 
 907:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           and UART5 peripherals).
 908:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 909:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
 910:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
 911:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 912:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 913:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 914:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Sets the specified USART guard time.
 915:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3 or 6 to select the USART or 
 916:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 917:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_GuardTime: specifies the guard time.   
 918:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 919:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 920:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
 921:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {    
 1379              		.loc 1 921 0
 1380              		.cfi_startproc
 1381              		@ args = 0, pretend = 0, frame = 8
 1382              		@ frame_needed = 1, uses_anonymous_args = 0
 1383 0660 80B5     		push	{r7, lr}
 1384              		.cfi_def_cfa_offset 8
 1385              		.cfi_offset 7, -8
 1386              		.cfi_offset 14, -4
 1387 0662 82B0     		sub	sp, sp, #8
 1388              		.cfi_def_cfa_offset 16
 1389 0664 00AF     		add	r7, sp, #0
 1390              		.cfi_def_cfa_register 7
 1391 0666 7860     		str	r0, [r7, #4]
 1392 0668 0A00     		movs	r2, r1
 1393 066a FB1C     		adds	r3, r7, #3
 1394 066c 1A70     		strb	r2, [r3]
 922:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 923:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_1236_PERIPH(USARTx));
 924:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
 925:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Clear the USART Guard time */
 926:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->GTPR &= USART_GTPR_PSC;
 1395              		.loc 1 926 0
 1396 066e 7B68     		ldr	r3, [r7, #4]
 1397 0670 1B8B     		ldrh	r3, [r3, #24]
 1398 0672 9BB2     		uxth	r3, r3
 1399 0674 FF22     		movs	r2, #255
 1400 0676 1340     		ands	r3, r2
 1401 0678 9AB2     		uxth	r2, r3
 1402 067a 7B68     		ldr	r3, [r7, #4]
 1403 067c 1A83     		strh	r2, [r3, #24]
 927:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Set the USART guard time */
 928:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->GTPR |= (uint16_t)((uint16_t)USART_GuardTime << 0x08);
 1404              		.loc 1 928 0
 1405 067e 7B68     		ldr	r3, [r7, #4]
 1406 0680 1B8B     		ldrh	r3, [r3, #24]
 1407 0682 9AB2     		uxth	r2, r3
 1408 0684 FB1C     		adds	r3, r7, #3
 1409 0686 1B78     		ldrb	r3, [r3]
 1410 0688 9BB2     		uxth	r3, r3
 1411 068a 1B02     		lsls	r3, r3, #8
 1412 068c 9BB2     		uxth	r3, r3
 1413 068e 1343     		orrs	r3, r2
 1414 0690 9AB2     		uxth	r2, r3
 1415 0692 7B68     		ldr	r3, [r7, #4]
 1416 0694 1A83     		strh	r2, [r3, #24]
 929:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1417              		.loc 1 929 0
 1418 0696 C046     		nop
 1419 0698 BD46     		mov	sp, r7
 1420 069a 02B0     		add	sp, sp, #8
 1421              		@ sp needed
 1422 069c 80BD     		pop	{r7, pc}
 1423              		.cfi_endproc
 1424              	.LFE141:
 1426              		.align	1
 1427              		.global	USART_SmartCardCmd
 1428              		.syntax unified
 1429              		.code	16
 1430              		.thumb_func
 1431              		.fpu softvfp
 1433              	USART_SmartCardCmd:
 1434              	.LFB142:
 930:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 931:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 932:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the USART's Smart Card mode.
 933:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3 or 6 to select the USART or 
 934:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 935:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the Smart Card mode.
 936:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.      
 937:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 938:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 939:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 940:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1435              		.loc 1 940 0
 1436              		.cfi_startproc
 1437              		@ args = 0, pretend = 0, frame = 8
 1438              		@ frame_needed = 1, uses_anonymous_args = 0
 1439 069e 80B5     		push	{r7, lr}
 1440              		.cfi_def_cfa_offset 8
 1441              		.cfi_offset 7, -8
 1442              		.cfi_offset 14, -4
 1443 06a0 82B0     		sub	sp, sp, #8
 1444              		.cfi_def_cfa_offset 16
 1445 06a2 00AF     		add	r7, sp, #0
 1446              		.cfi_def_cfa_register 7
 1447 06a4 7860     		str	r0, [r7, #4]
 1448 06a6 0A00     		movs	r2, r1
 1449 06a8 FB1C     		adds	r3, r7, #3
 1450 06aa 1A70     		strb	r2, [r3]
 941:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 942:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_1236_PERIPH(USARTx));
 943:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 944:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1451              		.loc 1 944 0
 1452 06ac FB1C     		adds	r3, r7, #3
 1453 06ae 1B78     		ldrb	r3, [r3]
 1454 06b0 002B     		cmp	r3, #0
 1455 06b2 08D0     		beq	.L72
 945:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 946:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the SC mode by setting the SCEN bit in the CR3 register */
 947:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 |= USART_CR3_SCEN;
 1456              		.loc 1 947 0
 1457 06b4 7B68     		ldr	r3, [r7, #4]
 1458 06b6 9B8A     		ldrh	r3, [r3, #20]
 1459 06b8 9BB2     		uxth	r3, r3
 1460 06ba 2022     		movs	r2, #32
 1461 06bc 1343     		orrs	r3, r2
 1462 06be 9AB2     		uxth	r2, r3
 1463 06c0 7B68     		ldr	r3, [r7, #4]
 1464 06c2 9A82     		strh	r2, [r3, #20]
 948:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 949:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 950:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 951:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the SC mode by clearing the SCEN bit in the CR3 register */
 952:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_SCEN);
 953:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 954:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1465              		.loc 1 954 0
 1466 06c4 07E0     		b	.L74
 1467              	.L72:
 952:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1468              		.loc 1 952 0
 1469 06c6 7B68     		ldr	r3, [r7, #4]
 1470 06c8 9B8A     		ldrh	r3, [r3, #20]
 1471 06ca 9BB2     		uxth	r3, r3
 1472 06cc 2022     		movs	r2, #32
 1473 06ce 9343     		bics	r3, r2
 1474 06d0 9AB2     		uxth	r2, r3
 1475 06d2 7B68     		ldr	r3, [r7, #4]
 1476 06d4 9A82     		strh	r2, [r3, #20]
 1477              	.L74:
 1478              		.loc 1 954 0
 1479 06d6 C046     		nop
 1480 06d8 BD46     		mov	sp, r7
 1481 06da 02B0     		add	sp, sp, #8
 1482              		@ sp needed
 1483 06dc 80BD     		pop	{r7, pc}
 1484              		.cfi_endproc
 1485              	.LFE142:
 1487              		.align	1
 1488              		.global	USART_SmartCardNACKCmd
 1489              		.syntax unified
 1490              		.code	16
 1491              		.thumb_func
 1492              		.fpu softvfp
 1494              	USART_SmartCardNACKCmd:
 1495              	.LFB143:
 955:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 956:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 957:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables NACK transmission.
 958:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3 or 6 to select the USART or 
 959:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
 960:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the NACK transmission.
 961:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.  
 962:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
 963:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 964:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
 965:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1496              		.loc 1 965 0
 1497              		.cfi_startproc
 1498              		@ args = 0, pretend = 0, frame = 8
 1499              		@ frame_needed = 1, uses_anonymous_args = 0
 1500 06de 80B5     		push	{r7, lr}
 1501              		.cfi_def_cfa_offset 8
 1502              		.cfi_offset 7, -8
 1503              		.cfi_offset 14, -4
 1504 06e0 82B0     		sub	sp, sp, #8
 1505              		.cfi_def_cfa_offset 16
 1506 06e2 00AF     		add	r7, sp, #0
 1507              		.cfi_def_cfa_register 7
 1508 06e4 7860     		str	r0, [r7, #4]
 1509 06e6 0A00     		movs	r2, r1
 1510 06e8 FB1C     		adds	r3, r7, #3
 1511 06ea 1A70     		strb	r2, [r3]
 966:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
 967:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_1236_PERIPH(USARTx)); 
 968:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
 969:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1512              		.loc 1 969 0
 1513 06ec FB1C     		adds	r3, r7, #3
 1514 06ee 1B78     		ldrb	r3, [r3]
 1515 06f0 002B     		cmp	r3, #0
 1516 06f2 08D0     		beq	.L76
 970:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 971:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the NACK transmission by setting the NACK bit in the CR3 register */
 972:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 |= USART_CR3_NACK;
 1517              		.loc 1 972 0
 1518 06f4 7B68     		ldr	r3, [r7, #4]
 1519 06f6 9B8A     		ldrh	r3, [r3, #20]
 1520 06f8 9BB2     		uxth	r3, r3
 1521 06fa 1022     		movs	r2, #16
 1522 06fc 1343     		orrs	r3, r2
 1523 06fe 9AB2     		uxth	r2, r3
 1524 0700 7B68     		ldr	r3, [r7, #4]
 1525 0702 9A82     		strh	r2, [r3, #20]
 973:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 974:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
 975:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
 976:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the NACK transmission by clearing the NACK bit in the CR3 register */
 977:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_NACK);
 978:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 979:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1526              		.loc 1 979 0
 1527 0704 07E0     		b	.L78
 1528              	.L76:
 977:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1529              		.loc 1 977 0
 1530 0706 7B68     		ldr	r3, [r7, #4]
 1531 0708 9B8A     		ldrh	r3, [r3, #20]
 1532 070a 9BB2     		uxth	r3, r3
 1533 070c 1022     		movs	r2, #16
 1534 070e 9343     		bics	r3, r2
 1535 0710 9AB2     		uxth	r2, r3
 1536 0712 7B68     		ldr	r3, [r7, #4]
 1537 0714 9A82     		strh	r2, [r3, #20]
 1538              	.L78:
 1539              		.loc 1 979 0
 1540 0716 C046     		nop
 1541 0718 BD46     		mov	sp, r7
 1542 071a 02B0     		add	sp, sp, #8
 1543              		@ sp needed
 1544 071c 80BD     		pop	{r7, pc}
 1545              		.cfi_endproc
 1546              	.LFE143:
 1548              		.align	1
 1549              		.global	USART_IrDAConfig
 1550              		.syntax unified
 1551              		.code	16
 1552              		.thumb_func
 1553              		.fpu softvfp
 1555              	USART_IrDAConfig:
 1556              	.LFB144:
 980:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 981:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
 982:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
 983:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
 984:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
 985:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group7 IrDA mode functions
 986:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   IrDA mode functions 
 987:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
 988:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
 989:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
 990:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                         ##### IrDA mode functions #####
 991:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
 992:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 993:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to manage the USART 
 994:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     IrDA communication.
 995:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
 996:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     IrDA is a half duplex communication protocol. If the Transmitter is busy, any data
 997:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     on the IrDA receive line will be ignored by the IrDA decoder and if the Receiver 
 998:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     is busy, data on the TX from the USART to IrDA will not be encoded by IrDA.
 999:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     While receiving data, transmission should be avoided as the data to be transmitted
1000:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     could be corrupted.
1001:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1002:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     IrDA communication is possible through the following procedure:
1003:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Program the Baud rate, Word length = 8 bits, Stop bits, Parity, Transmitter/Receiver 
1004:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           modes and hardware flow control values using the USART_Init() function.
1005:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the USART using the USART_Cmd() function.
1006:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the IrDA pulse width by configuring the prescaler using  
1007:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           the USART_SetPrescaler() function.
1008:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Configures the IrDA  USART_IrDAMode_LowPower or USART_IrDAMode_Normal mode
1009:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           using the USART_IrDAConfig() function.
1010:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Enable the IrDA using the USART_IrDACmd() function.
1011:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1012:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- A pulse of width less than two and greater than one PSC period(s) may or may
1013:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           not be rejected.
1014:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- The receiver set up time should be managed by software. The IrDA physical layer
1015:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           specification specifies a minimum of 10 ms delay between transmission and 
1016:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           reception (IrDA is a half duplex protocol).
1017:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@- In IrDA mode, the following bits must be kept cleared:
1018:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (+@) LINEN, STOP and CLKEN bits in the USART_CR2 register.
1019:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (+@) SCEN and HDSEL bits in the USART_CR3 register.
1020:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1021:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
1022:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
1023:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1024:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1025:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1026:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Configures the USART's IrDA interface.
1027:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1028:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1029:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_IrDAMode: specifies the IrDA mode.
1030:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be one of the following values:
1031:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IrDAMode_LowPower
1032:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IrDAMode_Normal
1033:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
1034:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1035:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_IrDAConfig(USART_TypeDef* USARTx, uint16_t USART_IrDAMode)
1036:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1557              		.loc 1 1036 0
 1558              		.cfi_startproc
 1559              		@ args = 0, pretend = 0, frame = 8
 1560              		@ frame_needed = 1, uses_anonymous_args = 0
 1561 071e 80B5     		push	{r7, lr}
 1562              		.cfi_def_cfa_offset 8
 1563              		.cfi_offset 7, -8
 1564              		.cfi_offset 14, -4
 1565 0720 82B0     		sub	sp, sp, #8
 1566              		.cfi_def_cfa_offset 16
 1567 0722 00AF     		add	r7, sp, #0
 1568              		.cfi_def_cfa_register 7
 1569 0724 7860     		str	r0, [r7, #4]
 1570 0726 0A00     		movs	r2, r1
 1571 0728 BB1C     		adds	r3, r7, #2
 1572 072a 1A80     		strh	r2, [r3]
1037:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1038:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1039:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_IRDA_MODE(USART_IrDAMode));
1040:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1041:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IRLP);
 1573              		.loc 1 1041 0
 1574 072c 7B68     		ldr	r3, [r7, #4]
 1575 072e 9B8A     		ldrh	r3, [r3, #20]
 1576 0730 9BB2     		uxth	r3, r3
 1577 0732 0422     		movs	r2, #4
 1578 0734 9343     		bics	r3, r2
 1579 0736 9AB2     		uxth	r2, r3
 1580 0738 7B68     		ldr	r3, [r7, #4]
 1581 073a 9A82     		strh	r2, [r3, #20]
1042:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->CR3 |= USART_IrDAMode;
 1582              		.loc 1 1042 0
 1583 073c 7B68     		ldr	r3, [r7, #4]
 1584 073e 9B8A     		ldrh	r3, [r3, #20]
 1585 0740 9AB2     		uxth	r2, r3
 1586 0742 BB1C     		adds	r3, r7, #2
 1587 0744 1B88     		ldrh	r3, [r3]
 1588 0746 1343     		orrs	r3, r2
 1589 0748 9AB2     		uxth	r2, r3
 1590 074a 7B68     		ldr	r3, [r7, #4]
 1591 074c 9A82     		strh	r2, [r3, #20]
1043:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1592              		.loc 1 1043 0
 1593 074e C046     		nop
 1594 0750 BD46     		mov	sp, r7
 1595 0752 02B0     		add	sp, sp, #8
 1596              		@ sp needed
 1597 0754 80BD     		pop	{r7, pc}
 1598              		.cfi_endproc
 1599              	.LFE144:
 1601              		.align	1
 1602              		.global	USART_IrDACmd
 1603              		.syntax unified
 1604              		.code	16
 1605              		.thumb_func
 1606              		.fpu softvfp
 1608              	USART_IrDACmd:
 1609              	.LFB145:
1044:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1045:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1046:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the USART's IrDA interface.
1047:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1048:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1049:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the IrDA mode.
1050:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
1051:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
1052:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1053:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1054:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1610              		.loc 1 1054 0
 1611              		.cfi_startproc
 1612              		@ args = 0, pretend = 0, frame = 8
 1613              		@ frame_needed = 1, uses_anonymous_args = 0
 1614 0756 80B5     		push	{r7, lr}
 1615              		.cfi_def_cfa_offset 8
 1616              		.cfi_offset 7, -8
 1617              		.cfi_offset 14, -4
 1618 0758 82B0     		sub	sp, sp, #8
 1619              		.cfi_def_cfa_offset 16
 1620 075a 00AF     		add	r7, sp, #0
 1621              		.cfi_def_cfa_register 7
 1622 075c 7860     		str	r0, [r7, #4]
 1623 075e 0A00     		movs	r2, r1
 1624 0760 FB1C     		adds	r3, r7, #3
 1625 0762 1A70     		strb	r2, [r3]
1055:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1056:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1057:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
1058:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1059:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1626              		.loc 1 1059 0
 1627 0764 FB1C     		adds	r3, r7, #3
 1628 0766 1B78     		ldrb	r3, [r3]
 1629 0768 002B     		cmp	r3, #0
 1630 076a 08D0     		beq	.L81
1060:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1061:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
1062:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 |= USART_CR3_IREN;
 1631              		.loc 1 1062 0
 1632 076c 7B68     		ldr	r3, [r7, #4]
 1633 076e 9B8A     		ldrh	r3, [r3, #20]
 1634 0770 9BB2     		uxth	r3, r3
 1635 0772 0222     		movs	r2, #2
 1636 0774 1343     		orrs	r3, r2
 1637 0776 9AB2     		uxth	r2, r3
 1638 0778 7B68     		ldr	r3, [r7, #4]
 1639 077a 9A82     		strh	r2, [r3, #20]
1063:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1064:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
1065:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1066:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
1067:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 &= (uint16_t)~((uint16_t)USART_CR3_IREN);
1068:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1069:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1640              		.loc 1 1069 0
 1641 077c 07E0     		b	.L83
 1642              	.L81:
1067:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1643              		.loc 1 1067 0
 1644 077e 7B68     		ldr	r3, [r7, #4]
 1645 0780 9B8A     		ldrh	r3, [r3, #20]
 1646 0782 9BB2     		uxth	r3, r3
 1647 0784 0222     		movs	r2, #2
 1648 0786 9343     		bics	r3, r2
 1649 0788 9AB2     		uxth	r2, r3
 1650 078a 7B68     		ldr	r3, [r7, #4]
 1651 078c 9A82     		strh	r2, [r3, #20]
 1652              	.L83:
 1653              		.loc 1 1069 0
 1654 078e C046     		nop
 1655 0790 BD46     		mov	sp, r7
 1656 0792 02B0     		add	sp, sp, #8
 1657              		@ sp needed
 1658 0794 80BD     		pop	{r7, pc}
 1659              		.cfi_endproc
 1660              	.LFE145:
 1662              		.align	1
 1663              		.global	USART_DMACmd
 1664              		.syntax unified
 1665              		.code	16
 1666              		.thumb_func
 1667              		.fpu softvfp
 1669              	USART_DMACmd:
 1670              	.LFB146:
1070:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1071:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1072:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
1073:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1074:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1075:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group8 DMA transfers management functions
1076:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   DMA transfers management functions
1077:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
1078:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
1079:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
1080:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****               ##### DMA transfers management functions #####
1081:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
1082:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1083:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
1084:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
1085:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1086:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
1087:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1088:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the USART's DMA interface.
1089:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1090:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1091:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_DMAReq: specifies the DMA request.
1092:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be any combination of the following values:
1093:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_DMAReq_Tx: USART DMA transmit request
1094:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_DMAReq_Rx: USART DMA receive request
1095:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the DMA Request sources.
1096:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.   
1097:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
1098:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1099:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState)
1100:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1671              		.loc 1 1100 0
 1672              		.cfi_startproc
 1673              		@ args = 0, pretend = 0, frame = 8
 1674              		@ frame_needed = 1, uses_anonymous_args = 0
 1675 0796 80B5     		push	{r7, lr}
 1676              		.cfi_def_cfa_offset 8
 1677              		.cfi_offset 7, -8
 1678              		.cfi_offset 14, -4
 1679 0798 82B0     		sub	sp, sp, #8
 1680              		.cfi_def_cfa_offset 16
 1681 079a 00AF     		add	r7, sp, #0
 1682              		.cfi_def_cfa_register 7
 1683 079c 7860     		str	r0, [r7, #4]
 1684 079e 0800     		movs	r0, r1
 1685 07a0 1100     		movs	r1, r2
 1686 07a2 BB1C     		adds	r3, r7, #2
 1687 07a4 021C     		adds	r2, r0, #0
 1688 07a6 1A80     		strh	r2, [r3]
 1689 07a8 7B1C     		adds	r3, r7, #1
 1690 07aa 0A1C     		adds	r2, r1, #0
 1691 07ac 1A70     		strb	r2, [r3]
1101:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1102:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1103:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_DMAREQ(USART_DMAReq));  
1104:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState)); 
1105:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1692              		.loc 1 1106 0
 1693 07ae 7B1C     		adds	r3, r7, #1
 1694 07b0 1B78     		ldrb	r3, [r3]
 1695 07b2 002B     		cmp	r3, #0
 1696 07b4 09D0     		beq	.L85
1107:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1108:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Enable the DMA transfer for selected requests by setting the DMAT and/or
1109:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****        DMAR bits in the USART CR3 register */
1110:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 |= USART_DMAReq;
 1697              		.loc 1 1110 0
 1698 07b6 7B68     		ldr	r3, [r7, #4]
 1699 07b8 9B8A     		ldrh	r3, [r3, #20]
 1700 07ba 9AB2     		uxth	r2, r3
 1701 07bc BB1C     		adds	r3, r7, #2
 1702 07be 1B88     		ldrh	r3, [r3]
 1703 07c0 1343     		orrs	r3, r2
 1704 07c2 9AB2     		uxth	r2, r3
 1705 07c4 7B68     		ldr	r3, [r7, #4]
 1706 07c6 9A82     		strh	r2, [r3, #20]
1111:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1112:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
1113:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1114:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     /* Disable the DMA transfer for selected requests by clearing the DMAT and/or
1115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****        DMAR bits in the USART CR3 register */
1116:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     USARTx->CR3 &= (uint16_t)~USART_DMAReq;
1117:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1118:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1707              		.loc 1 1118 0
 1708 07c8 0AE0     		b	.L87
 1709              	.L85:
1116:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1710              		.loc 1 1116 0
 1711 07ca 7B68     		ldr	r3, [r7, #4]
 1712 07cc 9B8A     		ldrh	r3, [r3, #20]
 1713 07ce 9BB2     		uxth	r3, r3
 1714 07d0 BA1C     		adds	r2, r7, #2
 1715 07d2 1288     		ldrh	r2, [r2]
 1716 07d4 D243     		mvns	r2, r2
 1717 07d6 92B2     		uxth	r2, r2
 1718 07d8 1340     		ands	r3, r2
 1719 07da 9AB2     		uxth	r2, r3
 1720 07dc 7B68     		ldr	r3, [r7, #4]
 1721 07de 9A82     		strh	r2, [r3, #20]
 1722              	.L87:
 1723              		.loc 1 1118 0
 1724 07e0 C046     		nop
 1725 07e2 BD46     		mov	sp, r7
 1726 07e4 02B0     		add	sp, sp, #8
 1727              		@ sp needed
 1728 07e6 80BD     		pop	{r7, pc}
 1729              		.cfi_endproc
 1730              	.LFE146:
 1732              		.align	1
 1733              		.global	USART_ITConfig
 1734              		.syntax unified
 1735              		.code	16
 1736              		.thumb_func
 1737              		.fpu softvfp
 1739              	USART_ITConfig:
 1740              	.LFB147:
1119:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1120:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1121:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @}
1122:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1123:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
1124:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /** @defgroup USART_Group9 Interrupts and flags management functions
1125:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *  @brief   Interrupts and flags management functions 
1126:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  *
1127:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @verbatim   
1128:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================
1129:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****             ##### Interrupts and flags management functions #####
1130:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****  ===============================================================================  
1131:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1132:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     This subsection provides a set of functions allowing to configure the USART 
1133:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     Interrupts sources, DMA channels requests and check or clear the flags or 
1134:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     pending bits status.
1135:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     The user should identify which mode will be used in his application to manage 
1136:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     the communication: Polling mode, Interrupt mode or DMA mode. 
1137:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1138:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     *** Polling Mode ***
1139:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     ====================
1140:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1141:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In Polling Mode, the SPI communication can be managed by 10 flags:
1142:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_TXE : to indicate the status of the transmit buffer register
1143:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_RXNE : to indicate the status of the receive buffer register
1144:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_TC : to indicate the status of the transmit operation
1145:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_IDLE : to indicate the status of the Idle Line             
1146:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_CTS : to indicate the status of the nCTS input
1147:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_LBD : to indicate the status of the LIN break detection
1148:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_NE : to indicate if a noise error occur
1149:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_FE : to indicate if a frame error occur
1150:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_PE : to indicate if a parity error occur
1151:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_FLAG_ORE : to indicate if an Overrun error occur
1152:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1153:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In this Mode it is advised to use the following functions:
1154:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint16_t USART_FLAG);
1155:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG);
1156:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1157:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     *** Interrupt Mode ***
1158:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     ======================
1159:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1160:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In Interrupt Mode, the USART communication can be managed by 8 interrupt sources
1161:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     and 10 pending bits: 
1162:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1163:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Pending Bits:
1164:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1165:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_TXE : to indicate the status of the transmit buffer register
1166:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_RXNE : to indicate the status of the receive buffer register
1167:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_TC : to indicate the status of the transmit operation
1168:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_IDLE : to indicate the status of the Idle Line             
1169:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_CTS : to indicate the status of the nCTS input
1170:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_LBD : to indicate the status of the LIN break detection
1171:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_NE : to indicate if a noise error occur
1172:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_FE : to indicate if a frame error occur
1173:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_PE : to indicate if a parity error occur
1174:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_ORE : to indicate if an Overrun error occur
1175:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1176:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) Interrupt Source:
1177:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1178:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_TXE : specifies the interrupt source for the Tx buffer empty 
1179:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                             interrupt. 
1180:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_RXNE : specifies the interrupt source for the Rx buffer not 
1181:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                              empty interrupt.
1182:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_TC : specifies the interrupt source for the Transmit complete 
1183:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                            interrupt. 
1184:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_IDLE : specifies the interrupt source for the Idle Line interrupt.           
1185:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_CTS : specifies the interrupt source for the CTS interrupt. 
1186:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_LBD : specifies the interrupt source for the LIN break detection
1187:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****                             interrupt. 
1188:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_PE : specifies the interrupt source for the parity error interrupt. 
1189:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****         (##) USART_IT_ERR :  specifies the interrupt source for the errors interrupt.
1190:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1191:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       -@@- Some parameters are coded in order to use them as interrupt source 
1192:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****           or as pending bits.
1193:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1194:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In this Mode it is advised to use the following functions:
1195:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) void USART_ITConfig(USART_TypeDef* USARTx, uint16_t USART_IT, FunctionalState NewState);
1196:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint16_t USART_IT);
1197:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT);
1198:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1199:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     *** DMA Mode ***
1200:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     ================
1201:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1202:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In DMA Mode, the USART communication can be managed by 2 DMA Channel requests:
1203:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_DMAReq_Tx: specifies the Tx buffer DMA transfer request
1204:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (#) USART_DMAReq_Rx: specifies the Rx buffer DMA transfer request
1205:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     [..]
1206:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     In this Mode it is advised to use the following function:
1207:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****       (+) void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState)
1208:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1209:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** @endverbatim
1210:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @{
1211:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1212:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1213:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1214:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Enables or disables the specified USART interrupts.
1215:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1216:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1217:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_IT: specifies the USART interrupt sources to be enabled or disabled.
1218:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be one of the following values:
1219:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_CTS:  CTS change interrupt
1220:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_LBD:  LIN Break detection interrupt
1221:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_TXE:  Transmit Data Register empty interrupt
1222:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_TC:   Transmission complete interrupt
1223:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_RXNE: Receive Data register not empty interrupt
1224:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_IDLE: Idle line detection interrupt
1225:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_PE:   Parity Error interrupt
1226:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_ERR:  Error interrupt(Frame error, noise error, overrun error)
1227:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  NewState: new state of the specified USARTx interrupts.
1228:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be: ENABLE or DISABLE.
1229:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
1230:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1231:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_ITConfig(USART_TypeDef* USARTx, uint16_t USART_IT, FunctionalState NewState)
1232:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1741              		.loc 1 1232 0
 1742              		.cfi_startproc
 1743              		@ args = 0, pretend = 0, frame = 24
 1744              		@ frame_needed = 1, uses_anonymous_args = 0
 1745 07e8 80B5     		push	{r7, lr}
 1746              		.cfi_def_cfa_offset 8
 1747              		.cfi_offset 7, -8
 1748              		.cfi_offset 14, -4
 1749 07ea 86B0     		sub	sp, sp, #24
 1750              		.cfi_def_cfa_offset 32
 1751 07ec 00AF     		add	r7, sp, #0
 1752              		.cfi_def_cfa_register 7
 1753 07ee 7860     		str	r0, [r7, #4]
 1754 07f0 0800     		movs	r0, r1
 1755 07f2 1100     		movs	r1, r2
 1756 07f4 BB1C     		adds	r3, r7, #2
 1757 07f6 021C     		adds	r2, r0, #0
 1758 07f8 1A80     		strh	r2, [r3]
 1759 07fa 7B1C     		adds	r3, r7, #1
 1760 07fc 0A1C     		adds	r2, r1, #0
 1761 07fe 1A70     		strb	r2, [r3]
1233:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint32_t usartreg = 0x00, itpos = 0x00, itmask = 0x00;
 1762              		.loc 1 1233 0
 1763 0800 0023     		movs	r3, #0
 1764 0802 3B61     		str	r3, [r7, #16]
 1765 0804 0023     		movs	r3, #0
 1766 0806 FB60     		str	r3, [r7, #12]
 1767 0808 0023     		movs	r3, #0
 1768 080a BB60     		str	r3, [r7, #8]
1234:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint32_t usartxbase = 0x00;
 1769              		.loc 1 1234 0
 1770 080c 0023     		movs	r3, #0
 1771 080e 7B61     		str	r3, [r7, #20]
1235:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1236:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1237:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_CONFIG_IT(USART_IT));
1238:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_FUNCTIONAL_STATE(NewState));
1239:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1240:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* The CTS interrupt is not available for UART4 and UART5 */
1241:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (USART_IT == USART_IT_CTS)
1242:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1243:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     assert_param(IS_USART_1236_PERIPH(USARTx));
1244:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   } 
1245:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1246:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   usartxbase = (uint32_t)USARTx;
 1772              		.loc 1 1246 0
 1773 0810 7B68     		ldr	r3, [r7, #4]
 1774 0812 7B61     		str	r3, [r7, #20]
1247:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1248:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Get the USART register index */
1249:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   usartreg = (((uint8_t)USART_IT) >> 0x05);
 1775              		.loc 1 1249 0
 1776 0814 BB1C     		adds	r3, r7, #2
 1777 0816 1B88     		ldrh	r3, [r3]
 1778 0818 DBB2     		uxtb	r3, r3
 1779 081a 5B09     		lsrs	r3, r3, #5
 1780 081c DBB2     		uxtb	r3, r3
 1781 081e 3B61     		str	r3, [r7, #16]
1250:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1251:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Get the interrupt position */
1252:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   itpos = USART_IT & IT_MASK;
 1782              		.loc 1 1252 0
 1783 0820 BB1C     		adds	r3, r7, #2
 1784 0822 1B88     		ldrh	r3, [r3]
 1785 0824 1F22     		movs	r2, #31
 1786 0826 1340     		ands	r3, r2
 1787 0828 FB60     		str	r3, [r7, #12]
1253:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   itmask = (((uint32_t)0x01) << itpos);
 1788              		.loc 1 1253 0
 1789 082a 0122     		movs	r2, #1
 1790 082c FB68     		ldr	r3, [r7, #12]
 1791 082e 9A40     		lsls	r2, r2, r3
 1792 0830 1300     		movs	r3, r2
 1793 0832 BB60     		str	r3, [r7, #8]
1254:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1255:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (usartreg == 0x01) /* The IT is in CR1 register */
 1794              		.loc 1 1255 0
 1795 0834 3B69     		ldr	r3, [r7, #16]
 1796 0836 012B     		cmp	r3, #1
 1797 0838 03D1     		bne	.L89
1256:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1257:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     usartxbase += 0x0C;
 1798              		.loc 1 1257 0
 1799 083a 7B69     		ldr	r3, [r7, #20]
 1800 083c 0C33     		adds	r3, r3, #12
 1801 083e 7B61     		str	r3, [r7, #20]
 1802 0840 09E0     		b	.L90
 1803              	.L89:
1258:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1259:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (usartreg == 0x02) /* The IT is in CR2 register */
 1804              		.loc 1 1259 0
 1805 0842 3B69     		ldr	r3, [r7, #16]
 1806 0844 022B     		cmp	r3, #2
 1807 0846 03D1     		bne	.L91
1260:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1261:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     usartxbase += 0x10;
 1808              		.loc 1 1261 0
 1809 0848 7B69     		ldr	r3, [r7, #20]
 1810 084a 1033     		adds	r3, r3, #16
 1811 084c 7B61     		str	r3, [r7, #20]
 1812 084e 02E0     		b	.L90
 1813              	.L91:
1262:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1263:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else /* The IT is in CR3 register */
1264:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1265:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     usartxbase += 0x14; 
 1814              		.loc 1 1265 0
 1815 0850 7B69     		ldr	r3, [r7, #20]
 1816 0852 1433     		adds	r3, r3, #20
 1817 0854 7B61     		str	r3, [r7, #20]
 1818              	.L90:
1266:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1267:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (NewState != DISABLE)
 1819              		.loc 1 1267 0
 1820 0856 7B1C     		adds	r3, r7, #1
 1821 0858 1B78     		ldrb	r3, [r3]
 1822 085a 002B     		cmp	r3, #0
 1823 085c 06D0     		beq	.L92
1268:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1269:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     *(__IO uint32_t*)usartxbase  |= itmask;
 1824              		.loc 1 1269 0
 1825 085e 7B69     		ldr	r3, [r7, #20]
 1826 0860 1968     		ldr	r1, [r3]
 1827 0862 7B69     		ldr	r3, [r7, #20]
 1828 0864 BA68     		ldr	r2, [r7, #8]
 1829 0866 0A43     		orrs	r2, r1
 1830 0868 1A60     		str	r2, [r3]
1270:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1271:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
1272:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1273:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     *(__IO uint32_t*)usartxbase &= ~itmask;
1274:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1275:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1831              		.loc 1 1275 0
 1832 086a 06E0     		b	.L94
 1833              	.L92:
1273:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
 1834              		.loc 1 1273 0
 1835 086c 7B69     		ldr	r3, [r7, #20]
 1836 086e 1A68     		ldr	r2, [r3]
 1837 0870 BB68     		ldr	r3, [r7, #8]
 1838 0872 D943     		mvns	r1, r3
 1839 0874 7B69     		ldr	r3, [r7, #20]
 1840 0876 0A40     		ands	r2, r1
 1841 0878 1A60     		str	r2, [r3]
 1842              	.L94:
 1843              		.loc 1 1275 0
 1844 087a C046     		nop
 1845 087c BD46     		mov	sp, r7
 1846 087e 06B0     		add	sp, sp, #24
 1847              		@ sp needed
 1848 0880 80BD     		pop	{r7, pc}
 1849              		.cfi_endproc
 1850              	.LFE147:
 1852              		.align	1
 1853              		.global	USART_GetFlagStatus
 1854              		.syntax unified
 1855              		.code	16
 1856              		.thumb_func
 1857              		.fpu softvfp
 1859              	USART_GetFlagStatus:
 1860              	.LFB148:
1276:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1277:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1278:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Checks whether the specified USART flag is set or not.
1279:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1280:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1281:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_FLAG: specifies the flag to check.
1282:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be one of the following values:
1283:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_CTS:  CTS Change flag (not available for UART4 and UART5)
1284:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_LBD:  LIN Break detection flag
1285:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_TXE:  Transmit data register empty flag
1286:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_TC:   Transmission Complete flag
1287:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_RXNE: Receive data register not empty flag
1288:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_IDLE: Idle Line detection flag
1289:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_ORE:  OverRun Error flag
1290:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_NE:   Noise Error flag
1291:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_FE:   Framing Error flag
1292:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_PE:   Parity Error flag
1293:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval The new state of USART_FLAG (SET or RESET).
1294:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1295:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, uint16_t USART_FLAG)
1296:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1861              		.loc 1 1296 0
 1862              		.cfi_startproc
 1863              		@ args = 0, pretend = 0, frame = 16
 1864              		@ frame_needed = 1, uses_anonymous_args = 0
 1865 0882 80B5     		push	{r7, lr}
 1866              		.cfi_def_cfa_offset 8
 1867              		.cfi_offset 7, -8
 1868              		.cfi_offset 14, -4
 1869 0884 84B0     		sub	sp, sp, #16
 1870              		.cfi_def_cfa_offset 24
 1871 0886 00AF     		add	r7, sp, #0
 1872              		.cfi_def_cfa_register 7
 1873 0888 7860     		str	r0, [r7, #4]
 1874 088a 0A00     		movs	r2, r1
 1875 088c BB1C     		adds	r3, r7, #2
 1876 088e 1A80     		strh	r2, [r3]
1297:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   FlagStatus bitstatus = RESET;
 1877              		.loc 1 1297 0
 1878 0890 0F23     		movs	r3, #15
 1879 0892 FB18     		adds	r3, r7, r3
 1880 0894 0022     		movs	r2, #0
 1881 0896 1A70     		strb	r2, [r3]
1298:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1299:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1300:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_FLAG(USART_FLAG));
1301:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1302:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* The CTS flag is not available for UART4 and UART5 */
1303:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (USART_FLAG == USART_FLAG_CTS)
1304:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1305:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     assert_param(IS_USART_1236_PERIPH(USARTx));
1306:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   } 
1307:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1308:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if ((USARTx->SR & USART_FLAG) != (uint16_t)RESET)
 1882              		.loc 1 1308 0
 1883 0898 7B68     		ldr	r3, [r7, #4]
 1884 089a 1B88     		ldrh	r3, [r3]
 1885 089c 9BB2     		uxth	r3, r3
 1886 089e BA1C     		adds	r2, r7, #2
 1887 08a0 1288     		ldrh	r2, [r2]
 1888 08a2 1340     		ands	r3, r2
 1889 08a4 9BB2     		uxth	r3, r3
 1890 08a6 002B     		cmp	r3, #0
 1891 08a8 04D0     		beq	.L96
1309:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1310:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     bitstatus = SET;
 1892              		.loc 1 1310 0
 1893 08aa 0F23     		movs	r3, #15
 1894 08ac FB18     		adds	r3, r7, r3
 1895 08ae 0122     		movs	r2, #1
 1896 08b0 1A70     		strb	r2, [r3]
 1897 08b2 03E0     		b	.L97
 1898              	.L96:
1311:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1312:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
1313:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1314:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     bitstatus = RESET;
 1899              		.loc 1 1314 0
 1900 08b4 0F23     		movs	r3, #15
 1901 08b6 FB18     		adds	r3, r7, r3
 1902 08b8 0022     		movs	r2, #0
 1903 08ba 1A70     		strb	r2, [r3]
 1904              	.L97:
1315:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1316:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   return bitstatus;
 1905              		.loc 1 1316 0
 1906 08bc 0F23     		movs	r3, #15
 1907 08be FB18     		adds	r3, r7, r3
 1908 08c0 1B78     		ldrb	r3, [r3]
1317:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1909              		.loc 1 1317 0
 1910 08c2 1800     		movs	r0, r3
 1911 08c4 BD46     		mov	sp, r7
 1912 08c6 04B0     		add	sp, sp, #16
 1913              		@ sp needed
 1914 08c8 80BD     		pop	{r7, pc}
 1915              		.cfi_endproc
 1916              	.LFE148:
 1918              		.align	1
 1919              		.global	USART_ClearFlag
 1920              		.syntax unified
 1921              		.code	16
 1922              		.thumb_func
 1923              		.fpu softvfp
 1925              	USART_ClearFlag:
 1926              	.LFB149:
1318:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1319:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1320:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Clears the USARTx's pending flags.
1321:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1322:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1323:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_FLAG: specifies the flag to clear.
1324:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be any combination of the following values:
1325:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_CTS:  CTS Change flag (not available for UART4 and UART5).
1326:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_LBD:  LIN Break detection flag.
1327:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_TC:   Transmission Complete flag.
1328:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_FLAG_RXNE: Receive data register not empty flag.
1329:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *   
1330:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   PE (Parity error), FE (Framing error), NE (Noise error), ORE (OverRun 
1331:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          error) and IDLE (Idle line detected) flags are cleared by software 
1332:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          sequence: a read operation to USART_SR register (USART_GetFlagStatus()) 
1333:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          followed by a read operation to USART_DR register (USART_ReceiveData()).
1334:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   RXNE flag can be also cleared by a read to the USART_DR register 
1335:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          (USART_ReceiveData()).
1336:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   TC flag can be also cleared by software sequence: a read operation to 
1337:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          USART_SR register (USART_GetFlagStatus()) followed by a write operation
1338:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          to USART_DR register (USART_SendData()).
1339:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   TXE flag is cleared only by a write to the USART_DR register 
1340:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          (USART_SendData()).
1341:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *   
1342:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
1343:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1344:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_ClearFlag(USART_TypeDef* USARTx, uint16_t USART_FLAG)
1345:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1927              		.loc 1 1345 0
 1928              		.cfi_startproc
 1929              		@ args = 0, pretend = 0, frame = 8
 1930              		@ frame_needed = 1, uses_anonymous_args = 0
 1931 08ca 80B5     		push	{r7, lr}
 1932              		.cfi_def_cfa_offset 8
 1933              		.cfi_offset 7, -8
 1934              		.cfi_offset 14, -4
 1935 08cc 82B0     		sub	sp, sp, #8
 1936              		.cfi_def_cfa_offset 16
 1937 08ce 00AF     		add	r7, sp, #0
 1938              		.cfi_def_cfa_register 7
 1939 08d0 7860     		str	r0, [r7, #4]
 1940 08d2 0A00     		movs	r2, r1
 1941 08d4 BB1C     		adds	r3, r7, #2
 1942 08d6 1A80     		strh	r2, [r3]
1346:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1347:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1348:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
1349:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1350:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* The CTS flag is not available for UART4 and UART5 */
1351:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if ((USART_FLAG & USART_FLAG_CTS) == USART_FLAG_CTS)
1352:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1353:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     assert_param(IS_USART_1236_PERIPH(USARTx));
1354:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   } 
1355:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****        
1356:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->SR = (uint16_t)~USART_FLAG;
 1943              		.loc 1 1356 0
 1944 08d8 BB1C     		adds	r3, r7, #2
 1945 08da 1B88     		ldrh	r3, [r3]
 1946 08dc DB43     		mvns	r3, r3
 1947 08de 9AB2     		uxth	r2, r3
 1948 08e0 7B68     		ldr	r3, [r7, #4]
 1949 08e2 1A80     		strh	r2, [r3]
1357:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 1950              		.loc 1 1357 0
 1951 08e4 C046     		nop
 1952 08e6 BD46     		mov	sp, r7
 1953 08e8 02B0     		add	sp, sp, #8
 1954              		@ sp needed
 1955 08ea 80BD     		pop	{r7, pc}
 1956              		.cfi_endproc
 1957              	.LFE149:
 1959              		.align	1
 1960              		.global	USART_GetITStatus
 1961              		.syntax unified
 1962              		.code	16
 1963              		.thumb_func
 1964              		.fpu softvfp
 1966              	USART_GetITStatus:
 1967              	.LFB150:
1358:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1359:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1360:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Checks whether the specified USART interrupt has occurred or not.
1361:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1362:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1363:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_IT: specifies the USART interrupt source to check.
1364:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be one of the following values:
1365:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_CTS:  CTS change interrupt (not available for UART4 and UART5)
1366:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_LBD:  LIN Break detection interrupt
1367:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_TXE:  Transmit Data Register empty interrupt
1368:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_TC:   Transmission complete interrupt
1369:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_RXNE: Receive Data register not empty interrupt
1370:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_IDLE: Idle line detection interrupt
1371:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_ORE_RX : OverRun Error interrupt if the RXNEIE bit is set
1372:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_ORE_ER : OverRun Error interrupt if the EIE bit is set  
1373:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_NE:   Noise Error interrupt
1374:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_FE:   Framing Error interrupt
1375:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_PE:   Parity Error interrupt
1376:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval The new state of USART_IT (SET or RESET).
1377:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1378:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** ITStatus USART_GetITStatus(USART_TypeDef* USARTx, uint16_t USART_IT)
1379:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 1968              		.loc 1 1379 0
 1969              		.cfi_startproc
 1970              		@ args = 0, pretend = 0, frame = 24
 1971              		@ frame_needed = 1, uses_anonymous_args = 0
 1972 08ec 80B5     		push	{r7, lr}
 1973              		.cfi_def_cfa_offset 8
 1974              		.cfi_offset 7, -8
 1975              		.cfi_offset 14, -4
 1976 08ee 86B0     		sub	sp, sp, #24
 1977              		.cfi_def_cfa_offset 32
 1978 08f0 00AF     		add	r7, sp, #0
 1979              		.cfi_def_cfa_register 7
 1980 08f2 7860     		str	r0, [r7, #4]
 1981 08f4 0A00     		movs	r2, r1
 1982 08f6 BB1C     		adds	r3, r7, #2
 1983 08f8 1A80     		strh	r2, [r3]
1380:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint32_t bitpos = 0x00, itmask = 0x00, usartreg = 0x00;
 1984              		.loc 1 1380 0
 1985 08fa 0023     		movs	r3, #0
 1986 08fc FB60     		str	r3, [r7, #12]
 1987 08fe 0023     		movs	r3, #0
 1988 0900 7B61     		str	r3, [r7, #20]
 1989 0902 0023     		movs	r3, #0
 1990 0904 BB60     		str	r3, [r7, #8]
1381:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   ITStatus bitstatus = RESET;
 1991              		.loc 1 1381 0
 1992 0906 1323     		movs	r3, #19
 1993 0908 FB18     		adds	r3, r7, r3
 1994 090a 0022     		movs	r2, #0
 1995 090c 1A70     		strb	r2, [r3]
1382:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1383:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1384:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_GET_IT(USART_IT)); 
1385:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1386:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* The CTS interrupt is not available for UART4 and UART5 */ 
1387:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (USART_IT == USART_IT_CTS)
1388:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1389:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     assert_param(IS_USART_1236_PERIPH(USARTx));
1390:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   } 
1391:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1392:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Get the USART register index */
1393:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   usartreg = (((uint8_t)USART_IT) >> 0x05);
 1996              		.loc 1 1393 0
 1997 090e BB1C     		adds	r3, r7, #2
 1998 0910 1B88     		ldrh	r3, [r3]
 1999 0912 DBB2     		uxtb	r3, r3
 2000 0914 5B09     		lsrs	r3, r3, #5
 2001 0916 DBB2     		uxtb	r3, r3
 2002 0918 BB60     		str	r3, [r7, #8]
1394:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Get the interrupt position */
1395:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   itmask = USART_IT & IT_MASK;
 2003              		.loc 1 1395 0
 2004 091a BB1C     		adds	r3, r7, #2
 2005 091c 1B88     		ldrh	r3, [r3]
 2006 091e 1F22     		movs	r2, #31
 2007 0920 1340     		ands	r3, r2
 2008 0922 7B61     		str	r3, [r7, #20]
1396:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   itmask = (uint32_t)0x01 << itmask;
 2009              		.loc 1 1396 0
 2010 0924 0122     		movs	r2, #1
 2011 0926 7B69     		ldr	r3, [r7, #20]
 2012 0928 9A40     		lsls	r2, r2, r3
 2013 092a 1300     		movs	r3, r2
 2014 092c 7B61     		str	r3, [r7, #20]
1397:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
1398:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (usartreg == 0x01) /* The IT  is in CR1 register */
 2015              		.loc 1 1398 0
 2016 092e BB68     		ldr	r3, [r7, #8]
 2017 0930 012B     		cmp	r3, #1
 2018 0932 07D1     		bne	.L101
1399:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1400:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     itmask &= USARTx->CR1;
 2019              		.loc 1 1400 0
 2020 0934 7B68     		ldr	r3, [r7, #4]
 2021 0936 9B89     		ldrh	r3, [r3, #12]
 2022 0938 9BB2     		uxth	r3, r3
 2023 093a 1A00     		movs	r2, r3
 2024 093c 7B69     		ldr	r3, [r7, #20]
 2025 093e 1340     		ands	r3, r2
 2026 0940 7B61     		str	r3, [r7, #20]
 2027 0942 11E0     		b	.L102
 2028              	.L101:
1401:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1402:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else if (usartreg == 0x02) /* The IT  is in CR2 register */
 2029              		.loc 1 1402 0
 2030 0944 BB68     		ldr	r3, [r7, #8]
 2031 0946 022B     		cmp	r3, #2
 2032 0948 07D1     		bne	.L103
1403:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1404:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     itmask &= USARTx->CR2;
 2033              		.loc 1 1404 0
 2034 094a 7B68     		ldr	r3, [r7, #4]
 2035 094c 1B8A     		ldrh	r3, [r3, #16]
 2036 094e 9BB2     		uxth	r3, r3
 2037 0950 1A00     		movs	r2, r3
 2038 0952 7B69     		ldr	r3, [r7, #20]
 2039 0954 1340     		ands	r3, r2
 2040 0956 7B61     		str	r3, [r7, #20]
 2041 0958 06E0     		b	.L102
 2042              	.L103:
1405:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1406:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else /* The IT  is in CR3 register */
1407:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1408:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     itmask &= USARTx->CR3;
 2043              		.loc 1 1408 0
 2044 095a 7B68     		ldr	r3, [r7, #4]
 2045 095c 9B8A     		ldrh	r3, [r3, #20]
 2046 095e 9BB2     		uxth	r3, r3
 2047 0960 1A00     		movs	r2, r3
 2048 0962 7B69     		ldr	r3, [r7, #20]
 2049 0964 1340     		ands	r3, r2
 2050 0966 7B61     		str	r3, [r7, #20]
 2051              	.L102:
1409:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1410:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
1411:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   bitpos = USART_IT >> 0x08;
 2052              		.loc 1 1411 0
 2053 0968 BB1C     		adds	r3, r7, #2
 2054 096a 1B88     		ldrh	r3, [r3]
 2055 096c 1B0A     		lsrs	r3, r3, #8
 2056 096e 9BB2     		uxth	r3, r3
 2057 0970 FB60     		str	r3, [r7, #12]
1412:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   bitpos = (uint32_t)0x01 << bitpos;
 2058              		.loc 1 1412 0
 2059 0972 0122     		movs	r2, #1
 2060 0974 FB68     		ldr	r3, [r7, #12]
 2061 0976 9A40     		lsls	r2, r2, r3
 2062 0978 1300     		movs	r3, r2
 2063 097a FB60     		str	r3, [r7, #12]
1413:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   bitpos &= USARTx->SR;
 2064              		.loc 1 1413 0
 2065 097c 7B68     		ldr	r3, [r7, #4]
 2066 097e 1B88     		ldrh	r3, [r3]
 2067 0980 9BB2     		uxth	r3, r3
 2068 0982 1A00     		movs	r2, r3
 2069 0984 FB68     		ldr	r3, [r7, #12]
 2070 0986 1340     		ands	r3, r2
 2071 0988 FB60     		str	r3, [r7, #12]
1414:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if ((itmask != (uint16_t)RESET)&&(bitpos != (uint16_t)RESET))
 2072              		.loc 1 1414 0
 2073 098a 7B69     		ldr	r3, [r7, #20]
 2074 098c 002B     		cmp	r3, #0
 2075 098e 07D0     		beq	.L104
 2076              		.loc 1 1414 0 is_stmt 0 discriminator 1
 2077 0990 FB68     		ldr	r3, [r7, #12]
 2078 0992 002B     		cmp	r3, #0
 2079 0994 04D0     		beq	.L104
1415:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1416:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     bitstatus = SET;
 2080              		.loc 1 1416 0 is_stmt 1
 2081 0996 1323     		movs	r3, #19
 2082 0998 FB18     		adds	r3, r7, r3
 2083 099a 0122     		movs	r2, #1
 2084 099c 1A70     		strb	r2, [r3]
 2085 099e 03E0     		b	.L105
 2086              	.L104:
1417:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1418:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   else
1419:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1420:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     bitstatus = RESET;
 2087              		.loc 1 1420 0
 2088 09a0 1323     		movs	r3, #19
 2089 09a2 FB18     		adds	r3, r7, r3
 2090 09a4 0022     		movs	r2, #0
 2091 09a6 1A70     		strb	r2, [r3]
 2092              	.L105:
1421:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   }
1422:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   
1423:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   return bitstatus;  
 2093              		.loc 1 1423 0
 2094 09a8 1323     		movs	r3, #19
 2095 09aa FB18     		adds	r3, r7, r3
 2096 09ac 1B78     		ldrb	r3, [r3]
1424:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 2097              		.loc 1 1424 0
 2098 09ae 1800     		movs	r0, r3
 2099 09b0 BD46     		mov	sp, r7
 2100 09b2 06B0     		add	sp, sp, #24
 2101              		@ sp needed
 2102 09b4 80BD     		pop	{r7, pc}
 2103              		.cfi_endproc
 2104              	.LFE150:
 2106              		.align	1
 2107              		.global	USART_ClearITPendingBit
 2108              		.syntax unified
 2109              		.code	16
 2110              		.thumb_func
 2111              		.fpu softvfp
 2113              	USART_ClearITPendingBit:
 2114              	.LFB151:
1425:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1426:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** /**
1427:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @brief  Clears the USARTx's interrupt pending bits.
1428:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USARTx: where x can be 1, 2, 3, 4, 5, 6, 7 or 8 to select the USART or 
1429:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *         UART peripheral.
1430:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @param  USART_IT: specifies the interrupt pending bit to clear.
1431:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          This parameter can be one of the following values:
1432:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_CTS:  CTS change interrupt (not available for UART4 and UART5)
1433:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_LBD:  LIN Break detection interrupt
1434:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_TC:   Transmission complete interrupt. 
1435:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *            @arg USART_IT_RXNE: Receive Data register not empty interrupt.
1436:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *
1437:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   PE (Parity error), FE (Framing error), NE (Noise error), ORE (OverRun 
1438:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          error) and IDLE (Idle line detected) pending bits are cleared by 
1439:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          software sequence: a read operation to USART_SR register 
1440:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          (USART_GetITStatus()) followed by a read operation to USART_DR register 
1441:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          (USART_ReceiveData()).
1442:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   RXNE pending bit can be also cleared by a read to the USART_DR register 
1443:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          (USART_ReceiveData()).
1444:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   TC pending bit can be also cleared by software sequence: a read 
1445:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          operation to USART_SR register (USART_GetITStatus()) followed by a write 
1446:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          operation to USART_DR register (USART_SendData()).
1447:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @note   TXE pending bit is cleared only by a write to the USART_DR register 
1448:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *          (USART_SendData()).
1449:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   *  
1450:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   * @retval None
1451:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   */
1452:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** void USART_ClearITPendingBit(USART_TypeDef* USARTx, uint16_t USART_IT)
1453:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** {
 2115              		.loc 1 1453 0
 2116              		.cfi_startproc
 2117              		@ args = 0, pretend = 0, frame = 16
 2118              		@ frame_needed = 1, uses_anonymous_args = 0
 2119 09b6 80B5     		push	{r7, lr}
 2120              		.cfi_def_cfa_offset 8
 2121              		.cfi_offset 7, -8
 2122              		.cfi_offset 14, -4
 2123 09b8 84B0     		sub	sp, sp, #16
 2124              		.cfi_def_cfa_offset 24
 2125 09ba 00AF     		add	r7, sp, #0
 2126              		.cfi_def_cfa_register 7
 2127 09bc 7860     		str	r0, [r7, #4]
 2128 09be 0A00     		movs	r2, r1
 2129 09c0 BB1C     		adds	r3, r7, #2
 2130 09c2 1A80     		strh	r2, [r3]
1454:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   uint16_t bitpos = 0x00, itmask = 0x00;
 2131              		.loc 1 1454 0
 2132 09c4 0E21     		movs	r1, #14
 2133 09c6 7B18     		adds	r3, r7, r1
 2134 09c8 0022     		movs	r2, #0
 2135 09ca 1A80     		strh	r2, [r3]
 2136 09cc 0C20     		movs	r0, #12
 2137 09ce 3B18     		adds	r3, r7, r0
 2138 09d0 0022     		movs	r2, #0
 2139 09d2 1A80     		strh	r2, [r3]
1455:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* Check the parameters */
1456:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_ALL_PERIPH(USARTx));
1457:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   assert_param(IS_USART_CLEAR_IT(USART_IT)); 
1458:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** 
1459:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   /* The CTS interrupt is not available for UART4 and UART5 */
1460:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   if (USART_IT == USART_IT_CTS)
1461:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   {
1462:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     assert_param(IS_USART_1236_PERIPH(USARTx));
1463:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   } 
1464:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****     
1465:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   bitpos = USART_IT >> 0x08;
 2140              		.loc 1 1465 0
 2141 09d4 7B18     		adds	r3, r7, r1
 2142 09d6 BA1C     		adds	r2, r7, #2
 2143 09d8 1288     		ldrh	r2, [r2]
 2144 09da 120A     		lsrs	r2, r2, #8
 2145 09dc 1A80     		strh	r2, [r3]
1466:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   itmask = ((uint16_t)0x01 << (uint16_t)bitpos);
 2146              		.loc 1 1466 0
 2147 09de 7B18     		adds	r3, r7, r1
 2148 09e0 1B88     		ldrh	r3, [r3]
 2149 09e2 0122     		movs	r2, #1
 2150 09e4 9A40     		lsls	r2, r2, r3
 2151 09e6 3B18     		adds	r3, r7, r0
 2152 09e8 1A80     		strh	r2, [r3]
1467:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c ****   USARTx->SR = (uint16_t)~itmask;
 2153              		.loc 1 1467 0
 2154 09ea 3B18     		adds	r3, r7, r0
 2155 09ec 1B88     		ldrh	r3, [r3]
 2156 09ee DB43     		mvns	r3, r3
 2157 09f0 9AB2     		uxth	r2, r3
 2158 09f2 7B68     		ldr	r3, [r7, #4]
 2159 09f4 1A80     		strh	r2, [r3]
1468:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_usart.c **** }
 2160              		.loc 1 1468 0
 2161 09f6 C046     		nop
 2162 09f8 BD46     		mov	sp, r7
 2163 09fa 04B0     		add	sp, sp, #16
 2164              		@ sp needed
 2165 09fc 80BD     		pop	{r7, pc}
 2166              		.cfi_endproc
 2167              	.LFE151:
 2169              	.Letext0:
 2170              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 2171              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 2172              		.file 4 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
 2173              		.file 5 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 2174              		.file 6 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 2175              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_usart.h"
 2176              		.file 8 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_rcc.h"
