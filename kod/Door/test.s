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
  11              		.file	"stm32f4xx_gpio.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	GPIO_DeInit
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	GPIO_DeInit:
  23              	.LFB123:
  24              		.file 1 "C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_S
   1:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
   2:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   ******************************************************************************
   3:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @file    stm32f4xx_gpio.c
   4:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @author  MCD Application Team
   5:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @version V1.8.0
   6:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @date    04-November-2016
   7:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief   This file provides firmware functions to manage the following 
   8:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          functionalities of the GPIO peripheral:           
   9:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *           + Initialization and Configuration
  10:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *           + GPIO Read and Write
  11:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *           + GPIO Alternate functions configuration
  12:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * 
  13:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @verbatim  
  14:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================
  15:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                       ##### How to use this driver #####
  16:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================       
  17:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  [..]             
  18:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) Enable the GPIO AHB clock using the following function
  19:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOx, ENABLE);
  20:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                
  21:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) Configure the GPIO pin(s) using GPIO_Init()
  22:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        Four possible configuration are available for each pin:
  23:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        (++) Input: Floating, Pull-up, Pull-down.
  24:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        (++) Output: Push-Pull (Pull-up, Pull-down or no Pull)
  25:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             Open Drain (Pull-up, Pull-down or no Pull). In output mode, the speed 
  26:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             is configurable: 2 MHz, 25 MHz, 50 MHz or 100 MHz.
  27:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        (++) Alternate Function: Push-Pull (Pull-up, Pull-down or no Pull) Open 
  28:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             Drain (Pull-up, Pull-down or no Pull).
  29:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        (++) Analog: required mode when a pin is to be used as ADC channel or DAC 
  30:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             output.
  31:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    
  32:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) Peripherals alternate function:
  33:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        (++) For ADC and DAC, configure the desired pin in analog mode using 
  34:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             GPIO_InitStruct->GPIO_Mode = GPIO_Mode_AN;
  35:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             (+++) For other peripherals (TIM, USART...):
  36:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             (+++) Connect the pin to the desired peripherals' Alternate 
  37:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                      Function (AF) using GPIO_PinAFConfig() function
  38:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             (+++) Configure the desired pin in alternate function mode using
  39:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                      GPIO_InitStruct->GPIO_Mode = GPIO_Mode_AF
  40:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             (+++) Select the type, pull-up/pull-down and output speed via 
  41:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                      GPIO_PuPd, GPIO_OType and GPIO_Speed members
  42:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             (+++) Call GPIO_Init() function
  43:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****           
  44:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) To get the level of a pin configured in input mode use GPIO_ReadInputDataBit()
  45:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****             
  46:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) To set/reset the level of a pin configured in output mode use 
  47:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        GPIO_SetBits()/GPIO_ResetBits()
  48:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                  
  49:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) During and just after reset, the alternate functions are not 
  50:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        active and the GPIO pins are configured in input floating mode (except JTAG
  51:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        pins).
  52:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   
  53:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) The LSE oscillator pins OSC32_IN and OSC32_OUT can be used as general purpose 
  54:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        (PC14 and PC15, respectively) when the LSE oscillator is off. The LSE has 
  55:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        priority over the GPIO function.
  56:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   
  57:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****    (#) The HSE oscillator pins OSC_IN/OSC_OUT can be used as 
  58:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        general purpose PH0 and PH1, respectively, when the HSE oscillator is off. 
  59:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****        The HSE has priority over the GPIO function.
  60:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                
  61:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @endverbatim        
  62:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *
  63:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   ******************************************************************************
  64:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @attention
  65:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *
  66:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * <h2><center>&copy; COPYRIGHT 2016 STMicroelectronics</center></h2>
  67:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *
  68:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  69:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * You may not use this file except in compliance with the License.
  70:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * You may obtain a copy of the License at:
  71:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *
  72:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *        http://www.st.com/software_license_agreement_liberty_v2
  73:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *
  74:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * Unless required by applicable law or agreed to in writing, software 
  75:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * distributed under the License is distributed on an "AS IS" BASIS, 
  76:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  77:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * See the License for the specific language governing permissions and
  78:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * limitations under the License.
  79:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *
  80:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   ******************************************************************************
  81:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
  82:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
  83:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /* Includes ------------------------------------------------------------------*/
  84:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** #include "stm32f4xx_gpio.h"
  85:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** #include "stm32f4xx_rcc.h"
  86:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
  87:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /** @addtogroup STM32F4xx_StdPeriph_Driver
  88:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @{
  89:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
  90:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
  91:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /** @defgroup GPIO 
  92:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief GPIO driver modules
  93:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @{
  94:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */ 
  95:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
  96:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /* Private typedef -----------------------------------------------------------*/
  97:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /* Private define ------------------------------------------------------------*/
  98:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /* Private macro -------------------------------------------------------------*/
  99:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /* Private variables ---------------------------------------------------------*/
 100:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /* Private function prototypes -----------------------------------------------*/
 101:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /* Private functions ---------------------------------------------------------*/
 102:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 103:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /** @defgroup GPIO_Private_Functions
 104:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @{
 105:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */ 
 106:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 107:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /** @defgroup GPIO_Group1 Initialization and Configuration
 108:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  *  @brief   Initialization and Configuration
 109:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  *
 110:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @verbatim   
 111:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================
 112:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                  ##### Initialization and Configuration #####
 113:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================  
 114:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 115:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @endverbatim
 116:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @{
 117:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 118:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 119:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 120:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  De-initializes the GPIOx peripheral registers to their default reset values.
 121:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @note   By default, The GPIO pins are configured in input floating mode (except JTAG pins).
 122:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 123:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 124:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 125:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 126:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 127:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 128:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
  25              		.loc 1 128 0
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
 129:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 130:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 131:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 132:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   if (GPIOx == GPIOA)
  38              		.loc 1 132 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 4E4A     		ldr	r2, .L14
  41 000c 9342     		cmp	r3, r2
  42 000e 08D1     		bne	.L2
 133:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 134:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOA, ENABLE);
  43              		.loc 1 134 0
  44 0010 0121     		movs	r1, #1
  45 0012 0120     		movs	r0, #1
  46 0014 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 135:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOA, DISABLE);
  47              		.loc 1 135 0
  48 0018 0021     		movs	r1, #0
  49 001a 0120     		movs	r0, #1
  50 001c FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 136:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 137:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOB)
 138:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 139:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOB, ENABLE);
 140:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOB, DISABLE);
 141:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 142:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOC)
 143:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 144:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOC, ENABLE);
 145:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOC, DISABLE);
 146:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 147:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOD)
 148:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 149:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOD, ENABLE);
 150:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOD, DISABLE);
 151:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 152:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOE)
 153:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 154:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOE, ENABLE);
 155:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOE, DISABLE);
 156:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 157:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOF)
 158:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 159:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOF, ENABLE);
 160:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOF, DISABLE);
 161:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 162:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOG)
 163:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 164:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOG, ENABLE);
 165:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOG, DISABLE);
 166:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 167:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOH)
 168:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 169:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOH, ENABLE);
 170:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOH, DISABLE);
 171:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 172:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 173:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOI)
 174:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 175:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOI, ENABLE);
 176:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOI, DISABLE);
 177:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 178:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else if (GPIOx == GPIOJ)
 179:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 180:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOJ, ENABLE);
 181:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOJ, DISABLE);
 182:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 183:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else
 184:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 185:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     if (GPIOx == GPIOK)
 186:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     {
 187:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOK, ENABLE);
 188:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOK, DISABLE);
 189:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     }
 190:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 191:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
  51              		.loc 1 191 0
  52 0020 8CE0     		b	.L13
  53              	.L2:
 137:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
  54              		.loc 1 137 0
  55 0022 7B68     		ldr	r3, [r7, #4]
  56 0024 484A     		ldr	r2, .L14+4
  57 0026 9342     		cmp	r3, r2
  58 0028 08D1     		bne	.L4
 139:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOB, DISABLE);
  59              		.loc 1 139 0
  60 002a 0121     		movs	r1, #1
  61 002c 0220     		movs	r0, #2
  62 002e FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 140:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
  63              		.loc 1 140 0
  64 0032 0021     		movs	r1, #0
  65 0034 0220     		movs	r0, #2
  66 0036 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
  67              		.loc 1 191 0
  68 003a 7FE0     		b	.L13
  69              	.L4:
 142:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
  70              		.loc 1 142 0
  71 003c 7B68     		ldr	r3, [r7, #4]
  72 003e 434A     		ldr	r2, .L14+8
  73 0040 9342     		cmp	r3, r2
  74 0042 08D1     		bne	.L5
 144:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOC, DISABLE);
  75              		.loc 1 144 0
  76 0044 0121     		movs	r1, #1
  77 0046 0420     		movs	r0, #4
  78 0048 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 145:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
  79              		.loc 1 145 0
  80 004c 0021     		movs	r1, #0
  81 004e 0420     		movs	r0, #4
  82 0050 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
  83              		.loc 1 191 0
  84 0054 72E0     		b	.L13
  85              	.L5:
 147:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
  86              		.loc 1 147 0
  87 0056 7B68     		ldr	r3, [r7, #4]
  88 0058 3D4A     		ldr	r2, .L14+12
  89 005a 9342     		cmp	r3, r2
  90 005c 08D1     		bne	.L6
 149:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOD, DISABLE);
  91              		.loc 1 149 0
  92 005e 0121     		movs	r1, #1
  93 0060 0820     		movs	r0, #8
  94 0062 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 150:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
  95              		.loc 1 150 0
  96 0066 0021     		movs	r1, #0
  97 0068 0820     		movs	r0, #8
  98 006a FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
  99              		.loc 1 191 0
 100 006e 65E0     		b	.L13
 101              	.L6:
 152:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 102              		.loc 1 152 0
 103 0070 7B68     		ldr	r3, [r7, #4]
 104 0072 384A     		ldr	r2, .L14+16
 105 0074 9342     		cmp	r3, r2
 106 0076 08D1     		bne	.L7
 154:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOE, DISABLE);
 107              		.loc 1 154 0
 108 0078 0121     		movs	r1, #1
 109 007a 1020     		movs	r0, #16
 110 007c FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 155:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 111              		.loc 1 155 0
 112 0080 0021     		movs	r1, #0
 113 0082 1020     		movs	r0, #16
 114 0084 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 115              		.loc 1 191 0
 116 0088 58E0     		b	.L13
 117              	.L7:
 157:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 118              		.loc 1 157 0
 119 008a 7B68     		ldr	r3, [r7, #4]
 120 008c 324A     		ldr	r2, .L14+20
 121 008e 9342     		cmp	r3, r2
 122 0090 08D1     		bne	.L8
 159:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOF, DISABLE);
 123              		.loc 1 159 0
 124 0092 0121     		movs	r1, #1
 125 0094 2020     		movs	r0, #32
 126 0096 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 160:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 127              		.loc 1 160 0
 128 009a 0021     		movs	r1, #0
 129 009c 2020     		movs	r0, #32
 130 009e FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 131              		.loc 1 191 0
 132 00a2 4BE0     		b	.L13
 133              	.L8:
 162:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 134              		.loc 1 162 0
 135 00a4 7B68     		ldr	r3, [r7, #4]
 136 00a6 2D4A     		ldr	r2, .L14+24
 137 00a8 9342     		cmp	r3, r2
 138 00aa 08D1     		bne	.L9
 164:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOG, DISABLE);
 139              		.loc 1 164 0
 140 00ac 0121     		movs	r1, #1
 141 00ae 4020     		movs	r0, #64
 142 00b0 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 165:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 143              		.loc 1 165 0
 144 00b4 0021     		movs	r1, #0
 145 00b6 4020     		movs	r0, #64
 146 00b8 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 147              		.loc 1 191 0
 148 00bc 3EE0     		b	.L13
 149              	.L9:
 167:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 150              		.loc 1 167 0
 151 00be 7B68     		ldr	r3, [r7, #4]
 152 00c0 274A     		ldr	r2, .L14+28
 153 00c2 9342     		cmp	r3, r2
 154 00c4 08D1     		bne	.L10
 169:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOH, DISABLE);
 155              		.loc 1 169 0
 156 00c6 0121     		movs	r1, #1
 157 00c8 8020     		movs	r0, #128
 158 00ca FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 170:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 159              		.loc 1 170 0
 160 00ce 0021     		movs	r1, #0
 161 00d0 8020     		movs	r0, #128
 162 00d2 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 163              		.loc 1 191 0
 164 00d6 31E0     		b	.L13
 165              	.L10:
 173:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 166              		.loc 1 173 0
 167 00d8 7B68     		ldr	r3, [r7, #4]
 168 00da 224A     		ldr	r2, .L14+32
 169 00dc 9342     		cmp	r3, r2
 170 00de 0CD1     		bne	.L11
 175:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOI, DISABLE);
 171              		.loc 1 175 0
 172 00e0 8023     		movs	r3, #128
 173 00e2 5B00     		lsls	r3, r3, #1
 174 00e4 0121     		movs	r1, #1
 175 00e6 1800     		movs	r0, r3
 176 00e8 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 176:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 177              		.loc 1 176 0
 178 00ec 8023     		movs	r3, #128
 179 00ee 5B00     		lsls	r3, r3, #1
 180 00f0 0021     		movs	r1, #0
 181 00f2 1800     		movs	r0, r3
 182 00f4 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 183              		.loc 1 191 0
 184 00f8 20E0     		b	.L13
 185              	.L11:
 178:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 186              		.loc 1 178 0
 187 00fa 7B68     		ldr	r3, [r7, #4]
 188 00fc 1A4A     		ldr	r2, .L14+36
 189 00fe 9342     		cmp	r3, r2
 190 0100 0CD1     		bne	.L12
 180:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOJ, DISABLE);
 191              		.loc 1 180 0
 192 0102 8023     		movs	r3, #128
 193 0104 9B00     		lsls	r3, r3, #2
 194 0106 0121     		movs	r1, #1
 195 0108 1800     		movs	r0, r3
 196 010a FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 181:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 197              		.loc 1 181 0
 198 010e 8023     		movs	r3, #128
 199 0110 9B00     		lsls	r3, r3, #2
 200 0112 0021     		movs	r1, #0
 201 0114 1800     		movs	r0, r3
 202 0116 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 203              		.loc 1 191 0
 204 011a 0FE0     		b	.L13
 205              	.L12:
 185:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     {
 206              		.loc 1 185 0
 207 011c 7B68     		ldr	r3, [r7, #4]
 208 011e 134A     		ldr	r2, .L14+40
 209 0120 9342     		cmp	r3, r2
 210 0122 0BD1     		bne	.L13
 187:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_GPIOK, DISABLE);
 211              		.loc 1 187 0
 212 0124 8023     		movs	r3, #128
 213 0126 DB00     		lsls	r3, r3, #3
 214 0128 0121     		movs	r1, #1
 215 012a 1800     		movs	r0, r3
 216 012c FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 188:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     }
 217              		.loc 1 188 0
 218 0130 8023     		movs	r3, #128
 219 0132 DB00     		lsls	r3, r3, #3
 220 0134 0021     		movs	r1, #0
 221 0136 1800     		movs	r0, r3
 222 0138 FFF7FEFF 		bl	RCC_AHB1PeriphResetCmd
 223              	.L13:
 224              		.loc 1 191 0
 225 013c C046     		nop
 226 013e BD46     		mov	sp, r7
 227 0140 02B0     		add	sp, sp, #8
 228              		@ sp needed
 229 0142 80BD     		pop	{r7, pc}
 230              	.L15:
 231              		.align	2
 232              	.L14:
 233 0144 00000240 		.word	1073872896
 234 0148 00040240 		.word	1073873920
 235 014c 00080240 		.word	1073874944
 236 0150 000C0240 		.word	1073875968
 237 0154 00100240 		.word	1073876992
 238 0158 00140240 		.word	1073878016
 239 015c 00180240 		.word	1073879040
 240 0160 001C0240 		.word	1073880064
 241 0164 00200240 		.word	1073881088
 242 0168 00240240 		.word	1073882112
 243 016c 00280240 		.word	1073883136
 244              		.cfi_endproc
 245              	.LFE123:
 247              		.align	1
 248              		.global	GPIO_Init
 249              		.syntax unified
 250              		.code	16
 251              		.thumb_func
 252              		.fpu softvfp
 254              	GPIO_Init:
 255              	.LFB124:
 192:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 193:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 194:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Initializes the GPIOx peripheral according to the specified parameters in the GPIO_Init
 195:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 196:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 197:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 198:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_InitStruct: pointer to a GPIO_InitTypeDef structure that contains
 199:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         the configuration information for the specified GPIO peripheral.
 200:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 201:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 202:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_InitTypeDef* GPIO_InitStruct)
 203:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 256              		.loc 1 203 0
 257              		.cfi_startproc
 258              		@ args = 0, pretend = 0, frame = 24
 259              		@ frame_needed = 1, uses_anonymous_args = 0
 260 0170 80B5     		push	{r7, lr}
 261              		.cfi_def_cfa_offset 8
 262              		.cfi_offset 7, -8
 263              		.cfi_offset 14, -4
 264 0172 86B0     		sub	sp, sp, #24
 265              		.cfi_def_cfa_offset 32
 266 0174 00AF     		add	r7, sp, #0
 267              		.cfi_def_cfa_register 7
 268 0176 7860     		str	r0, [r7, #4]
 269 0178 3960     		str	r1, [r7]
 204:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   uint32_t pinpos = 0x00, pos = 0x00 , currentpin = 0x00;
 270              		.loc 1 204 0
 271 017a 0023     		movs	r3, #0
 272 017c 7B61     		str	r3, [r7, #20]
 273 017e 0023     		movs	r3, #0
 274 0180 3B61     		str	r3, [r7, #16]
 275 0182 0023     		movs	r3, #0
 276 0184 FB60     		str	r3, [r7, #12]
 205:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 206:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 207:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 208:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_PIN(GPIO_InitStruct->GPIO_Pin));
 209:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_MODE(GPIO_InitStruct->GPIO_Mode));
 210:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_PUPD(GPIO_InitStruct->GPIO_PuPd));
 211:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 212:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* ------------------------- Configure the port pins ---------------- */
 213:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /*-- GPIO Mode Configuration --*/
 214:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   for (pinpos = 0x00; pinpos < 0x10; pinpos++)
 277              		.loc 1 214 0
 278 0186 0023     		movs	r3, #0
 279 0188 7B61     		str	r3, [r7, #20]
 280 018a 76E0     		b	.L17
 281              	.L21:
 215:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 216:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     pos = ((uint32_t)0x01) << pinpos;
 282              		.loc 1 216 0
 283 018c 0122     		movs	r2, #1
 284 018e 7B69     		ldr	r3, [r7, #20]
 285 0190 9A40     		lsls	r2, r2, r3
 286 0192 1300     		movs	r3, r2
 287 0194 3B61     		str	r3, [r7, #16]
 217:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     /* Get the port pins position */
 218:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     currentpin = (GPIO_InitStruct->GPIO_Pin) & pos;
 288              		.loc 1 218 0
 289 0196 3B68     		ldr	r3, [r7]
 290 0198 1A68     		ldr	r2, [r3]
 291 019a 3B69     		ldr	r3, [r7, #16]
 292 019c 1340     		ands	r3, r2
 293 019e FB60     		str	r3, [r7, #12]
 219:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 220:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     if (currentpin == pos)
 294              		.loc 1 220 0
 295 01a0 FA68     		ldr	r2, [r7, #12]
 296 01a2 3B69     		ldr	r3, [r7, #16]
 297 01a4 9A42     		cmp	r2, r3
 298 01a6 65D1     		bne	.L18
 221:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     {
 222:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       GPIOx->MODER  &= ~(GPIO_MODER_MODER0 << (pinpos * 2));
 299              		.loc 1 222 0
 300 01a8 7B68     		ldr	r3, [r7, #4]
 301 01aa 1B68     		ldr	r3, [r3]
 302 01ac 7A69     		ldr	r2, [r7, #20]
 303 01ae 5200     		lsls	r2, r2, #1
 304 01b0 0321     		movs	r1, #3
 305 01b2 9140     		lsls	r1, r1, r2
 306 01b4 0A00     		movs	r2, r1
 307 01b6 D243     		mvns	r2, r2
 308 01b8 1A40     		ands	r2, r3
 309 01ba 7B68     		ldr	r3, [r7, #4]
 310 01bc 1A60     		str	r2, [r3]
 223:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       GPIOx->MODER |= (((uint32_t)GPIO_InitStruct->GPIO_Mode) << (pinpos * 2));
 311              		.loc 1 223 0
 312 01be 7B68     		ldr	r3, [r7, #4]
 313 01c0 1A68     		ldr	r2, [r3]
 314 01c2 3B68     		ldr	r3, [r7]
 315 01c4 1B79     		ldrb	r3, [r3, #4]
 316 01c6 1900     		movs	r1, r3
 317 01c8 7B69     		ldr	r3, [r7, #20]
 318 01ca 5B00     		lsls	r3, r3, #1
 319 01cc 9940     		lsls	r1, r1, r3
 320 01ce 0B00     		movs	r3, r1
 321 01d0 1A43     		orrs	r2, r3
 322 01d2 7B68     		ldr	r3, [r7, #4]
 323 01d4 1A60     		str	r2, [r3]
 224:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 225:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       if ((GPIO_InitStruct->GPIO_Mode == GPIO_Mode_OUT) || (GPIO_InitStruct->GPIO_Mode == GPIO_Mode
 324              		.loc 1 225 0
 325 01d6 3B68     		ldr	r3, [r7]
 326 01d8 1B79     		ldrb	r3, [r3, #4]
 327 01da 012B     		cmp	r3, #1
 328 01dc 03D0     		beq	.L19
 329              		.loc 1 225 0 is_stmt 0 discriminator 1
 330 01de 3B68     		ldr	r3, [r7]
 331 01e0 1B79     		ldrb	r3, [r3, #4]
 332 01e2 022B     		cmp	r3, #2
 333 01e4 2ED1     		bne	.L20
 334              	.L19:
 226:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       {
 227:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         /* Check Speed mode parameters */
 228:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         assert_param(IS_GPIO_SPEED(GPIO_InitStruct->GPIO_Speed));
 229:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 230:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         /* Speed mode configuration */
 231:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         GPIOx->OSPEEDR &= ~(GPIO_OSPEEDER_OSPEEDR0 << (pinpos * 2));
 335              		.loc 1 231 0 is_stmt 1
 336 01e6 7B68     		ldr	r3, [r7, #4]
 337 01e8 9B68     		ldr	r3, [r3, #8]
 338 01ea 7A69     		ldr	r2, [r7, #20]
 339 01ec 5200     		lsls	r2, r2, #1
 340 01ee 0321     		movs	r1, #3
 341 01f0 9140     		lsls	r1, r1, r2
 342 01f2 0A00     		movs	r2, r1
 343 01f4 D243     		mvns	r2, r2
 344 01f6 1A40     		ands	r2, r3
 345 01f8 7B68     		ldr	r3, [r7, #4]
 346 01fa 9A60     		str	r2, [r3, #8]
 232:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         GPIOx->OSPEEDR |= ((uint32_t)(GPIO_InitStruct->GPIO_Speed) << (pinpos * 2));
 347              		.loc 1 232 0
 348 01fc 7B68     		ldr	r3, [r7, #4]
 349 01fe 9A68     		ldr	r2, [r3, #8]
 350 0200 3B68     		ldr	r3, [r7]
 351 0202 5B79     		ldrb	r3, [r3, #5]
 352 0204 1900     		movs	r1, r3
 353 0206 7B69     		ldr	r3, [r7, #20]
 354 0208 5B00     		lsls	r3, r3, #1
 355 020a 9940     		lsls	r1, r1, r3
 356 020c 0B00     		movs	r3, r1
 357 020e 1A43     		orrs	r2, r3
 358 0210 7B68     		ldr	r3, [r7, #4]
 359 0212 9A60     		str	r2, [r3, #8]
 233:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 234:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         /* Check Output mode parameters */
 235:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         assert_param(IS_GPIO_OTYPE(GPIO_InitStruct->GPIO_OType));
 236:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 237:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         /* Output mode configuration*/
 238:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         GPIOx->OTYPER  &= ~((GPIO_OTYPER_OT_0) << ((uint16_t)pinpos)) ;
 360              		.loc 1 238 0
 361 0214 7B68     		ldr	r3, [r7, #4]
 362 0216 5B68     		ldr	r3, [r3, #4]
 363 0218 7A69     		ldr	r2, [r7, #20]
 364 021a 92B2     		uxth	r2, r2
 365 021c 1100     		movs	r1, r2
 366 021e 0122     		movs	r2, #1
 367 0220 8A40     		lsls	r2, r2, r1
 368 0222 D243     		mvns	r2, r2
 369 0224 1A40     		ands	r2, r3
 370 0226 7B68     		ldr	r3, [r7, #4]
 371 0228 5A60     		str	r2, [r3, #4]
 239:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****         GPIOx->OTYPER |= (uint16_t)(((uint16_t)GPIO_InitStruct->GPIO_OType) << ((uint16_t)pinpos));
 372              		.loc 1 239 0
 373 022a 7B68     		ldr	r3, [r7, #4]
 374 022c 5B68     		ldr	r3, [r3, #4]
 375 022e 3A68     		ldr	r2, [r7]
 376 0230 9279     		ldrb	r2, [r2, #6]
 377 0232 1100     		movs	r1, r2
 378 0234 7A69     		ldr	r2, [r7, #20]
 379 0236 92B2     		uxth	r2, r2
 380 0238 9140     		lsls	r1, r1, r2
 381 023a 0A00     		movs	r2, r1
 382 023c 92B2     		uxth	r2, r2
 383 023e 1A43     		orrs	r2, r3
 384 0240 7B68     		ldr	r3, [r7, #4]
 385 0242 5A60     		str	r2, [r3, #4]
 386              	.L20:
 240:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       }
 241:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 242:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       /* Pull-up Pull down resistor configuration*/
 243:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       GPIOx->PUPDR &= ~(GPIO_PUPDR_PUPDR0 << ((uint16_t)pinpos * 2));
 387              		.loc 1 243 0
 388 0244 7B68     		ldr	r3, [r7, #4]
 389 0246 DB68     		ldr	r3, [r3, #12]
 390 0248 7A69     		ldr	r2, [r7, #20]
 391 024a 92B2     		uxth	r2, r2
 392 024c 5200     		lsls	r2, r2, #1
 393 024e 0321     		movs	r1, #3
 394 0250 9140     		lsls	r1, r1, r2
 395 0252 0A00     		movs	r2, r1
 396 0254 D243     		mvns	r2, r2
 397 0256 1A40     		ands	r2, r3
 398 0258 7B68     		ldr	r3, [r7, #4]
 399 025a DA60     		str	r2, [r3, #12]
 244:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****       GPIOx->PUPDR |= (((uint32_t)GPIO_InitStruct->GPIO_PuPd) << (pinpos * 2));
 400              		.loc 1 244 0
 401 025c 7B68     		ldr	r3, [r7, #4]
 402 025e DA68     		ldr	r2, [r3, #12]
 403 0260 3B68     		ldr	r3, [r7]
 404 0262 DB79     		ldrb	r3, [r3, #7]
 405 0264 1900     		movs	r1, r3
 406 0266 7B69     		ldr	r3, [r7, #20]
 407 0268 5B00     		lsls	r3, r3, #1
 408 026a 9940     		lsls	r1, r1, r3
 409 026c 0B00     		movs	r3, r1
 410 026e 1A43     		orrs	r2, r3
 411 0270 7B68     		ldr	r3, [r7, #4]
 412 0272 DA60     		str	r2, [r3, #12]
 413              	.L18:
 214:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 414              		.loc 1 214 0 discriminator 2
 415 0274 7B69     		ldr	r3, [r7, #20]
 416 0276 0133     		adds	r3, r3, #1
 417 0278 7B61     		str	r3, [r7, #20]
 418              	.L17:
 214:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 419              		.loc 1 214 0 is_stmt 0 discriminator 1
 420 027a 7B69     		ldr	r3, [r7, #20]
 421 027c 0F2B     		cmp	r3, #15
 422 027e 85D9     		bls	.L21
 245:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     }
 246:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 247:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 423              		.loc 1 247 0 is_stmt 1
 424 0280 C046     		nop
 425 0282 BD46     		mov	sp, r7
 426 0284 06B0     		add	sp, sp, #24
 427              		@ sp needed
 428 0286 80BD     		pop	{r7, pc}
 429              		.cfi_endproc
 430              	.LFE124:
 432              		.align	1
 433              		.global	GPIO_StructInit
 434              		.syntax unified
 435              		.code	16
 436              		.thumb_func
 437              		.fpu softvfp
 439              	GPIO_StructInit:
 440              	.LFB125:
 248:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 249:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 250:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Fills each GPIO_InitStruct member with its default value.
 251:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_InitStruct : pointer to a GPIO_InitTypeDef structure which will be initialized.
 252:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 253:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 254:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_StructInit(GPIO_InitTypeDef* GPIO_InitStruct)
 255:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 441              		.loc 1 255 0
 442              		.cfi_startproc
 443              		@ args = 0, pretend = 0, frame = 8
 444              		@ frame_needed = 1, uses_anonymous_args = 0
 445 0288 80B5     		push	{r7, lr}
 446              		.cfi_def_cfa_offset 8
 447              		.cfi_offset 7, -8
 448              		.cfi_offset 14, -4
 449 028a 82B0     		sub	sp, sp, #8
 450              		.cfi_def_cfa_offset 16
 451 028c 00AF     		add	r7, sp, #0
 452              		.cfi_def_cfa_register 7
 453 028e 7860     		str	r0, [r7, #4]
 256:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Reset GPIO init structure parameters values */
 257:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIO_InitStruct->GPIO_Pin  = GPIO_Pin_All;
 454              		.loc 1 257 0
 455 0290 7B68     		ldr	r3, [r7, #4]
 456 0292 094A     		ldr	r2, .L23
 457 0294 1A60     		str	r2, [r3]
 258:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIO_InitStruct->GPIO_Mode = GPIO_Mode_IN;
 458              		.loc 1 258 0
 459 0296 7B68     		ldr	r3, [r7, #4]
 460 0298 0022     		movs	r2, #0
 461 029a 1A71     		strb	r2, [r3, #4]
 259:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIO_InitStruct->GPIO_Speed = GPIO_Speed_2MHz;
 462              		.loc 1 259 0
 463 029c 7B68     		ldr	r3, [r7, #4]
 464 029e 0022     		movs	r2, #0
 465 02a0 5A71     		strb	r2, [r3, #5]
 260:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIO_InitStruct->GPIO_OType = GPIO_OType_PP;
 466              		.loc 1 260 0
 467 02a2 7B68     		ldr	r3, [r7, #4]
 468 02a4 0022     		movs	r2, #0
 469 02a6 9A71     		strb	r2, [r3, #6]
 261:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIO_InitStruct->GPIO_PuPd = GPIO_PuPd_NOPULL;
 470              		.loc 1 261 0
 471 02a8 7B68     		ldr	r3, [r7, #4]
 472 02aa 0022     		movs	r2, #0
 473 02ac DA71     		strb	r2, [r3, #7]
 262:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 474              		.loc 1 262 0
 475 02ae C046     		nop
 476 02b0 BD46     		mov	sp, r7
 477 02b2 02B0     		add	sp, sp, #8
 478              		@ sp needed
 479 02b4 80BD     		pop	{r7, pc}
 480              	.L24:
 481 02b6 C046     		.align	2
 482              	.L23:
 483 02b8 FFFF0000 		.word	65535
 484              		.cfi_endproc
 485              	.LFE125:
 487              		.align	1
 488              		.global	GPIO_PinLockConfig
 489              		.syntax unified
 490              		.code	16
 491              		.thumb_func
 492              		.fpu softvfp
 494              	GPIO_PinLockConfig:
 495              	.LFB126:
 263:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 264:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 265:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Locks GPIO Pins configuration registers.
 266:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @note   The locked registers are GPIOx_MODER, GPIOx_OTYPER, GPIOx_OSPEEDR,
 267:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         GPIOx_PUPDR, GPIOx_AFRL and GPIOx_AFRH.
 268:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @note   The configuration of the locked GPIO pins can no longer be modified
 269:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         until the next reset.
 270:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 271:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 272:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 273:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_Pin: specifies the port bit to be locked.
 274:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
 275:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 276:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 277:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_PinLockConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
 278:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 496              		.loc 1 278 0
 497              		.cfi_startproc
 498              		@ args = 0, pretend = 0, frame = 16
 499              		@ frame_needed = 1, uses_anonymous_args = 0
 500 02bc 80B5     		push	{r7, lr}
 501              		.cfi_def_cfa_offset 8
 502              		.cfi_offset 7, -8
 503              		.cfi_offset 14, -4
 504 02be 84B0     		sub	sp, sp, #16
 505              		.cfi_def_cfa_offset 24
 506 02c0 00AF     		add	r7, sp, #0
 507              		.cfi_def_cfa_register 7
 508 02c2 7860     		str	r0, [r7, #4]
 509 02c4 0A00     		movs	r2, r1
 510 02c6 BB1C     		adds	r3, r7, #2
 511 02c8 1A80     		strh	r2, [r3]
 279:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   __IO uint32_t tmp = 0x00010000;
 512              		.loc 1 279 0
 513 02ca 8023     		movs	r3, #128
 514 02cc 5B02     		lsls	r3, r3, #9
 515 02ce FB60     		str	r3, [r7, #12]
 280:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 281:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 282:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 283:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_PIN(GPIO_Pin));
 284:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 285:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   tmp |= GPIO_Pin;
 516              		.loc 1 285 0
 517 02d0 BB1C     		adds	r3, r7, #2
 518 02d2 1A88     		ldrh	r2, [r3]
 519 02d4 FB68     		ldr	r3, [r7, #12]
 520 02d6 1343     		orrs	r3, r2
 521 02d8 FB60     		str	r3, [r7, #12]
 286:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Set LCKK bit */
 287:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->LCKR = tmp;
 522              		.loc 1 287 0
 523 02da FA68     		ldr	r2, [r7, #12]
 524 02dc 7B68     		ldr	r3, [r7, #4]
 525 02de DA61     		str	r2, [r3, #28]
 288:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Reset LCKK bit */
 289:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->LCKR =  GPIO_Pin;
 526              		.loc 1 289 0
 527 02e0 BB1C     		adds	r3, r7, #2
 528 02e2 1A88     		ldrh	r2, [r3]
 529 02e4 7B68     		ldr	r3, [r7, #4]
 530 02e6 DA61     		str	r2, [r3, #28]
 290:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Set LCKK bit */
 291:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->LCKR = tmp;
 531              		.loc 1 291 0
 532 02e8 FA68     		ldr	r2, [r7, #12]
 533 02ea 7B68     		ldr	r3, [r7, #4]
 534 02ec DA61     		str	r2, [r3, #28]
 292:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Read LCKK bit*/
 293:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   tmp = GPIOx->LCKR;
 535              		.loc 1 293 0
 536 02ee 7B68     		ldr	r3, [r7, #4]
 537 02f0 DB69     		ldr	r3, [r3, #28]
 538 02f2 FB60     		str	r3, [r7, #12]
 294:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Read LCKK bit*/
 295:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   tmp = GPIOx->LCKR;
 539              		.loc 1 295 0
 540 02f4 7B68     		ldr	r3, [r7, #4]
 541 02f6 DB69     		ldr	r3, [r3, #28]
 542 02f8 FB60     		str	r3, [r7, #12]
 296:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 543              		.loc 1 296 0
 544 02fa C046     		nop
 545 02fc BD46     		mov	sp, r7
 546 02fe 04B0     		add	sp, sp, #16
 547              		@ sp needed
 548 0300 80BD     		pop	{r7, pc}
 549              		.cfi_endproc
 550              	.LFE126:
 552              		.align	1
 553              		.global	GPIO_ReadInputDataBit
 554              		.syntax unified
 555              		.code	16
 556              		.thumb_func
 557              		.fpu softvfp
 559              	GPIO_ReadInputDataBit:
 560              	.LFB127:
 297:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 298:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 299:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @}
 300:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 301:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 302:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /** @defgroup GPIO_Group2 GPIO Read and Write
 303:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  *  @brief   GPIO Read and Write
 304:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  *
 305:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @verbatim   
 306:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================
 307:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****                          ##### GPIO Read and Write #####
 308:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================  
 309:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 310:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @endverbatim
 311:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @{
 312:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 313:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 314:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 315:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Reads the specified input port pin.
 316:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 317:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 318:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 319:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_Pin: specifies the port bit to read.
 320:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         This parameter can be GPIO_Pin_x where x can be (0..15).
 321:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval The input port pin value.
 322:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 323:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** uint8_t GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
 324:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 561              		.loc 1 324 0
 562              		.cfi_startproc
 563              		@ args = 0, pretend = 0, frame = 16
 564              		@ frame_needed = 1, uses_anonymous_args = 0
 565 0302 80B5     		push	{r7, lr}
 566              		.cfi_def_cfa_offset 8
 567              		.cfi_offset 7, -8
 568              		.cfi_offset 14, -4
 569 0304 84B0     		sub	sp, sp, #16
 570              		.cfi_def_cfa_offset 24
 571 0306 00AF     		add	r7, sp, #0
 572              		.cfi_def_cfa_register 7
 573 0308 7860     		str	r0, [r7, #4]
 574 030a 0A00     		movs	r2, r1
 575 030c BB1C     		adds	r3, r7, #2
 576 030e 1A80     		strh	r2, [r3]
 325:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   uint8_t bitstatus = 0x00;
 577              		.loc 1 325 0
 578 0310 0F23     		movs	r3, #15
 579 0312 FB18     		adds	r3, r7, r3
 580 0314 0022     		movs	r2, #0
 581 0316 1A70     		strb	r2, [r3]
 326:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 327:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 328:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 329:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GET_GPIO_PIN(GPIO_Pin));
 330:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 331:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   if ((GPIOx->IDR & GPIO_Pin) != (uint32_t)Bit_RESET)
 582              		.loc 1 331 0
 583 0318 7B68     		ldr	r3, [r7, #4]
 584 031a 1B69     		ldr	r3, [r3, #16]
 585 031c BA1C     		adds	r2, r7, #2
 586 031e 1288     		ldrh	r2, [r2]
 587 0320 1340     		ands	r3, r2
 588 0322 04D0     		beq	.L27
 332:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 333:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     bitstatus = (uint8_t)Bit_SET;
 589              		.loc 1 333 0
 590 0324 0F23     		movs	r3, #15
 591 0326 FB18     		adds	r3, r7, r3
 592 0328 0122     		movs	r2, #1
 593 032a 1A70     		strb	r2, [r3]
 594 032c 03E0     		b	.L28
 595              	.L27:
 334:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 335:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else
 336:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 337:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     bitstatus = (uint8_t)Bit_RESET;
 596              		.loc 1 337 0
 597 032e 0F23     		movs	r3, #15
 598 0330 FB18     		adds	r3, r7, r3
 599 0332 0022     		movs	r2, #0
 600 0334 1A70     		strb	r2, [r3]
 601              	.L28:
 338:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 339:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   return bitstatus;
 602              		.loc 1 339 0
 603 0336 0F23     		movs	r3, #15
 604 0338 FB18     		adds	r3, r7, r3
 605 033a 1B78     		ldrb	r3, [r3]
 340:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 606              		.loc 1 340 0
 607 033c 1800     		movs	r0, r3
 608 033e BD46     		mov	sp, r7
 609 0340 04B0     		add	sp, sp, #16
 610              		@ sp needed
 611 0342 80BD     		pop	{r7, pc}
 612              		.cfi_endproc
 613              	.LFE127:
 615              		.align	1
 616              		.global	GPIO_ReadInputData
 617              		.syntax unified
 618              		.code	16
 619              		.thumb_func
 620              		.fpu softvfp
 622              	GPIO_ReadInputData:
 623              	.LFB128:
 341:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 342:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 343:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Reads the specified GPIO input data port.
 344:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 345:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 346:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 347:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval GPIO input data port value.
 348:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 349:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** uint16_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 350:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 624              		.loc 1 350 0
 625              		.cfi_startproc
 626              		@ args = 0, pretend = 0, frame = 8
 627              		@ frame_needed = 1, uses_anonymous_args = 0
 628 0344 80B5     		push	{r7, lr}
 629              		.cfi_def_cfa_offset 8
 630              		.cfi_offset 7, -8
 631              		.cfi_offset 14, -4
 632 0346 82B0     		sub	sp, sp, #8
 633              		.cfi_def_cfa_offset 16
 634 0348 00AF     		add	r7, sp, #0
 635              		.cfi_def_cfa_register 7
 636 034a 7860     		str	r0, [r7, #4]
 351:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 352:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 353:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 354:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   return ((uint16_t)GPIOx->IDR);
 637              		.loc 1 354 0
 638 034c 7B68     		ldr	r3, [r7, #4]
 639 034e 1B69     		ldr	r3, [r3, #16]
 640 0350 9BB2     		uxth	r3, r3
 355:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 641              		.loc 1 355 0
 642 0352 1800     		movs	r0, r3
 643 0354 BD46     		mov	sp, r7
 644 0356 02B0     		add	sp, sp, #8
 645              		@ sp needed
 646 0358 80BD     		pop	{r7, pc}
 647              		.cfi_endproc
 648              	.LFE128:
 650              		.align	1
 651              		.global	GPIO_ReadOutputDataBit
 652              		.syntax unified
 653              		.code	16
 654              		.thumb_func
 655              		.fpu softvfp
 657              	GPIO_ReadOutputDataBit:
 658              	.LFB129:
 356:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 357:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 358:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Reads the specified output data port bit.
 359:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 360:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 361:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 362:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_Pin: specifies the port bit to read.
 363:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          This parameter can be GPIO_Pin_x where x can be (0..15).
 364:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval The output port pin value.
 365:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 366:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** uint8_t GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
 367:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 659              		.loc 1 367 0
 660              		.cfi_startproc
 661              		@ args = 0, pretend = 0, frame = 16
 662              		@ frame_needed = 1, uses_anonymous_args = 0
 663 035a 80B5     		push	{r7, lr}
 664              		.cfi_def_cfa_offset 8
 665              		.cfi_offset 7, -8
 666              		.cfi_offset 14, -4
 667 035c 84B0     		sub	sp, sp, #16
 668              		.cfi_def_cfa_offset 24
 669 035e 00AF     		add	r7, sp, #0
 670              		.cfi_def_cfa_register 7
 671 0360 7860     		str	r0, [r7, #4]
 672 0362 0A00     		movs	r2, r1
 673 0364 BB1C     		adds	r3, r7, #2
 674 0366 1A80     		strh	r2, [r3]
 368:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   uint8_t bitstatus = 0x00;
 675              		.loc 1 368 0
 676 0368 0F23     		movs	r3, #15
 677 036a FB18     		adds	r3, r7, r3
 678 036c 0022     		movs	r2, #0
 679 036e 1A70     		strb	r2, [r3]
 369:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 370:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 371:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 372:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GET_GPIO_PIN(GPIO_Pin));
 373:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 374:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   if (((GPIOx->ODR) & GPIO_Pin) != (uint32_t)Bit_RESET)
 680              		.loc 1 374 0
 681 0370 7B68     		ldr	r3, [r7, #4]
 682 0372 5B69     		ldr	r3, [r3, #20]
 683 0374 BA1C     		adds	r2, r7, #2
 684 0376 1288     		ldrh	r2, [r2]
 685 0378 1340     		ands	r3, r2
 686 037a 04D0     		beq	.L33
 375:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 376:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     bitstatus = (uint8_t)Bit_SET;
 687              		.loc 1 376 0
 688 037c 0F23     		movs	r3, #15
 689 037e FB18     		adds	r3, r7, r3
 690 0380 0122     		movs	r2, #1
 691 0382 1A70     		strb	r2, [r3]
 692 0384 03E0     		b	.L34
 693              	.L33:
 377:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 378:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else
 379:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 380:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     bitstatus = (uint8_t)Bit_RESET;
 694              		.loc 1 380 0
 695 0386 0F23     		movs	r3, #15
 696 0388 FB18     		adds	r3, r7, r3
 697 038a 0022     		movs	r2, #0
 698 038c 1A70     		strb	r2, [r3]
 699              	.L34:
 381:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 382:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   return bitstatus;
 700              		.loc 1 382 0
 701 038e 0F23     		movs	r3, #15
 702 0390 FB18     		adds	r3, r7, r3
 703 0392 1B78     		ldrb	r3, [r3]
 383:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 704              		.loc 1 383 0
 705 0394 1800     		movs	r0, r3
 706 0396 BD46     		mov	sp, r7
 707 0398 04B0     		add	sp, sp, #16
 708              		@ sp needed
 709 039a 80BD     		pop	{r7, pc}
 710              		.cfi_endproc
 711              	.LFE129:
 713              		.align	1
 714              		.global	GPIO_ReadOutputData
 715              		.syntax unified
 716              		.code	16
 717              		.thumb_func
 718              		.fpu softvfp
 720              	GPIO_ReadOutputData:
 721              	.LFB130:
 384:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 385:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 386:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Reads the specified GPIO output data port.
 387:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 388:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 389:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 390:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval GPIO output data port value.
 391:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 392:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** uint16_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 393:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 722              		.loc 1 393 0
 723              		.cfi_startproc
 724              		@ args = 0, pretend = 0, frame = 8
 725              		@ frame_needed = 1, uses_anonymous_args = 0
 726 039c 80B5     		push	{r7, lr}
 727              		.cfi_def_cfa_offset 8
 728              		.cfi_offset 7, -8
 729              		.cfi_offset 14, -4
 730 039e 82B0     		sub	sp, sp, #8
 731              		.cfi_def_cfa_offset 16
 732 03a0 00AF     		add	r7, sp, #0
 733              		.cfi_def_cfa_register 7
 734 03a2 7860     		str	r0, [r7, #4]
 394:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 395:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 396:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 397:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   return ((uint16_t)GPIOx->ODR);
 735              		.loc 1 397 0
 736 03a4 7B68     		ldr	r3, [r7, #4]
 737 03a6 5B69     		ldr	r3, [r3, #20]
 738 03a8 9BB2     		uxth	r3, r3
 398:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 739              		.loc 1 398 0
 740 03aa 1800     		movs	r0, r3
 741 03ac BD46     		mov	sp, r7
 742 03ae 02B0     		add	sp, sp, #8
 743              		@ sp needed
 744 03b0 80BD     		pop	{r7, pc}
 745              		.cfi_endproc
 746              	.LFE130:
 748              		.align	1
 749              		.global	GPIO_SetBits
 750              		.syntax unified
 751              		.code	16
 752              		.thumb_func
 753              		.fpu softvfp
 755              	GPIO_SetBits:
 756              	.LFB131:
 399:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 400:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 401:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Sets the selected data port bits.
 402:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @note   This functions uses GPIOx_BSRR register to allow atomic read/modify 
 403:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         accesses. In this way, there is no risk of an IRQ occurring between
 404:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         the read and the modify access.
 405:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 406:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 407:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 408:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_Pin: specifies the port bits to be written.
 409:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
 410:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 411:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 412:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
 413:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 757              		.loc 1 413 0
 758              		.cfi_startproc
 759              		@ args = 0, pretend = 0, frame = 8
 760              		@ frame_needed = 1, uses_anonymous_args = 0
 761 03b2 80B5     		push	{r7, lr}
 762              		.cfi_def_cfa_offset 8
 763              		.cfi_offset 7, -8
 764              		.cfi_offset 14, -4
 765 03b4 82B0     		sub	sp, sp, #8
 766              		.cfi_def_cfa_offset 16
 767 03b6 00AF     		add	r7, sp, #0
 768              		.cfi_def_cfa_register 7
 769 03b8 7860     		str	r0, [r7, #4]
 770 03ba 0A00     		movs	r2, r1
 771 03bc BB1C     		adds	r3, r7, #2
 772 03be 1A80     		strh	r2, [r3]
 414:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 415:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 416:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_PIN(GPIO_Pin));
 417:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 418:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->BSRRL = GPIO_Pin;
 773              		.loc 1 418 0
 774 03c0 7B68     		ldr	r3, [r7, #4]
 775 03c2 BA1C     		adds	r2, r7, #2
 776 03c4 1288     		ldrh	r2, [r2]
 777 03c6 1A83     		strh	r2, [r3, #24]
 419:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 778              		.loc 1 419 0
 779 03c8 C046     		nop
 780 03ca BD46     		mov	sp, r7
 781 03cc 02B0     		add	sp, sp, #8
 782              		@ sp needed
 783 03ce 80BD     		pop	{r7, pc}
 784              		.cfi_endproc
 785              	.LFE131:
 787              		.align	1
 788              		.global	GPIO_ResetBits
 789              		.syntax unified
 790              		.code	16
 791              		.thumb_func
 792              		.fpu softvfp
 794              	GPIO_ResetBits:
 795              	.LFB132:
 420:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 421:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 422:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Clears the selected data port bits.
 423:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @note   This functions uses GPIOx_BSRR register to allow atomic read/modify 
 424:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         accesses. In this way, there is no risk of an IRQ occurring between
 425:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         the read and the modify access.
 426:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 427:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 428:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 429:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_Pin: specifies the port bits to be written.
 430:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          This parameter can be any combination of GPIO_Pin_x where x can be (0..15).
 431:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 432:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 433:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
 434:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 796              		.loc 1 434 0
 797              		.cfi_startproc
 798              		@ args = 0, pretend = 0, frame = 8
 799              		@ frame_needed = 1, uses_anonymous_args = 0
 800 03d0 80B5     		push	{r7, lr}
 801              		.cfi_def_cfa_offset 8
 802              		.cfi_offset 7, -8
 803              		.cfi_offset 14, -4
 804 03d2 82B0     		sub	sp, sp, #8
 805              		.cfi_def_cfa_offset 16
 806 03d4 00AF     		add	r7, sp, #0
 807              		.cfi_def_cfa_register 7
 808 03d6 7860     		str	r0, [r7, #4]
 809 03d8 0A00     		movs	r2, r1
 810 03da BB1C     		adds	r3, r7, #2
 811 03dc 1A80     		strh	r2, [r3]
 435:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 436:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 437:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_PIN(GPIO_Pin));
 438:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 439:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->BSRRH = GPIO_Pin;
 812              		.loc 1 439 0
 813 03de 7B68     		ldr	r3, [r7, #4]
 814 03e0 BA1C     		adds	r2, r7, #2
 815 03e2 1288     		ldrh	r2, [r2]
 816 03e4 5A83     		strh	r2, [r3, #26]
 440:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 817              		.loc 1 440 0
 818 03e6 C046     		nop
 819 03e8 BD46     		mov	sp, r7
 820 03ea 02B0     		add	sp, sp, #8
 821              		@ sp needed
 822 03ec 80BD     		pop	{r7, pc}
 823              		.cfi_endproc
 824              	.LFE132:
 826              		.align	1
 827              		.global	GPIO_WriteBit
 828              		.syntax unified
 829              		.code	16
 830              		.thumb_func
 831              		.fpu softvfp
 833              	GPIO_WriteBit:
 834              	.LFB133:
 441:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 442:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 443:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Sets or clears the selected data port bit.
 444:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 445:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 446:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 447:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_Pin: specifies the port bit to be written.
 448:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          This parameter can be one of GPIO_Pin_x where x can be (0..15).
 449:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  BitVal: specifies the value to be written to the selected bit.
 450:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          This parameter can be one of the BitAction enum values:
 451:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg Bit_RESET: to clear the port pin
 452:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg Bit_SET: to set the port pin
 453:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 454:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 455:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_WriteBit(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, BitAction BitVal)
 456:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 835              		.loc 1 456 0
 836              		.cfi_startproc
 837              		@ args = 0, pretend = 0, frame = 8
 838              		@ frame_needed = 1, uses_anonymous_args = 0
 839 03ee 80B5     		push	{r7, lr}
 840              		.cfi_def_cfa_offset 8
 841              		.cfi_offset 7, -8
 842              		.cfi_offset 14, -4
 843 03f0 82B0     		sub	sp, sp, #8
 844              		.cfi_def_cfa_offset 16
 845 03f2 00AF     		add	r7, sp, #0
 846              		.cfi_def_cfa_register 7
 847 03f4 7860     		str	r0, [r7, #4]
 848 03f6 0800     		movs	r0, r1
 849 03f8 1100     		movs	r1, r2
 850 03fa BB1C     		adds	r3, r7, #2
 851 03fc 021C     		adds	r2, r0, #0
 852 03fe 1A80     		strh	r2, [r3]
 853 0400 7B1C     		adds	r3, r7, #1
 854 0402 0A1C     		adds	r2, r1, #0
 855 0404 1A70     		strb	r2, [r3]
 457:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 458:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 459:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GET_GPIO_PIN(GPIO_Pin));
 460:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_BIT_ACTION(BitVal));
 461:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 462:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   if (BitVal != Bit_RESET)
 856              		.loc 1 462 0
 857 0406 7B1C     		adds	r3, r7, #1
 858 0408 1B78     		ldrb	r3, [r3]
 859 040a 002B     		cmp	r3, #0
 860 040c 04D0     		beq	.L41
 463:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 464:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     GPIOx->BSRRL = GPIO_Pin;
 861              		.loc 1 464 0
 862 040e 7B68     		ldr	r3, [r7, #4]
 863 0410 BA1C     		adds	r2, r7, #2
 864 0412 1288     		ldrh	r2, [r2]
 865 0414 1A83     		strh	r2, [r3, #24]
 465:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 466:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   else
 467:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   {
 468:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****     GPIOx->BSRRH = GPIO_Pin ;
 469:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 470:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 866              		.loc 1 470 0
 867 0416 03E0     		b	.L43
 868              	.L41:
 468:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   }
 869              		.loc 1 468 0
 870 0418 7B68     		ldr	r3, [r7, #4]
 871 041a BA1C     		adds	r2, r7, #2
 872 041c 1288     		ldrh	r2, [r2]
 873 041e 5A83     		strh	r2, [r3, #26]
 874              	.L43:
 875              		.loc 1 470 0
 876 0420 C046     		nop
 877 0422 BD46     		mov	sp, r7
 878 0424 02B0     		add	sp, sp, #8
 879              		@ sp needed
 880 0426 80BD     		pop	{r7, pc}
 881              		.cfi_endproc
 882              	.LFE133:
 884              		.align	1
 885              		.global	GPIO_Write
 886              		.syntax unified
 887              		.code	16
 888              		.thumb_func
 889              		.fpu softvfp
 891              	GPIO_Write:
 892              	.LFB134:
 471:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 472:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 473:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Writes data to the specified GPIO data port.
 474:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 475:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 476:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 477:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  PortVal: specifies the value to be written to the port output data register.
 478:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 479:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 480:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_Write(GPIO_TypeDef* GPIOx, uint16_t PortVal)
 481:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 893              		.loc 1 481 0
 894              		.cfi_startproc
 895              		@ args = 0, pretend = 0, frame = 8
 896              		@ frame_needed = 1, uses_anonymous_args = 0
 897 0428 80B5     		push	{r7, lr}
 898              		.cfi_def_cfa_offset 8
 899              		.cfi_offset 7, -8
 900              		.cfi_offset 14, -4
 901 042a 82B0     		sub	sp, sp, #8
 902              		.cfi_def_cfa_offset 16
 903 042c 00AF     		add	r7, sp, #0
 904              		.cfi_def_cfa_register 7
 905 042e 7860     		str	r0, [r7, #4]
 906 0430 0A00     		movs	r2, r1
 907 0432 BB1C     		adds	r3, r7, #2
 908 0434 1A80     		strh	r2, [r3]
 482:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 483:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 484:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 485:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->ODR = PortVal;
 909              		.loc 1 485 0
 910 0436 BB1C     		adds	r3, r7, #2
 911 0438 1A88     		ldrh	r2, [r3]
 912 043a 7B68     		ldr	r3, [r7, #4]
 913 043c 5A61     		str	r2, [r3, #20]
 486:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 914              		.loc 1 486 0
 915 043e C046     		nop
 916 0440 BD46     		mov	sp, r7
 917 0442 02B0     		add	sp, sp, #8
 918              		@ sp needed
 919 0444 80BD     		pop	{r7, pc}
 920              		.cfi_endproc
 921              	.LFE134:
 923              		.align	1
 924              		.global	GPIO_ToggleBits
 925              		.syntax unified
 926              		.code	16
 927              		.thumb_func
 928              		.fpu softvfp
 930              	GPIO_ToggleBits:
 931              	.LFB135:
 487:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 488:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 489:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Toggles the specified GPIO pins..
 490:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 491:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 492:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 493:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_Pin: Specifies the pins to be toggled.
 494:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 495:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 496:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
 497:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 932              		.loc 1 497 0
 933              		.cfi_startproc
 934              		@ args = 0, pretend = 0, frame = 8
 935              		@ frame_needed = 1, uses_anonymous_args = 0
 936 0446 80B5     		push	{r7, lr}
 937              		.cfi_def_cfa_offset 8
 938              		.cfi_offset 7, -8
 939              		.cfi_offset 14, -4
 940 0448 82B0     		sub	sp, sp, #8
 941              		.cfi_def_cfa_offset 16
 942 044a 00AF     		add	r7, sp, #0
 943              		.cfi_def_cfa_register 7
 944 044c 7860     		str	r0, [r7, #4]
 945 044e 0A00     		movs	r2, r1
 946 0450 BB1C     		adds	r3, r7, #2
 947 0452 1A80     		strh	r2, [r3]
 498:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 499:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 500:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 501:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->ODR ^= GPIO_Pin;
 948              		.loc 1 501 0
 949 0454 7B68     		ldr	r3, [r7, #4]
 950 0456 5A69     		ldr	r2, [r3, #20]
 951 0458 BB1C     		adds	r3, r7, #2
 952 045a 1B88     		ldrh	r3, [r3]
 953 045c 5A40     		eors	r2, r3
 954 045e 7B68     		ldr	r3, [r7, #4]
 955 0460 5A61     		str	r2, [r3, #20]
 502:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 956              		.loc 1 502 0
 957 0462 C046     		nop
 958 0464 BD46     		mov	sp, r7
 959 0466 02B0     		add	sp, sp, #8
 960              		@ sp needed
 961 0468 80BD     		pop	{r7, pc}
 962              		.cfi_endproc
 963              	.LFE135:
 965              		.align	1
 966              		.global	GPIO_PinAFConfig
 967              		.syntax unified
 968              		.code	16
 969              		.thumb_func
 970              		.fpu softvfp
 972              	GPIO_PinAFConfig:
 973              	.LFB136:
 503:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 504:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 505:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @}
 506:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 507:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 508:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /** @defgroup GPIO_Group3 GPIO Alternate functions configuration function
 509:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  *  @brief   GPIO Alternate functions configuration function
 510:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  *
 511:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @verbatim   
 512:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================
 513:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****            ##### GPIO Alternate functions configuration function #####
 514:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****  ===============================================================================  
 515:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 516:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** @endverbatim
 517:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @{
 518:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 519:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** 
 520:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** /**
 521:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @brief  Changes the mapping of the specified pin.
 522:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIOx: where x can be (A..K) to select the GPIO peripheral for STM32F405xx/407xx and ST
 523:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A..I) to select the GPIO peripheral for STM32F42xxx/43xxx device
 524:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *                      x can be (A, B, C, D and H) to select the GPIO peripheral for STM32F401xx 
 525:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_PinSource: specifies the pin for the Alternate function.
 526:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *         This parameter can be GPIO_PinSourcex where x can be (0..15).
 527:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @param  GPIO_AFSelection: selects the pin to used as Alternate function.
 528:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *          This parameter can be one of the following values:
 529:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_RTC_50Hz: Connect RTC_50Hz pin to AF0 (default after reset) 
 530:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_MCO: Connect MCO pin (MCO1 and MCO2) to AF0 (default after reset) 
 531:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TAMPER: Connect TAMPER pins (TAMPER_1 and TAMPER_2) to AF0 (default aft
 532:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SWJ: Connect SWJ pins (SWD and JTAG)to AF0 (default after reset) 
 533:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TRACE: Connect TRACE pins to AF0 (default after reset)
 534:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM1: Connect TIM1 pins to AF1
 535:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM2: Connect TIM2 pins to AF1
 536:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM3: Connect TIM3 pins to AF2
 537:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM4: Connect TIM4 pins to AF2
 538:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM5: Connect TIM5 pins to AF2
 539:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM8: Connect TIM8 pins to AF3
 540:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM9: Connect TIM9 pins to AF3
 541:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM10: Connect TIM10 pins to AF3
 542:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM11: Connect TIM11 pins to AF3
 543:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_I2C1: Connect I2C1 pins to AF4
 544:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_I2C2: Connect I2C2 pins to AF4
 545:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_I2C3: Connect I2C3 pins to AF4
 546:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SPI1: Connect SPI1 pins to AF5
 547:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SPI2: Connect SPI2/I2S2 pins to AF5
 548:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SPI4: Connect SPI4 pins to AF5 
 549:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SPI5: Connect SPI5 pins to AF5 
 550:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SPI6: Connect SPI6 pins to AF5
 551:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SAI1: Connect SAI1 pins to AF6 for STM32F42xxx/43xxx devices.       
 552:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SPI3: Connect SPI3/I2S3 pins to AF6
 553:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_I2S3ext: Connect I2S3ext pins to AF7
 554:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_USART1: Connect USART1 pins to AF7
 555:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_USART2: Connect USART2 pins to AF7
 556:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_USART3: Connect USART3 pins to AF7
 557:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_UART4: Connect UART4 pins to AF8
 558:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_UART5: Connect UART5 pins to AF8
 559:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_USART6: Connect USART6 pins to AF8
 560:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_UART7: Connect UART7 pins to AF8
 561:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_UART8: Connect UART8 pins to AF8
 562:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_CAN1: Connect CAN1 pins to AF9
 563:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_CAN2: Connect CAN2 pins to AF9
 564:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM12: Connect TIM12 pins to AF9
 565:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM13: Connect TIM13 pins to AF9
 566:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_TIM14: Connect TIM14 pins to AF9
 567:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_OTG_FS: Connect OTG_FS pins to AF10
 568:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_OTG_HS: Connect OTG_HS pins to AF10
 569:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_ETH: Connect ETHERNET pins to AF11
 570:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_FSMC: Connect FSMC pins to AF12 
 571:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_FMC: Connect FMC pins to AF12 for STM32F42xxx/43xxx devices.   
 572:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_OTG_HS_FS: Connect OTG HS (configured in FS) pins to AF12
 573:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_SDIO: Connect SDIO pins to AF12
 574:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_DCMI: Connect DCMI pins to AF13
 575:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_LTDC: Connect LTDC pins to AF14 for STM32F429xx/439xx devices. 
 576:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   *            @arg GPIO_AF_EVENTOUT: Connect EVENTOUT pins to AF15
 577:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   * @retval None
 578:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   */
 579:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** void GPIO_PinAFConfig(GPIO_TypeDef* GPIOx, uint16_t GPIO_PinSource, uint8_t GPIO_AF)
 580:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** {
 974              		.loc 1 580 0
 975              		.cfi_startproc
 976              		@ args = 0, pretend = 0, frame = 16
 977              		@ frame_needed = 1, uses_anonymous_args = 0
 978 046a 80B5     		push	{r7, lr}
 979              		.cfi_def_cfa_offset 8
 980              		.cfi_offset 7, -8
 981              		.cfi_offset 14, -4
 982 046c 84B0     		sub	sp, sp, #16
 983              		.cfi_def_cfa_offset 24
 984 046e 00AF     		add	r7, sp, #0
 985              		.cfi_def_cfa_register 7
 986 0470 7860     		str	r0, [r7, #4]
 987 0472 0800     		movs	r0, r1
 988 0474 1100     		movs	r1, r2
 989 0476 BB1C     		adds	r3, r7, #2
 990 0478 021C     		adds	r2, r0, #0
 991 047a 1A80     		strh	r2, [r3]
 992 047c 7B1C     		adds	r3, r7, #1
 993 047e 0A1C     		adds	r2, r1, #0
 994 0480 1A70     		strb	r2, [r3]
 581:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   uint32_t temp = 0x00;
 995              		.loc 1 581 0
 996 0482 0023     		movs	r3, #0
 997 0484 FB60     		str	r3, [r7, #12]
 582:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   uint32_t temp_2 = 0x00;
 998              		.loc 1 582 0
 999 0486 0023     		movs	r3, #0
 1000 0488 BB60     		str	r3, [r7, #8]
 583:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   
 584:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   /* Check the parameters */
 585:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
 586:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_PIN_SOURCE(GPIO_PinSource));
 587:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   assert_param(IS_GPIO_AF(GPIO_AF));
 588:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   
 589:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   temp = ((uint32_t)(GPIO_AF) << ((uint32_t)((uint32_t)GPIO_PinSource & (uint32_t)0x07) * 4)) ;
 1001              		.loc 1 589 0
 1002 048a 7B1C     		adds	r3, r7, #1
 1003 048c 1A78     		ldrb	r2, [r3]
 1004 048e BB1C     		adds	r3, r7, #2
 1005 0490 1B88     		ldrh	r3, [r3]
 1006 0492 0721     		movs	r1, #7
 1007 0494 0B40     		ands	r3, r1
 1008 0496 9B00     		lsls	r3, r3, #2
 1009 0498 9A40     		lsls	r2, r2, r3
 1010 049a 1300     		movs	r3, r2
 1011 049c FB60     		str	r3, [r7, #12]
 590:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->AFR[GPIO_PinSource >> 0x03] &= ~((uint32_t)0xF << ((uint32_t)((uint32_t)GPIO_PinSource & (
 1012              		.loc 1 590 0
 1013 049e BB1C     		adds	r3, r7, #2
 1014 04a0 1B88     		ldrh	r3, [r3]
 1015 04a2 DB08     		lsrs	r3, r3, #3
 1016 04a4 9BB2     		uxth	r3, r3
 1017 04a6 1A00     		movs	r2, r3
 1018 04a8 7B68     		ldr	r3, [r7, #4]
 1019 04aa 0832     		adds	r2, r2, #8
 1020 04ac 9200     		lsls	r2, r2, #2
 1021 04ae D358     		ldr	r3, [r2, r3]
 1022 04b0 BA1C     		adds	r2, r7, #2
 1023 04b2 1288     		ldrh	r2, [r2]
 1024 04b4 0721     		movs	r1, #7
 1025 04b6 0A40     		ands	r2, r1
 1026 04b8 9200     		lsls	r2, r2, #2
 1027 04ba 0F21     		movs	r1, #15
 1028 04bc 9140     		lsls	r1, r1, r2
 1029 04be 0A00     		movs	r2, r1
 1030 04c0 D243     		mvns	r2, r2
 1031 04c2 B91C     		adds	r1, r7, #2
 1032 04c4 0988     		ldrh	r1, [r1]
 1033 04c6 C908     		lsrs	r1, r1, #3
 1034 04c8 89B2     		uxth	r1, r1
 1035 04ca 0800     		movs	r0, r1
 1036 04cc 1A40     		ands	r2, r3
 1037 04ce 1100     		movs	r1, r2
 1038 04d0 7B68     		ldr	r3, [r7, #4]
 1039 04d2 0200     		movs	r2, r0
 1040 04d4 0832     		adds	r2, r2, #8
 1041 04d6 9200     		lsls	r2, r2, #2
 1042 04d8 D150     		str	r1, [r2, r3]
 591:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   temp_2 = GPIOx->AFR[GPIO_PinSource >> 0x03] | temp;
 1043              		.loc 1 591 0
 1044 04da BB1C     		adds	r3, r7, #2
 1045 04dc 1B88     		ldrh	r3, [r3]
 1046 04de DB08     		lsrs	r3, r3, #3
 1047 04e0 9BB2     		uxth	r3, r3
 1048 04e2 1A00     		movs	r2, r3
 1049 04e4 7B68     		ldr	r3, [r7, #4]
 1050 04e6 0832     		adds	r2, r2, #8
 1051 04e8 9200     		lsls	r2, r2, #2
 1052 04ea D358     		ldr	r3, [r2, r3]
 1053 04ec FA68     		ldr	r2, [r7, #12]
 1054 04ee 1343     		orrs	r3, r2
 1055 04f0 BB60     		str	r3, [r7, #8]
 592:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c ****   GPIOx->AFR[GPIO_PinSource >> 0x03] = temp_2;
 1056              		.loc 1 592 0
 1057 04f2 BB1C     		adds	r3, r7, #2
 1058 04f4 1B88     		ldrh	r3, [r3]
 1059 04f6 DB08     		lsrs	r3, r3, #3
 1060 04f8 9BB2     		uxth	r3, r3
 1061 04fa 1A00     		movs	r2, r3
 1062 04fc 7B68     		ldr	r3, [r7, #4]
 1063 04fe 0832     		adds	r2, r2, #8
 1064 0500 9200     		lsls	r2, r2, #2
 1065 0502 B968     		ldr	r1, [r7, #8]
 1066 0504 D150     		str	r1, [r2, r3]
 593:C:/Users/Adamt/OneDrive/Dokument/GitHub/DAT290-Larmsystem/kod/lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/src\stm32f4xx_gpio.c **** }
 1067              		.loc 1 593 0
 1068 0506 C046     		nop
 1069 0508 BD46     		mov	sp, r7
 1070 050a 04B0     		add	sp, sp, #16
 1071              		@ sp needed
 1072 050c 80BD     		pop	{r7, pc}
 1073              		.cfi_endproc
 1074              	.LFE136:
 1076              	.Letext0:
 1077              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1078              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 1079              		.file 4 "../lib/STM32F4_lib/CMSIS/include/core_cm4.h"
 1080              		.file 5 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/system_stm32f4xx.h"
 1081              		.file 6 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx.h"
 1082              		.file 7 "../lib/STM32F4_lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h"
