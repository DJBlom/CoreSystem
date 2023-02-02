/*******************************************************************************
 * Contents: Implementation of the core system initialization function.
 * Additionally, there is a FreeRTOS specific ISR at the bottom called
 * vApplicationTickHook, and is used as a sequencer.
 * Author: Dawid Blom.
 * Date: January 15, 2023.
 *
 * NOTE: It's important to note that this ISR is native to FreeRTOS and does not
 * require a definition, only an implementation.
 *******************************************************************************/
#include "CoreSystem.h"


static TickType_t currentTickCount = 0;


bool CoreSystemInitialization( void )
{
	SetWatchdog(0);

	for (int i = 0; i < NUMBER_OF_SERVICES; i++)
	{
		SetServiceSemaphore(xSemaphoreCreateBinary());
		if (GetServiceSemaphore(i) == NULL)
		{
			return false;
		}
	}

	SetWatchdogMutex(xSemaphoreCreateMutex());

	if (GetWatchdogMutex() == NULL)
	{
		return false;
	}

	return true;
}



void vApplicationTickHook( void )
{

	currentTickCount = xTaskGetTickCount();


	if ((currentTickCount % SERVICE1_HZ) == ZERO)
	{
		xSemaphoreGiveFromISR(GetServiceSemaphore(ZERO), NULL);
	}

	if ((currentTickCount % SERVICE2_HZ) == ZERO)
	{
		xSemaphoreGiveFromISR(GetServiceSemaphore(ONE), NULL);
	}

	if ((currentTickCount % SERVICE3_HZ) == ZERO)
	{
		xSemaphoreGiveFromISR(GetServiceSemaphore(TWO), NULL);
	}

	if ((currentTickCount % SERVICE4_HZ) == ZERO)
	{
		xSemaphoreGiveFromISR(GetServiceSemaphore(THREE), NULL);
	}

	if ((currentTickCount % SERVICE5_HZ) == ZERO)
	{
		xSemaphoreGiveFromISR(GetServiceSemaphore(FOUR), NULL);
	}

	if ((currentTickCount % SERVICE6_HZ) == ZERO)
	{
		xSemaphoreGiveFromISR(GetServiceSemaphore(FIVE), NULL);
	}
}











