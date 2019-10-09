typedef struct door
{
    char id;
    int controlbits; // 16 kontrollbitar tex den minst signifikanta biten är ifall dörren är upplåst eller ej
    char time_larm;            // tid i 10 sekunders intervall innan dörr larmar lokalt
    char time_central_larm;    // tid i 10 sekunders intervall innan dörr larmar centralenheten
    int password;              //4 sifferig kod för att låsa upp dörrarna
    int GPIO_lamp;
    int GPIO_read;
    int larmTick; // msTick == larmState ? Larm
    int GPIO_Type; //GPIOA = 0, osv
} door;
