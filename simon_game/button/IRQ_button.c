#include "button.h"
#include "lpc17xx.h"
#include "../led/led.h"

unsigned int button, pressed;

void EINT0_IRQHandler (void)	  
{
	button = 0;
	pressed = 1;
	LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
	button = 1;
	pressed = 1;
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	button = 2;
	pressed = 1;
	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */
}
