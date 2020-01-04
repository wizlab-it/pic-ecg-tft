/*
 * 20200104.035
 * ECG-TFT
 *
 * File: eusart.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef EUSART_H
#define	EUSART_H

#include "commons.h"

#define	EUSART_BUFFER_SIZE          512
#define EUSART_TIMEOUT_DEFAULT      1000
#define EUSART_RX_AVAILABLE_NO      0
#define EUSART_RX_AVAILABLE_YES     1
#define EUSART_RX_NODATA            -1
#define EUSART_USE_DEFAULT_TIMEOUT  0
#define EUSART_USE_NO_TIMEOUT       -1

struct {
    uint16_t iRead;
    uint16_t iWrite;
    char buffer[EUSART_BUFFER_SIZE];
} EUSART_RX;

void EUSART_Init(void);
void EUSART_BaudRateSet(const uint32_t baudRate);
void EUSART_Interrupt(void);
void EUSART_Flush(void);
void EUSART_Trim(uint8_t *arr);
void EUSART_SendByte(uint8_t b);
void EUSART_SendByteArray(const uint8_t *arr, uint8_t len);
uint8_t EUSART_Available(int16_t timeout);
int16_t EUSART_PeekByte(int16_t timeout);
int16_t EUSART_ReadByte(int16_t timeout);
uint8_t EUSART_ReadLine(char *line, uint8_t len, int16_t timeout);

#endif