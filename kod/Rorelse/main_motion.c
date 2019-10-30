/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );



#include "CAN_motion.h"



void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}


// ================================ Globala Variabler ======================================
char bits[] = {bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7};


uint16_t GPIO_Pins[] = {
	GPIO_Pin_0, GPIO_Pin_1, GPIO_Pin_2, GPIO_Pin_3, GPIO_Pin_4, GPIO_Pin_5,
	GPIO_Pin_6, GPIO_Pin_7, GPIO_Pin_8, GPIO_Pin_9, GPIO_Pin_10, GPIO_Pin_11,
	GPIO_Pin_12, GPIO_Pin_13, GPIO_Pin_14, GPIO_Pin_15};



// Dessa är konfigurerbara
GPIO_TypeDef* motionPorts[3] 	= {GPIOA, GPIOB, GPIOC};
GPIO_TypeDef* vibrationPorts[2] = {GPIOD, GPIOE};



// Alla sensorer, denna initieras under init_Sensors.
Sensor sensors[nMaxMotionSensors + nMaxVibrationSensors];	// Array för max antalet sensorer.
Sensor initMotionSensors[nMaxMotionSensors];	// Lista som används i början vid initiering av rörelsesensorerna.

char connectedCounter = 0;	// Räknare till connectedSensors, en global variabel för den används i 'init_MotionSensors' och 'init_VibrationSensors'.

uint8_t nMotionSensors = 0;		// Antalet rörelsesensorer kopplade till MD407-kortet.
uint8_t nVibrationSensors = 0;	// Antalet vibrationssensorer kopplade till MD407-kortet.




// Kollar ifall det är en giltlig pinne en sensor kopplas till. OBS!!! Funkar endast när GPIOA och GPIOB är designerade portar för rörelsesensorer. (Detta skall ändras -Erik)
int validPin(GPIO_TypeDef* port, uint16_t pin){
	if((port == GPIOA) && (pin == GPIO_Pin_1 || pin == GPIO_Pin_10 || pin == GPIO_Pin_13))
		return 0;
		
	if((port == GPIOB) && (pin == GPIO_Pin_1 || pin == GPIO_Pin_4 || pin == GPIO_Pin_7 || pin == GPIO_Pin_10))
		return 0;
	
	return 1;
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
		init.GPIO_PuPd = GPIO_PuPd_DOWN;
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
			if(!((i*5+j/3) == nMaxMotionSensors)){ // Nollindexerat och därför hade 'initMotionSensors[nMaxMotionSensors]' varit out of bounds.
			
			MotionSensor m =  {
					.pinTrig	= GPIO_Pins[j],
					.pinEcho	= GPIO_Pins[j+1],
					.pulseTrig	= 0,
					.pulseEcho	= 0,
					.pulseDelay = 0,
					.timeOut	= microTicks + 60000000,	// Högt värde (microTicks + 60s) i initialisering för att inte larma i direkt när mainloopen körs.
					.cm			= 400,
					.multiple	= 1,
					.alarmDistance = 20 // Ändra denna när centralenheten kan styra över rörelseenheten - Erik
			};
			
			Sensor s = {
					.id 		= 0,
					.port 		= motionPorts[i],
					.pinLamp 	= GPIO_Pins[j+2],
					.alarmDelay	= 0,
					.motion = m};
			
			initMotionSensors[i*5+j/3] = s;
			
			}
			
			
		}
	}	
	char lows[nMaxMotionSensors];	// Räknar antalet gånger en rörelsesensors 'pinTrig' varit låg.
	uint32_t timeOut = microTicks + 500000;	// 500 ms

	while(microTicks < timeOut){
		for(int i = 0; i < nMaxMotionSensors; i++){
			MotionSensor* mSensor = &(initMotionSensors[i].motion);
			
			if (validPin(initMotionSensors[i].port, mSensor->pinEcho)){				
				if(lows[i] < 2 && microTicks > mSensor->pulseTrig){ // Första låga
					GPIO_ResetBits(initMotionSensors[i].port, mSensor->pinTrig);	// Avaktivera triggerpuls
					lows[i]++;
				}
				if(microTicks >= mSensor->pulseDelay){
					GPIO_SetBits(initMotionSensors[i].port, mSensor->pinTrig);	// Aktivera triggerpuls
					mSensor->pulseTrig = microTicks + 10; // Triggpuls 10µs
					mSensor->pulseDelay = microTicks + 1000000; // Triggpuls 1s
					
				}
				if(GPIO_ReadInputDataBit(initMotionSensors[i].port, mSensor->pinEcho) && !(initMotionSensors[i].controlbits & bit0)){ // Är echo hög och bitarna har inte redan satts?
					initMotionSensors[i].controlbits |= bit0;	// Ettställer kontrollbit 0.
					initMotionSensors[i].controlbits |= bit2;	// Ettställer kontrollbit 2. Ta bort när centralenheten kan kommunicera med oss. - Erik
					// Lägger till inkopplade rörelsesensorers i 'sensors'.
					sensors[connectedCounter] = initMotionSensors[i];
					sensors[connectedCounter].id = connectedCounter;
					connectedCounter++;
					nMotionSensors++;
				}
			}
		}
	}	
}

