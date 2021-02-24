#include "stm32f4xx.h"
//#include "stm32f401_discovery.h"
// to record number of slits
uint8_t slits;
// to calculate speed of motor in rpm
double rpm;
int main(void) {
	// initial values
	slits = 0;
	rpm = 0;
	// Enabling CLock
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE);

	// Configure Pin 0 of Port D to detect rising edges
	GPIO_InitTypeDef gpio;
	gpio.GPIO_Pin = GPIO_Pin_0;
	gpio.GPIO_Mode = GPIO_Mode_IN;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_Speed = GPIO_Speed_2MHz;
	gpio.GPIO_PuPd = GPIO_PuPd_DOWN;
	GPIO_Init(GPIOD, &gpio);

	EXTI_InitTypeDef EXTI_InitStructure;
	EXTI_InitStructure.EXTI_Line = EXTI_Line0;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);
	SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOD, EXTI_PinSource0);

	gpio.GPIO_Pin = GPIO_Pin_12;
	gpio.GPIO_Mode = GPIO_Mode_OUT;
	gpio.GPIO_OType = GPIO_OType_PP;
	gpio.GPIO_Speed = GPIO_Speed_2MHz;
	gpio.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOD, &gpio);

	/* Enable and set Button EXTI Interrupt to the lowest priority */
	NVIC_InitTypeDef NVIC_InitStructure;
	NVIC_InitStructure.NVIC_IRQChannel = EXTI0_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	TIM_TimeBaseInitTypeDef timStruct;
	timStruct.TIM_Period = 0xFFFF;
	timStruct.TIM_Prescaler = 0xFFF;
	timStruct.TIM_ClockDivision = 0;
	timStruct.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInit(TIM4, &timStruct);
	GPIOD->ODR = 0x02;
	TIM_Cmd(TIM4, ENABLE);
	while (1) {
///
	}

}

void EXTI0_IRQHandler() {
	if (EXTI_GetITStatus(EXTI_Line0)) {
		slits++;
		if (slits == 20) {
			rpm = (double) 60/ ((0xFFF+1)* (double) (TIM_GetCounter(TIM4)/ (double) SystemCoreClock));
			slits = 0;
			TIM_SetCounter(TIM4, 0);
		}
		EXTI_ClearITPendingBit(EXTI_Line0);
	}
}
/*
 * Callback used by stm32f401_discovery_audio_codec.c.
 * Refer to stm32f401_discovery_audio_codec.h for more info.
 */
void EVAL_AUDIO_TransferComplete_CallBack(uint32_t pBuffer, uint32_t Size) {
	/* TODO, implement your code here */
	return;
}

/*
 * Callback used by stm32f401_discovery_audio_codec.c.
 * Refer to stm32f401_discovery_audio_codec.h for more info.
 */
uint16_t EVAL_AUDIO_GetSampleCallBack(void) {
	/* TODO, implement your code here */
	return -1;
}
