
#include "SysTick_motion.h"



volatile uint32_t microTicks = 0;		 // Variabel för mikrosekunder.



/**
 * @brief SysTick avbrottshanterare.
 */
void SysTick_Handler(void)  {
	microTicks++;
}



/**
 * @brief Initieringsfunktion för timer.
 */
void init_Timer(){
	//Systick
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
  	returnCode = SysTick_Config(168000000/1000000);      // Konfigurera SysTick att generera avbrott varje mikrosekund.
}



/**
 * @brief Fördröjningsfunktion där inputen är fördröjningen i mikrosekunder.
 */
void delayMicro (uint32_t micro){
		uint32_t wait = microTicks + micro;
		while(wait > microTicks);
	}