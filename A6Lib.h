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

uint32_t A6_SPEED = 9600;

void A6_Init(void);
uint8_t A6_IsAlive(void);
void A6_SpeedAutoDetect(void);
uint8_t A6_SpeedSet(const uint32_t speed);
void A6_ReadLine(char *response, int timeout);
void A6_Command(const char *command, const char *resp1, const char *resp2, uint16_t timeout, char *response);

#endif