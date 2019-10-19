/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

#define DEBUG

#include <stdio.h>
#include "string.h"
#include "stm32f4xx_gpio.h"
#include "core_cm4.h"
#include "stm32f4xx_rcc.h"
#include "stm32f4xx_rng.h"
#include "stm32f4xx_syscfg.h"
#include "USARTDebug.h"
#include "main_motion.h"
#include "misc.h"
#include "CAN.h"
#include "CANEncode.h"



void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}





// == Globala Variabler ==

// Dessa är konfigurerbara
GPIO_TypeDef* motionPorts[3] 	= {GPIOA, GPIOB, GPIOC};
GPIO_TypeDef* vibrationPorts[2] = {GPIOD, GPIOE};


uint32_t id = 0;
char nocid = 1;


// Alla sensorer, denna initieras under init_Sensors.
Sensor sensors[nMaxMotionSensors + nMaxVibrationSensors];

volatile uint32_t microTicks = 0;		 // Variabel för microsekunder.

void SysTick_Handler(void)  {			 // SysTick interrupt Handler.
	microTicks++;
}

void init_Timer(){
	//Systick
	*((void (**)(void) ) 0x2001C03C ) = SysTick_Handler;
	uint32_t returnCode;
  	returnCode = SysTick_Config(168000000/1000000);      // Konfigurera SysTick att generera avbrott varje mikrosekund.
}



/**
 * @brief Konfigurera GPIO portarna
 * 
 * @note 
 * Portar A, B, och C används till rörelsesensor; D och E används till vibrationsmätare.
 * För rörelsesensor används pinnar 3n, 3n + 1, 3n + 2, till trigg, echo, respektive lysdioden.
 * För vibrationsmätaren används jämna pinnar till DO (Sensor avmätning), och udda till lysdioder.
 * 
 * Det finns stöd för 5 rörelsesensor per port och 8 vibrationsmätare per port.
 */
void init_GPIO_Ports(){
	// Initiera klockar för alla portar, todo: behöv detta?
	uint32_t portClocks[5] = {RCC_AHB1Periph_GPIOA, RCC_AHB1Periph_GPIOB, RCC_AHB1Periph_GPIOC, RCC_AHB1Periph_GPIOD, RCC_AHB1Periph_GPIOE}; 
	for (int i=0; i*sizeof(portClocks[0]) < sizeof(portClocks); i++) {
		RCC_AHB1PeriphClockCmd(portClocks[i], ENABLE);
	}
	GPIO_InitTypeDef init;
	
	// Initierar portarna som tilldelats till rörelsesensorerna.
	for (int i=0; i*sizeof(motionPorts[0]) < sizeof(motionPorts); i++)
	{
		// Konfigurerar inportar för avståndsmätare
		GPIO_StructInit(&init);  // Default-ställer init konfigurationen
		init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_4 | GPIO_Pin_7 | GPIO_Pin_10 | GPIO_Pin_13;  // Echo pinnar
		init.GPIO_Mode = GPIO_Mode_IN;
		init.GPIO_PuPd = GPIO_PuPd_UP;
		init.GPIO_Speed = GPIO_Fast_Speed;	// 50 Mhz
		GPIO_Init(motionPorts[i], &init);
		
		// Konfigurerar utportar för avståndsmätare
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_12 | GPIO_Pin_14;  // Trigg & Lysdiod pinnar
		init.GPIO_Mode = GPIO_Mode_OUT;
		init.GPIO_OType = GPIO_OType_PP;
		init.GPIO_Speed = GPIO_Fast_Speed;	// 50 Mhz
		GPIO_Init(motionPorts[i], &init);
	}
	
	// Initierar portarna som tilldelats till vibrationssensorerna.
	for (int i=0; i*sizeof(vibrationPorts[0]) < sizeof(vibrationPorts); i++) {
		// Konfigurerar inportar vibrationssensor
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_2 | GPIO_Pin_4 | GPIO_Pin_6 | GPIO_Pin_8 | GPIO_Pin_10 | GPIO_Pin_12 | GPIO_Pin_14; // DO pinnar
		init.GPIO_Mode = GPIO_Mode_IN;
		init.GPIO_PuPd = GPIO_PuPd_DOWN;
		init.GPIO_Speed = GPIO_Fast_Speed;	// 50 Mhz
		GPIO_Init(vibrationPorts[i], &init);
		
		// Konfigurerar utportar vibrationssensor
		GPIO_StructInit(&init);
		init.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_3 | GPIO_Pin_5 | GPIO_Pin_7 | GPIO_Pin_9 | GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_15; // Lysdiod pinnar
		init.GPIO_Mode = GPIO_Mode_OUT;
		init.GPIO_OType = GPIO_OType_PP;
		init.GPIO_Speed = GPIO_Fast_Speed;	// 50 Mhz
		GPIO_Init(vibrationPorts[i], &init);
	}
}
	
