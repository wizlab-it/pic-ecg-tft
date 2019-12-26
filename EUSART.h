/*
 * 20191226.029
 * ECG-TFT
 *
 * File: eusart.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef EUSART_H
#define	EUSART_H

#include "commons.h"

#define	EUSART_BUFFER_SIZE      128
#define EUSART_TIMEOUT_DEFAULT  1000

struct {
    uint8_t iRead;
    uint8_t iWrite;
    char buffer[EUSART_BUFFER_SIZE];
} EUSART_RX;

void EUSART_Init(void);
void EUSART_BaudRateSet(const uint32_t baudRate);
void EUSART_TX_Char(uint8_t c);
void EUSART_TX_String(const char *str, uint8_t len);
void EUSART_RX_Interrupt(void);
uint8_t EUSART_RX_AvailableData(int16_t timeout);
void EUSART_RX_Flush(void);
char EUSART_BufferGetChar(int16_t timeout);

#endif