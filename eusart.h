/*
 * 20191224.020
 * ECG-TFT
 *
 * File: eusart.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef EUSART_H
#define	EUSART_H

#include "commons.h"

STRUCT_EUSART_RX EUSART_RX;

void EUSART_Init(void);
void EUSART_SetSpeed(const uint32_t speed);
void EUSART_TX_Char(uint8_t c);
void EUSART_TX_String(const char *str, uint8_t len);
void EUSART_RX_Interrupt(void);
void EUSART_RX_Process(void);

#endif