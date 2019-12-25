/*
 * 20190330.031
 * ECG-TFT
 *
 * File: main.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "main.h"

char x1[] = "AT+IPR?\r";
char x2[] = "AT+CCLK?\r";
char x3[] = "AT+CSQ\r";
char x4[] = "AT+CCID\r";
char x5[] = "AT+CREG?\r";
char x6[] = "AT+COPS?\r";
char x7[] = "AT+COPS=?\r";
char x8[] = "AT\r";

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
        printLine("Change speed", _TFT_COLOR_YELLOW);
        tmp4 = MILLISECONDS;

        uint8_t zz;
        switch(A6_SPEED) {
            case 9600:
                zz = A6_SpeedSet(57600);
                break;
            case 57600:
                zz = A6_SpeedSet(115200);
                break;
            case 115200:
                zz = A6_SpeedSet(9600);
                break;
        }

        printLine(((zz == 1) ? "Yes!" : "No..."), _TFT_COLOR_BLUE);

        if(A6_IsAlive() == 0) {
            printLine("Comm is dead. Retry...", _TFT_COLOR_BLUE);
            A6_SpeedAutoDetect();
            printLine(((A6_IsAlive() == 0) ? "Still dead" : "Resurrected!"), _TFT_COLOR_BLUE);
        }
    }

    if((MILLISECONDS > 2500) && (tmp1 < (MILLISECONDS - 2500))) {
        printLine("Send AT", _TFT_COLOR_YELLOW);
        tmp1 = MILLISECONDS;

        char response[EUSART_LINE_SIZE];
        A6_Command(x8, "aa", "bb", 0, response);
        printLine(response, _TFT_COLOR_RED);
    }

    if((MILLISECONDS > 4000) && (tmp2 < (MILLISECONDS - 4000))) {
        printLine("Check speed", _TFT_COLOR_YELLOW);
        tmp2 = MILLISECONDS;

        char response[EUSART_LINE_SIZE];
        memset(response, 0x00, EUSART_LINE_SIZE);
        A6_Command(x1, "aa", "bb", 0, response);

        printLine(response, _TFT_COLOR_RED);
    }

    //MILLISECONDS
    /*
    EUSART_TX_String(x1, strlen(x1));
    __delay_ms(500);
    EUSART_TX_String(x2, strlen(x2));
    __delay_ms(500);
    EUSART_TX_String(x3, strlen(x3));
    __delay_ms(500);
    EUSART_TX_String(x4, strlen(x4));
    __delay_ms(500);
    EUSART_TX_String(x5, strlen(x5));
    __delay_ms(500);
    EUSART_TX_String(x6, strlen(x6));
    __delay_ms(2500);
    //EUSART_TX_String(x7, strlen(x7));
    __delay_ms(2500);
    __delay_ms(2500);
    __delay_ms(2500);
    __delay_ms(2500);
    */

    /*
    xx[3]++;
    if(xx[3] == '6') {
        xx[3] = '0';
        __delay_ms(2500);
    }
    */
    
    
    
    /*

        EUSART_RX.zzzzzzzzz += 8;
        TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 50, _TFT_HEIGHT, _TFT_COLOR_BLACK);
        TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), response, _TFT_COLOR_GREEN, _TFT_COLOR_BLACK, 1);

        EUSART_RX.zzzzzzzzz += 8;
        TFT_DrawChar(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), 'A' + c, _TFT_COLOR_BLUE, _TFT_COLOR_BLACK, 1);
   
     */ 
}

void sleepMS(uint32_t ms) {
    uint32_t t = MILLISECONDS + ms;
    while(t > MILLISECONDS);
}

void printLine(const char *str, uint16_t color) {
    EUSART_RX.zzzzzzzzz += 8;
    TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 50, _TFT_HEIGHT, _TFT_COLOR_BLACK);
    TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), str, color, _TFT_COLOR_BLACK, 1);
}