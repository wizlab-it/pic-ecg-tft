/* 
 * 20191226.004
 * ECG-TFT
 *
 * File: main.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef MAIN_H
#define	MAIN_H

#include "commons.h"

uint32_t tmp1 = 0;
uint32_t tmp2 = 0;
uint32_t tmp3 = 0;
uint32_t tmp4 = 0;
uint32_t tmp5 = 0;
uint16_t consoleX = 0;

void loop(void);
void sleepMS(uint32_t ms);
void printLine(const char *str, uint16_t color);

#endif