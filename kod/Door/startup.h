#ifndef STARTUP_H
#define STARTUP_H
#include "stm32f4xx_gpio.h"
typedef struct _door
{
    char id;
    int controlbits; // 16 kontrollbitar, 1 st är ifall dörren larmar, 2, göra så det inte spammar can tex den minst signifikanta biten är ifall dörren är upplåst eller ej
    char time_larm;            // tid i 10 sekunders intervall innan dörr larmar lokalt
    char time_central_larm;    // tid i 10 sekunders intervall innan dörr larmar centralenheten
    int password;              //4 sifferig kod för att låsa upp dörrarna
    int GPIO_lamp;
    int GPIO_read;
    int larmTick; // msTick == larmState ? Larm
    GPIO_TypeDef * GPIO_type;
} door;

volatile uint32_t msTicks; /* Variable to store millisecond ticks */
uint32_t id;
char nocid;
//char annydoorLarm;
#endif
////Dörren uppställd?/larmat centralt/Larmar