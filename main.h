/*
 * 20191229.033
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
#define OPERATOR_GPRS_REFRESH           5920

struct {
    uint8_t gsmModuleStatus;
    uint32_t nextOperatorName;
    uint32_t nextRSSI;
    uint32_t nextGPRSStatus;
    char operatorName[OPERATOR_NAME_SIZE];
    char operatorNameLastFirstChar;
    uint8_t operatorRSSILevel;
    uint8_t operatorGPRSStatus;
} GSMStatus;

uint32_t tmp1 = 0;
uint32_t tmp2 = 0;

void loop(void);
void processGSM(void);
uint8_t processGSM_CheckGSMAndSIMStatus(void);
void processGSM_RefreshOperatorName(void);
void processGSM_RefreshRSSI(void);
void processGSM_RefreshGPRS(void);

#endif