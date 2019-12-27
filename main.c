/*
 * 20191227.063
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

    if(tmp1 < (MILLISECONDS - 10000)) {
        tmp1 = MILLISECONDS;

        char operator[32];
        uint16_t operatorX = TFT_GetWidth() - 100;
        A6_NetworkGetOperator(operator, 32);
        TFT_DrawString(operatorX, 5, operator, _TFT_COLOR_YELLOW, _TFT_COLOR_BLACK, 1);
        if(operator[0] != '-') {
            uint8_t RSSILevel = A6_NetworkGetRSSILevel();
            for(uint8_t i=0; i<5; i++) {
                uint16_t operatorRSSIX = operatorX + (i * 6);
                if(RSSILevel > i) {
                    TFT_DrawFillRect(operatorRSSIX, 17, 5, 10, _TFT_COLOR_YELLOW);
                } else {
                    TFT_DrawFillRect(operatorRSSIX, 17, 5, 10, _TFT_COLOR_BLACK);
                    TFT_DrawLine(operatorRSSIX, 26, (operatorRSSIX + 5), 26, _TFT_COLOR_YELLOW);
                }
            }
        }
    }









    /*
    A6_Process_Random_Comms();

    if((MILLISECONDS > 20000) && (tmp4 < (MILLISECONDS - 20000))) {
        tmp4 = MILLISECONDS;
        
        char zzzz[32];
        sprintf(zzzz, "Change baud rate (%lu)", A6_BaudRateGet());
        TFT_ConsolePrintLine(zzzz, _TFT_COLOR_YELLOW);

        uint32_t zz = 0;
        switch(A6_BaudRateGet()) {
            case 57600:
                zz = A6_BaudRateSet(115200);
                break;
            case 115200:
                zz = A6_BaudRateSet(9600);
                break;
            case 9600:
                zz = A6_BaudRateSet(57600);
                break;
            default:
                sprintf(zzzz, "Invalid current baud rate (%lu)", A6_BaudRateGet());
                TFT_ConsolePrintLine(zzzz, _TFT_COLOR_YELLOW);
                A6_BaudRateAutoDetect();
                break;
        }

        sprintf(zzzz, "Baud rate changed (-> %lu)", zz);
        TFT_ConsolePrintLine(((zz == 0) ? "Error changing baud rate" : zzzz), _TFT_COLOR_MAGENTA);

        if(A6_IsAlive() == 0) {
            TFT_ConsolePrintLine("Comm is dead. Retry...", _TFT_COLOR_BLUE);
            A6_BaudRateAutoDetect();
            TFT_ConsolePrintLine(((A6_IsAlive() == 0) ? "Still dead" : "Resurrected!"), _TFT_COLOR_BLUE);
        }
    }

    if((MILLISECONDS > 2500) && (tmp1 < (MILLISECONDS - 2500))) {
        tmp1 = MILLISECONDS;

        TFT_ConsolePrintLine("Check time", _TFT_COLOR_YELLOW);
        char response[32];
        A6_Command("AT+CCLK?\r", 0, response, 32);
        TFT_ConsolePrintLine(response, _TFT_COLOR_GREEN);
    }

    if((MILLISECONDS > 4000) && (tmp2 < (MILLISECONDS - 4000))) {
        tmp2 = MILLISECONDS;
        TFT_ConsolePrintLine("Check baud rate", _TFT_COLOR_YELLOW);
        char zzzz[32];
        sprintf(zzzz, "%lu", A6_BaudRateGet());
        TFT_ConsolePrintLine(zzzz, _TFT_COLOR_RED);
    }

    if((MILLISECONDS > 6500) && (tmp3 < (MILLISECONDS - 6500))) {
        tmp3 = MILLISECONDS;

        TFT_ConsolePrintLine("Check RSSI", _TFT_COLOR_YELLOW);
        char zzzz[32];
        sprintf(zzzz, "Quality: %u; Level: %d", A6_NetworkGetRSSI(), A6_NetworkGetRSSILevel());
        TFT_ConsolePrintLine(zzzz, _TFT_COLOR_WHITE);
    }

    if((MILLISECONDS > 8500) && (tmp5 < (MILLISECONDS - 8500))) {
        tmp5 = MILLISECONDS;

        TFT_ConsolePrintLine("Check network registration", _TFT_COLOR_YELLOW);
        uint8_t ns = A6_NetworkGetStatus();
        char zzzz[32];
        sprintf(zzzz, "Network status: %u (%s)", ns, ((ns == 2) ? "Searching..." : ((ns == 1) ? "Registered" : "Other")));
        TFT_ConsolePrintLine(zzzz, _TFT_COLOR_WHITE);
    }

    if((MILLISECONDS > 11000) && (tmp8 < (MILLISECONDS - 11000))) {
        tmp8 = MILLISECONDS;

        TFT_ConsolePrintLine("Check operator", _TFT_COLOR_YELLOW);
        char operator[32];
        A6_NetworkGetOperator(operator, 32);
        TFT_ConsolePrintLine(operator, _TFT_COLOR_WHITE);
    }
    */
}