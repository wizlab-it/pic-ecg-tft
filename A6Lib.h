/*
 * 20191226.018
 * A6 GSM Module Library
 *
 * File: A6Lib.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */


#ifndef A6LIB_H
#define	A6LIB_H

#include "commons.h"

const uint32_t A6_BAUDRATES[] = { 9600, 57600, 115200 };

void A6_Init(void);
uint8_t A6_IsAlive(void);
uint32_t A6_BaudRateAutoDetect(void);
uint32_t A6_BaudRateGet(void);
uint32_t A6_BaudRateSet(const uint32_t baudRate);
void A6_Command(const char *command, int16_t timeout, char *response, uint8_t responseLen);
uint8_t A6_ReadLine(char *response, uint8_t responseLen, int16_t timeout);
void A6_Process_Random_Comms(void);

#endif