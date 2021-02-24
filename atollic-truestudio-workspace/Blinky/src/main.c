#include "stm32f4xx.h"
#define DELAY 500000
GPIO_InitTypeDef GPIO_LED;

int main(void)
{
  int i;

  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
  GPIO_LED.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
  GPIO_LED.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_LED.GPIO_OType = GPIO_OType_PP;
  GPIO_LED.GPIO_Speed = GPIO_Speed_50MHz;

  GPIO_Init(GPIOD, &GPIO_LED);

  while (1)
  {
		GPIO_WriteBit(GPIOD, GPIO_Pin_12, Bit_SET);
		for (i = 0; i < DELAY; i++);
		GPIO_WriteBit(GPIOD, GPIO_Pin_13, Bit_SET);
		for (i = 0; i < DELAY; i++);
		GPIO_WriteBit(GPIOD, GPIO_Pin_14, Bit_SET);
		for (i = 0; i < DELAY; i++);
		GPIO_WriteBit(GPIOD, GPIO_Pin_15, Bit_SET);
		for (i = 0; i < DELAY; i++);
		GPIO_WriteBit(GPIOD, GPIO_Pin_12, Bit_RESET);
		for (i = 0; i < DELAY; i++);
		GPIO_WriteBit(GPIOD, GPIO_Pin_13, Bit_RESET);
		for (i = 0; i < DELAY; i++);
		GPIO_WriteBit(GPIOD, GPIO_Pin_14, Bit_RESET);
		for (i = 0; i < DELAY; i++);
		GPIO_WriteBit(GPIOD, GPIO_Pin_15, Bit_RESET);
		for (i = 0; i < DELAY; i++);
  }
}
