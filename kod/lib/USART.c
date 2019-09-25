#include "USART.h"

#include "buffer.h"
#include "misc.h"
#include "core_cm4.h"
#include "stm32f4xx_usart.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_rcc.h"
#include <math.h>


//Buffertar för mottagning och sändning
//Pekare för att slippa skicka adresser med & hela tiden
static FIFO *txBuffer, *rxBuffer, realTxBuffer, realRxBuffer;
uint8_t digitToPrintable(uint8_t inDigit);
uint8_t charToPrintable(uint8_t inChar);

//Avbrottshantering för USART1
void USART1_IRQHandler(void){
    //Avbrott orsakat av mottaget meddelande
    if(USART_GetITStatus(USART1, USART_IT_RXNE) == SET){
        //Skriver inkommen medelande till rxBuffer
        bufferPut(rxBuffer, USART_ReceiveData(USART1));
        //Fundering ska vi ha något sätt att meddela att vi
        //har missat meddelande på grund av full buffer?
    }

    //Avbrott orsakat av att registret för sändning är tomt
    if(USART_GetITStatus(USART1, USART_IT_TXE) == SET){
        //Försöker läsa från txBuffer
        uint8_t data;
        uint8_t readOk = bufferGet(txBuffer,&data);

        //Om vi lyckades skickar vi data
        //Annars är buffern tom och vi avativerar avbrott för att skicka
        if(readOk) {
            USART_SendData(USART1,data);
        } else{
            USART_ITConfig(USART1, USART_IT_TXE, DISABLE);
        }
    }
}

//Sätter upp USART1
void USARTConfig(void){
    //Sätter bufferpekarna
    txBuffer = &realTxBuffer;
    rxBuffer = &realRxBuffer;

    //Nollställer vår buffertar
    bufferInit(txBuffer);
    bufferInit(rxBuffer);

    //Aktiverar klockorna för USART1, Port A
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

    //Aktiverar alternativ funktion USART1 för port A pinnar 9 och 10
    GPIO_PinAFConfig(GPIOA, GPIO_Pin_9, GPIO_AF_USART1);
    GPIO_PinAFConfig(GPIOA, GPIO_Pin_10, GPIO_AF_USART1);

    //Konfigurerar USART1 Tx och Rx som alternativ funktion push-pull
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
    /* USARTx konfiguraras enligt:
    - BaudRate = 115200 baud
    - Word Length = 8 Bits
    - One Stop Bit
    - No parity
    - Hardware flow control disabled (RTS and CTS signals)
    - Receive and transmit enabled*/
      USART_InitStructure.USART_BaudRate = 115200;
      USART_InitStructure.USART_WordLength = USART_WordLength_8b;
      USART_InitStructure.USART_StopBits = USART_StopBits_1;
      USART_InitStructure.USART_Parity = USART_Parity_No;
      USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
      USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
    USART_Init(USART1, &USART_InitStructure);

    //Konfigurerar avbrott för USART
    NVIC_InitTypeDef NVIC_InitStructure;
    //4 möjliga gruppprioriteringar
    //4 möjliga undergruppsprioriterinar
    //NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
    NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    //Testar att sätta avbrottsvektorn manuellt
    *((void (**)(void) ) (0x2001C000 + 0xD4) ) = USART1_IRQHandler;

    //Startar USART1
    USART_Cmd(USART1,ENABLE);

    //Aktiverar avbrott vid mottagning av meddelanden
    USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
}

//Lägger till elem till kön för att skicka
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPut (uint8_t elem){
    //Lägger till den i bufferten om det går
    if (bufferPut(txBuffer, elem)){
        //Aktiverar avbrott för att skicka
        USART_ITConfig(USART1, USART_IT_TXE, ENABLE);
        //Alternativ lösning: hålla koll på om avbrott redan är aktivt
        return 1;
    }
    return 0;
}

//Lägger till list till kön för att skicka
//Sköter omvandling mellan sträng i c till rätt tecken i USART. Klarar 0-9 a-z A-Z och mellanslag
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrint(uint8_t *list){
    //En sträng avslutas med null så vi
    //läser tills vi hittar den
    while (*list) {
        //Lägg till alla tecken en efter en
        //Misslyckas vi med en avbryter vi resten
        if (!USARTPut(charToPrintable(*list++))){
            return 0;
        }
    }
    return 1;
}

//Lägger till num som enskilda nummer
//0-9 till kön för att skicka
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrintNum(uint32_t num){
    //Max längd för 32 bitar inbut är 10 digits
    uint8_t digits,digitArr[10];
    digits = (num == 0) ? 1 : ceil(log10(num));

    //Save the digit in reverse to array
    for (uint8_t i = digits; i != 0; i--){
        digitArr[i-1] = digitToPrintable(num % 10);
        num /= 10;
    }

    //Printing
     for (uint8_t i = 0; i != digits; i++){
         if(!USARTPut(digitArr[i])){
             return 0;
         }
     }

    return 1;
}

//Hämta senaste mottagna meddelandet till dest
//Gör ingen omvandling, dvs returnerar det tal som skickades över USART
//Returnerar 1 om det lyckades, dvs det fanns ett meddelande att hämta 0 annars.
uint8_t USARTGet(uint8_t *dest){
    return bufferGet (rxBuffer, dest);
}

//För omvandling från 0-9 heltal till int som kan skrivas
//ut i terminalen. Det fungerar annorluna i simulatorn
uint8_t digitToPrintable(uint8_t inDigit){
        #ifdef SIMULATOR
        if (0 <= inDigit && inDigit <= 9) {
            return ('0' + inDigit);
        }

        return '?';
        #else
        if (0 <= inDigit && inDigit <= 9) {
            //Where 16 is the number for a zero
            return (16 + inDigit);
        }

        return (31); //return ?
        #endif
}

//För omvandling från char till int som kan skrivas ut i terminalen
// hårdvaran.  Det fungerar annorluna i simulatorn
uint8_t charToPrintable(uint8_t inChar){
    #ifdef SIMULATOR
    return inChar;
    #else
    //* används för ny rad
    //10 är ny rad vid utskrift kort -> pc (USARTPut)
    //"*" är 42
    if (inChar == 42) {
        return (10);
    }

    //2 är space vid utskrift kort -> pc (USARTPut)
    //" " är 32
    if (inChar == 32) {
        return (2);
    }

    //16 är 0 vid utskrift kort -> pc (USARTPut)
    //"0" är 48. "9" är 57
    if (48 <= inChar && inChar <= 57) {
        return (16 + inChar - 48);
    }

    //33 är A vid utskrift kort -> pc (USARTPut)
    //"A" är 65.  "Z" är 90
    if (65 <= inChar && inChar <= 90) {
        return (33 + inChar - 65);
    }
    
    //161 är A vid utskrift kort -> pc (USARTPut)
    //"a" är 97. "z" är 122
    if (97 <= inChar && inChar <= 122) {
        return (161 + inChar - 97);
    }

    //else return ?
    return (31);
    #endif
}