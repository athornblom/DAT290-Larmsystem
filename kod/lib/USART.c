#include "USART.h"

#include "buffer.h"
#include "misc.h"
#include "core_cm4.h"
#include "stm32f4xx_usart.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_rcc.h"
#include <math.h>

//USART använder Port A pinnarna 9 och 10

//Buffertar för mottagning och sändning
//Pekare för att slippa skicka adresser med & hela tiden
static FIFO *txBuffer, *rxBuffer, realTxBuffer, realRxBuffer;
/*uint8_t digitToPrintable(uint8_t inDigit);
uint8_t charToPrintable(uint8_t inChar);*/

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
    //Utan initsiering fungerar det utan "krumelurer"
    //USART_Init(USART1, &USART_InitStructure);

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
//Om show error är 0 så visas inte fel
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPut (uint8_t elem, uint8_t showError){
    //Avaktiverar avbrott för sändning för att inte tillåta avbrott under skrivning till buffern
    USART_ITConfig(USART1, USART_IT_TXE, DISABLE);

    //Lägger till den i bufferten om det går
    uint8_t retVal = bufferPut(txBuffer, elem);

    //Om buffern blivift full skriver vi en stjärna för att visa problemet
    if(showError && !retVal){
        bufferOverrideLast(txBuffer, '*');
    }

    //Aktiverar avbrott för sändning igen
    USART_ITConfig(USART1, USART_IT_TXE, ENABLE);

    return retVal;
}

//Lägger till list till kön för att skicka
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrint(uint8_t *list){
    //Kan inte lägga till en tom sträng
    if (*list == 0){
        return 0;
    }

    //En sträng avslutas med null så vi
    //läser tills vi hittar den
    while (*list) {
        //Lägg till alla tecken en efter en
        //Misslyckas vi med en avbryter vi resten
        if (!USARTPut(*list++, 1)){
            return 0;
        }
    }
    return 1;
}

//Lägger till list till kön för att skicka.
//Väntar till det lyckas.
void USARTWaitPrint(uint8_t *list){
    //En sträng avslutas med null så vi
    //läser tills vi hittar den
    while (*list) {
        //Väntar tills tecknet är tillagt
        while (!USARTPut(*list, 0));
        list++;
    }
}

//Lägger till num som enskilda nummer
//base anger vilken bas
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrintNumBase(uint32_t num, uint8_t base){
    if (base == 0 || base == 1){
        return 0;
    }

    //Max längd är 32 bitar vid base = 2
    uint8_t index = 0,digitArr[32];

    //Sparar tecknen i arrayn
    do {
        uint8_t digit = num % base;
        digitArr[index++] = digit >= 10 ? 'A' + digit - 10 : '0' + digit;
        num /= base;
    } while (num);

    //Printar
    while(index){
         if(!USARTPut(digitArr[--index], 1)){
             return 0;
         }
     }

    return 1;
}

//Lägger till num som enskilda nummer
//0-9 till kön för att skicka
//Returnerar 1 om det lyckades, 0 annars.
uint8_t USARTPrintNum(uint32_t num){
    USARTPrintNumBase(num, 10);
}

//Skriver ut en pointer av length bytes staratndes från ptr
//Returerar 1 om det lyckades 0 annars
uint8_t USARTPrintPtr(uint8_t *ptr, uint8_t length, uint8_t base){
    for (uint8_t i = length; i > 0; i--){
        //Skriver ut en byte
        if (!USARTPrintNumBase(*(uint8_t *)(ptr + i - 1), base)){
            return 0;
        }

        //Ett bindesträck mellan varje byte
        if (i > 1){
            if(!USARTPrint("-")){
                return 0;
            }
        }
    }
    return 1;
}

//Hämta senaste mottagna meddelandet till dest
//Gör ingen omvandling, dvs returnerar det tal som skickades över USART
//Returnerar 1 om det lyckades, dvs det fanns ett meddelande att hämta 0 annars.
uint8_t USARTGet(uint8_t *dest){
    //Avaktiverar avbrott för mottagning för att inte gå till avbrottet under läsning från buffern.
    USART_ITConfig(USART1, USART_IT_RXNE, DISABLE);

    //Läser från buffern
    uint8_t retVal =  bufferGet (rxBuffer, dest);

    //Aktiverar avbrott igen
    USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);

    return retVal;
}

//För omvandling från 0-9 heltal till int som kan skrivas
//ut i terminalen. Det fungerar annorluna i simulatorn
/*uint8_t digitToPrintable(uint8_t inDigit){
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
}*/

//För omvandling från char till int som kan skrivas ut i terminalen
// hårdvaran.  Det fungerar annorluna i simulatorn
/*uint8_t charToPrintable(uint8_t inChar){
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
}*/