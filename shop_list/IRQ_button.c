#include "button.h"
#include "lpc17xx.h"

extern unsigned int key1, key2;

void EINT0_IRQHandler (void)	  
{
	LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
	key1 = 1;
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	key2 = 1;
	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}
