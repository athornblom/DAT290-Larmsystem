#include "keypad.h"
#include "buffer.h"
#include "misc.h"
#include "delay.h"
#include "stm32f4xx_gpio.h"
#include "stm32f4xx.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_syscfg.h"
#include "stm32f4xx_exti.h"

void keyPad_IRQ(void);
static FIFO *keyBuffer, realKeyBuffer;

//Se till att keyMatrix har lika många rader som element i rowsPins
//och lika många kolumner som element i colPins.
#define KEYPAD_COLS 4
#define KEYPAD_ROWS  4
static const uint8_t keyMatrix[KEYPAD_ROWS][KEYPAD_COLS] = {{0x1, 0x2, 0x3, 0xa},
                                             {0x4, 0x5, 0x6, 0xb},
                                             {0x7, 0x8, 0x9, 0xc},
                                             {0xe, 0x0, 0xf, 0xd}};
static const uint16_t colPins[KEYPAD_COLS] = {GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11};
static const uint16_t rowPins[KEYPAD_ROWS] = {GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};

//Läser senaste tecknet från keypaden till dest
//Returnerar 1 om det fanns att läsa 0 annars
uint8_t readKeypad(uint8_t *dest){
    return bufferGet(keyBuffer, dest);
}

//Rensar kön som man läser ifrån med readKeypad
void clearKeypadQue(void){
    bufferInit(keyBuffer);
}

void setRows(uint8_t set){
    //Skriver raderna alla rader enligt set
    uint16_t pins = 0;
    for (uint8_t row = 0; row < KEYPAD_ROWS; row++){
        pins |= rowPins[row];
    }
    if(set) {
        GPIO_SetBits(GPIOE, pins);
    } else {
        GPIO_ResetBits(GPIOE, pins);
    }
}

void setEXTI0(FunctionalState state){
    //konfigurera SYSCFG
    SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOE, EXTI_PinSource0);

    //Konfigurerar EXTI0
    //state avgör om den är aktiv eller inte
    EXTI_InitTypeDef EXTI_InitStructure;
    EXTI_InitStructure.EXTI_Line = EXTI_Line0;
    EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
    EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
    EXTI_InitStructure.EXTI_LineCmd = state;
    EXTI_Init(&EXTI_InitStructure);
}

//Avbrottsrutin för keypad
void keyPad_IRQ(void){
    //Delay för att utvänta kontaktstuds
    blockingDelayMs(1);

    //Avaktiverar EXTI0 för att undvika rekursion
    setEXTI0(DISABLE);

    //Sätter raderna låga för att sedan sätta dem en och en
    setRows(0);

    //Loopar igenom alla rader
    for (uint8_t row = 0; row < KEYPAD_ROWS; row++){
        //Sätter raden hög
        GPIO_SetBits(GPIOE, rowPins[row]);
        //Läser av kolumnerna och sparar knapptryckningar i bufferter
        uint16_t activeCols = GPIO_ReadInputData(GPIOE);
        for (int col = 0; col < KEYPAD_COLS; col++){
            if (activeCols & colPins[col]){
                bufferPut(keyBuffer, keyMatrix[row][col]);
                //TODO REMOVE
                //USARTPrint("FOUND*");
            }
        }

        //Sätter raden låg
        GPIO_ResetBits(GPIOE, rowPins[row]);
    }

    //Sätter raderna höga efter att vi har utfört avbrottet
    setRows(1);

    //Clearar avbrottet
    EXTI_ClearITPendingBit(EXTI_Line0);

    //Aktiverar avbrott igen
    setEXTI0(ENABLE);
}

//Initierar keypad för port PE8-15 med avbrott från gul banankontakt kopplad till PE0
void keypadnit(){
    //Initierar systick
    systick_Init();

    //Tnitsierar buffer
    keyBuffer = &realKeyBuffer;
    bufferInit(keyBuffer);

    //Startar klockorna för PE och för SYSCFG (för att kunna aktivera EXTI avbrott)
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

    //Konfigurerar pinnarna i PE för keypad
    GPIO_InitTypeDef GPIO_InitStructure;
    GPIO_StructInit(&GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    //Konfigurerar PE0 och PE8-11 som ingångar pull-down
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_10 | GPIO_Pin_11;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_DOWN;
    GPIO_Init(GPIOE, &GPIO_InitStructure);

    //Konfigurerear PE12-15 som utgångar push-pull
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_Init(GPIOE, &GPIO_InitStructure);

    //Konfigurerar avbrott för PE0 3 steg
    //1 aktiverar EXTI
    setEXTI0(ENABLE);

    //2 konfigurera NVIC
    NVIC_InitTypeDef NVIC_InitStructure;
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
    NVIC_InitStructure.NVIC_IRQChannel = EXTI0_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 3;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 3;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    //3 Sätter avbrottsvektorn manuellt
    *((void (**)(void) ) (0x2001C000 + 0x58) ) = keyPad_IRQ;

    //Skriver raderna höga för att detektera knapptryckning som genererar avbrott
    setRows(1);
}