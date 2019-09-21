/*
 * 	startup.c
 *
 */
#include "stm32f4xx.h"
#include "stm32f4xx_usart.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_rcc.h"
#include <stdint.h>

//Buffertar for USART
#define BUFFERSIZE 100
uint8_t aTxBuffer[BUFFERSIZE];
uint8_t aRxBuffer [BUFFERSIZE];

void USART_Config(void){
    //Aktiverar klockorna för USART1, Port A 
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
    
    //Aktiverar alternativ funktion USART1 för port A pinnar 9 och 10
    GPIO_PinAFConfig(GPIOA, GPIO_Pin_9, GPIO_AF_USART1);
    GPIO_PinAFConfig(GPIOA, GPIO_Pin_10, GPIO_AF_USART1);
    

    /* Konfigurerar USART1 Tx och Rx som alternativ funktion push-pull */
    GPIO_InitTypeDef GPIO_InitStructure;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
    //Pinne 9 är TX
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    //Pinne 10 är RX
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
  
    //Konfigurerar USART1
    USART_InitTypeDef USART_InitStructure;
      /* USARTx configured as follows:
            - BaudRate = 115200 baud  
            - Word Length = 8 Bits
            - One Stop Bit
            - No parity
            - Hardware flow control disabled (RTS and CTS signals)
            - Receive and transmit enabled
      */
      USART_InitStructure.USART_BaudRate = 115200;
      USART_InitStructure.USART_WordLength = USART_WordLength_8b;
      USART_InitStructure.USART_StopBits = USART_StopBits_1;
      USART_InitStructure.USART_Parity = USART_Parity_No;
      USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
      USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
    USART_Init(USART1, &USART_InitStructure);
    
    //Startar USART1
    USART_Cmd(USART1,ENABLE);
}

void main() {
    USART_Config();
    
    unsigned long macH = ETH->MACA0HR;
  
  USART_SendData(USART1,'a');
  
   uint8_t current;
    uint8_t lastRead;
    
    while (1) {
        //USART_SendData(USART1,57);
        current = USART_ReceiveData(USART1);
        if(current != lastRead){
                USART_SendData(USART1,current);
                lastRead = current;
        }
    }
    
    /*for (uint32_t i = 0; i < 200; i++){
        USART_SendData(USART1,i);
    }*/
    return;
}

// **** Boilerplate startup code ****
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup( void ) {
    __asm volatile(
      " LDR R0,=0x2001C000\n"		/* set stack */
      " MOV SP,R0\n" 
      " BL main\n" 	    /* call main */
      " B ."
      );
}
