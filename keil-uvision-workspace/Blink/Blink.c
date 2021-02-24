#include <stm32f4xx_hal.h>

void LED_Init(void);

int main()
{
	uint32_t i;
	
	HAL_Init();
	LED_Init();
	
	while(1)
	{
		HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_12);
		
		for(i=0; i<4000000; i++);
	}
}

void LED_Init(void)
{
	GPIO_InitTypeDef LED_Init;
	
	__HAL_RCC_GPIOD_CLK_ENABLE();
	
	LED_Init.Pin = GPIO_PIN_12;
	LED_Init.Mode = GPIO_MODE_OUTPUT_PP;
	LED_Init.Pull = GPIO_NOPULL;
	LED_Init.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOD, &LED_Init);
}
