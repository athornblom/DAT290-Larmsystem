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

void app_init(void)
{
    * ((unsigned long *)0x40020C00) = 0x00005555;
}

void main(void)
{
    unsigned char c;
    app_init();
    while(1){
        c = (unsigned char) *((unsigned short *) 0x40021010);
        * ((unsigned char *) 0x40020C14) = c;
    }
}

