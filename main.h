/*
 * 20191228.025
 * ECG-TFT
 *
 * File: main.h
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#ifndef MAIN_H
#define	MAIN_H

#include "commons.h"

#define OPERATOR_NAME_SIZE              32
#define OPERATOR_NAME_TOP_MARGIN        8
#define OPERATOR_NAME_RIGHT_MARGIN      110
#define OPERATOR_NAME_REFRESH_SHORT     2510
#define OPERATOR_NAME_REFRESH_LONG      37190
#define OPERATOR_RSSI_REFRESH           4740

struct {
    uint32_t nextOperatorName;
    uint32_t nextRSSI;
    char operatorName[OPERATOR_NAME_SIZE];
    char operatorNameLastFirstChar;
    uint8_t operatorRSSILevel;
} GSMStatus;

uint32_t tmp1 = 0;

void loop(void);
void processGSM(void);

#endif