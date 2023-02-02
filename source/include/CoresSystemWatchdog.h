/*******************************************************************************
 * Contents: Functions to check whether or not the system is still healthy and
 * help maintain the system in a healthy state.
 * Author: Dawid Blom.
 * Date: January 15, 2023.
 *
 * NOTE:
 *******************************************************************************/
#ifndef _CORE_SYSTEM_WATCHDOG_H_
#define _CORE_SYSTEM_WATCHDOG_H_
#include <CoreSystemConfiguration.h>
#ifdef __cplusplus
extern "C"
{
#endif
bool ServiceIsRunning(uint16_t bitPosition);
bool SetServiceWatchdogBit(uint16_t serviceNumber);
#ifdef __cplusplus
}
#endif
#endif
