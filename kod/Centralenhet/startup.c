//Centralenhet
#include "startup.h"


#define MAXCOMMANDLENGTH 10
#define SESSIONIDACTIVE 0



uint8_t next_id = 0;
uint16_t default_time_0 = 2;
uint16_t default_time_1 = 3;

void *devices[max_num_of_devs];
Door_device door_devs[max_num_of_devs];
Motion_device motion_devs[max_num_of_devs];


void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}



Door_device *get_door_device(uint8_t id){
    return (Door_device*) (devices[id]);
    //return &door_devs[id];
}

//Denna funktion ska alltid användas för att lägga till en ny dörrenhet
Door_device *add_door_device(uint8_t id){
    Door_device dev;
    dev.id = id;
    dev.type = 0;
    door_devs[id] = dev; //Lägger dev i array av faktiska strukturinstanser för att undvika att den skrivs över
    devices[id] = (void*)(&door_devs[id]);
    return &door_devs[id];
}

Motion_device *get_motion_device(uint8_t id){
    return (Motion_device*) (devices[id]);
}

//Denna funktion ska alltid användas för att lägga till en ny rörelseenhet
Motion_device *add_motion_device(uint8_t id){
    Motion_device dev;
    dev.id = id;
    dev.type = 1;
    motion_devs[id] = dev; //Lägger dev i array av faktiska strukturinstanser för att undvika att den skrivs över
    devices[id] = (void*)(&motion_devs[id]);
    return &motion_devs[id];
}


uint8_t get_id_by_random_id(uint32_t random_id, uint8_t device_type){
    if(!device_type){ //Om det är en dörrenhet
        for(uint8_t i = 0; i < next_id; i++){
            if(get_door_device(i)->random_id == random_id){
                return i;
            }
        }
    }
	//Motsvarande för rörelseenhet
	else {
		for(uint8_t i = 0; i < next_id; i++){
            if(get_motion_device(i)->random_id == random_id){
                return i;
            }
        }
	}
    
    //Returnerar ~0 för att ange att ingen enhet hittades. ~0 förutsätts vara ett ogiltigt id
    return ~0;
}


void id_request_handler(CanRxMsg *rxMsgP){
    printRxMsg(rxMsgP, 16);
        CanRxMsg rxMsg = *rxMsgP;
        CanTxMsg txMsg;
        static uint8_t counter = 0;
        if (encode_assign_id(&txMsg, rxMsgP, counter++)){
            if (CANsendMessage(&txMsg) == CAN_TxStatus_NoMailBox){
                    USARTPrint("No mailbox empty\n");
            } else {
                printTxMsg(&txMsg, 16);
            }
        } else {
            USARTPrint("encodefel\n");
        }
}
    /*TODO KOMPILERAR INTE
    CanRxMsg rxMsg = *rxMsgP;
    CanTxMsg txMsg;
    
    
    uint8_t device_type = rxmsg.data[1];
    uint32_t random_id = rxmsg.id;
    uint8_t id = get_id_by_random_id(random_id, device_type);
    
    //Om random_id känns igen behöver vi bara skicka 
    if(!~id){
        encode_assign_id(&txMsg, rxMsgP, id);
        if (CANsendMessage(&txMsg) == CAN_TxStatus_NoMailBox){
            USARTPrint("No mailbox empty\n");
        }
        
    }
    else{
        encode_assign_id(&txMsg, rxMsgP, next_id);
        if (CANsendMessage(&txMsg) == CAN_TxStatus_NoMailBox){
            USARTPrint("No mailbox empty\n");
        }
        //TODO att lägga till en enhet borde först ske vid mottagande av ack
        //TODO ta bort delay såsmåningom
        blockingDelayMs(300);
        else{
            Door_device *dev = add_door_device(next_id);
            USARTPrint("Lagt till dorrenhet med id ");
            
            id = get_door_device(next_id)->id;
            USARTPrintNum((uint32_t)id);
			if (next_id < max_num_of_devs) {
				next_id++;
			}
			else {
				USARTPrint("Max antal periferienheter har nu lagts till. Om du lagger till fler kan det handa dumma saker.")
			}
            
            dev->num_of_doors = rxMsg.Data[5];
            USARTPrint("\noch ");
            USARTPrintNum((uint32_t)rxMsg.Data[5]);
            USARTPrint(" dorrar.\n");
            
            Door door;
            for(uint8_t id = 0; id < dev->num_of_doors; id++){
                door = dev->doors[id];
                door.id = id;
                door.time_0 = default_time_0;
                door.time_1 = default_time_1;
            }
        }
        
        //send_door_configs(dev);
    }
    
    USARTPrint("ExtId ");
    USARTPrintNum((uint32_t)rxMsg.ExtId);// & 0x7FF);

    USARTPrint("\nData ");
    USARTPrintNum((uint32_t)rxMsg.Data);
    USARTPrint("\n");
    
    

}
*/

