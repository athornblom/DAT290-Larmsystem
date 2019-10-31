#include "delay.h"

// Variabel för microsekunder.
volatile uint32_t msTicks = 0;

//SysTick interrupt Handler.
void SysTick_Handler(void){
	msTicks++;
}

void systick_Init(void){
    msTicks = 0;
	*((void (**)(void))0x2001C03C) = SysTick_Handler;
    //Genererar ett SysTick-avbrott varje ms.
	SysTick_Config(168000000 / 1000);
    NVIC_SetPriority(SysTick_IRQn, 0);
}

//Blockerande fördröjning delay anger antaler millisekunder
void blockingDelayMs(uint32_t delay){
    //Kommer ge fel då det blir overflow
    uint32_t start = msTicks + delay;
    while (start > msTicks);
}