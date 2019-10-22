#include "CAN.h"
#include "USART.h"
#include "printMsg.h"
#include "delay.c"
#include "stringFunc.h"

typedef struct {
    //Om IDE är 1 är ID 29 bitar EXTID
    //OM IDE är 0 är ID 11 bitar STDID
    uint32_t ID;

    //1 för extended 0 för standard
    uint8_t IDE : 1;

    //om 1 är det remote om 0 data frame
    uint8_t RTR : 1;

    //Datafältets längd
    uint8_t DLC : 4;
} HeaderInfo;

//Egen struktur för meddelanden då CanTxMsg/CanRxMsg har mycket overhead
typedef struct {
    HeaderInfo header;
    uint8_t data[8];
    //Delay i ms sedan start dvs kan räka nästan 1200 timmar
    uint32_t delay;
} MsgUnit;

#define MAXCOMMANDLENGTH 12
#define SAVEDMSGS 1000
#define NOMODE 0
#define RECORDMODE 1
#define REPLAYMODE (1<<1)
uint8_t currentMode = NOMODE;
uint16_t savedMsgsIndex = 0;
uint16_t replayIndex = 0;
MsgUnit savedMsgs[SAVEDMSGS];
volatile uint32_t msTicks = 0;
uint32_t recordStarted = 0;
uint32_t replayStarted = 0;

uint8_t Command(uint8_t *command);
void exitRecordMode (void);

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

//SysTick interrupt Handler.
void SysTick_Handler(void){
	msTicks++;
}

void systick_Init(void){
    msTicks = 0;
	*((void (**)(void))0x2001C03C) = SysTick_Handler;
	uint32_t returnCode;
    //Genererar ett SysTick-avbrott varje ms.
	returnCode = SysTick_Config(168000000 / 1000);
}

//Handler för mottagna meddelande som ska spelas in
void record(CanRxMsg *msg){
    if (savedMsgsIndex < SAVEDMSGS){
        //Kopierar meddelandet
        savedMsgs[savedMsgsIndex].header.RTR = (msg->RTR == CAN_RTR_Remote);
        uint8_t IDE = (msg->IDE == CAN_Id_Extended);
        savedMsgs[savedMsgsIndex].header.IDE = IDE;
        if (IDE){
            savedMsgs[savedMsgsIndex].header.ID = msg->ExtId;
        } else {
            savedMsgs[savedMsgsIndex].header.ID = msg->StdId;
        }

        savedMsgs[savedMsgsIndex].header.DLC = msg->DLC;
        for (uint8_t i = 0; i < msg->DLC; i++){
            savedMsgs[savedMsgsIndex].data[i] = msg->Data[i];
        }

        savedMsgs[savedMsgsIndex].delay = msTicks - recordStarted;

        //Ökar index variabel
        savedMsgsIndex++;

        USARTPrint("Recorded:\n");
        printRxMsg(msg, 16);
        USARTPrint("\n\n");
    } else {
        USARTPrint("Full inspelningsbuffer, avslutar record-mode");
        exitRecordMode();
    }
}

//Återupprepar inspelad trafik efter bästa förmåga
//Loopar efter att ha spelat alla meddelanden
void replay(void){    
    //Om vi kommit till sista sparade meddelandet startar vi om (loopar)
    if (replayIndex >= savedMsgsIndex){
        replayIndex = 0;
        replayStarted = msTicks;
    }

    //Kollar vi om det är dax att spela upp nästa meddelande
    if (savedMsgs[replayIndex].delay <= msTicks - replayStarted) {
        MsgUnit savedMsg = savedMsgs[replayIndex++];
        CanTxMsg msg;

        if (savedMsg.header.IDE){
            msg.IDE = CAN_Id_Extended;
            msg.ExtId = savedMsg.header.ID;
        } else {
            msg.IDE = CAN_Id_Standard;
            msg.StdId = savedMsg.header.ID;
        }

        if (savedMsg.header.RTR){
            msg.RTR = CAN_RTR_Remote;
        } else {
            msg.RTR = CAN_RTR_Data;
        }

        msg.DLC = savedMsg.header.DLC;
        for(uint8_t i = 0; i < msg.DLC; i++){
            msg.Data[i] = savedMsg.data[i];
        }

        if (CANsendMessage(&msg) != CAN_TxStatus_NoMailBox){
            USARTPrint("Skickade:\n");
            printTxMsg(&msg, 16);
            USARTPrint("\n\n");
        } else {
            USARTPrint("Misslyckades med att  skicka meddelande\n");
        }
    }
}

//Aktiverar återuppspelningsläge 
//returnerar 1 om det lyckades, 0 annars
uint8_t enterRecordMode (void){
    USARTPrint("Startar inspelnings-mode. Aktiverar foljande handler:\n");
    
    //Mask som accepterar alla meddelanden
    CANFilter mask = {0, 0, 0, 0};

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

    //Aktiverar handler för ID begäran
    if (CANhandlerListNotFull()){
        USARTWaitPrint("Handler for alla meddelanden med handler index: ");
        USARTPrintNum(CANaddFilterHandler(record, &mask, &mask));
        USARTWaitPrint("\n");
        currentMode |= RECORDMODE;
        recordStarted = msTicks;
    } else {
        return 0;
    }

    return 1;
}

