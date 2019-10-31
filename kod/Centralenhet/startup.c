//Centralenhet
#include "startup.h"


#define MAXCOMMANDLENGTH 10
#define SESSIONIDACTIVE 0
#define CONFMODE 0
#define STDMODE 1

uint8_t mode;
uint8_t next_id = 0;

Device devices[max_num_of_devs];
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

//Denna funktion ska alltid användas för att lägga till en ny dörrenhet
Door_device *add_door_device(uint8_t id, CanRxMsg *msg){
    devices[id].id = id;
    devices[id].type = door_unit;
    devices[id].random_id = decode_tempID(msg);
    devices[id].num_of_unacked = 0;

    door_devs[id].num_of_doors = decode_doorNum(msg);
    
    for(uint8_t i = 0; i < door_devs[id].num_of_doors; i++){
        Door *door = &(door_devs[id].doors[i]);
        door->id = i;
        door->time_0 = default_time_0;
        door->time_1 = default_time_1;
        door->locked = LOCKED;
    }

    return &door_devs[id];
}

void print_door(Door door){
    USARTPrint("Dorr\n   id: ");
    USARTPrintNum(door.id);
    USARTPrint("\n   time_0: ");
    USARTPrintNum(door.time_0);
    USARTPrint("\n   time_1: ");
    USARTPrintNum(door.time_1);
    USARTPrint("\n   locked: ");
    USARTPrintNum(door.locked);
    USARTPrint("\n\n");
}

//Denna funktion ska alltid användas för att lägga till en ny rörelseenhet
Motion_device *add_motion_device(uint8_t id, CanRxMsg *msg){
    devices[id].id = id;
    devices[id].type = motion_unit;
    devices[id].random_id = decode_tempID(msg);
    devices[id].num_of_unacked = 0;

    uint8_t motionSensors = decode_motionSensNum(msg);
    uint8_t vibSensors = decode_vibSensNum(msg);
    motion_devs[id].num_of_motion_sensors = motionSensors;
    motion_devs[id].num_of_vib_sensors = vibSensors;
    
    //Initierar rörelsesensorer
    for(uint8_t i = 0; i < motionSensors; i++){
        Dist_sensor *dist = &(motion_devs[id].dist_sensors[i]);
        dist->id = i;
        dist->dist = default_dist;
        dist->active = ACTIVE;
    }
    
    //Initierar vibrationssensorer
    for(uint8_t i = 0; i < vibSensors; i++){
        Vib_sensor *vib = &(motion_devs[id].vib_sensors[i]);
        vib->id = i;
        vib->active = ACTIVE;
    }

    return &motion_devs[id];
}

//Hittar idt till enheten med random_id och device_type
//idDest är en pekare dit idt som hittas sparas
//Returnerar 1 om den hittades 0 annars
uint8_t get_id_by_random_id(uint8_t *idDest, uint32_t random_id, uint8_t device_type){
    for(uint8_t i = 0; i < next_id; i++){
        if(devices[i].type == device_type && devices[i].random_id  == random_id){
            *idDest = i;
            return 1;
        }
    }
    
    return 0;
}

void id_request_handler(CanRxMsg *rxMsgP){
    printRxMsg(rxMsgP, 16); //TODO Ta bort när vi inte behöver den längre
    CanRxMsg rxMsg = *rxMsgP;
    CanTxMsg txMsg;
    
    uint8_t device_type = rxMsg.Data[4];
    
    uint32_t temp_id = decode_tempID(rxMsgP);
    
    USARTPrint("\n\nRandom ID: ");
    USARTPrintNumBase(temp_id, 16);
    USARTPrint("\n");
    uint8_t id;
    
    //Om random_id känns igen behöver vi bara skicka samma id igen
    if(get_id_by_random_id(&id, temp_id, device_type)){
        USARTPrint("Skickar ID till ");
        USARTPrintNum((uint32_t)id);
        USARTPrint(" igen\n");
        encode_assign_id(&txMsg, rxMsgP, id);
        CANsendMessage(&txMsg);
    } else {
        encode_assign_id(&txMsg, rxMsgP, next_id);
        if (CANsendMessage(&txMsg) != CAN_TxStatus_NoMailBox){
            //Hantera dörrenhet
            if(device_type == door_unit){
                add_door_device(next_id, rxMsgP);
                USARTPrint("Lagt till dorrenhet med id ");
                USARTPrintNum(id);
                USARTPrint("\noch ");
                USARTPrintNum(door_devs[id].num_of_doors);
                USARTPrint(" dorrar.\n");
            }
            //Hantera rörelseenhet
            else if (device_type == door_unit){
                add_motion_device(next_id, rxMsgP);
                USARTPrint("Lagt till rorelseenhet med id ");
                USARTPrintNum((uint32_t)id);
                USARTPrint("\noch ");
                USARTPrintNum(motion_devs[id].num_of_motion_sensors);
                USARTPrint(" rorelsesensorer och ");
                USARTPrintNum(motion_devs[id].num_of_vib_sensors);
                USARTPrint(" vibrationssensorer\n");
            }
            
			if (next_id < max_num_of_devs) {
				next_id++;
			}
			else {
				USARTPrint("Max antal periferienheter har nu lagts till. Om du lagger till fler kan det handa dumma saker.");
			}
            
            
            
        }
        
        //send_door_configs(dev);
    }
    
    USARTPrint("ExtId ");
    USARTPrintNum((uint32_t)rxMsg.ExtId);// & 0x7FF);

  /*  USARTPrint("\nData ");
    USARTPrintNum((uint32_t)rxMsg.Data);
    USARTPrint("\n");*/
    
    

}


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
    encode_ack_msg(&msg, rxMsg);
    CANsendMessage(&msg);
}

