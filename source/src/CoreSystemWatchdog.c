/*******************************************************************************
 * Contents: Implementation both ServiceIsRunning and SetServiceWatchdogBit.
 * Additionally, there is FreeRTOS specific ISR in at the bottom.
 * Author: Dawid Blom.
 * Date: January 15, 2023.
 *
 * NOTE: It's important to note that FreeRTOS specific ISR, the
 * vApplicationIdleHook is native to FreeRTOS and does not require a
 * definition, only a implementation.
 *******************************************************************************/
#include <CoresSystemWatchdog.h>


bool ServiceIsRunning(uint16_t bitPosition)
{
	if (((*GetWatchdog() >> bitPosition) & 1U) == 1U)
	{
		return true;
	}

	return false;
}



bool SetServiceWatchdogBit(uint16_t serviceNumber)
{
	return (*GetWatchdog() = *GetWatchdog() | (1U << serviceNumber));
}



void vApplicationIdleHook( void )
{
	for (uint16_t i = 0; i < NUMBER_OF_SERVICES; i++)
	{
		if (ServiceIsRunning(i) == true)
		{
			PRINTF("\n\n\r Service %d Kicked The Watch Dog", i);
		}
		else
		{
			PRINTF("\n\n\r Service %d Is NOT Running", i);
		}
	}
}
