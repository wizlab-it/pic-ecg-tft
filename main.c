/*
 * 20191228.075
 * ECG-TFT
 *
 * File: main.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */



//AGGIUNGERE CONTROLLO SE C'E' SIM
//AGGIUNGERE CONTROLLO SE SIm HA IL PIN




#include "main.h"

void main(void) {
    //Init everything
    init();
    TFT_Init(_TFT_ORIENTATION_INV_LANDSCAPE, _TFT_COLOR_BLACK);
    EUSART_Init();
    Ecg_Init();
    A6_Init(115200);

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
        tmp1 = MILLISECONDS + 30000;

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

    /*
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