//Avaktiverar återuppspelningsläge
//returnerar 1 om det lyckades, 0 annars
void exitRecordMode (void){
    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();
}

//Hjälputskrift
void help(void){
    USARTWaitPrint("Kommandon:\nrecord for starta record-mode\nexit record for att avsluta record-mode\n");
    USARTWaitPrint("replay for att starta replay\nexit replay for att avsluta replay\nclear for att avlsuta alla aktiva modes och ta bort inspelning\n");
    USARTWaitPrint("info for info\n? for denna hjalp\n");
}

//Kör kommandot som finns i strängen command
//Retrunrerar 1 det fanns ett kommando att köra. 0 annars.
uint8_t Command(uint8_t *command){
    //Ett tomt komando är ett gilltigt kommando.
    //Detta för att man ska kunna få en ny rad utan ogilltigt kommando utskrift
    if (command[0] == 0){
        return 1;
    }

    if (strEqual(command, "record")){
        if (enterRecordMode()){
            currentMode |= RECORDMODE;
            USARTWaitPrint("Start av record-mode lyckades\n");
        } else {
            USARTWaitPrint("Start av record-mode misslyckades\n");
        }
        return 1;
    }

    else if (strEqual(command, "replay")) {
        if (savedMsgsIndex > 0){
            currentMode |= REPLAYMODE;
            //Börjar från första meddelandet
            replayIndex = 0;
            replayStarted = msTicks;
            USARTPrint("Replay-mode startat\n");
        } else {
            USARTPrint("Inget inspelat, kunde inte starta replay-mode\n");
        }
        return 1;
    }

    else if (strEqual(command, "exit record")) {
        if (currentMode & RECORDMODE){
            exitRecordMode();
            currentMode &= ~RECORDMODE;
            USARTWaitPrint("Avslutade record-mode\n");
        } else {
            USARTPrint("Ar inte i record-mode\n");
        }
        return 1;
    }

    else if (strEqual(command, "exit replay")) {
        if (currentMode & REPLAYMODE){
            currentMode &= ~REPLAYMODE;
            USARTWaitPrint("Avslutade av replay-mode\n");
        } else {
            USARTPrint("Ar inte i replay-mode\n");
        }
        return 1;
    }

    else if (strEqual(command, "clear")){
        if (currentMode & RECORDMODE){
            exitRecordMode();
            currentMode &= ~RECORDMODE;
            USARTWaitPrint("Avslutade record-mode\n");
        }

        if (currentMode & REPLAYMODE){
            currentMode &= ~REPLAYMODE;
            USARTWaitPrint("Avslutade replay-mode\n");
        }

        USARTPrint("Tar bord sparade meddelanden\n");
        savedMsgsIndex = 0;

        return 1;
    }

    else if (strEqual(command, "info")){
        USARTPrint("Info: \n");
        if (currentMode & RECORDMODE){
            USARTWaitPrint("Record-mode aktivt\n");
        } else {
            USARTWaitPrint("Record-mode inte aktivt\n");
        }
        if (currentMode & REPLAYMODE){
            USARTWaitPrint("Replay-mode aktivt\n");
        } else {
            USARTWaitPrint("Replay-mode inte aktivt\n");
        }
        
        USARTPrintNum(savedMsgsIndex);
        USARTPrint(" inspelade meddelanden\n");

        return 1;
    }

    else if (strEqual(command, "?")){
        help();

        return 1;
    }

    return 0;
}

//Hanterar länken mellan USART och commando. Dvs kör de kommandon som skrivs från USART
void USARTCommand(void) {
    //Lista för nuvarande kommando + 1 för att ha plats för terminering
    static uint8_t currentCommand[MAXCOMMANDLENGTH + 1];
    static uint8_t index = 0;
    static uint8_t newCommand = 1;

    if (newCommand) {
        newCommand = 0;
        USARTWaitPrint(">>");
    }

    uint8_t uint8Read;

    if (USARTGet(&uint8Read)){
        if(uint8Read == '\r' || uint8Read == '\n'){
            USARTPrint("\n");
            //Terminering
            currentCommand[index] = 0;
            index = 0;
            newCommand = 1;
            if (!Command(currentCommand)){
                USARTWaitPrint("Kommandot:");
                USARTWaitPrint(currentCommand);
                USARTWaitPrint(" hittades inte\n");
            }

        } else {
            //Check om vi skriver ett för lång kommando
            if (index >= MAXCOMMANDLENGTH){
                USARTPrint("\nFor langt kommando\n");
                index = 0;
                newCommand = 1;
            } else {
                //Skriver ut tecknet
                uint8_t oneChar[2] = {uint8Read, 0};
                USARTPrint(oneChar);

                //Lägger till bokstav till kommandot
                currentCommand[index++] = uint8Read;

                //Terminering
                currentCommand[index] = 0;
            }
        }
    }
}

void main(void) {
    USARTConfig();
    can_init();
    systick_Init();
    USARTPrint("\n");
    help();

    while (1) {
        USARTCommand();
        if (currentMode & REPLAYMODE){
            replay();
        }
    }
}