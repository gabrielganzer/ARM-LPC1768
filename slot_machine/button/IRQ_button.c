/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           IRQ_button.c
** Last modified Date:  2019-12-05
** Last Version:        V1.00
** Descriptions:        Exercise 1 and Exercise 2
** Correlated files:    
**--------------------------------------------------------------------------------------------------------       
*********************************************************************************************************/

#include "lpc17xx.h"
#include "../LED/led.h"
#include "../button/button.h"
#include "../timer/timer.h"

/********************************************* Exercise 1 **********************************************/

extern unsigned int led_value;
unsigned int pressed, button;

void EINT0_IRQHandler (void)	  
{
	pressed = LPC_GPIO2->FIOPIN & (1<<10);
	NVIC_DisableIRQ(EINT0_IRQn);
	button = 1;
	enable_timer(0);
	BUTTON_debounce();
  LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
	pressed = LPC_GPIO2->FIOPIN & (1<<11);
	NVIC_DisableIRQ(EINT1_IRQn);
	button = 2;
	enable_timer(0);
	BUTTON_debounce();
	if (button == 1) {
		LED_Off(led_value--);
		LED_On(led_value);
		if(led_value == 4)
			led_value = 11;
	}
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	pressed = LPC_GPIO2->FIOPIN & (1<<12);
	NVIC_DisableIRQ(EINT2_IRQn);
	button = 3;
	BUTTON_debounce();
	LED_Off(led_value++);
	LED_On(led_value);
	if(led_value == 11)
			led_value = 4;
  LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}

/********************************************* Exercise 2 **********************************************/

//unsigned int timer1, timer2, timer3, wheel1, wheel2, wheel3;

//void EINT0_IRQHandler (void)	  
//{
//	if(timer3%2==1)
//	{
//		LED_On(9);
//		wheel3 = 1;
//	}
//	else
//	{
//		LED_On(8);
//		wheel3 = 0;
//	}

//	if((wheel1 + wheel2 + wheel3) == 3)
//		LED_On(11);
//	else if ((wheel1 + wheel2 + wheel3) == 0)
//		LED_On(11);
//	else
//		LED_On(10);
//	
//  LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
//}


//void EINT1_IRQHandler (void)	  
//{
//	all_LED_off();
//	if(timer1%2==1)
//	{
//		LED_On(5);
//		wheel1 = 1;
//	}
//	else
//	{
//		LED_On(4);
//		wheel1 = 0;
//	}
//	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
//}

//void EINT2_IRQHandler (void)	  
//{
//	if(timer2%2==1)
//	{
//		LED_On(7);
//		wheel2 = 1;
//	}
//	else
//	{
//		LED_On(6);
//		wheel2 = 0;
//	}
//  LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
//}

//void random (void)
//{
//	while(1){
//		timer1++;
//		timer2++;
//		timer3++;
//	}
//}
