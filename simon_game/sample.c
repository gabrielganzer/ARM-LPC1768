/*----------------------------------------------------------------------------
 * Name:    sample.c
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 * Copyright (c) 2019 Politecnico di Torino. All rights reserved.
 *----------------------------------------------------------------------------*/
                  
#include <stdio.h>
#include "LPC17xx.h"                    /* LPC17xx definitions                */
#include "led/led.h"
#include "button/button.h"
#include "timer/timer.h"

enum {s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6};
unsigned int state = s0, i, j, n, seq[256];
extern unsigned int flagT0, pressed, button, led, cnt;

/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
int main (void)
{  
	LED_init();										/* LED Initialization                 */
	BUTTON_init();								/* BUTTON Initialization              */
	init_timer(0,0x023C3460);			/* TIMER0 Initialization              */
	init_timer(1,0x00BEBC20);			/* TIMER1 Initialization              */
	
	while(1){
		switch(state){
		  case s1:
					enable_timer(0);
					if(flagT0){
						if (i == (n-1)){
							led = LPC_TIM1->TC%3;
							LED_On(led);
							seq[i++] = led;
						}
						else {
							LED_On(seq[i++]);
						}
						flagT0 = 0;
						state = s2;
					}
				break;
			case s2:
					enable_timer(0);
					if(flagT0){
						all_LED_off();
						flagT0 = 0;
						if(cnt<n*2)
							state = s1;
						else {
							cnt = 0;
							state = s3;
						}
					}
				break;
			case s3:
					if(pressed)
					{
						pressed = 0;
						if(button == seq[j]){
							j++;
							state = s5;
						}
						else
							state = s4;
					}
				break;
			case s4:
					LPC_GPIO2->FIOPIN = ++j;
					if (pressed){
						pressed = 0;
						state = s0;
					}
					else
						state = s4;
				break;
			case s5:
					if(j<n)
						state = s3;
					else
						state = s6;
				break;
			case s6:
					LPC_GPIO2->FIOPIN = n;
					i = 0;
					j = 0;
					if (pressed) {
						n++;
						pressed = 0;
						all_LED_off();
						state = s1;
					}
					else
						state = s6;
				break;
			case s0:
			default:
					i = 0;
					j = 0;
					n = 1;
					all_LED_off();
					enable_timer(1);
					state = s1;
				break;
		}
	}
}
