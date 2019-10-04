#include "USART.h"

#include "delay.h"
#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_rng.h"
#include "stm32f4xx_rcc.h"

uint8_t tryRandomizeCANMsg(CanTxMsg *msg);
uint8_t can_init();
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void main(void) {
    USARTConfig();
    can_init();
    
    //Initsierar random number generator
    RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
    
    CanTxMsg canMsg;

    USARTPrint("\nStarted\n");
                    
    while (1) {
        //Ändra fördröjningen för att justera hur mycket snabbt data som skickas
        blockingDelayus(100000);
        
        tryRandomizeCANMsg(&canMsg);
        
        //Prova att skicka
        if (CAN_Transmit(CAN1, &canMsg) == CAN_TxStatus_NoMailBox){
            USARTPrint("no mailbox empty\n");
        }
    }
}

uint8_t can_init() {
	CAN_InitTypeDef CAN_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	CAN_FilterInitTypeDef CAN_FilterInitStructure;
	GPIO_InitTypeDef GPIO_InitStructure;

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_CAN1, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	
	// Connect CAN pins to AF9. See more below
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_CAN1);
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource8, GPIO_AF_CAN1);  

	// Configure CAN RX and TX pins
	// See page 41 of MD407 reference manual
	// Connect CAN1 pins to AF
    // PB9 - CAN1 TX
    // PB8 - CAN1 RX
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_CAN1);  	
    GPIO_PinAFConfig(GPIOB, GPIO_PinSource8, GPIO_AF_CAN1);  

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);	

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;	
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;	
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
	 
	/* CAN register init */
	CAN_DeInit(CAN1);

	/* CAN filter init */
	CAN_FilterInitStructure.CAN_FilterNumber = 0;
	CAN_FilterInitStructure.CAN_FilterMode = CAN_FilterMode_IdMask;
	CAN_FilterInitStructure.CAN_FilterScale = CAN_FilterScale_32bit;
	CAN_FilterInitStructure.CAN_FilterIdHigh = 0x0000;
	CAN_FilterInitStructure.CAN_FilterIdLow = 0x0000;
	CAN_FilterInitStructure.CAN_FilterMaskIdHigh = 0x0000;
	CAN_FilterInitStructure.CAN_FilterMaskIdLow = 0x0000;
	CAN_FilterInitStructure.CAN_FilterFIFOAssignment = 0;
	CAN_FilterInitStructure.CAN_FilterActivation = ENABLE;
	CAN_FilterInit(&CAN_FilterInitStructure);
	
	/* CAN cell init */
	CAN_InitStructure.CAN_TTCM = DISABLE; // time-triggered communication mode = DISABLED
    CAN_InitStructure.CAN_ABOM = DISABLE; // automatic bus-off management mode = DISABLED
    CAN_InitStructure.CAN_AWUM = DISABLE; // automatic wake-up mode = DISABLED
    CAN_InitStructure.CAN_NART = DISABLE; // non-automatic retransmission mode = DISABLED
    CAN_InitStructure.CAN_RFLM = DISABLE; // receive FIFO locked mode = DISABLED
    CAN_InitStructure.CAN_TXFP = DISABLE; // transmit FIFO priority = DISABLED
    CAN_InitStructure.CAN_Mode = CAN_Mode_Normal; // normal CAN mode

	/* CAN Baudrate = 1 MBps (CAN clocked at 30 MHz) */
	CAN_InitStructure.CAN_BS1 = CAN_BS1_3tq;
	CAN_InitStructure.CAN_BS2 = CAN_BS2_4tq;
	CAN_InitStructure.CAN_Prescaler = 7;
	
	uint8_t can_init_status = CAN_Init(CAN1, &CAN_InitStructure);
	
	return can_init_status;
}

//Slumpar ett meddelande, RNG måste ha initsieras innan användning
uint8_t tryRandomizeCANMsg(CanTxMsg *msg){
    //kollar om vi kan hämta ett nytt slumptal
     if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
             RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
             RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
                    uint32_t rand = RNG_GetRandomNumber();
                    //skriv meddelande
                    msg->StdId = rand;
                    msg->ExtId = rand;
                    msg->IDE = CAN_Id_Standard; //Alternativen är CAN_Id_Standard eller FCAN_Id_Extended
                    msg->RTR = CAN_RTR_Data;
                    msg->DLC = 8;
                    for (uint8_t i = 0; i < 7; i++){
                        msg->Data[i] = ((uint8_t *) &rand)[i%4];
                    }

                    return 1;
    }
    return 0;
}