/*
 * 	startup.c
 *
 */
#include "stm32f4xx.h"
#include "stm32f4xx_usart.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_dma.h"
#include <stdint.h>

//Buffertar for USART
#define fborg
#define BUFFERSIZE 100
uint8_t aTxBuffer[BUFFERSIZE] = "Communication between two USART using DMA";
uint8_t aRxBuffer [BUFFERSIZE] = {55,55,55,55,55,55,55,55,55,44};

void USART_Config(void){
    //Aktiverar klockorna för USART1, Port A och DMA2 
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
    RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_DMA2, ENABLE);
    
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
  
  USART_SendData(USART1,'a');
  USART_SendData(USART1,'q');
  while(DMA_GetCmdStatus(DMA2_Stream7) == DISABLE){
      DMA_Cmd(DMA2_Stream7,DISABLE);
  }
  USART_SendData(USART1,'b');
  while(DMA_GetCmdStatus(DMA2_Stream5) == DISABLE){
      DMA_Cmd(DMA2_Stream5,DISABLE);
  }
  USART_SendData(USART1,'c');
  //Konfigurerar DMA Stream todo channel tx rx todo skriv vilke dma och kanaler som används!
  DMA_InitTypeDef DMA_InitStructure;
  DMA_StructInit(&DMA_InitStructure);
  DMA_InitStructure.DMA_BufferSize = BUFFERSIZE ;
  DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable ;
  DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_1QuarterFull ;
  DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single ;
  DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
  DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
  DMA_InitStructure.DMA_PeripheralBaseAddr =(uint32_t) (&(USART1->DR)) ;
  DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;
  DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
  DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  //Configure TX DMA
  DMA_InitStructure.DMA_Channel = DMA_Channel_4;
  DMA_InitStructure.DMA_DIR = DMA_DIR_MemoryToPeripheral ;
  DMA_InitStructure.DMA_Memory0BaseAddr =(uint32_t)aTxBuffer;
  DMA_Init(DMA2_Stream7,&DMA_InitStructure);
  //Configure RX DMA
  DMA_InitStructure.DMA_Channel = DMA_Channel_4 ;
  DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory ;
  DMA_InitStructure.DMA_Memory0BaseAddr =(uint32_t)aRxBuffer ; 
  DMA_Init(DMA2_Stream5,&DMA_InitStructure);
    
    //Aktiverar DMA för USART1 RX och TX
    USART_DMACmd(USART1, USART_DMAReq_Rx, ENABLE);
    USART_DMACmd(USART1, USART_DMAReq_Tx, ENABLE);
    
    //Startar DMA streams
    DMA_Cmd(DMA2_Stream7, ENABLE);
    DMA_Cmd(DMA2_Stream5, ENABLE);
}

void main() {
    USART_Config();
    
    unsigned long macH = ETH->MACA0HR;

    //Väntar tills DMA2 stream7 är aktiv
    while (DMA_GetCmdStatus(DMA2_Stream7) == DISABLE);
    
    /* Waiting the end of Data transfer */
    //while (USART_GetFlagStatus(USART1,USART_FLAG_TC)==RESET);    
    //while (DMA_GetFlagStatus(DMA1_Stream1,DMA_FLAG_TCIF1)==DISABLE);
      
      /* Clear DMA Transfer Complete Flags */
      //DMA_ClearFlag(DMA1_Stream1,DMA_FLAG_TCIF1);
      /* Clear USART Transfer Complete Flags */
      //USART_ClearFlag(USART1,USART_FLAG_TC); 
  
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
