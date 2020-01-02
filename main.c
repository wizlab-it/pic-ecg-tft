/*
 * 20191229.086
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
    GSMStatus.gsmModuleStatus = A6_Init(115200);

    TFT_ConsoleInit(_TFT_ORIENTATION_PORTRAIT);


    char zzzz[32];
    TFT_ConsolePrintLine("Unlock pin", _TFT_COLOR_WHITE);
    A6_Command("AT+CPIN=\"5239\"\r", 0, zzzz, 32);
    TFT_ConsolePrintLine(zzzz, _TFT_COLOR_RED);

    
    //Loop forever
    while(1) loop();
}


/*==============================================================================
 * Loop routine
 *============================================================================*/
void loop(void) {

    //Ecg_Process();

    processGSM();

    if(tmp1 < MILLISECONDS) {
        tmp1 = MILLISECONDS + 30000;

        if(tmp2 == 0) {
            //A6_NetworkGPRSConnect("www.postemobile.it");
            A6_NetworkGPRSConnect("iliad");
            tmp2++;
        } else {
            A6_NetworkGPRSDisconnect();
            tmp2 = 0;
        }

        /*
        char response[32];
        char zzzz[32];
        A6_Command("AT+CGATT?\r", 0, response, 32);
        TFT_ConsolePrintLine(response, _TFT_COLOR_GREEN);
        */
    }
}

void processGSM(void) {
    if(processGSM_CheckGSMAndSIMStatus() == 1) {
        processGSM_RefreshOperatorName();
        processGSM_RefreshRSSI();
        processGSM_RefreshGPRS();
    }
    A6_Process_Random_Comms();
}

uint8_t processGSM_CheckGSMAndSIMStatus(void) {
    if(GSMStatus.gsmModuleStatus == A6_SIM_READY) return 1;
    if(GSMStatus.nextOperatorName > MILLISECONDS) return 0;
    GSMStatus.nextOperatorName = MILLISECONDS + 10000;

    //If GSM Module is OK, then check SIM Status
    if(GSMStatus.gsmModuleStatus != A6_SIM_A6_ERROR) {
        GSMStatus.gsmModuleStatus = A6_SIM_GetStatus();
        if(GSMStatus.gsmModuleStatus == A6_SIM_READY) {
            GSMStatus.nextOperatorName = 0;
            return 1;
        }
    }

    //Print error
    char errorString[24];
    switch(GSMStatus.gsmModuleStatus) {
        case A6_SIM_A6_ERROR:
            strcpy(errorString, "GSM Module Error");
            break;
        case A6_SIM_UNKNOWN:
            strcpy(errorString, "SIM Error");
            break;
        case A6_SIM_MISSING:
            strcpy(errorString, "SIM Missing");
            break;
        case A6_SIM_PIN:
            strcpy(errorString, "SIM PIN Locked");
            break;
    }
    TFT_DrawString(TFT_GetWidth() - OPERATOR_NAME_RIGHT_MARGIN, OPERATOR_NAME_TOP_MARGIN, errorString, _TFT_COLOR_RED, _TFT_COLOR_BLACK, 1);

    return 0;
}

void processGSM_RefreshOperatorName(void) {
    if(GSMStatus.nextOperatorName > MILLISECONDS) return;

    A6_NetworkGetOperator(GSMStatus.operatorName, OPERATOR_NAME_SIZE);
    uint16_t operatorX = TFT_GetWidth() - OPERATOR_NAME_RIGHT_MARGIN;
    if(GSMStatus.operatorName[0] == '-') {
        GSMStatus.nextOperatorName = MILLISECONDS + OPERATOR_NAME_REFRESH_SHORT;
        TFT_DrawString(operatorX, OPERATOR_NAME_TOP_MARGIN, "Connecting...", _TFT_COLOR_YELLOW, _TFT_COLOR_BLACK, 1);
    } else {
        GSMStatus.nextOperatorName = MILLISECONDS + OPERATOR_NAME_REFRESH_LONG;
        if(GSMStatus.operatorNameLastFirstChar != GSMStatus.operatorName[0]) {
            TFT_DrawFillRect(operatorX, OPERATOR_NAME_TOP_MARGIN, OPERATOR_NAME_RIGHT_MARGIN, 7, _TFT_COLOR_BLACK);
            GSMStatus.operatorNameLastFirstChar = GSMStatus.operatorName[0];
        }
        TFT_DrawString(operatorX, OPERATOR_NAME_TOP_MARGIN, GSMStatus.operatorName, _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 1);
    }
}

void processGSM_RefreshRSSI(void) {
    if(GSMStatus.nextRSSI > MILLISECONDS) return;
    GSMStatus.nextRSSI = MILLISECONDS + OPERATOR_RSSI_REFRESH;

    if(GSMStatus.operatorName[0] == '-')  return;

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

void processGSM_RefreshGPRS(void) {
    if(GSMStatus.nextGPRSStatus > MILLISECONDS) return;
    GSMStatus.nextGPRSStatus = MILLISECONDS + OPERATOR_GPRS_REFRESH;

    if(GSMStatus.operatorName[0] == '-') return;

    GSMStatus.operatorGPRSIsConnected = A6_NetworkGPRSIsConnected();
    uint16_t GPRSX = TFT_GetWidth() - OPERATOR_NAME_RIGHT_MARGIN + ((strlen(GSMStatus.operatorName) + 1) * 6) + 18;
    TFT_DrawString(GPRSX, OPERATOR_NAME_TOP_MARGIN, ((GSMStatus.operatorGPRSIsConnected == 1) ? "G" : " "), _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 1);

    //Get IP Address
    if(GSMStatus.operatorGPRSIsConnected == 1) {
        

        char response[32];


        TFT_ConsolePrintLine("Connect", _TFT_COLOR_RED);
        if(A6_NetworkGPRSOpenTCP("51.89.155.15", 80, 2500) == 1) {
            TFT_ConsolePrintLine("Connected!", _TFT_COLOR_MAGENTA);

            TFT_ConsolePrintLine("Start request", _TFT_COLOR_CYAN);
            A6_Command("AT+CIPSEND\r", 0, response, 32);
            TFT_ConsolePrintLine(response, _TFT_COLOR_GREEN);

            TFT_ConsolePrintLine("Send data", _TFT_COLOR_CYAN);
            const char req[] = "GET / HTTP/1.0\r\n\r\n";
            EUSART_TX_String(req, strlen(req));
            EUSART_TX_Char(0x1A);
            sleepMS(500);
            while(EUSART_RX_AvailableData(0) == 1) A6_Process_Random_Comms();

            A6_NetworkGPRSCloseTCP();
        } else {
            TFT_ConsolePrintLine("Connection error!", _TFT_COLOR_MAGENTA);
        }
    }
}