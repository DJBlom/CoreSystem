/*******************************************************************************
 * Contents: Implementation of the system service creation function and services.
 * Author: Dawid Blom.
 * Date: January 20, 2023.
 *
 * NOTE:
 *******************************************************************************/
#include <CoreSystemServices.h>


#define TRUE 1

bool CreateSystemServices( void )
{
	BaseType_t task;

	task = xTaskCreate(Service1, "Service1", STACK_SIZE, NULL, tskIDLE_PRIORITY + SIX, GetServiceHandle(ZERO));
	if (task == pdFAIL)
	{
		return false;
	}


	task = xTaskCreate(Service2, "Service2", STACK_SIZE, NULL, tskIDLE_PRIORITY + FIVE, GetServiceHandle(ONE));
	if (task == pdFAIL)
	{
		return false;
	}

	task = xTaskCreate(Service3, "Service3", STACK_SIZE, NULL, tskIDLE_PRIORITY + FOUR, GetServiceHandle(TWO));
	if (task == pdFAIL)
	{
		return false;
	}

	task = xTaskCreate(Service4, "Service4", STACK_SIZE, NULL, tskIDLE_PRIORITY + THREE, GetServiceHandle(THREE));
	if (task == pdFAIL)
	{
		return false;
	}

	task = xTaskCreate(Service5, "Service5", STACK_SIZE, NULL, tskIDLE_PRIORITY + TWO, GetServiceHandle(FOUR));
	if (task == pdFAIL)
	{
		return false;
	}

	task = xTaskCreate(Service6, "Service6", STACK_SIZE, NULL, tskIDLE_PRIORITY + ONE, GetServiceHandle(FIVE));
	if (task == pdFAIL)
	{
		return false;
	}

	return true;
}

void Service1( void* p )
{
	int count = 0;
	while (TRUE)
	{
		if (xSemaphoreTake(GetServiceSemaphore(ZERO), (TickType_t) FIVE) == pdTRUE)
		{
			count++;

			// Load

			xSemaphoreTake(GetWatchdogMutex(), (TickType_t) ZERO);
			SetServiceWatchdogBit(ZERO);
			xSemaphoreGive(GetWatchdogMutex());
			PRINTF("\n\n\r Service1 Running ( %d ) @ 50 Hz.", count);
		}
	}
}



void Service2( void* p )
{
	int count = 0;
	while (TRUE)
	{
		if (xSemaphoreTake(GetServiceSemaphore(ONE), (TickType_t) FIVE) == pdTRUE)
		{
			count++;

			// Load

			xSemaphoreTake(GetWatchdogMutex(), (TickType_t) ZERO);
			SetServiceWatchdogBit(ONE);
			xSemaphoreGive(GetWatchdogMutex());
			PRINTF("\n\n\r Service2 Running ( %d ) @ 10 Hz.", count);
		}
	}
}



void Service3( void* p )
{
	int count = 0;
	while (TRUE)
	{
		if (xSemaphoreTake(GetServiceSemaphore(TWO), (TickType_t) FIVE) == pdTRUE)
		{
			count++;

			// Load

			xSemaphoreTake(GetWatchdogMutex(), (TickType_t) ZERO);
			SetServiceWatchdogBit(TWO);
			xSemaphoreGive(GetWatchdogMutex());
			PRINTF("\n\n\r Service3 Running ( %d ) @ 5 Hz.", count);
		}
	}
}



void Service4( void* p )
{
	int count = 0;
	while (TRUE)
	{
		if (xSemaphoreTake(GetServiceSemaphore(THREE), (TickType_t) FIVE) == pdTRUE)
		{
			count++;

			// Load

			xSemaphoreTake(GetWatchdogMutex(), (TickType_t) ZERO);
			SetServiceWatchdogBit(THREE);
			xSemaphoreGive(GetWatchdogMutex());
			PRINTF("\n\n\r Service4 Running ( %d ) @ 4 Hz.", count);
		}
	}
}



void Service5( void* p )
{
	int count = 0;
	while (TRUE)
	{
		if (xSemaphoreTake(GetServiceSemaphore(FOUR), (TickType_t) FIVE) == pdTRUE)
		{
			count++;

			// Load

			xSemaphoreTake(GetWatchdogMutex(), (TickType_t) ZERO);
			SetServiceWatchdogBit(FOUR);
			xSemaphoreGive(GetWatchdogMutex());
			PRINTF("\n\n\r Service5 Running ( %d ) @ 2 Hz.", count);
		}
	}
}



void Service6( void* p )
{
	int count = 0;
	while (TRUE)
	{
		if (xSemaphoreTake(GetServiceSemaphore(FIVE), (TickType_t) FIVE) == pdTRUE)
		{
			count++;

			// Load

			xSemaphoreTake(GetWatchdogMutex(), (TickType_t) ZERO);
			SetServiceWatchdogBit(FIVE);
			xSemaphoreGive(GetWatchdogMutex());
			PRINTF("\n\n\r Service6 Running ( %d ) @ 1 Hz.", count);
		}
	}
}