//Förslag på struktur för larmhanterare
void larmHandler(CanRxMsg *rxMsg){
    Header header = empty_header;
    UINT32toHEADER(rxMsg->ExtId, header);
    //header.ID .... TODO kolla enhetstyp
    //TODO göra resten

    //Detta är för utveckling
    USARTPrint("Larmande sensor ");
    USARTPrintNumBase(rxMsg->Data[0], 10);
    USARTPrint(" larmar pa enhet med ID ");
    USARTPrintNumBase(header.ID, 16);
    USARTPrint("\n");
    
    //TODO kolla vilken typ av enhet det är osv
    //Skicka ack för dörr
    CanTxMsg msg;
    encode_larm_ack(&msg, rxMsg);
    CANsendMessage(&msg);
}

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

//Aktiverar centralenhetens konfigurationsläge
//Aktiverar ID-tilldelningshantering och initial konfiguration
//returnerar 1 om det lyckades, 0 annars
uint8_t enterConfMode (void){
    USARTWaitPrint("Startar konfigurations-mode. Aktiverar foljande handlers:\n");
    CANFilter filter = empty_filter;
    CANFilter mask = empty_mask;

    //Används för omvandling
    Header header = empty_header;

    //Skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    
    
    header.msgType = ~0;
    header.toCentral = ~0;
    header.ID = ~0;
    //ignorera msgNum
    header.msgNum = 0;
    HEADERtoUINT32(header, mask.ID);

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

    //Filter för ID-Begäran
    filter.IDE = 1;
    filter.RTR = 0;
    header.msgType = reqID_msg_type;
    header.toCentral = 1;
    header.ID = 0;
    HEADERtoUINT32(header, filter.ID);

    //Aktiverar handler för ID-begäran
    if (CANhandlerListNotFull()){
        USARTWaitPrint("ID-begaran handler med handler index: ");
        USARTPrintNum(CANaddFilterHandler(id_request_handler, &filter, &mask));
        USARTWaitPrint("\n");
    } else {
        return 0;
    }

    //Filter för mottagen konfiguration
    /*filter.STDID = 0b01010000000;
    filter.EXDID = 0;
    filter.IDE = 0;
    filter.RTR = 1;

    //Aktiverar handler för ID begäran
    if (CANhandlerListNotFull()){
        USARTPrint("Mottagen konfigurations handler med handler index: ");
        USARTPrintNum(CANaddFilterHandler(confHandler, &filter, &mask));
        USARTPrint("\n");
    } else {
        return 0;
    }*/

    return 1;
}

//Aktiverar centralenhetens standardläge
//Aktiverar larmhantering och automatisk konfigurationsöversändning
//returnerar 1 om det lyckades, 0 annars
uint8_t enterStdMode (void){
    USARTPrint("Startar standard-mode. Aktiverar foljande handlers:\n");
     uint8_t retIndex;
    CANFilter filter;
    CANFilter mask;

    //För omvandling
    Header header;

    //Skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    header.msgType = ~0;
    header.toCentral = ~0;
    header.ID = 0;
    //ingorera msgNum
    header.msgNum = 0;
    HEADERtoUINT32(header, mask.ID);

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

    //Filter för Larm
    filter.IDE = 1;
    filter.RTR = 0;
    header.msgType = larm_msg_type;
    header.toCentral = 1;
    header.ID = 0;
    HEADERtoUINT32(header, filter.ID);

    //Aktiverar handler för larm
    if (CANhandlerListNotFull()){
        USARTPrint("Larm handler med handler index: ");
        retIndex = CANaddFilterHandler(larmHandler, &filter, &mask);
        USARTPrintNum(retIndex);
        USARTPrint("\n");
    } else {
        return 0;
    }

    return 1;
}

