/*
 * 20191225.006
 * A6 GSM Module Library
 *
 * File: A6Lib.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */


#ifndef A6LIB_H
#define	A6LIB_H

#include "commons.h"

#define A6_TIMEOUT_DEFAULT  1000

const uint32_t A6_SPEEDS[] = { 9600, 57600, 115200 };

void A6_Init(void);
uint8_t A6_IsAlive(void);
uint32_t A6_SpeedAutoDetect(void);
uint32_t A6_SpeedGet(void);
uint32_t A6_SpeedSet(const uint32_t speed);
void A6_ReadLine(char *response, uint8_t responseLen, int timeout);
void A6_Command(const char *command, const char *resp1, const char *resp2, uint16_t timeout, char *response, uint8_t responseLen);

#endif