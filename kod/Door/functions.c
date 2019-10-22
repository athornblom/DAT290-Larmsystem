#include "functions.h"

// Variabel där man ställer in vilken bit i kontrollbitarna som representerar vad.
const int open = 1;
const int cLarm = 2;
const int dissarmedBit = 4;
const int addaptS = 10;
// allmän dynamisk delay funktion.
void delay (int mili){
		int time = msTicks + mili * addaptS;
		while(time > msTicks);
	}

// Kollar så att dörren inte är avlarmad. Returnar 0 ifall avlarmad
int is_door_armed(int controlbitts){
    if (controlbitts & dissarmedBit){
        return 0;
    } else
    {
        return 1;
    }
}
// Uppdaterar kontrollbitarna för varje dörr.

void check_door_status (door *aDoors, int arrayLength){
    for (int i = 0; i < arrayLength; i++)
    {
        if (is_door_armed(aDoors->controlbits)) // ifall dörren är avlarmad uppdateras inte dens pinnar.
        {
           if (!GPIO_ReadInputDataBit(aDoors->GPIO_type, aDoors->GPIO_read)){ //GPIO pinnen är noll ifall dörren är stängd därför !
					aDoors->controlbits &= 0xFFFF - open - cLarm; //Nollställer kontrollbiten för larm ifall en dörr är öppen och spam kontrollbiten för central		
			}
			else{
                if (!aDoors->controlbits & open) // Kollar så att dörren inte har detekteras som öppen innan
                {
                    aDoors->larmTick = msTicks;
                }
                aDoors->controlbits |= open; //sätter dörrens kontrolbit för att den är öppen
            }
        }
       aDoors++;   
    }
    
}
// Funktion som tänder eller släcker den lokala larmnings lampan
void door_uppdate_lamps (door *door){
    uint32_t larmTime = door->larmTick + 1000 * 10 * addaptS *door->time_larm; // gångrar med 10 * 1000 eftersom att tiden anges i 10 s interval
    if (door->controlbits & open && msTicks > larmTime) {
            GPIO_SetBits(door->GPIO_type, door->GPIO_lamp); // tänder lampan ifall tiden för att dörren ska larma har gått
    }
    else{
            GPIO_ResetBits(door->GPIO_type, door->GPIO_lamp);	// släcker lampan annars
        }
}
// Funktion som kollar ifall dörren har vart öppen tillräckligt länge för att den ska larma centralt.
int central_larm(door *door){
    uint32_t larmTime = door->larmTick + 1000 * 10 * addaptS*door->time_central_larm;// gångrar med 10 * 1000 eftersom att tiden anges i 10 s interval
    if(door->controlbits&open && msTicks>larmTime && !(door->controlbits & cLarm)){
    	door->controlbits |= cLarm;    // sätter kontrollbiten som säger att dörren har larmat centralt.
        return 1;
    }else{
        return 0;
    }
}

void check_door_sound (door *aDoors, int arrayLength){
    int checkV = 0;
    for (int i = 0; i < arrayLength; i++){
        uint32_t larmTime = aDoors->larmTick + 1000 * 10 * addaptS*aDoors->time_larm; // gångrar med 10 * 1000 eftersom att tiden anges i 10 s interval
        if(aDoors->controlbits & open && msTicks > larmTime){
        checkV = 1;
        break;
        }
        aDoors++;
    }
    annydoorLarm = checkV;
}
// ================================== LIGHTS =========================================================
//bara för cool-het's faktorn. 
void startup_lights (door *aDoors, int aLength){
	
	for (int i = 0; i < aLength; i++) 
	{
		GPIO_SetBits(GPIOA, GPIO_Pin_5);
		GPIO_SetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
		delay(100);	
		GPIO_ResetBits(GPIOA, GPIO_Pin_5);
        aDoors++;
		
	}
	for (int i = aLength; i > 0 ; i--) 
	{
		GPIO_ResetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
		delay(100);
        aDoors--;
	}
	delay(200);
	for (int i = 0; i < aLength; i++) 
	{
		GPIO_SetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
        aDoors++;
	}
	delay(3000);
	for (int i = 0; i < aLength; i++) 
	{
		GPIO_ResetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
        aDoors--;
	}
}