/*
 * 20191225.049
 * ECG-TFT
 *
 * File: main.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "main.h"

char x2[] = "AT+CCLK?\r";
char x3[] = "AT+CSQ\r";
char x4[] = "AT+CCID\r";
char x5[] = "AT+CREG?\r";
char x6[] = "AT+COPS?\r";
char x7[] = "AT+COPS=?\r";

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

    //EUSART_RX_Process();

    if((MILLISECONDS > 20000) && (tmp4 < (MILLISECONDS - 20000))) {
        tmp4 = MILLISECONDS;
        
        char zzzz[32];
        sprintf(zzzz, "Change speed (%lu)", A6_SpeedGet());
        printLine(zzzz, _TFT_COLOR_YELLOW);

        uint32_t zz = 0;
        switch(A6_SpeedGet()) {
            case 57600:
                zz = A6_SpeedSet(115200);
                break;
            case 115200:
                zz = A6_SpeedSet(9600);
                break;
            case 9600:
                zz = A6_SpeedSet(57600);
                break;
            default:
                sprintf(zzzz, "Invalid current speed (%lu)", A6_SpeedGet());
                printLine(zzzz, _TFT_COLOR_YELLOW);
                A6_SpeedAutoDetect();
                break;
        }

        sprintf(zzzz, "Speed changed (-> %lu)", zz);
        printLine(((zz == 0) ? "Error changing speed" : zzzz), _TFT_COLOR_MAGENTA);

        if(A6_IsAlive() == 0) {
            printLine("Comm is dead. Retry...", _TFT_COLOR_BLUE);
            A6_SpeedAutoDetect();
            printLine(((A6_IsAlive() == 0) ? "Still dead" : "Resurrected!"), _TFT_COLOR_BLUE);
        }
    }

    if((MILLISECONDS > 2500) && (tmp1 < (MILLISECONDS - 2500))) {
        tmp1 = MILLISECONDS;

        printLine("Check time", _TFT_COLOR_YELLOW);
        char response[32];
        A6_Command("AT+CCLK?\r", "aa", "bb", 0, response, 32);
        printLine(response, _TFT_COLOR_GREEN);
    }

    if((MILLISECONDS > 4000) && (tmp2 < (MILLISECONDS - 4000))) {
        tmp2 = MILLISECONDS;

        printLine("Check speed", _TFT_COLOR_YELLOW);
        char zzzz[32];
        sprintf(zzzz, "%lu", A6_SpeedGet());
        printLine(zzzz, _TFT_COLOR_RED);
    }
}

void sleepMS(uint32_t ms) {
    uint32_t t = MILLISECONDS + ms;
    while(t > MILLISECONDS);
}

void printLine(const char *str, uint16_t color) {
    EUSART_RX.zzzzzzzzz += 10;
    TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 40, _TFT_HEIGHT, _TFT_COLOR_BLACK);
    TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), str, color, _TFT_COLOR_BLACK, 1);
}