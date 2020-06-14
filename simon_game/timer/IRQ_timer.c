/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           IRQ_timer.c
** Descriptions:        interrupt handlers of Timer/Counter 0 and 1
** Correlated files:    timer.h
**--------------------------------------------------------------------------------------------------------
*********************************************************************************************************/
#include "lpc17xx.h"
#include "timer.h"

unsigned int flagT0, cnt;

void TIMER0_IRQHandler (void)
{
	flagT0 = 1;
	cnt++;
  LPC_TIM0->IR = 1;			/* clear interrupt flag */
	disable_timer(0);
}

void TIMER1_IRQHandler (void)
{
  LPC_TIM1->IR = 1;			/* clear interrupt flag */
  return;
}
