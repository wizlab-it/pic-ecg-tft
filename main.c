/*
 * 20191228.069
 * ECG-TFT
 *
 * File: main.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "main.h"

void main(void) {
    //Init everything
    init();
    TFT_Init(_TFT_ORIENTATION_INV_LANDSCAPE, _TFT_COLOR_BLACK);
    EUSART_Init();
    Ecg_Init();
    A6_Init(115200);

    //Loop forever
    while(1) loop();
}


/*==============================================================================
 * Loop routine
 *============================================================================*/
void loop(void) {

    Ecg_Process();

    processGSM();

    /*
    A6_Process_Random_Comms();

    if((MILLISECONDS > 20000) && (tmp4 < (MILLISECONDS - 20000))) {
        sprintf(zzzz, "Baud rate changed (-> %lu)", zz);
        TFT_ConsolePrintLine(((zz == 0) ? "Error changing baud rate" : zzzz), _TFT_COLOR_MAGENTA);
        if(A6_IsAlive() == 0) {
        }
    }

    if((MILLISECONDS > 2500) && (tmp1 < (MILLISECONDS - 2500))) {
        TFT_ConsolePrintLine("Check time", _TFT_COLOR_YELLOW);
        char response[32];
        A6_Command("AT+CCLK?\r", 0, response, 32);
        TFT_ConsolePrintLine(response, _TFT_COLOR_GREEN);
    }
    */
}

void processGSM(void) {
    //Refresh operator name
    if(GSMStatus.nextOperatorName < MILLISECONDS) {
        A6_NetworkGetOperator(GSMStatus.operatorName, OPERATOR_NAME_SIZE);
        uint16_t operatorX = TFT_GetWidth() - OPERATOR_NAME_RIGHT_MARGIN;
        if(GSMStatus.operatorName[0] == '-') {
            GSMStatus.nextOperatorName = MILLISECONDS + OPERATOR_NAME_REFRESH_SHORT;
            TFT_DrawString(operatorX, OPERATOR_NAME_TOP_MARGIN, "Connecting...", _TFT_COLOR_YELLOW, _TFT_COLOR_BLACK, 1);
        } else {
            GSMStatus.nextOperatorName = MILLISECONDS + OPERATOR_NAME_REFRESH_LONG;
            TFT_DrawString(operatorX, OPERATOR_NAME_TOP_MARGIN, GSMStatus.operatorName, _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 1);
        }
    }

    //Refresh RSSI
    if(GSMStatus.nextRSSI < MILLISECONDS) {
        GSMStatus.nextRSSI = MILLISECONDS + OPERATOR_RSSI_REFRESH;
        if(GSMStatus.operatorName[0] != '-') {
            GSMStatus.operatorRSSILevel = A6_NetworkGetRSSILevel();
            uint16_t RSSIX = TFT_GetWidth() - OPERATOR_NAME_RIGHT_MARGIN + ((strlen(GSMStatus.operatorName) + 1) * 6);
            for(uint8_t i=0; i<5; i++) {
                if(GSMStatus.operatorRSSILevel > i) {
                    uint8_t RSSIY = (4 - i) * 2;
                    TFT_DrawFillRect(RSSIX, (5 + RSSIY), 2, (10 - RSSIY), _TFT_COLOR_WHITE);
                } else {
                    TFT_DrawFillRect(RSSIX, 5, 2, 10, _TFT_COLOR_BLACK);
                    TFT_DrawLine(RSSIX, 14, (RSSIX + 2), 14, _TFT_COLOR_WHITE);
                }
                RSSIX += 3;
            }
        }
    }
}