/*
 * 20191226.053
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

        printLine("Check signal", _TFT_COLOR_YELLOW);
        char response[32];
        A6_Command("AT+CSQ\r", 0, response, 32);
        printLine(response, _TFT_COLOR_WHITE);
        
        /*
        2-9 - Merda
        10-14 - OK
        15-19 - Buono
        20-30 - Ottimp
        99 - Boh
        */
    }

    if((MILLISECONDS > 8500) && (tmp5 < (MILLISECONDS - 8500))) {
        tmp5 = MILLISECONDS;

        printLine("Check registration", _TFT_COLOR_YELLOW);
        char response[32];
        A6_Command("AT+CREG?\r", 0, response, 32);
        printLine(response, _TFT_COLOR_WHITE);
        
        /*
        <n>:
        0 - disable network registration unsolicited result code
        1 - enable network registration unsolicited result code +CREG: <stat>
        2 - enable network registration and location information unsolicited result code +CREG: <stat>[,<lac>,<ci>]
        <stat>:
        0 - not registered, MT is not currently searching a new operator to register to
        1 - registered, home network
        2 - not registered, but MT is currently searching a new operator to register to
        3 - registration denied
        4 - unknown
        5 - registered, roaming
        */
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