void init_VibrationSensor(){
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
					.id 			= connectedCounter,
					.controlbits 	= bit0 | bit1 | bit2,
					/* Bit 0 = 1, Sensor inkopplad
					 * Bit 1 = 1, Sensorn är av typen vibration
					 * Bit 2 = 1, Sensorn är aktiv (Ändra när centralenheten kan konfigurerar sensorerna)*/
					 .port 			= vibrationPorts[i],
					 .pinLamp 		= GPIO_Pins[j+1],
					 .alarmDelay	= 0,
					 .vibration 	= v
					// Resten av structen är tom och fylls på när konfigurationen tas emot från centralenheten */
				};
				// Initiera en sensor i sensors arrayen efter alla rörelsesensorer
				sensors[connectedCounter] = s;
				connectedCounter++;
				nVibrationSensors++;
			}
		}
	}
}

void init_Sensors(){
	init_MotionSensors();
	init_VibrationSensor();
}



void init_app(){

	init_Timer();
	init_GPIO_Ports();	
	DebugPrintInit(); // Todo: ta bort innan slutprodukt
	init_Sensors();
	init_rng();
	can_init();
	getId();
}


/**
 * @brief Pollingfunktion för att pinga & mäta distans
 * @param sensor: rörelsesensor
 * @return 0 Då ett värde inte mäts, 1 då det görs, 2 vid timeout.
 */
int motionMeasure(Sensor *sensor) {
	MotionSensor* mSensor = &(sensor->motion);
	
	// Är trigpulsen klar?
	if(microTicks >= mSensor->pulseTrig){ 					
		GPIO_ResetBits(sensor->port, mSensor->pinTrig);		// Avaktivera triggerpuls
	}
	
	// Är triggfördröjningen klar?
	if(microTicks >= mSensor->pulseDelay){  					
		GPIO_SetBits(sensor->port, mSensor->pinTrig);		// Aktivera triggerpuls
		mSensor->pulseTrig  = microTicks + 10; 				// Triggpuls 10µs
		mSensor->pulseDelay = microTicks + 60000;			// Fördröjning mellan triggerpulserna, 60ms
	}
	

	// Är echo hög för första gången?
	if(!(sensor->controlbits & bit3) && GPIO_ReadInputDataBit(sensor->port, mSensor->pinEcho)){
		mSensor->timeOut = microTicks + 500000;		// Ifall echo inte varit hög på 0.5s ska det larma.
		mSensor->pulseEcho = microTicks; 			// Början av echopulsen.
		sensor->controlbits |= bit3;  				// Ettställer kontrollbit 3.
	}
	
	// Är echo låg för första gången?
	else if (sensor->controlbits & bit3 && !GPIO_ReadInputDataBit(sensor->port, mSensor->pinEcho)) {	
		mSensor->cm = mSensor->multiple*(microTicks - mSensor->pulseEcho)/58; 	// Tid tills echo kommer tillbaks.
		sensor->controlbits &= ~bit3;							// Nollställer kontrollbit 3.
		return 1;
	}
	
	// Timeout över 40ms
	if (microTicks - mSensor->pulseEcho > 40000) {
		return 2;
	}
	
	return 0;	
}


/**
 * @brief sköter alla pollingfunktioner för rörelsensorer
 * 
 * @returval returnar 0 vid fel, 1 vid inga fel
 */
char motionPolling(Sensor *sensor) {
	if (sensor->controlbits & bit1) {  // Ogiltig sensortyp
		return 0; 
	}
	
	motionMeasure(sensor);
	
	MotionSensor* mSensor = &(sensor->motion);

	// Sensorn upptäcker att något är för nära eller att sensorn kopplats ut, fortsätt larma tills centralenheten skickat larm-ACK.
	if((((mSensor->cm < mSensor->alarmDistance || mSensor->timeOut < microTicks) && !(sensor->controlbits & bit6)) || sensor->controlbits & bit7) && microTicks > sensor->alarmDelay){
		sensor->alarmDelay = microTicks + 1000000;	// Skickar larm en gång i sekunden till det är kviterat.
		alarm(sensor);	// Larmar centralenheten
		//GPIO_SetBits(sensor->port, sensor->pinLamp);	// Tänd lampa.

	}

	/*else{
		GPIO_ResetBits(sensor->port, sensor->pinLamp);	// Släck lampa.
	}*/
}


void vibrationPolling(Sensor *sensor) {
	VibrationSensor* vSensor = &(sensor->vibration);
				
	// Vibration detekterat, larma.
	if(((!GPIO_ReadInputDataBit(sensor->port, vSensor->pinDO) && !(sensor->controlbits & bit6)) || sensor->controlbits & bit7) && microTicks > sensor->alarmDelay){
		sensor->alarmDelay = microTicks + 1000000;	// Skickar larm en gång i sekunden till det är kviterat.
		alarm(sensor);	// Larmar centralenheten){
		
		//GPIO_SetBits(sensor->port, sensor->pinLamp);
	}

	/*else{
		GPIO_ResetBits(sensor->port, sensor->pinLamp);
	}*/
}


void main(void){
	init_app();
	
	while(1){

		// Polling
		// Itererar över alla inkopplade sensorer.
		for(int i = 0; i < connectedCounter; i++){
			
			//==========TEST FÖR ATT KOLLA ATT 'sensors' ÄR RÄTT===================
			//DebugPrint("\n");
			//DebugPrintNum(sensors[i].id);
			//delayMicro(500000);
			//=====================================================================

			// Är sensorn aktiverad och av typen motion? (controlbit 2 && !1)
			if(sensors[i].controlbits & bit2 && !(sensors[i].controlbits & bit1)){
				motionPolling(&sensors[i]);
			}
			
			// Är sensorn aktiverad och av typen vibration? (controlbit 1 && 2)
			else if(sensors[i].controlbits & (bit1 | bit2)) {
				vibrationPolling(&sensors[i]);
			}
		}
	}
}
