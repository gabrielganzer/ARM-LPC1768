/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           lib_led.c
** Last modified Date:  2019-12-05
** Last Version:        V1.00
** Descriptions:        Atomic led init functions
** Correlated files:    
**--------------------------------------------------------------------------------------------------------       
*********************************************************************************************************/
#define LED_NUM     8                   /* Number of user LEDs                */
#include "LPC17xx.h"
#include "led.h"

const unsigned long led_mask[LED_NUM] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
unsigned int led_value;

/*----------------------------------------------------------------------------
  Function that initializes LEDs
 *----------------------------------------------------------------------------*/

void LED_init(void)
{
	LPC_PINCON->PINSEL4 &= 0xFFFF0000;	// PIN mode GPIO: P2.0-P2.7 are set to zero
	LPC_GPIO2->FIODIR |= 0x000000FF;		// P2.0-P2.7 on PORT2 defined as Output
}

void LED_deinit(void)
{
  LPC_GPIO2->FIODIR &= 0xFFFFFF00;
}

/*----------------------------------------------------------------------------
  Functions that turn on/off all led
 *----------------------------------------------------------------------------*/

void all_LED_on(void)
{
	LPC_GPIO2->FIOSET = 0x000000FF;
}

void all_LED_off(void)
{
	LPC_GPIO2->FIOCLR = 0x000000FF;
}

/*----------------------------------------------------------------------------
  Functions that turn on/off the requested led
 *----------------------------------------------------------------------------*/
void LED_On(unsigned int num)
{
	led_value = num;
  LPC_GPIO2->FIOPIN |= led_mask[11-num];
}

void LED_Off(unsigned int num)
{
  LPC_GPIO2->FIOPIN &= ~led_mask[11-num];
}
