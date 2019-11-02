//Centralenhet
#include "startup.h"


#define MAXCOMMANDLENGTH 15
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
        door->time_local_larm = default_time_local_larm;
        door->time_central_larm = default_time_central_larm;
        door->locked = LOCKED;
    }

    return &door_devs[id];
}

void print_door(Door door){
    USARTPrint("\n   Lokalt larm: ");
    USARTPrintNum(((uint32_t)door.time_local_larm) * 10);
    USARTPrint("s\n   Centralt larm: ");
    USARTPrintNum(((uint32_t)door.time_central_larm) * 10);
    
    
    if(door.locked){
        USARTPrint("s\n   Last\n");
    }
    else{
        USARTPrint("s\n   Olast\n");
    }
}

void print_motion_sensor(Dist_sensor sensor){
    USARTPrint("\n   Avstand : ");
    USARTPrintNum((uint32_t)sensor.dist);
    if(sensor.active){
        USARTPrint("cm\n   Aktiv");
    }
    else{
        USARTPrint("cm\n   Inaktiv");
    }
    if(sensor.disArm){
        USARTPrint("\n   Avlarmad\n");
    }
    else{
        USARTPrint("\n   Larmad\n");
    }
}

void print_vib_sensor(Vib_sensor sensor){
    if(sensor.active){
        USARTPrint("\n   Aktiv");
    }
    else{
        USARTPrint("\n   Inaktiv");
    }
    if(sensor.disArm){
        USARTPrint("\n   Avlarmad\n");
    }
    else{
        USARTPrint("\n   Larmad\n");
    }
}

void print_device(uint8_t id){
    Device dev = devices[id];
    if(dev.type == door_unit){
        Door_device door_dev = door_devs[id];
        uint8_t num_of_doors = door_dev.num_of_doors;
        USARTPrint("\nDorrenhet ");
        USARTPrintNum((uint32_t)id);
        USARTPrint("\nAntal dorrar: ");
        USARTPrintNum((uint32_t)num_of_doors);
        USARTPrint("\n");
        for(uint8_t i = 0; i < num_of_doors; i++){
            blockingDelayMs(25);
            USARTPrint("Dorr ");
            USARTPrintNum((uint32_t)i);
            print_door(door_dev.doors[i]);
        }
    }
    else{
        Motion_device motion_dev = motion_devs[id];
        uint8_t num_of_motion = motion_dev.num_of_motion_sensors;
        uint8_t num_of_vibs = motion_dev.num_of_vib_sensors;
        USARTPrint("\nRorelseenhet ");
        USARTPrintNum((uint32_t)id);
        USARTPrint("\nAntal rorelsesensorer: ");
        USARTPrintNum((uint32_t)num_of_motion);
        USARTPrint("\n");
        for(uint8_t i = 0; i < num_of_motion; i++){
            blockingDelayMs(25);
            USARTPrint("Rorelsesensor ");
            USARTPrintNum((uint32_t)i);
            print_motion_sensor(motion_dev.dist_sensors[i]);
        }
        USARTPrint("\nAntal vibrationssensorer: ");
        USARTPrintNum((uint32_t)num_of_vibs);
        USARTPrint("\n");
        for(uint8_t i = 0; i < num_of_vibs; i++){
            blockingDelayMs(25);
            USARTPrint("Vibrationssensor ");
            USARTPrintNum((uint32_t)i);
            print_vib_sensor(motion_dev.vib_sensors[i]);
        }
    }
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
    uint8_t i = 0;
    for(; i < motionSensors; i++){
        Dist_sensor *dist = &(motion_devs[id].dist_sensors[i]);
        dist->id = i;
        dist->dist = default_dist;
        dist->active = ACTIVE;
        dist->disArm = LARMON;
        dist->calib = NOCALEBRATING;
    }
    
    //Initierar vibrationssensorer
    for(; i - motionSensors < vibSensors; i++){
        Vib_sensor *vib = &(motion_devs[id].vib_sensors[i]);
        vib->id = i;
        vib->active = ACTIVE;
        vib->disArm = LARMOFF;
    }

    return &motion_devs[id];
}

/* Hittar id:t till enheten med random_id och device_type
 * idDest är en pekare dit id:t som hittas sparas
 * Returnerar 1 om det hittas, annars 0 */
uint8_t get_id_by_random_id(uint8_t *idDest, uint32_t random_id, uint8_t device_type){
    for(uint8_t i = 0; i < next_id; i++){
        if(devices[i].type == device_type && devices[i].random_id  == random_id){
            *idDest = i;
            return 1;
        }
    }
    return 0;
}

