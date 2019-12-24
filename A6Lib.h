/*
 * 20191224.001
 * A6 GSM Module Library
 *
 * File: A6Lib.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */


#ifndef A6LIB_H
#define	A6LIB_H

#include "commons.h"

void A6_SetSpeed(const uint32_t speed);
void A6_ReadLine(char *response, uint8_t len);
void A6_Command(const char *command, const char *resp1, const char *resp2, int timeout, char *response);

#endif