/*
 * 20191224.040
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

#define _XTAL_FREQ          48000000        //CPU Frequency
#define MILLISECONDS_TICK   5               //Increment of milliseconds variable
#define _LED                PORTAbits.RA2   //Led
#define	EUSART_BUFFER_SIZE  64
#define	EUSART_LINE_SIZE    32

//Structs
typedef struct {
    uint8_t processRX;
    uint8_t iRead;
    uint8_t iWrite;
    uint8_t zzzzzzzzz;
    char buffer[EUSART_BUFFER_SIZE];
    char line[EUSART_LINE_SIZE];
} STRUCT_EUSART_RX;

//External variables
extern uint32_t MILLISECONDS;
extern STRUCT_EUSART_RX EUSART_RX;

//External functions
extern void init(void);
extern void sleepMS(uint32_t ms);
extern void printLine(const char *str, uint16_t color);

extern void Ecg_Init(void);
extern void Ecg_Process(void);
extern void Ecg_Interrupt(void);
extern void EUSART_Init(void);
extern void EUSART_SetSpeed(const uint32_t speed);
extern void EUSART_TX_Char(uint8_t c);
extern void EUSART_TX_String(const char *str, uint8_t len);
extern void EUSART_RX_Interrupt(void);
extern void EUSART_RX_Process(void);

extern void A6_Init(void);
extern uint8_t A6_IsAlive(void);
extern uint32_t A6_SpeedAutoDetect(void);
extern uint32_t A6_SpeedGet(void);
extern uint32_t A6_SpeedSet(const uint32_t speed);
extern void A6_ReadLine(char *response, uint8_t responseLen, int timeout);
extern void A6_Command(const char *command, const char *resp1, const char *resp2, uint16_t timeout, char *response, uint8_t responseLen);

#endif