/*
 * 	startup.c
 *
 */
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

void main(void)
{
	struct door* newItem = malloc(sizeof(struct door));
}
	
	


inline struct door* door(char id, char controlbits, char time_larm,char time_central_larm, short password)
{
    return (struct my*)(id, controlbits, time_larm,time_central_larm,password);
}


struct door {
	char id;
	char controlbits; // 8 kontrollbitar tex den minst signifikanta biten är ifall dörren är upplåst eller ej
	char time_larm; // tid i 10 sekunders intervall innan dörr larmar lokalt
	char time_central_larm; // tid i 10 sekunders intervall innan dörr larmar centralenheten
	short password; //4 sifferig kod för att låsa upp dörrarna
}


// Array av arrayer för Centralenheten, 2d, en siffra för kortet, en siffra för dörrarna, 