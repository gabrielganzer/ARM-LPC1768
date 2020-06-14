/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           lib_led.c
** Last modified Date:  2019-11-26
** Last Version:        V1.00
** Descriptions:        Atomic led init functions
** Correlated files:    
**--------------------------------------------------------------------------------------------------------       
*********************************************************************************************************/
#include "LPC17xx.h"
#include "led.h"

const unsigned long led_mask[] = {1UL, 1UL<<1, 1UL<<2, 1UL<<3, 1UL<<4, 1UL<<5, 1UL<<6, 1UL<<7};
/*----------------------------------------------------------------------------
  Function that initializes LEDs and switch them on/off
 *----------------------------------------------------------------------------*/
 
void led4and11_On(void)
{
	LPC_GPIO2->FIOSET = 0x00000081;			// P2.0 AND P2.7 on PORT2 active
}

void led4_Off(void)
{
	LPC_GPIO2->FIOCLR = 0x00000080;
}

void ledEvenOn_OddOf(void)
{
	LPC_GPIO2->FIOPIN = 0x00000055;
}

void LED_On(unsigned int num)
{
  LPC_GPIO2->FIOPIN |= led_mask[11-num];
}

void LED_Off(unsigned int num)
{
  LPC_GPIO2->FIOPIN &= ~led_mask[11-num];
}
