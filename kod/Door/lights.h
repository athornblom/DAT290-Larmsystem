#include "systick.h"
    void bootupLight(door active_doors[]){
    for (int i = 0; i < sizeof(active_doors)/sizeof(active_doors[0]); i++) //CHRISTMAST LIGHTS FTW
	{
		GPIO_SetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
		GPIO_ResetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
		
	}
	for(int i = sizeof(active_doors)/sizeof(active_doors[0]); i > 0; i--){
		GPIO_SetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
		int waitde = msTicks + 100;
		while (msTicks < waitde);
		GPIO_ResetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
	}
	for (int i = 0; i < sizeof(active_doors)/sizeof(active_doors[0]); i++) //CHRISTMAST LIGHTS FTW
	{
		GPIO_SetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
	}
		int waitde1 = msTicks + 3000;
		while (msTicks < waitde1);
	for(int i = sizeof(active_doors)/sizeof(active_doors[0]); i > 0; i--){
		GPIO_ResetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
	}
	int waitde3 = msTicks + 100;
		while (msTicks < waitde3);
	for (int i = 0; i < sizeof(active_doors)/sizeof(active_doors[0]); i++) //CHRISTMAST LIGHTS FTW
	{
		GPIO_SetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
	}
	int waitde2 = msTicks + 100;
		while (msTicks < waitde2);
	for(int i = sizeof(active_doors)/sizeof(active_doors[0]); i > 0; i--){
		GPIO_ResetBits(active_doors[i].GPIO_type, active_doors[i].GPIO_lamp);
	}
    }