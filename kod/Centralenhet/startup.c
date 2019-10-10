//Centralenhet

#include "CAN.h"
#include "USART.h"
#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"
#include "delay.c"

#define MAXCOMMANDLENGTH 10

CanRxMsg RxMessage;
CanTxMsg TxMessage;


typedef struct{
    uint8_t id;
    uint8_t num_of_doors;
} Door_device;

typedef struct{
    uint8_t id;
    uint32_t dist_threshold;
} Motion_device;

uint8_t next_id = 50;

void *devices[128];
Door_device door_devs[128];
uint32_t messages_to_send;
uint8_t light;
uint32_t counter;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
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


Door_device *get_door_device(uint8_t id){
    return (Door_device*) (devices[id]);
    //return &door_devs[id];
}

//Denna funktion ska alltid användas för att lägga till en ny dörrenhet
Door_device *add_door_device(uint8_t id){
    Door_device dev;
    dev.id = id;
    door_devs[id] = dev; //Lägger dev i array av faktiska strukturinstanser för att undvika att den skrivs över
    devices[id] = (void*)(&door_devs[id]);
    return &door_devs[id];
}

//Använder MAC-adress för att tilldela en enhet ett id
void assign_id(unsigned int mac, unsigned char id){
    
}

//Ställer in de två tiderna för en dörr
void config_door(unsigned char id_device, unsigned char id_door, unsigned int time0, unsigned int time1) {
    
}

/*void setup_doors(){
    Door_device door_dev;
        
        door_dev = door_devs[i];
        //TODO: Fråga via usart om användaren vill konfigurera antal dörrar
        //TODO: Om ja, lägg antal dörrar i door_dev.num_of_doors
        
        num_of_doors = door_dev.num_of_doors;
        
        
        for(unsigned int j = 0; j < num_of_doors; j++){
            
        }
}*/

void id_request_handler(CanRxMsg *rxMsgP){
    //TODO REMOVE
    USARTPrint("In irq handler\n");
    
    CanRxMsg rxMsg = *rxMsgP;
    CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);
    //TODO hantera meddelandet
    
    
    if (rxMsg.IDE == CAN_Id_Standard){ //standard meddelande
        
        CanTxMsg txMsg;
        encode_assign_id(&txMsg, next_id);
        if (send_can_message(&txMsg) == CAN_TxStatus_NoMailBox){
            USARTPrint("No mailbox empty\n");
        }
        else{
            blockingDelayMs(300);
            Door_device *dev = add_door_device(next_id);
            USARTPrint("Lagt till dorrenhet med id ");
            
            uint8_t id = get_door_device(next_id)->id;
            USARTPrintNum((uint32_t)id);
            USARTPrint("\n");
            next_id++;
            
        }
        
        USARTPrint("StdId ");
        USARTPrintNum((uint32_t)rxMsg.StdId & 0x7FF);
    }
    USARTPrint("\nData ");
    USARTPrintNum((uint32_t)rxMsg.Data);
    USARTPrint("\n");

}

void add_id_request_handler(void){
    
    CANFilter filter;
    filter.STDID = 0b10110000000;
    filter.EXDID = 0;
    filter.IDE = 0;
    filter.RTR = 0;
    uint8_t index;
    
    CANFilter mask;
    mask.STDID = 0b11111111111;
    mask.EXDID = 0;
    mask.IDE = 0;
    mask.RTR = 0;
    
    if (CANhandlerListNotFull()){
        USARTPrint("handler list not full\n");
        index = CANaddFilterHandler(id_request_handler, &filter, &mask);
        USARTPrintNum(index);
    }
}
/*
void add_handler(void){
    
    CANFilter filter;
    filter.STDID = 0b10110000000;
    filter.EXDID = 0;
    filter.IDE = 0;
    filter.RTR = 0;
    uint8_t index;
    
    CANFilter mask;
    mask.STDID = 0b11111111111;
    mask.EXDID = 0;
    mask.IDE = 0;
    mask.RTR = 0;
    
    if (CANhandlerListNotFull()){
        USARTPrint("handler list not full\n");
        index = CANaddFilterHandler(can_handler, &filter, &mask);
        USARTPrintNum(index);
    }
}*/

uint8_t msgPrint(CanRxMsg *msg, uint8_t base){
    USARTPrint("New msg:\n");

    //Skriver ut ID
    if (msg->IDE == CAN_Id_Standard) {
        USARTPrint("STD ID: \n");
        USARTPrintNumBase(msg->StdId, base);
    } else {
        USARTPrint("Ext ID: \n");
        USARTPrintNumBase(msg->ExtId, base);
    }

    USARTPrint("\nData: \n");
    for (uint8_t i = 0; i < msg->DLC; i++){
        USARTPrintNumBase(msg->Data[i],base);
    }
    USARTPrint("\n\n");
}

void confMsg(CanRxMsg *msg){
    USARTPrint("Nytt konf msg:\n");
    msgPrint(msg, 16);
}