//Kör kommandot som finns i strängen command
//Retrunrerar 1 det fanns ett kommando att köra. 0 annars.
uint8_t Command(uint8_t *command){
    //Ett tomt komando är ett gilltigt kommando.
    //Detta för att man ska kunna få en ny rad utan ogilltigt kommando utskrift
    if (command[0] == 0){
        return 1;
    }

    if (strEqual(command, "start")){
        if (enterStdMode()){
            USARTWaitPrint("Start av standard-mode lyckades\n");
        } else {
            USARTWaitPrint("Start av standard-mode misslyckades\n");
        }
        return 1;
    }

    if (strStartsWith(command, "avlarma")) {
        //TODO läs vad som ska avlarmas

        //Lösenord som sträng sista 0an för att terminera
        #define passwordLength 4
        uint8_t readKey;
        uint8_t password[passwordLength + 1] = {1,2,3,4,0};
        uint8_t entered[passwordLength]; 
        USARTPrint("Skriv losenord: ");
        clearKeypadQue();
        for (uint8_t i = 0; i < passwordLength; i++){
            while(!readKeypad(&readKey));
            entered[i] = readKey;
            USARTPrintNumBase(readKey, 16);
        }

        //Efter som enterd inte har terminering kollar vi om entered börjar med password
        if (strStartsWith(entered, password)){
            //Inloggning lyckades
            USARTPrint(" ratt!\n");
        } else {
            //Inloggning misslyckades
            USARTPrint(" fel\n");
        }

        return 1;
    }

    if (strEqual(command, "test")) {
        USARTPrint("Hanterar test\n");
        return 1;
    }

    if (strStartsWith(command, "spam")){
        if (command[4] != ' ' || command[4] == 0){
            USARTWaitPrint("Anvand>> spam string\n");

        } else {
            while (USARTPrint(&command[5]));
            USARTWaitPrint("\n");
        }
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
            //Check om vi skriver ett för långt kommando
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

uint8_t doors_equal(Door door_0, Door door_1){
    return door_0.time_0 == door_1.time_0 && door_0.time_1 == door_1.time_1 && door_0.locked == door_1.locked;
}

uint8_t send_door_configs(Door_device *dev){
    CanTxMsg msg;
    Door door_first;
    Door door_last;
    uint8_t id_last;
    //Följande loop samlar största möjliga intervall av dörrar med samma värden och skickar ett meddelande per intervall
    for(uint8_t id_first = 0; id_first < dev->num_of_doors;){
        door_first = dev->doors[id_first];
        for(id_last = id_first; id_last < dev->num_of_doors; ++id_last){
            door_last = dev->doors[id_last];
            if(!doors_equal(door_first, door_last)){
                break;
            }
        }
        //TODO KOMPILERAR INTE
        //encode_door_config(msg, 0, id_first, id_last - 1, door_first.time_0, door_first.time_1, door_first.locked);
        blockingDelayMs(300); //För säkerhets skull TODO: Ta bort om möjligt
        if (CANsendMessage(&msg) == CAN_TxStatus_NoMailBox){
            //TODO: Hantera?
            USARTPrint("No mailbox empty\n");
            return 0;
        }
        id_first = id_last; //Vi behöver ju inte kolla de dörrar som är med i intervallet.
    }
    return 1;
}

void main(void) {
    USARTConfig();
    can_init();
    keypadnit();

    //Initsierar random number generator
    RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);

    USARTPrint("\n");

    if (enterConfMode()){
        USARTWaitPrint("Start av konfigurations-mode lyckades\n");
    } else {
        USARTWaitPrint("Start av konfigurations-mode misslyckades\n");
    }
    
    if (SESSIONIDACTIVE){
         if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
             RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
             RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
                setSessionId(RNG_GetRandomNumber());
        }
    }

    while (1) {
        USARTCommand();
    }
}