void init_MotionSensors(){

	// Iterera genom portarna
	for (int i=0; i*sizeof(motionPorts[0]) < sizeof(motionPorts); i++) {
		// Iterera genom pinnarna
		for (int j=0; j*sizeof(GPIO_Pins[0]) < sizeof(GPIO_Pins);j+=3) {
			if(!((i*5+j/3) == 15)){ // Hårdvaran begränsar oss till 15 rörelsesensorer, alltså kollar vi inte 16:e elementet(för det finns inte).
			MotionSensor m =  {
					.pinTrig = GPIO_Pins[j],
					.pinEcho = GPIO_Pins[j+1],
					.pulseTrig = 0,
					.pulseEcho = 0,
					.pulseDelay = 0,
					.cm = 400,
					.alarmDistance = 20 // Ändra denna när centralenheten kan styra över rörelseenheten - Erik
			};
			
			Sensor s = {
					.id = i*5 + j/3, 
					.port = motionPorts[i], 
					.pinLamp = GPIO_Pins[j+2], 
					.motion = m};
			
			sensors[i*5+j/3] = s;
			
			}
			
			
		}
	}	
	char lows[nMaxMotionSensors];
	uint32_t timeOut = microTicks + 500000;	// 500 ms

	while(microTicks < timeOut){
		for(int i = 0; i < nMaxMotionSensors; i++){
			MotionSensor* sensor = &(sensors[i].motion);
			if(lows[i] < 2 && microTicks > sensor->pulseTrig){ // Första låga
				GPIO_ResetBits(sensors[i].port, sensor->pinTrig);	// Avaktivera triggerpuls
				lows[i]++;
			}
			if(microTicks >= sensor->pulseDelay){
				GPIO_SetBits(sensors[i].port, sensor->pinTrig);	// Aktivera triggerpuls
				sensor->pulseTrig = microTicks + 10; // Triggpuls 10µs
				sensor->pulseDelay = microTicks + 1000000; // Triggpuls 1s
				
			}
			if(GPIO_ReadInputDataBit(sensors[i].port, sensor->pinEcho)){ // Är echo hög?
				sensors[i].controlbits |= bit0;	// Ettställer kontrollbit 0.
				sensors[i].controlbits |= bit2;	// Ettställer kontrollbit 2. Ta bort när centralenheten kan kommunicera med oss. - Erik
			}
			
		}
	}
	
	
}

void init_VibrationSensor(){
	uint8_t sensorCounter = 0;
	// Iterera genom portarna
	for (int i=0; i*sizeof(vibrationPorts[0]) < sizeof(vibrationPorts); i++) {
		// Iterera genom pinnarna
		for (int j=0; j*sizeof(GPIO_Pins[0]) < sizeof(GPIO_Pins); j += 2) {
			// Är sensorn aktiv?
			if (GPIO_ReadInputDataBit(vibrationPorts[i], GPIO_Pins[j])) {
				VibrationSensor v = {
					.pinDO = GPIO_Pins[j]
				};
				
				Sensor s = {
					.id 			= 0, // TODO
					.controlbits 	= bit0 | bit1 | bit2,
					/* Bit 0 = 0, Sensorn är ej aktiv (Den har ej tagit emot centralenhets konfiguration än)
					 * Bit 1 = 1, Sensorn är av typen vibration
					 * Bit 2 = 0, används ej
					 * Bit 3 = 1, Sensorn väntar på konfiguration från centralenheten */
					 .port 			= vibrationPorts[i],
					 .pinLamp 		= GPIO_Pins[j+1],
					 .vibration 	= v
					// Resten av structen är tom och fylls på när konfigurationen tas emot från centralenheten */
				};
				// Initiera en sensor i sensors listan efter alla rörelsesensorer
				sensors[nMaxMotionSensors + sensorCounter] = s;
				sensorCounter++;
			}
		}
	}
}

