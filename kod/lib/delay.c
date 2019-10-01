#include "delay.h"

void blockingDelayus(uint16_t delay){
    SysTick->CTRL = 0;
    SysTick->LOAD = 168 * delay;
    SysTick->CTRL = SysTick_CTRL_ENABLE_Msk | SysTick_CTRL_CLKSOURCE_Msk;
    while (!(SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk));
    SysTick->CTRL = 0;
}

void blockingDelayMs(uint16_t delay){
    for(; delay; delay--){
        blockingDelayus(1000);
    }
}