/* Hanterar id-begäran från periferienhet
 * Om enheten redan finns i listan skickas samma id igen
 * Annars får enheten ett id och läggs till listan */
void id_request_handler(CanRxMsg *rxMsgP){
    //printRxMsg(rxMsgP, 16); //TODO Ta bort när vi inte behöver den längre
    CanRxMsg rxMsg = *rxMsgP;
    CanTxMsg txMsg;
    
    uint8_t device_type = decode_deviceType(rxMsgP);
    uint32_t temp_id = decode_tempID(rxMsgP);
    
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
                USARTPrintNum(next_id);
                USARTPrint("\noch ");
                USARTPrintNum(door_devs[next_id].num_of_doors);
                USARTPrint(" dorrar.\n");
            }
            //Hantera rörelseenhet
            else if (device_type == motion_unit){
                add_motion_device(next_id, rxMsgP);
                USARTPrint("Lagt till rorelseenhet med id ");
                USARTPrintNum((uint32_t)next_id);
                USARTPrint("\noch ");
                USARTPrintNum(motion_devs[next_id].num_of_motion_sensors);
                USARTPrint(" rorelsesensorer och ");
                USARTPrintNum(motion_devs[next_id].num_of_vib_sensors);
                USARTPrint(" vibrationssensorer\n");
            }
            
			if (next_id < max_num_of_devs) {
				next_id++;
			}
			else {
				USARTPrint("Max antal periferienheter har nu lagts till. Om du lagger till fler kan det handa dumma saker.");
			}
        }
    }
}


//Hanterar larmmeddelanden
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

/* Hanterar konfigurations-ack
 * Antalet oackade meddelanden för periferienheten inkrementeras */
void config_ack_handler(CanRxMsg *msg){
    Header header = empty_header;
    UINT32toHEADER(msg->ExtId, header);
    uint8_t id = header.ID;
    Device*  dev = &devices[id];
	// Id måste vara mindre än antalet enheter
    if (id < next_id) {
		dev->num_of_unacked = 0;
	}
}

/* Aktiverar centralenhetens konfigurationsläge
 * Aktiverar ID-tilldelningshantering och initial konfiguration
 * Returnerar 1 om det lyckades, 0 annars */
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

/* Aktiverar centralenhetens standardläge
 * Aktiverar larmhantering och automatisk konfigurationsöversändning
 * Returnerar 1 om det lyckades, 0 annars */
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
    
    //Skriver mask
    mask.IDE = 1;
    mask.RTR = 1;
    //Olika längd för DLC
    mask.DLC = 0;
    header.msgType = ~0;
    header.toCentral = ~0;
    header.ID = 0;
    header.msgNum = ~0;
    HEADERtoUINT32(header, mask.ID);
    
    //Filter för konfig ack
    filter.IDE = 1;
    filter.RTR = 1;
    filter.DLC = 0;
    header.msgType = conf_msg_type;
    header.toCentral = 0;
    header.ID = 0;
    header.msgNum = 0;
    HEADERtoUINT32(header, filter.ID);

    //Aktiverar handler för larm
    if (CANhandlerListNotFull()){
        USARTPrint("Konf ack handler med handler index: ");
        retIndex = CANaddFilterHandler(config_ack_handler, &filter, &mask);
        USARTPrintNum(retIndex);
        USARTPrint("\n");
    } else {
        return 0;
    }

    return 1;
}

