#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

#define E_MODER ((unsigned int *) 0x40021000)
#define D_MODER ((unsigned int *) 0x40020C00)

#define D_ODR_LOW ((unsigned char *) 0x40020C14)
#define E_IDR_LOW ((unsigned char *) 0x40021010)
#define E_ODR_LOW ((unsigned char *) 0x40021014)


#define	CAN1_IRQ_VECTOR		(0x2001C000+0x90)
#define __CAN_IRQ_PRIORITY		2

CanRxMsg RxMessage;
CanTxMsg TxMessage;

unsigned int id;
unsigned int messages_to_send;
unsigned char light;
unsigned int counter;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void toggle_light() {
	light = ~light;
}

uint8_t send_can_message()
{
	CanTxMsg msgstorage;
	CanTxMsg* msg = &msgstorage;
	msg->StdId = id;
    msg->ExtId = 0x01;
	msg->RTR = CAN_RTR_DATA;
    msg->IDE = CAN_ID_STD;
    msg->DLC = 0;
	return CAN_Transmit(CAN1, msg);
}

void can_irq_handler(void)
{
    CanRxMsg rxMsg;
    if(CAN_MessagePending(CAN1, CAN_FIFO0)) {
		CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);
		toggle_light();
		if(id == 101) {
			messages_to_send++;
			counter = 3000000;
		}
    }
}

uint8_t can_init()
{
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
    
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
        GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);	

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;	
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_OType = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;	
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	NVIC_InitStructure.NVIC_IRQChannel = CAN1_RX0_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = __CAN_IRQ_PRIORITY;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x2;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
	 
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
	
	*((void (**)(void) ) CAN1_IRQ_VECTOR ) = can_irq_handler;
	// We need the following function because it's not equivalent to what NVIC_Init does with respect
	// to IRQ priority. Which seems bananas to me...
    NVIC_SetPriority( CAN1_RX0_IRQn, __CAN_IRQ_PRIORITY);
	CAN_ITConfig(CAN1, CAN_IT_FMP0, ENABLE);
	
	return can_init_status;
}


void main(void) {
	id = 101; // listener id
	messages_to_send = 0;
	counter = 0;
	
	// Help us determine if CAN got started at all. 0 = bad. 1 = good.
	light = can_init();
	
	unsigned char remembered_value = 0;
	
	*D_MODER = 0x5555;
	*E_MODER = 0x5500;
	
	while(1) {
		// Artifical delays avoids problems with bouncing contacts and makes it easier
		// to see in which order messages pop up.
		if(counter > 0) {
			counter--;
			// Reset input board while we wait. Any press during a waiting period is invalid anyway
			*E_ODR_LOW = 0x70;
			*E_ODR_LOW = 0x0;
		} else {
			// Here we send messages either in response to received messages(board without buttons)
			// or due to button being pressed by the user.
			if(messages_to_send > 0) {
				send_can_message();
				messages_to_send--;
			}
			
			unsigned char read_value = (*E_IDR_LOW & 1);
			if(remembered_value != read_value) {
				// Save state
				remembered_value = read_value;
				if(remembered_value) {
					// So we went from 0->1? Then send an empty CAN message
					id = 102; // Setting ourselves as sender
					// Lazy delay function to mask bouncing contacts
					// Also creates delay to demonstrate messages going back and forth
					counter = 3000000;
					messages_to_send++;
				}
			}
		}
		*D_ODR_LOW = light;
	}
}