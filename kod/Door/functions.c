#include "functions.h"

// Variabel där man ställer in vilken bit i kontrollbitarna som representerar vad.
const int open = 1;
const int cLarm = 2;
const int dissarmedBit = 4;
const int addaptS = 10000;
// allmän dynamisk delay funktion.
void delay (int mili){
		int time = msTicks + mili * addaptS /1000;
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

void check_door_status (void){
    for (int i = 0; i < amountOfActiveDoors; i++)
    {
        if (is_door_armed(doors[i].controlbits)) // ifall dörren är avlarmad uppdateras inte dens pinnar.
        {
           if (!GPIO_ReadInputDataBit(doors[i].GPIO_type, doors[i].GPIO_read)){ //GPIO pinnen är noll ifall dörren är stängd därför !
					doors[i].controlbits &= ~open+cLarm; //Nollställer kontrollbiten för larm ifall en dörr är öppen och spam kontrollbiten för central	
                    doors[i].waitOutTime = 0;	
			}
			else{
                if (!doors[i].controlbits & open) // Kollar så att dörren inte har detekteras som öppen innan
                {
                    doors[i].larmTick = msTicks;
                }
                doors[i].controlbits |= open; //sätter dörrens kontrolbit för att den är öppen
            }
        } 
    }
    
}
// Funktion som tänder eller släcker den lokala larmnings lampan
void door_uppdate_lamps (char i){
    uint32_t larmTime = doors[i].larmTick + 10 * addaptS *doors[i].time_larm; // gångrar med 10 * 1000 eftersom att tiden anges i 10 s interval
    if (doors[i].controlbits & open && msTicks > larmTime) {
            GPIO_SetBits(doors[i].GPIO_type, doors[i].GPIO_lamp); // tänder lampan ifall tiden för att dörren ska larma har gått
    }
    else{
            GPIO_ResetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);	// släcker lampan annars
        }
}
// Funktion som kollar ifall dörren har vart öppen tillräckligt länge för att den ska larma centralt.
int central_larm(char i){
    uint32_t larmTime = doors[i].larmTick + 10 * addaptS*doors[i].time_central_larm + (addaptS * doors[i].waitOutTime);// gångrar med 10 * addaptS eftersom att tiden anges i 10 s interval
    if(doors[i].controlbits&open && msTicks>larmTime 
	&& !(doors[i].controlbits & cLarm) && !nocid){
        doors[i].waitOutTime++;
    	//doors[i].controlbits |= cLarm;    // sätter kontrollbiten som säger att dörren har larmat centralt.
        return 1;
    }else{
        return 0;
    }
}

void check_door_sound (){
    int checkV = 0;
    for (int i = 0; i < amountOfActiveDoors; i++){
        uint32_t larmTime = doors[i].larmTick + 10 * addaptS*doors[i].time_larm; // gångrar med 10 * 1000 eftersom att tiden anges i 10 s interval
        if(doors[i].controlbits & open && msTicks > larmTime){
        checkV = 1;
        break;
        }
    }
    annydoorLarm = checkV;
}
// ================================== LIGHTS =========================================================
//bara för cool-het's faktorn. 
void startup_lights (){
	
	for (int i = 0; i < amountOfActiveDoors; i++) 
	{
		GPIO_SetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
		delay(100);	
	}
	for (int i = amountOfActiveDoors; i >= 0 ; i--) 
	{
		GPIO_ResetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
		delay(100);
	}
	delay(200);
	for (int i = 0; i < amountOfActiveDoors; i++) 
	{
		GPIO_SetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
	}
	delay(3000);
	for (int i = 0; i < amountOfActiveDoors; i++) 
	{
		GPIO_ResetBits(doors[i].GPIO_type, doors[i].GPIO_lamp);
	}
}