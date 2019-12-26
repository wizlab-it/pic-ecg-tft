/*
 * 20191226.047
 * ECG-TFT
 *
 * File: commons.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef COMMONS_H
#define	COMMONS_H

#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "TFT.h"
#include "A6Lib.h"
#include "EUSART.h"

#define _XTAL_FREQ          48000000        //CPU Frequency
#define MILLISECONDS_TICK   5               //Increment of milliseconds variable
#define _LED                PORTAbits.RA2   //Led

//External variables
extern uint32_t MILLISECONDS;

//External functions
extern void init(void);
extern void sleepMS(uint32_t ms);
extern void printLine(const char *str, uint16_t color);

extern void Ecg_Init(void);
extern void Ecg_Process(void);
extern void Ecg_Interrupt(void);

#endif