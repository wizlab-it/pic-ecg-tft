/*
 * 20191228.077
 * ECG-TFT
 *
 * File: main.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */



/*
 * controllare risposta per sim bloccata da pin
 * mettere in funzioni separate i blocchi di processGSM
 * mettere in una funzione il test GPRS Data
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
        tmp1 = MILLISECONDS + 3000;

        /*
        //Check if connected to network
        if(A6_NetworkGetStatus() != 1) {
            TFT_ConsolePrintLine("Not connected, try again later", _TFT_COLOR_RED);
        } else {
            TFT_ConsolePrintLine("Connected, try TCP", _TFT_COLOR_GREEN);

            char response[64];
            A6_Command("AT+CGATT?\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CGATT=1\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CGDCONT=1,\"IP\",\"iliad\"\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CGACT=1,1\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CIPSTATUS\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CIFSR\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CIPSTART=\"TCP\",\"51.89.155.15\",80\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CIPSTATUS\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            A6_Command("AT+CIPSEND\r", 0, response, 32);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();

            const char req[] = "GET / HTTP/1.0\r\n\r\n";
            EUSART_TX_String(req, strlen(req));
            EUSART_TX_Char(0x1A);
            while(EUSART_RX_AvailableData(-1) == 1) A6_Process_Random_Comms();
        }
        */

        /*
        //First method

        AT+CGATT?
        AT+CGATT=1
        AT+CGDCONT=1,"IP","internet"
        AT+CGACT=1,1
        AT+CIPSTATUS
        AT+CIFSR

        AT+CIPSTART="TCP","1.2.3.4",80
        AT+CIPSTATUS
        AT+CIPSEND
        GET / HTTP/1.1<cr><lf>Host:www.test.com<cr><lf>Connection:close<cr><lf>
        ^z
        */

        /*
        //Second method
        AT+CSTT=?aaa?,??,??
        OK
        AT+CGDCONT=1,?IP?,?aaa?
        OK
        AT+CIICR
        OK
        AT+CIPSTART=?TCP?,?www.test.com?,80
        +CDNSGIP:1,?www.test.com?,?1.2.3.4?
        OK
        CONNECT OK
        OK
        AT+CIPCLOSE
        AT+CIPSHUT
        */

    }
}

void processGSM(void) {
    if(GSMStatus.gsmModuleStatus != A6_SIM_READY) {
        if(GSMStatus.nextOperatorName < MILLISECONDS) {
            GSMStatus.nextOperatorName = MILLISECONDS + 10000;

            //If GSM Module is OK, then check SIM Status
            if(GSMStatus.gsmModuleStatus != A6_SIM_A6_ERROR) {
                GSMStatus.gsmModuleStatus = A6_SIM_GetStatus();
            }

            //Print error
            char errorString[24];
            switch(GSMStatus.gsmModuleStatus) {
                case A6_SIM_A6_ERROR:
                    strcpy(errorString, "GSM Module Error");
                    break;
                case A6_SIM_UNKNOWN:
                    strcpy(errorString, "SIM Card Error");
                    break;
                case A6_SIM_MISSING:
                    strcpy(errorString, "SIM Card Missing");
                    break;
                case A6_SIM_PIN:
                    strcpy(errorString, "SIM Card PIN Locked");
                    break;
            }
            TFT_DrawString(TFT_GetWidth() - OPERATOR_NAME_RIGHT_MARGIN, OPERATOR_NAME_TOP_MARGIN, errorString, _TFT_COLOR_RED, _TFT_COLOR_BLACK, 1);
        }

        return;
    }

    //Refresh operator name
    if(GSMStatus.nextOperatorName < MILLISECONDS) {
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

    //Handle random communications from A6
    A6_Process_Random_Comms();
}