/* Kör kommandot som finns i strängen command
 * Returnerar RERUN (2) om commandot måste köras igen, OK (1) om det fanns ett enkelt kommando att köra. NOCMD (0) annars */
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
        USARTPrint("Enheter:");
        for(uint8_t i = 0; i < next_id; i++){
            USARTPrint("\n");
            print_device(i);
            blockingDelayMs(50);
        }
        return OK;
    }

    //Detta kommando behöver itereras flera gånger för att hämta input och lö
    else if (strStartsWith(command, "avlarma")) {
        //Lösenordssträngen sista 0an för att terminera
        #define PASSWORDLENGTH 4
        uint8_t password[PASSWORDLENGTH + 1] = {1,2,3,0xa,0};
        //Håller koll på om det är första iterationen av kommandot
        static uint8_t firstIter = 1;
        //Håller koll på vilket index som är nästa i lösenordssträngen
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
                USARTPrint(" ratt!\n");
                //Inloggning lyckades
                //SORRY endast enheter med id 0-9 och sensorer 0-9 TODO
                uint8_t deviceID = command[8] - '0';
                uint8_t sensorID = command[10] - '0';
                if (0 <= deviceID && deviceID <= 9 && 0 <= sensorID  && sensorID <= 9 &&
                    deviceID < next_id){
                        if (devices[deviceID].type == door_unit){
                            USARTPrint("\nAlvarmar sensor ");
                            USARTPrintNum(sensorID);
                            USARTPrint(" pa dorrenhet med ID ");
                            USARTPrintNum(deviceID);
                            door_devs[deviceID].doors[sensorID].locked = UNLOCKED;
                            USARTPrint("\n");
                        } else if (devices[deviceID].type == motion_unit){
                            USARTPrint("\nAlvarmar sensor ");
                            USARTPrintNum(sensorID);
                            USARTPrint(" pa rorelseenhet med ID ");
                            USARTPrintNum(deviceID);
                            if(sensorID < motion_devs[deviceID].num_of_motion_sensors){
                                motion_devs[deviceID].dist_sensors[sensorID].disArm = LARMOFF;
                            } else {
                                motion_devs[deviceID].vib_sensors[sensorID - motion_devs[deviceID].num_of_motion_sensors].disArm = LARMOFF;
                            }
                            USARTPrint("\n");
                        } else {
                            USARTPrint("\nmisslyckadess\n");
                        }
                } else {
                    USARTPrint("\nmisslyckades\n");
                }
            } else {
                //Inloggning misslyckades
                USARTPrint(" fel\n");
            }

            return OK;
        }
        
        return RERUN;
    }
        
    //Detta kommando behöver itereras flera gånger för att hämta input och lö
    else if (strStartsWith(command, "larma")) {
        //Lösenordssträngen sista 0an för att terminera
        #define PASSWORDLENGTH 4
        uint8_t password[PASSWORDLENGTH + 1] = {1,2,3,0xa,0};
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
                USARTPrint(" ratt!\n");
                //Inloggning lyckades
                //SORRY endast enheter med id 0-9 och sensorer 0-9 TODO
                uint8_t deviceID = command[6] - '0';
                uint8_t sensorID = command[8] - '0';
                if (0 <= deviceID && deviceID <= 9 && 0 <= sensorID  && sensorID <= 9 &&
                    deviceID < next_id && devices[deviceID].type == door_unit){
                        if (devices[deviceID].type == door_unit){
                            USARTPrint("\nLarmar sensor ");
                            USARTPrintNum(sensorID);
                            USARTPrint(" pa dorrenhet med ID ");
                            USARTPrintNum(deviceID);
                            door_devs[deviceID].doors[sensorID].locked = LOCKED;
                            USARTPrint("\n");
                        } else if (devices[deviceID].type == motion_unit){
                            USARTPrint("\nLarmar sensor ");
                            USARTPrintNum(sensorID);
                            USARTPrint(" pa rorelseenhet med ID ");
                            USARTPrintNum(deviceID);
                            if(sensorID < motion_devs[deviceID].num_of_motion_sensors){
                                motion_devs[deviceID].dist_sensors[sensorID].disArm = LARMON;
                            } else {
                                motion_devs[deviceID].vib_sensors[sensorID - motion_devs[deviceID].num_of_motion_sensors].disArm = LARMON;
                            }
                            USARTPrint("\n");
                        }
                } else {
                    USARTPrint("\nmisslyckades\n");
                }
            } else {
                //Inloggning misslyckades
                USARTPrint(" fel\n");
            }

            return OK;
        }
        
        return RERUN;
    }

    
    //Detta kommando behöver itereras flera gånger för att hämta input osv
    else if (strStartsWith(command, "dor")) {
        if (mode == CONFMODE){
            //SORRY endast enheter med id 0-9 och sensorer 0-9 TODO
            uint8_t deviceID = command[4] - '0'; //TODO: Varför heter den uinitID? Menar du unit? Device är nog ett bättre ord i så fall /Josef
            uint8_t sensorID = command[6] - '0';
            uint8_t localTime = command[8] - '0';
            uint8_t centralTime = command[10] - '0';
            if (0 <= deviceID && deviceID <= 9 && 0 <= sensorID  && sensorID <= 9 &&
                0 <= localTime && localTime <= 9 && 0 <= centralTime  && centralTime <= 9 &&
                deviceID < next_id && devices[deviceID].type == door_unit){
                    USARTPrint("\nKonfigurerar dorr ");
                    USARTPrintNum(sensorID);
                    USARTPrint(" pa enhet med ID ");
                    USARTPrintNum(deviceID);
                    USARTPrint("\nmed local t ");
                    USARTPrintNum(localTime);
                    USARTPrint(" och central t ");
                    USARTPrintNum(centralTime);
                    USARTPrint("\n");
                    door_devs[deviceID].doors[sensorID].time_local_larm = localTime;
                    door_devs[deviceID].doors[sensorID].time_central_larm = centralTime;
            } else {
                USARTPrint("\nmisslyckades\n");
            }
            
            return OK;
        }
        
        //Vi är inte i konfig läge så kommandot är ogiltigt
        return NOCMD;
    }
    
    //Detta kommando behöver itereras flera gånger för att hämta input osv
    else if (strStartsWith(command, "ror")) {
        if (mode == CONFMODE){
            //SORRY endast enheter med id 0-9 och sensorer 0-9 TODO
            uint8_t deviceID = command[4] - '0';
            uint8_t sensorID = command[6] - '0';
            uint8_t dist = command[8] - '0';
            if (0 <= deviceID && deviceID <= 9 && 0 <= sensorID  && sensorID <= 9 &&
                0 <= dist && dist <= 9 && deviceID < next_id && devices[deviceID].type == motion_unit){
                    USARTPrint("\nKonfigurerar rorelse ");
                    USARTPrintNum(sensorID);
                    USARTPrint(" pa enhet med ID ");
                    USARTPrintNum(deviceID);
                    USARTPrint("\nmed dist ");
                    USARTPrintNum(dist * 10);
                    USARTPrint(" cm\n");
                    motion_devs[deviceID].dist_sensors[sensorID].dist = dist * 10;
            } else {
                USARTPrint("\nmisslyckades\n");
            }
            
            return OK;
        }
        //Vi är inte i conf läge så kommandot är ogiltigt
        return NOCMD;
    }
        
    //Detta kommando behöver itereras flera gånger för att hämta input osv
    else if (strStartsWith(command, "cal")) {
        if (mode == CONFMODE){
            //SORRY endast enheter med id 0-9 och sensorer 0-9 TODO
            uint8_t deviceID = command[4] - '0';
            uint8_t sensorID = command[6] - '0';
            uint8_t dist = command[8] - '0';
            if (0 <= deviceID && deviceID <= 9 && 0 <= sensorID  && sensorID <= 9 &&
                0 <= dist && dist <= 9 && deviceID < next_id && devices[deviceID].type == motion_sensor && sensorID < motion_devs[deviceID].num_of_motion_sensors){
                    USARTPrint("\nCalibrerar rorelsesensor ");
                    USARTPrintNum(sensorID);
                    USARTPrint(" pa enhet med ID ");
                    USARTPrintNum(deviceID);
                    USARTPrint("\nmed dist ");
                    USARTPrintNum(dist * 10);
                    USARTPrint(" cm\n");
                    motion_devs[deviceID].dist_sensors[sensorID].calib = CALEBRATING;
                    motion_devs[deviceID].dist_sensors[sensorID].dist = dist * 10;
            } else {
                USARTPrint("\nmisslyckades\n");
            }
            
            return OK;
        }
        
        //Vi är inte i stanard läge så kommandot är ogiltigt
        return NOCMD;
    }
    
   
    return NOCMD;
}