void config_ack_handler(CanRxMsg *msg){
    Header header = empty_header;
    UINT32toHEADER(msg->ExtId, header);
    uint8_t id = header.ID;
    Device*  dev = &devices[id];
	// Id måste vara mindre än mängden enheter
    if (id < next_id) {
		dev->num_of_unacked--;		
	}
}

uint8_t enable_config_ack_handler(){
    uint8_t retIndex;
    CANFilter filter;
    CANFilter mask;

    //För omvandling
    Header header;

    //Skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    mask.DLC = ~0;
    header.msgType = ~0;
    header.toCentral = ~0;
    header.ID = 0;
    //ignorera msgNum
    header.msgNum = 0;
    HEADERtoUINT32(header, mask.ID);

    //Filter för Larm
    filter.IDE = 1;
    filter.RTR = 0;
    filter.DLC = 1;
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
}


//Aktiverar centralenhetens konfigurationsläge
//Aktiverar ID-tilldelningshantering och initial konfiguration
//returnerar 1 om det lyckades, 0 annars
uint8_t enterConfMode (void){
    mode = CONFMODE;
    USARTWaitPrint("Startar konfigurations-mode. Aktiverar foljande handlers:\n");
    CANFilter filter = empty_filter;
    CANFilter mask = empty_mask;

    //Används för omvandling
    Header header = empty_header;

    //Skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    mask.DLC = ~0;

    header.msgType = ~0;
    header.toCentral = ~0;
    header.ID = ~0;
    header.sessionID = ~0;
    header.msgNum = ~0;
    HEADERtoUINT32(header, mask.ID);

    //Avaktiverar alla filter
    CANdisableAllFilterHandlers();

    //Filter för ID-Begäran
    filter.IDE = 1;
    filter.RTR = 0;
    filter.DLC = reqID_msg_length;
    header.msgType = reqID_msg_type;
    header.toCentral = 1;
    header.ID = 0;
    header.sessionID = 0;
    header.msgNum = 0;
    HEADERtoUINT32(header, filter.ID);

    //Aktiverar handler för ID-begäran
    if (CANhandlerListNotFull()){
        USARTWaitPrint("ID-begaran handler med handler index: ");
        USARTPrintNum(CANaddFilterHandler(id_request_handler, &filter, &mask));
        USARTWaitPrint("\n");
    } else {
        return 0;
    }
    
    //Aktiverar sessionID
    if (SESSIONIDACTIVE){
         if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
             RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
             RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
                activateSessionId(RNG_GetRandomNumber());
        } else {
            return 0;
        }
    } else {
        //För "inaktiv" sessionID används 0.
        //I bakgrunden kommer sessionID fortfarande vara aktivt fast med endast nollor
        activateSessionId(0);
    }

    return 1;
}

