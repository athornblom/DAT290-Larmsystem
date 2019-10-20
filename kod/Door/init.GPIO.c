#include "init_GPIO.h"
//======================================GPIO=========================================================
void init_GPIO_Ports()
{
	/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;
	//GPIO E UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOE, &init);
	
	//konfigurerar inport GPIO E
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 |GPIO_Pin_14;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOE, &init);

    //GPIOA UTPORTAR
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOA, &init);
	
	//konfigurerar inport GPIO a
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 |GPIO_Pin_14;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &init);

	//GPIO C UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOC, &init);
	
	//konfigurerar inport GPIO C
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 |GPIO_Pin_14;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOC, &init);

	//GPIO D UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOD, &init);
	
	//konfigurerar inport GPIO D
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 |GPIO_Pin_14;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOD, &init);

	//GPIO B UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_2;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	init.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOB, &init);
}