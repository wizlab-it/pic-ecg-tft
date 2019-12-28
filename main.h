/*
 * 20191228.013
 * ECG-TFT
 *
 * File: main.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef MAIN_H
#define	MAIN_H

#include "commons.h"

uint32_t refreshGSMSleep = 0;

void loop(void);
void refreshGSM(void);

#endif