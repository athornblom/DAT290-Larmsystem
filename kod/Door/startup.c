#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rcc.c"
#include "core_cm4.h"
#include "stm32f4xx_gpio.h"
#include "system_stm32f4xx.h"
#include "startup.h"

void startup(void) __attribute__((naked)) __attribute__((section(".start_section")));

void startup(void)
{
	__asm volatile(
		" LDR R0,=0x2001C000\n" /* set stack */
		" MOV SP,R0\n"
		" BL main\n"   /* call main */
		"_exit: B .\n" /* never return */
	);
}
// ========================================= DOOOOOORS INIT =================================================
uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};

GPIO_TypeDef *GPIO_Ports[] = {GPIOA, GPIOB};

void detect_Closed_Doors(int *pointer)
{
	for (int j = 0; j < sizeof(GPIO_Ports) / sizeof(GPIO_TypeDef *); j++)
	{
		for (int i = 0; i < sizeof(GPIO_Pins); i = i + 2)
		{
			if (GPIO_ReadInputDataBit(GPIO_Ports[j], GPIO_Pins[i]))
			{
				(*pointer)++;
			}
		}
	}
}

void init_Doors(door *pointer, int length)
{
	int SafetyNum = 0;
	for (int j = 0; j < 1; j++)
	{
		for (int i = 0; i < sizeof(GPIO_Pins)/sizeof(uint16_t); i = i + 2)
		{
			if (SafetyNum == length) //finns ifall en dörr stängs efter att första gången som programet kollar dörrar
			{
				break;
			}
			if (GPIO_ReadInputDataBit(GPIO_Ports[j], GPIO_Pins[i]))
			{

				SafetyNum++;
				pointer->id = i;
				pointer->controlbits = 0;
				pointer->time_larm = 0;
				pointer->time_central_larm = 2;
				pointer->password = 0;
				pointer->GPIO_lamp = GPIO_Pins[i + 1];
				pointer->GPIO_read = GPIO_Pins[i];
				pointer->larmTick = 0;
				pointer->GPIO_Type = j;
				pointer++;
			}
		}
	}
}

//======================================GPIO=========================================================
void init_GPIOA_Ports()
{
	/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;
	//GPIO A UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	GPIO_Init(GPIOA, &init);

	//konfigurerar inport GPIO A
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIO_Ports[0], &init);
}

void init_GPIOB_Ports()
{
	/*  Function used to set the GPIO configuration to the default reset state ****/
	GPIO_InitTypeDef init;
	//GPIO A UTPORTAR
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7;
	init.GPIO_Mode = GPIO_Mode_OUT;
	init.GPIO_OType = GPIO_OType_PP;
	GPIO_Init(GPIOB, &init);

	//konfigurerar inport GPIO A
	GPIO_StructInit(&init);
	init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6;
	init.GPIO_Mode = GPIO_Mode_IN;
	init.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIO_Ports[1], &init);
}

// ========================================= SYSTICK ================================================
volatile uint32_t msTicks = 0; /* Variable to store millisecond ticks */
void SysTick_Handler(void)
{ /* SysTick interrupt Handler. */
	msTicks++;
}
void systick_Init(void)
{
	// Initiera SysTick.
	*((void (**)(void))0x2001C03C) = SysTick_Handler;
	uint32_t returnCode;
	returnCode = SysTick_Config(168000000 / 1000); // Genererar ett SysTick-avbrott varje ms.

	if (returnCode != 0)
	{   // Om inte SysTick_Config lyckas...
		//typ reboot? bootloops är alltid kul
	}
}

void main(void)
{
	init_GPIOA_Ports();
	//init_GPIOB_Ports();

	int amountOfActiveDoors = 0;
	detect_Closed_Doors(&amountOfActiveDoors); // Hur många dörrar är aktiva?
	door active_doors[amountOfActiveDoors];	// Skapa en array med tillräckligt stor size.
	init_Doors(&active_doors[0], amountOfActiveDoors);

	systick_Init();

	/*
	door test1 = {.id = 0, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_3, .GPIO_read = GPIO_Pin_2, .larmTick = 0};
	door test2 = {.id = 1, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_5, .GPIO_read = GPIO_Pin_4, .larmTick = 0};
	door test3 = {.id = 2, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_1, .GPIO_read = GPIO_Pin_0, .larmTick = 0};
	door test4 = {.id = 3, .controlbits = 0, .time_larm = 0, .time_central_larm = 2, .password = 0, .GPIO_lamp = GPIO_Pin_7, .GPIO_read = GPIO_Pin_6, .larmTick = 0};
	
	door active_doors[4] = {test1,test2,test3,test4};
	*/

	while (1)
	{
		for (int i = 0; i < sizeof(active_doors) / sizeof(door); i++)
		{
			if (GPIO_ReadInputDataBit(GPIO_Ports[active_doors[i].GPIO_Type], active_doors[i].GPIO_read))
			{
				active_doors[i].controlbits &= 0xFFFE; //borde va så!
													   //GPIO_ResetBits(GPIO_Ports[0], active_doors[i].GPIO_lamp);
			}
			else
			{
				if (!active_doors[i].controlbits & 1)
				{
					active_doors[i].larmTick = msTicks;
				}
				active_doors[i].controlbits |= 1;

				//GPIO_SetBits(GPIO_Ports[0], active_doors[i].GPIO_lamp);
			}

			for (int i = 0; i < sizeof(active_doors); i++)
			{
				if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * active_doors[i].time_larm))
				{
					GPIO_SetBits(GPIO_Ports[0], active_doors[i].GPIO_lamp);
				}

				else
				{
					GPIO_ResetBits(GPIO_Ports[active_doors[i].GPIO_Type], active_doors[i].GPIO_lamp);
				}
				if (active_doors[i].controlbits & 1 && msTicks > (active_doors[i].larmTick + 1000 * 10 * active_doors[i].time_central_larm))
				{
					//Larma central enheten
				}
			}
		}
	}
}

// Lösenord?
// Detektera dörrar automatiskt.
//
