/*
 * 20191226.056
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
    TFT_Init();
    EUSART_Init();
    Ecg_Init();
    A6_Init();

    //Loop forever
    while(1) loop();
}


/*==============================================================================
 * Loop routine
 *============================================================================*/
void loop(void) {
    //Ecg_Process();

    A6_Process_Random_Comms();

    if((MILLISECONDS > 20000) && (tmp4 < (MILLISECONDS - 20000))) {
        tmp4 = MILLISECONDS;
        
        char zzzz[32];
        sprintf(zzzz, "Change baud rate (%lu)", A6_BaudRateGet());
        printLine(zzzz, _TFT_COLOR_YELLOW);

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
                printLine(zzzz, _TFT_COLOR_YELLOW);
                A6_BaudRateAutoDetect();
                break;
        }

        sprintf(zzzz, "Baud rate changed (-> %lu)", zz);
        printLine(((zz == 0) ? "Error changing baud rate" : zzzz), _TFT_COLOR_MAGENTA);

        if(A6_IsAlive() == 0) {
            printLine("Comm is dead. Retry...", _TFT_COLOR_BLUE);
            A6_BaudRateAutoDetect();
            printLine(((A6_IsAlive() == 0) ? "Still dead" : "Resurrected!"), _TFT_COLOR_BLUE);
        }
    }

    if((MILLISECONDS > 2500) && (tmp1 < (MILLISECONDS - 2500))) {
        tmp1 = MILLISECONDS;

        printLine("Check time", _TFT_COLOR_YELLOW);
        char response[32];
        A6_Command("AT+CCLK?\r", 0, response, 32);
        printLine(response, _TFT_COLOR_GREEN);
    }

    if((MILLISECONDS > 4000) && (tmp2 < (MILLISECONDS - 4000))) {
        tmp2 = MILLISECONDS;
        printLine("Check baud rate", _TFT_COLOR_YELLOW);
        char zzzz[32];
        sprintf(zzzz, "%lu", A6_BaudRateGet());
        printLine(zzzz, _TFT_COLOR_RED);
    }

    if((MILLISECONDS > 6500) && (tmp3 < (MILLISECONDS - 6500))) {
        tmp3 = MILLISECONDS;

        printLine("Check RSSI", _TFT_COLOR_YELLOW);
        char zzzz[32];
        sprintf(zzzz, "Quality: %u; Level: %d", A6_NetworkGetRSSI(), A6_NetworkGetRSSILevel());
        printLine(zzzz, _TFT_COLOR_WHITE);
    }

    if((MILLISECONDS > 8500) && (tmp5 < (MILLISECONDS - 8500))) {
        tmp5 = MILLISECONDS;

        printLine("Check network registration", _TFT_COLOR_YELLOW);
        uint8_t ns = A6_NetworkGetStatus();
        char zzzz[32];
        sprintf(zzzz, "Network status: %u (%s)", ns, ((ns == 2) ? "Searching..." : ((ns == 1) ? "Registered" : "Other")));
        printLine(zzzz, _TFT_COLOR_WHITE);
    }
}

void sleepMS(uint32_t ms) {
    uint32_t t = MILLISECONDS + ms;
    while(t > MILLISECONDS);
}

void printLine(const char *str, uint16_t color) {
    consoleX += 10;
    TFT_DrawFillRect(consoleX, 0, 40, _TFT_HEIGHT, _TFT_COLOR_BLACK);
    TFT_DrawString(consoleX, (_TFT_HEIGHT - 1), str, color, _TFT_COLOR_BLACK, 1);
    if(consoleX > (_TFT_WIDTH - 35)) consoleX = 0;
}