//Aktiverar centralenhetens standardläge
//Aktiverar larmhantering och automatisk konfigurationsöversändning
//returnerar 1 om det lyckades, 0 annars
uint8_t enterStdMode (void){
    mode = STDMODE;
    
    USARTPrint("Startar standard-mode. Aktiverar foljande handlers:\n");
    uint8_t retIndex;
    CANFilter filter;
    CANFilter mask;

    //För omvandling
    Header header;

    //Skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    mask.DLC = ~0;
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
    filter.DLC = larm_msg_length;
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
//Retrunrerar RERUN (2) om commandot måste köras igen, OK (1) om det fanns ett enkelt kommando att köra. NOCMD (0) annars.
uint8_t Command(uint8_t *command){
    //Ett tomt komando är ett gilltigt kommando.
    //Detta för att man ska kunna få en ny rad utan ogilltigt kommando utskrift
    if (command[0] == 0){
        return OK;
    }
    
    if (strEqual(command, "help")){
        if (mode == CONFMODE){
            USARTPrint("Help config-mode:\n");
            USARTPrint("start for att overga till standard-mode\n");
            USARTPrint("list for att lista enheter\n");
        } else if (mode == STDMODE){
            USARTPrint("Help standard-mode:\n");
            USARTPrint("avlarma for att avlarma en larmade sensor\n");
            USARTPrint("list for att lista enheter\n");
        }
        return OK;
    }

    else if (strEqual(command, "start")){
        if (mode == CONFMODE){
            if (enterStdMode()){
                USARTWaitPrint("Start av standard-mode lyckades\n");
            } else {
                USARTWaitPrint("Start av standard-mode misslyckades\n");
            }
            return OK;
        }
        return NOCMD;
    }
    
    else if (strStartsWith(command, "list")) {
        //TODO lista enheter
        USARTPrint("Enheter:\n");
        return OK;
    }

    //Detta kommando behöver itereras flera gånger för att hämta input och lö
    else if (strStartsWith(command, "avlarma")) {
        if (mode == STDMODE){
            //Lösenordssträngen sista 0an för att terminera
            #define PASSWORDLENGTH 4
            uint8_t password[PASSWORDLENGTH + 1] = {1,2,3,4,0};
            //Håller koll på om det är första iterationen av kommandot
            static uint8_t firstIter = 1;
            //Håller kåll på vilket index som är nästa i lösenordssträngen
            static uint8_t currentCharIndex = 0;
            //Håller koll på lösenordet som har matats in
            static uint8_t entered[PASSWORDLENGTH]; 
            
            //Första iterationern
            if (firstIter){
                currentCharIndex = 0;                
                USARTPrint("Skriv losenord: ");
                clearKeypadQue();
                firstIter = 0;
            }
            
            //Läser från keypad
            uint8_t readKey;
            if(readKeypad(&readKey)){
                entered[currentCharIndex++] = readKey;
                USARTPrintNumBase(readKey, 16);
            }

            //Har ett helt lösenord matats in?
            if (currentCharIndex == PASSWORDLENGTH){
                //Nästa gång börjar vi om på nytt
                firstIter = 1;
                //Efter som enterd inte har terminering kollar vi om entered börjar med password
                if (strStartsWith(entered, password)){
                    //Inloggning lyckades
                    USARTPrint(" ratt!\n");
                } else {
                    //Inloggning misslyckades
                    USARTPrint(" fel\n");
                }

                return OK;
            }
            
            return RERUN;
        }
        
        //Vi är inte i stanard läge så kommandot är ogiltigt
        return NOCMD;
    }

    return NOCMD;
}

//Hanterar länken mellan USART och commando. Dvs kör de kommandon som skrivs från USART
void USARTCommand(void) {
    //Lista för nuvarande kommando + 1 för att ha plats för terminering
    static uint8_t currentCommand[MAXCOMMANDLENGTH + 1];
    static uint8_t index = 0;
    static uint8_t newCommandIndicator = 1;
    static uint8_t rerunLastCommand = 0;
    
    if (rerunLastCommand){
        if (Command(currentCommand) != RERUN){
            rerunLastCommand = 0;
            newCommandIndicator = 1;
        }
        return;
    }

    if (newCommandIndicator) {
        newCommandIndicator = 0;
        USARTWaitPrint(">>");
    }

    uint8_t uint8Read;

    if (USARTGet(&uint8Read)){
        if(uint8Read == '\r' || uint8Read == '\n'){
            USARTPrint("\n");
            //Terminering
            currentCommand[index] = 0;
            index = 0;
            uint8_t retVal = Command(currentCommand);
            switch (retVal) {
                //Om samma kommando måste köras igen
                case RERUN:
                    rerunLastCommand = 1;
                    break;
                    
                //Om kommandot är klart
                case OK:
                    newCommandIndicator = 1;
                    break;
                    
                //Om kommandot inte fanns
                case NOCMD:
                    USARTWaitPrint("Kommandot:");
                    USARTWaitPrint(currentCommand);
                    USARTWaitPrint(" hittades inte\n");
                    newCommandIndicator = 1;
                    break;
            }

        } else {
            //Check om vi skriver ett för långt kommando
            if (index >= MAXCOMMANDLENGTH){
                USARTPrint("\nFor langt kommando\n");
                index = 0;
                newCommandIndicator = 1;
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

//Kollar om två dörrar är identiska bortsett från id
uint8_t doors_equal(Door door_0, Door door_1){
    return door_0.time_0 == door_1.time_0 && door_0.time_1 == door_1.time_1 && door_0.locked == door_1.locked;
}

uint8_t send_door_configs(uint8_t id){
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
        encode_door_config(&msg, dev->id, id_first, id_last - 1, door_first.time_0, door_first.time_1, door_first.locked);
        //print_door(door_first);
        if (CANsendMessage(&msg) == CAN_TxStatus_NoMailBox){
            //TODO: Hantera?
            USARTPrint("No mailbox 1\n");
            return 0;
        }
        id_first = id_last; //Vi behöver ju inte kolla de dörrar som är med i intervallet.
    }
    dev->num_of_unacked++;
    return 1;
}

//Kollar om två rörelsesensorer är identiska bortsett från id
uint8_t dists_equal(Dist_sensor dist_0, Dist_sensor dist_1){
    return dist_0.dist == dist_1.dist && dist_0.active == dist_1.active;
}
//Kollar om två vibrationssensorer är identiska bortsett från id
uint8_t vibs_equal(Vib_sensor vib_0, Vib_sensor vib_1){
    return vib_0.active == vib_1.active;
}

uint8_t send_motion_configs(Motion_device *dev){
    CanTxMsg msg;
    Dist_sensor dist_first;
    Dist_sensor dist_last;
    uint8_t id_last;
    //Följande loop samlar största möjliga intervall av rörelsesensorer med samma värden och skickar ett meddelande per intervall
    for(uint8_t id_first = 0; id_first < dev->num_of_motion_sensors;){
        dist_first = dev->dist_sensors[id_first];
        for(id_last = id_first; id_last < dev->num_of_motion_sensors; ++id_last){
            dist_last = dev->dist_sensors[id_last];
            if(!dists_equal(dist_first, dist_last)){
                break;
            }
        }
        encode_motion_config(&msg, dev->id, motion_sensor, 0, id_first, id_last - 1, dist_first.active, dist_first.dist);
        //blockingDelayMs(300); //För säkerhets skull TODO: Ta bort om möjligt
        if (CANsendMessage(&msg) == CAN_TxStatus_NoMailBox){
            //TODO: Hantera?
            USARTPrint("No mailbox 2\n");
            return 0;
        }
        id_first = id_last; //Vi behöver ju inte kolla de dörrar som är med i intervallet.
    }
    
    
    Vib_sensor vib_first;
    Vib_sensor vib_last;
    
    //Följande loop samlar största möjliga intervall av vibrationssensorer med samma värden och skickar ett meddelande per intervall
    for(uint8_t id_first = 0; id_first < dev->num_of_vib_sensors;){
        vib_first = dev->vib_sensors[id_first];
        for(id_last = id_first; id_last < dev->num_of_vib_sensors; ++id_last){
            vib_last = dev->vib_sensors[id_last];
            if(!vibs_equal(vib_first, vib_last)){
                break;
            }
        }
        encode_motion_config(&msg, dev->id, vibration_sensor, 0, id_first, id_last - 1, vib_first.active, 0);
        //blockingDelayMs(300); //För säkerhets skull TODO: Ta bort om möjligt
        if (CANsendMessage(&msg) == CAN_TxStatus_NoMailBox){
            //TODO: Hantera?
            USARTPrint("No mailbox 3\n");
            return 0;
        }
        id_first = id_last; //Vi behöver ju inte kolla de dörrar som är med i intervallet.
    }
    
    return 1;
}

void main(void) {
    USARTConfig();
    can_init();
    systick_Init();
    keypadnit();

    //Initierar random number generator
    RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);

    USARTPrint("\n");

    if (enterConfMode()){
        USARTWaitPrint("Start av konfigurations-mode lyckades\n");
    } else {
        USARTWaitPrint("Start av konfigurations-mode misslyckades\n");
    }

    uint16_t ms_counter = msTicks + 1000;
    while (1) {
        USARTCommand();
        
        //Om vi är i STDMODE och det har gått en till sekund
        if((mode == STDMODE) && (ms_counter <= msTicks)){
            for(uint8_t i = 0; i < next_id; i++){
                USARTPrint("Konfig");
                if (get_door_device(i)->type == 0){
                    send_door_configs(get_door_device(i));
                    USARTPrint(" - Dorr\n");
                } else {
                    send_motion_configs(get_motion_device(i));
                    USARTPrint(" - Rorelse\n");
                }
            }
            ms_counter = msTicks + 1000;
        }
    }
}
