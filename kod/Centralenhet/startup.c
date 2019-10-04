//Centralenhet

#include "CAN.h"
#include "USART.h"
#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

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

uint8_t next_id = 0;

void *devices[256];

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


Door_device get_door_device(uint8_t id){
    return *((Door_device*) (devices[id]));
}

//Denna funktion ska alltid användas för att lägga till en ny dörrenhet
Door_device add_door_device(uint8_t id){
    Door_device dev;
    dev.id = id;
    devices[id] = (void*)(&dev);
    
    return dev;
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

void can_irq_handler(void){
    //TODO REMOVE
    USARTPrint("In irq handler\n");
    
    if(CAN_GetITStatus(CAN1, CAN_IT_FMP0)) {
        if (CAN_MessagePending(CAN1, CAN_FIFO0)) {
            CanRxMsg rxMsg;
            CAN_Receive(CAN1, CAN_FIFO0, &rxMsg);
            //TODO hantera meddelandet
            
            //För enkelt test TODO REMOVE
            if (rxMsg.IDE == CAN_Id_Standard){ //standard meddelande
                if(rxMsg.StdId == 5){ //Om det är en id-förfrågan
                    CanTxMsg txMsg;
                    encode_assign_id(&txMsg, next_id);
                    if (send_can_message(&txMsg) == CAN_TxStatus_NoMailBox){
                        USARTPrint("No mailbox empty\n");
                    }
                    else{
                        
                        Door_device dev = add_door_device(next_id);
                        USARTPrint("Lagt till dorrenhet med id ");
                        
                        uint8_t id = get_door_device(next_id).id;
                        USARTPrintNum((uint32_t)id);
                        USARTPrint("\n");
                        next_id++;
                        
                    }
                }
                USARTPrint("StdId ");
                USARTPrintNum((uint32_t)rxMsg.StdId & 0x7FF);
            } else if (rxMsg.IDE == CAN_Id_Extended){
                USARTPrint("ExtId ");
                USARTPrintNum(rxMsg.ExtId & 0x1FFFFFFF);
            } else {
                USARTPrint("unknown IDE");
            }
            USARTPrint("\nData ");
            USARTPrintNum((rxMsg.Data[0]));
            USARTPrint("\n");
            
        }
    }
}

void main(void) {
    USARTConfig();
    can_init();
    USARTPrint("Start Central\n");
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
}