void init_Sensors(){
	init_VibrationSensor();
	init_MotionSensors();
}




//=============================CAN====================================
/**
 * @brief Hanterar CAN meddelanden
 * 
 * 
 */
void CANMsg_handler() {
	// switch
	
}

/**
 * @brief Hanterar att ta emot konfigurationer för rörelsesenorer från centralenheten
 * 
 * 
 * Byte 0: 	 ID_Byte
 * 		Bit 0-2: 	Porten, 0 -> GPIOA, 1 -> GPIOB, etc.
 * 		Bit 7: 		Typ av sensor, 0 = rörelse, 1 = vibration.
 * 
 * Byte 1-2:	 Används ej
 * 
 * Byte 3-7: (Rörelse) 		Bytes med konfiguration för rörelsesensorer. n:e byten är till n-3:e sensorn på porten, byte 3 -> sensor 0, byte 4 -> sensor 1, etc.
 * 		Bit 0-6: 	'alarmDistance' / 5
 * 		Bit 7: 		Aktiv eller ej
 * 
 * Byte 7:   (Vibration) 	Byte med konfiguration för vibrationssensorer, n:e biten är till n:e sensorn på porten, bit 0 -> sensor 0, bit 1 -> sensor 1, etc.
 * 		Biten representerar ifall sensorn är aktiv
 */
void CANGetConfig() {
	char data[8]; 	 // todo
	char valid = 0;  // Används för att kolla att konfigurationen är av rätt typ
	
	char ID_Byte = data[0];
	char p = ID_Byte & (bit0 | bit1 | bit2);  // 3 minst signifikanta bitarna representerar portsiffran.
	
	// Vibrationsensor
	if (ID_Byte & bit7) {
		// Kolla ifall porten som skickats faktiskt är av typen vibration
		for (int i=0; i*sizeof(vibrationPorts[0]) < sizeof(vibrationPorts); i++) {
			if (ports[p] == vibrationPorts[i]) {
				valid = 1;
				p = i;	//
				break;
			}
		}
		// Finns ej vibrationssensorer på porten
		if (!valid) {
			return;
		}
		char configurationByte = data[7];
		for (int i=0; i < 8; i++) {
			// Sensorn finns inte
			if(!sensors[nMaxMotionSensors + i + p*8].controlbits & bit0) {
				return;
			}
			// Sätter 'aktiv' biten
			if(configurationByte & bits[i])
				sensors[nMaxMotionSensors + p*8 + i].controlbits |= bit2;
			else
				sensors[nMaxMotionSensors + p*8 + i].controlbits &= 0xFF - bit2;
		}
	}
	// Rörelsesensor
	else {
		for (int i=0; i*sizeof(motionPorts[0]) < sizeof(motionPorts); i++) {
			if (ports[p] == motionPorts[i]) {
				valid = 1;
			}
		}
		if (!valid) {
			return;
		}
		for (int i=0; i < 5; i++) {
			// Sensorn finns inte
			if(!sensors[i + p*5].controlbits & bit0) {
				return;
			}
			
			char configurationByte = data[i+3]; 										// Aktuella konfigurationsbyten
			sensors[i+p*5].motion.alarmDistance = (configurationByte&(0xFF - bit7))*5; 	// 7 minst signifikanta bitarna är 'alarmDistance'/5
			// Sätter 'aktiv' biten
			if(configurationByte & bit7)
				sensors[i+p*5].controlbits |= bit2;
			else
				sensors[i+p*5].controlbits &= 0xFF - bit2;
		}
	}
}



void idAssign_Handler(CanRxMsg* msg){
		uint32_t rndid = *(uint32_t *)(&(msg->Data[0]));
		if(rndid == id){
			id = msg->Data[1];
			nocid = 0;

		}
	}

void init_rng(){
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_RNG, ENABLE);
    RNG_Cmd(ENABLE);
}


