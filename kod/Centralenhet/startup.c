#include "CAN.c"
#include "misc.h"
#include "stm32f4xx_can.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_gpio.h"

#define E_MODER ((unsigned int *) 0x40021000)
#define D_MODER ((unsigned int *) 0x40020C00)

#define D_ODR_LOW ((unsigned char *) 0x40020C14)
#define E_IDR_LOW ((unsigned char *) 0x40021010)
#define E_ODR_LOW ((unsigned char *) 0x40021014)




CanRxMsg RxMessage;
CanTxMsg TxMessage;

typedef struct{
    unsigned int mac;
    unsigned char id;
    unsigned char num_of_doors;
} Door_device;

unsigned int id;
unsigned int messages_to_send;
unsigned char light;
unsigned int counter;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
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


//Använder MAC-adress för att tilldela en enhet ett id
void assign_id(unsigned int mac, unsigned char id){
    
}

//Ställer in de två tiderna för en dörr
void config_door(unsigned char id_device, unsigned char id_door, unsigned int time0, unsigned int time1) {
    
}

void setup_doors(){
    Door_device door_dev;
        
        door_dev = door_devs[i];
        //TODO: Fråga via usart om användaren vill konfigurera antal dörrar
        //TODO: Om ja, lägg antal dörrar i door_dev.num_of_doors
        
        num_of_doors = door_dev.num_of_doors;
        
        
        for(unsigned int j = 0; j < num_of_doors; j++){
            
        }
}


void main(void) {
	
	// Help us determine if CAN got started at all. 0 = bad. 1 = good.
	light = can_init();
}