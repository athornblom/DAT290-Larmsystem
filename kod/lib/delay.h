#ifndef DELAY_H
#define DELAY_H

#include "stm32f4xx.h"
#include "core_cm4.h"

//Variabel som uppdateras varje millisekund
extern volatile uint32_t msTicks;

//Initiering  av systick
void systick_Init(void);

//Blockerande delay mikrosekunder
void blockingDelayus(uint16_t delay);

//Blockerande delay millisekunder
void blockingDelayMs(uint32_t delay);

#endif