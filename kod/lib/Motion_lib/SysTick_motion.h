#ifndef SYSTICK_MOTION_H
#define SYSTICK_MOTION_H

#include "stm32f4xx_syscfg.h"

volatile uint32_t microTicks;	// Variabel för microsekunder.



/**
 * @brief SysTick avbrottshanterare.
 */
void SysTick_Handler(void);



/**
 * @brief Initieringsfunktion för timer.
 */
void init_Timer();



/**
 * @brief Fördröjningsfunktion där inputen är fördröjningen i mikrosekunder.
 */
void delayMicro (uint32_t micro);


#endif