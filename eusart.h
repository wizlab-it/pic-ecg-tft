/*
 * 20190330.018
 * ECG-TFT
 *
 * File: eusart.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef EUSART_H
#define	EUSART_H

#include "commons.h"

#define	EUSART_RX_BUFFER_SIZE   64

struct {
    unsigned unused : 7;
    unsigned processRX : 1;
    uint8_t iRead;
    uint8_t iWrite;
    uint8_t zzzzzzzzz;
    char buffer[EUSART_RX_BUFFER_SIZE];
    char line[EUSART_RX_BUFFER_SIZE];
} EUSART_RX;

void EUSART_Init(void);
void EUSART_TX_Char(uint8_t c);
void EUSART_TX_String(char *str, uint8_t len);
void EUSART_RX_Interrupt(void);
void EUSART_RX_Process(void);

#endif