uint8_t enterConfMode (void){
    uint8_t retIndex;
    CANFilter filter;
    CANFilter mask;
    mask.STDID = 0b11110000000;
    mask.EXDID = 0;
    mask.IDE = 1;
    mask.RTR = 1;

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

    //Filter för ID-Begäran
    filter.STDID = 0b10010000000;
    filter.EXDID = 0;
    filter.IDE = 0;
    filter.RTR = 1;

    //Aktiverar handler för ID begäran
    if (CANhandlerListNotFull()){
        //TODO skriv handler för ID och skriv klart raden nedan
        //retIndex = CANaddFilterHandler(idHandler, &filter, &mask);
        USARTPrintNum(retIndex);
        USARTPrint("\n");
    } else {
        USARTPrint("Error handler list not empty\n");
        return 0;
    }

    //Filter för mottagen konfiguration
    filter.STDID = 0b01010000000;
    filter.EXDID = 0;
    filter.IDE = 0;
    filter.RTR = 1;

    //Aktiverar handler för ID begäran
    if (CANhandlerListNotFull()){
        //TODO skriv handler för mottagen konfiguration och skriv klart raden nedan
        //retIndex = CANaddFilterHandler(confHandler, &filter, &mask);
        USARTPrintNum(retIndex);
        USARTPrint("\n");
    } else {
        USARTPrint("Error handler list not empty\n");
        return 0;
    }
    return 1;
}

uint8_t enterStdMode (void){
     uint8_t retIndex;
    CANFilter filter;
    CANFilter mask;
    mask.STDID = 0b11110000000;
    mask.EXDID = 0;
    mask.IDE = 1;
    mask.RTR = 1;

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

    //Filter för Larm
    filter.STDID = 0b00110000000;
    filter.EXDID = 0;
    filter.IDE = 0;
    filter.RTR = 1;

    //Aktiverar handler för larm
    if (CANhandlerListNotFull()){
        //TODO skriv handler för larm och skriv klart raden nedan
        //retIndex = CANaddFilterHandler(larmHandler, &filter, &mask);
        USARTPrintNum(retIndex);
        USARTPrint("\n");
    } else {
        USARTPrint("Error handler list not empty\n");
    }
}

//Jämför två strängar. Returnerar 1 om de är lika. 0 annars.
uint8_t strEqual(uint8_t *str1, uint8_t *str2){
    //Loopa så länge vi inte nått slutet på någon av strängarna
    while (*str1 && *str2) {
        //Skiljer sig tecknen åt, returnera 0
        //Flyttar också pekarna
        if (*str1++ != *str2++){
            return 0;
        }
    }

    //De är endast lika om de hitills varit lika och de slutar samtidigt
    return *str1 == *str2;
}

//Kollar om str1 börjar med str2. Returnerar 1 om det är så. 0 annars.
uint8_t strStartsWith(uint8_t *str1, uint8_t *str2){
    //Loopa tills vi kommer till slutet av str2
    while(*str1 && *str2){
        //Skiljer sig tecknen åt returnera 0
        //Flyttar också pekaren
        if (*str1++ != *str2++){
            return 0;
        }
    }

    //str1 slutar innan str2, returnera 0
    if (*str1 == 0 && *str2 != 0){
        return 0;
    }

    return 1;
}

void Command(uint8_t *command){
    if (strEqual(command, "test")) {
        USARTPrint("Hanterar test\n");
    }
}

void USARTCommand(void) {
    //Lista för nuvarande kommando + 1 för att ha plats för terminering
    static uint8_t currentCommand[MAXCOMMANDLENGTH + 1];
    static uint8_t index = 0;
    static uint8_t newCommand = 1;

    if (newCommand) {
        newCommand = 0;
        USARTPrint(">>");
    }

    uint8_t uint8Read;

    if (USARTGet(&uint8Read)){
        if(uint8Read == '\r' || uint8Read == '\n'){
            USARTPrint("\n");
            //Terminering
            currentCommand[index] = 0;
            index = 0;
            newCommand = 1;
            Command((uint8_t *)(&currentCommand[0]));

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
    USARTPrint("\nStart Central\n");
    CanTxMsg canMsg;
    uint8_t USARTmsg;/*
    while (1) {
        if (USARTGet(&USARTmsg)){
            //code canMsg
            //encode_door_time_config(&canMsg,5,12);
            canMsg.StdId = 55;
            canMsg.ExtId = 32;
            canMsg.IDE = CAN_Id_Standard; //Alternativen är CAN_Id_Standard eller FCAN_Id_Extended
            canMsg.RTR = CAN_RTR_Data;
            canMsg.DLC = 1;
            canMsg.Data[0] = USARTmsg;
            if (send_can_message(&canMsg) == CAN_TxStatus_NoMailBox){
                USARTPrint("no mailbox empty\n");
            }
        }
    }*/
    
    add_id_request_handler();
}