//Hanterar länken mellan USART och kommando, dvs kör de kommandon som skrivs från USART
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
    return door_0.time_local_larm == door_1.time_local_larm && door_0.time_central_larm == door_1.time_central_larm && door_0.locked == door_1.locked;
}

/* Skickar konfigurationsmeddelanden för dörrenhet med id startande från sensor first_door_ID
 * Om bufferten blir full så returneras id:t för dörren som inte skickades */
uint8_t send_door_configs(uint8_t id, uint8_t first_door_ID, uint8_t *return_door_ID){
    CanTxMsg msg;
    uint8_t last_door_ID;
    //Följande loop samlar största möjliga intervall av dörrar med samma värden och skickar ett meddelande per intervall
    for(; first_door_ID < door_devs[id].num_of_doors; first_door_ID = last_door_ID){
        Door first_door = door_devs[id].doors[first_door_ID];
        for(last_door_ID = first_door_ID; last_door_ID < door_devs[id].num_of_doors; last_door_ID++){
            Door last_door = door_devs[id].doors[last_door_ID];
            if(!doors_equal(first_door, last_door)){
                break;
            }
        }

        encode_door_config(&msg, id, first_door_ID, last_door_ID - 1, first_door.time_local_larm, first_door.time_central_larm, first_door.locked);
        //print_door(door_first);
        if (CANsendMessage(&msg) == CAN_TxStatus_NoMailBox){
            //USARTPrint("No mailbox 1\n");
            *return_door_ID = first_door_ID;
            return 0;
        }
    }
    devices[id].num_of_unacked++;
    if(devices[id].num_of_unacked >= OFFNETWORK){
        USARTPrint("Enhet med id ");
        USARTPrintNum(id);
        USARTPrint(" har lamnat natverket\n");
    }
    return 1;
}