void getId (int nDoors){
		CANFilter filter = empty_mask;
		CANFilter mask = empty_mask;

		//används för omvandling
		Header header = empty_header;

		//skriver mask
		mask.IDE = 1;
		mask.RTR = 1;
		header.msgType = ~0;
		header.ID = ~0;
		header.toCentral = ~0;
		HEADERtoUINT32(header, mask.ID);

		//Skriver filter
		filter.IDE = 1;
		filter.RTR = 0;
		header.msgType = assignID_msg_type;
		header.ID = 0;
		header.toCentral = 0;
		HEADERtoUINT32(header, filter.ID);

		if (CANhandlerListNotFull()){
			CANaddFilterHandler(idAssign_Handler, &filter, &mask);
		}


		/*int timeStamp = msTicks + 60 * 1000; 
		if (RNG_GetFlagStatus(RNG_FLAG_DRDY) == SET && //Nytt meddelande finns
            RNG_GetFlagStatus(RNG_FLAG_CECS) == RESET && //Inget klockfel
            RNG_GetFlagStatus(RNG_FLAG_SECS) == RESET){ //Inget seedfel
			id = RNG_GetRandomNumber();
			CanTxMsg idRequest;
					
			encode_request_id(&idRequest,id,0, nDoors, 69);
			while (msTicks < timeStamp && nocid) {
				CANsendMessage(&idRequest);
				delay(1000);
			}
		}*/
}

void alarm(Sensor* sensor) {
	sensor->controlbits |= 1 << 7; 					// Markera att larmet går
	GPIO_SetBits(sensor->port, sensor->pinLamp); 	// Tänd lampa
	// Todo notifiera centralneheten via CAN
}

void disarm(Sensor* sensor) {
	sensor->controlbits &= ~(1 << 7); 					// Markera att larmet inte längre går
	GPIO_SetBits(sensor->port, sensor->pinLamp);	
}



void init_app(){

	init_Timer();
	init_GPIO_Ports();	
	DebugPrintInit(); // Todo: ta bort innan slutprodukt
	init_Sensors();
	init_rng();
	can_init();

}


void main(void){
	init_app();
	
	while(1){

			// Polling
	// Itererar över alla sensorer
	for(int i = 0; i*sizeof(sensors[0]) < sizeof(sensors); i++){
		
		// Är sensorn aktiverad och av typen motion? (controlbit 2 && !1)
		if(sensors[i].controlbits & bit2 && !(sensors[i].controlbits & bit1)){
			MotionSensor* sensor = &(sensors[i].motion);
			
			// Är trigpulsen klar?
			if(microTicks >= sensor->pulseTrig){ 					
				GPIO_ResetBits(sensors[i].port, sensor->pinTrig);	// Avaktivera triggerpuls
			}
			
			// Är triggfördröjningen klar?
			if(microTicks >= sensor->pulseDelay){  					
				GPIO_SetBits(sensors[i].port, sensor->pinTrig);		// Aktivera triggerpuls
				sensor->pulseTrig  = microTicks + 10; 				// Triggpuls 10µs
				sensor->pulseDelay = microTicks + 60000;			// Fördröjning mellan triggerpulserna, 60ms
			}
			
		
			// Är echo hög för första gången?
			if(!(sensors[i].controlbits & bit3) && GPIO_ReadInputDataBit(sensors[i].port, sensor->pinEcho)){
				sensor->pulseEcho = microTicks; 					// Början av echopulsen.
				sensors[i].controlbits |= bit3;  					// Ettställer kontrollbit 3.
			}
			// Är echo låg för första gången?
			else if (sensors[i].controlbits & bit3 && !GPIO_ReadInputDataBit(sensors[i].port, sensor->pinEcho)) {	
				sensor->cm = (microTicks - sensor->pulseEcho)/58; 	// Tid tills echo kommer tillbaks.
				sensors[i].controlbits &= ~bit3;					// Nollställer kontrollbit 3.
			}
			
			// Upptäcker sensorn något som är för nära?
			if(sensor->cm < sensor->alarmDistance){					
				GPIO_SetBits(sensors[i].port, sensors[i].pinLamp);	// Tänd lampa.
			}
			else{
				GPIO_ResetBits(sensors[i].port, sensors[i].pinLamp);// Släck lampa.
			}
		}
		
		// Är sensorn aktiverad och av typen vibration? (controlbit 1 && 2)
		else if(sensors[i].controlbits & (bit1 | bit2)) {
			VibrationSensor* sensor = &(sensors[i].vibration);
			
			if(!GPIO_ReadInputDataBit(sensors[i].port, sensor->pinDO)){
				GPIO_SetBits(sensors[i].port, sensors[i].pinLamp);
			}
			else{
				GPIO_ResetBits(sensors[i].port, sensors[i].pinLamp);
			}
		}
	
	}
	}
}
