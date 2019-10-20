#include "functions.h"


// =============================== ALL FUNCTIONS FOR THE DOORS CHECKING
const int larming = 1;
const int cLarm = 2;
const int dissarmedBit = 4;
// allmäna
void delay (int mili){
		int time = msTicks + mili;
		while(time > msTicks);
	}

// functions for while loop in main
int is_door_armed(int controlbitts){
    if (controlbitts & dissarmedBit){
        return 0;
    } else
    {
        return 1;
    }
}

void check_door_status (door *aDoors, int arrayLength){
    for (int i = 0; i < arrayLength; i++)
    {
        if (is_door_armed(aDoors->controlbits))
        {
           if (!GPIO_ReadInputDataBit(aDoors->GPIO_type, aDoors->GPIO_read)){ //GPIO pinnen är noll ifall dörren är stängd därför !
					aDoors->controlbits &= 0xFFFF - larming - cLarm; //Nollställer kontrollbiten för larm ifall en dörr är öppen och spam kontrollbiten för central		
			}
			else{
                if (!aDoors->controlbits & larming) // Kollar så att dörren inte larmar sen innan så larmtick inte uppdateras hela tiden
                {
                    aDoors->larmTick = msTicks;
                }
                aDoors->controlbits |= larming; //sätter dörrens kontrolbit för larm
            }
        }
       aDoors++;   
    }
    
}

void door_uppdate_lamps (door *door){
    uint32_t larmTime = door->larmTick + 1000 * 10 * door->time_larm;
    if (door->controlbits & larming && msTicks > larmTime) {
            GPIO_SetBits(door->GPIO_type, door->GPIO_lamp); // tänder lampan ifall tiden för att dörren ska larma har gått
    }
    else{
            GPIO_ResetBits(door->GPIO_type, door->GPIO_lamp);	// släcker lampan annars
        }
}

int central_larm(door *door){
    uint32_t larmTime = door->larmTick + 1000 * 10 * door->time_central_larm;
    if(door->controlbits&larming && msTicks>larmTime && !(door->controlbits & cLarm)){
    	door->controlbits |= cLarm;    
        return 1;
    }else{
        return 0;
    }
}

// ================================== LIGHTS ========================================================= 
void startup_lights (door *aDoors, int aLength){
	
	for (int i = 0; i < aLength; i++) //CHRISTMAST LIGHTS FTW
	{
		GPIO_SetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
		delay(100);	
        aDoors++;
		
	}
	for (int i = aLength; i > 0 ; i--) //CHRISTMAST LIGHTS FTW
	{
		GPIO_ResetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
		delay(100);
        aDoors--;
	}
	delay(200);
	for (int i = 0; i < aLength; i++) //CHRISTMAST LIGHTS FTW
	{
		GPIO_SetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
        aDoors++;
	}
	delay(3000);
	for (int i = 0; i < aLength; i++) //CHRISTMAST LIGHTS FTW
	{
		GPIO_ResetBits(aDoors->GPIO_type, aDoors->GPIO_lamp);
        aDoors--;
	}
}