//Kollar om två rörelsesensorer är identiska bortsett från id
uint8_t dists_equal(Dist_sensor dist_0, Dist_sensor dist_1){
    return dist_0.dist == dist_1.dist && dist_0.active == dist_1.active && dist_0.calib == dist_1.calib;
}
//Kollar om två vibrationssensorer är identiska bortsett från id
uint8_t vibs_equal(Vib_sensor vib_0, Vib_sensor vib_1){
    return vib_0.active == vib_1.active;
}

/* Skickar konfigurationsmeddelanden för rörelseenhet med id för sensor startande från first_ID
 * Om bufferten blir full så returneras id:t för sensorn som inte skickades */
uint8_t send_motion_configs(uint8_t id, uint8_t first_ID, uint8_t *return_ID){
    CanTxMsg msg;
    uint8_t last_ID = first_ID;
    USARTPrintNum(first_ID);
    USARTPrint("\n");
    USARTPrintNum(last_ID);
    //Följande loop samlar största möjliga intervall av rörelsesensorer med samma värden och skickar ett meddelande per intervall
    for(; first_ID < motion_devs[id].num_of_motion_sensors; first_ID = last_ID){
        Dist_sensor first_dist = motion_devs[id].dist_sensors[first_ID];
        for(; last_ID < motion_devs[id].num_of_motion_sensors; last_ID++){
            Dist_sensor last_dist = motion_devs[id].dist_sensors[last_ID];
            if(!dists_equal(first_dist, last_dist)){
                break;
            }
        }
        
        encode_motion_config(&msg, id, motion_sensor, first_dist.calib, first_ID, last_ID - 1, first_dist.active, first_dist.dist, first_dist.disArm);
        //blockingDelayMs(300); //För säkerhets skull TODO: Ta bort om möjligt
        USARTPrint("test 1:\n");
        printTxMsg(&msg, 16);
        if (CANsendMessage(&msg) == CAN_TxStatus_NoMailBox){
            //USARTPrint("No mailbox 2\n");
            *return_ID = first_ID;
            return 0;
        }
    }
    
    //Följande loop samlar största möjliga intervall av vibrationssensorer med samma värden och skickar ett meddelande per intervall
    for(; first_ID - motion_devs[id].num_of_motion_sensors < motion_devs[id].num_of_vib_sensors; first_ID = last_ID){
        Vib_sensor first_vib = motion_devs[id].vib_sensors[first_ID];
        for(; last_ID < motion_devs[id].num_of_vib_sensors; last_ID++){
            Vib_sensor last_vib = motion_devs[id].vib_sensors[last_ID];
            if(!vibs_equal(first_vib, last_vib)){
				break;
            }
        }
        USARTPrintNum(first_ID);
        USARTPrint("test \n");
        encode_motion_config(&msg, id, vibration_sensor, 0, first_ID, last_ID - 1, first_vib.active, 0, first_vib.disArm);
        //blockingDelayMs(300); //För säkerhets skull TODO: Ta bort om möjligt
        USARTPrint("test 2:\n");
        printTxMsg(&msg, 16);
        if (CANsendMessage(&msg) == CAN_TxStatus_NoMailBox){
            //USARTPrint("No mailbox 3\n");
            *return_ID = first_ID;
            return 0;
        }
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

    uint32_t msDelay = 0;
	uint8_t i = 0;
	uint8_t keep_id = 0;
	uint8_t first_id = 0;
	uint8_t cont_id = 0;

    while (1) {
        USARTCommand();
        
	    //Om vi är i STDMODE och det är dags att skicka nya konfigurationer, dessutom har vi någon enhet
        if(mode == STDMODE && msDelay < msTicks && next_id != 0 ){
			
			keep_id = 0;

			if (devices[i].type == door_unit){
				if (!send_door_configs(i, first_id, &cont_id)) {
					 keep_id = 1;
                }
			} 
			
			else if (devices[i].type == motion_unit) {
				if (!send_motion_configs(i, first_id, &cont_id)) {
					keep_id = 1;
				}
			}
            
			if (!keep_id) {
				i++;
				first_id = 0;
			}
			else {
				first_id = cont_id;
			}
			
			if (i >= next_id) {
				i = 0;
			}
			msDelay = msTicks + 1000; // todo Ändra till + 10
        }
    }
}

