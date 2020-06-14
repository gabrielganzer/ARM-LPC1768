/*----------------------------------------------------------------------------
 * Name:    sample.c
 * Purpose: to control led through EINT buttons
 * Note(s):
 *----------------------------------------------------------------------------
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 * Copyright (c) 2019 Politecnico di Torino. All rights reserved.
 *----------------------------------------------------------------------------*/
                  
#include <stdio.h>
#include "LPC17xx.h"                    /* LPC17xx definitions                */
#include "../LED/led.h"
#include "../button/button.h"
#include "../timer/timer.h"

extern unsigned int timer1, timer2, timer3, wheel1, wheel2, wheel3;

/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
 /******************************** Exercise 1 *********************************/
int main (void)
{  
  LED_init();               /* LED Initialization                 */
  BUTTON_init();						/* BUTTON Initialization              */
	//init_timer(0,0x023C3460);	/* TIMER0 Initialization 							*/
	init_timer(0,0x00000060);	/* TIMER0 Initialization 							*/
	
	LED_On(8);
	
  while (1) {               /* Loop forever                       */
			__ASM("wfi");
  }
}

 /******************************** Exercise 2 *********************************/
//int main (void)
//{
//  LED_init();               /* LED Initialization                 */
//  BUTTON_init();						/* BUTTON Initialization              */
//	wheel1 = 2;
//	wheel2 = 2;
//	wheel3 = 2;
//	random();
//  while (1) {               /* Loop forever                       */
//  }
//}
