#include "stm32f4xx.h"
//#include "stm32f401_discovery.h"
//#include "stm32f4xx_hal.h"

#define DELAY 500000
GPIO_InitTypeDef GPIO_LED;

int main(void)
{
	int i = 0;

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
    GPIO_LED.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
    GPIO_LED.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_LED.GPIO_OType = GPIO_OType_PP;
    GPIO_LED.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_LED.GPIO_Speed = GPIO_Speed_50MHz;

    GPIO_Init(GPIOD, &GPIO_LED);

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
    GPIO_LED.GPIO_Pin = GPIO_Pin_6;
    GPIO_LED.GPIO_Mode = GPIO_Mode_IN;
    GPIO_LED.GPIO_OType = GPIO_OType_PP;
    GPIO_LED.GPIO_PuPd = GPIO_PuPd_DOWN;
    GPIO_LED.GPIO_Speed = GPIO_Speed_50MHz;

    GPIO_Init(GPIOC, &GPIO_LED);

    while (1)
    {
    	GPIO_WriteBit(GPIOD, GPIO_Pin_12, Bit_SET);
    	GPIO_WriteBit(GPIOD, GPIO_Pin_13, Bit_RESET);
    	//for (i = 0; i < 5*DELAY; i++);
    	//GPIO_WriteBit(GPIOD, GPIO_Pin_12, Bit_RESET);
    	//GPIO_WriteBit(GPIOD, GPIO_Pin_13, Bit_SET);
    	//for (i = 0; i < 5*DELAY; i++);

    	if(GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_6))
    	{
    		GPIO_WriteBit(GPIOD, GPIO_Pin_15, Bit_SET);
    	}
    	else
    	{
    		GPIO_WriteBit(GPIOD, GPIO_Pin_15, Bit_RESET);
    	}
    }
}
