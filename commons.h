/*
 * 20190330.038
 * ECG-TFT
 *
 * File: commons.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef COMMONS_H
#define	COMMONS_H

#include <xc.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "TFT.h"

#define _XTAL_FREQ          48000000        //CPU Frequency
#define MILLISECONDS_TICK   5               //Increment of milliseconds variable
#define _LED                PORTAbits.RA2   //Led

//External variables
extern uint32_t MILLISECONDS;

//External functions
extern void init(void);
extern void Ecg_Init(void);
extern void Ecg_Process(void);
extern void Ecg_Interrupt(void);
/*
extern void EUSART_Init(void);
extern void EUSART_TX_Char(uint8_t c);
extern void EUSART_TX_String(char *str, uint8_t len);
extern void EUSART_RX_Interrupt(void);
extern void EUSART_RX_Process(void);
*/

#endif