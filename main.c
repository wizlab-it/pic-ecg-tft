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
    EUSART_SetSpeed(9600);
    Ecg_Init();

    //Loop forever
    __delay_ms(2500);
    while(1) loop();
}


/*==============================================================================
 * Loop routine
 *============================================================================*/
void loop(void) {
    //Ecg_Process();

    //EUSART_RX_Process();

    /*
    if((MILLISECONDS > 20000) && (tmp4 < (MILLISECONDS - 20000))) {
        tmp4 = MILLISECONDS;
        char response[EUSART_LINE_SIZE];
        memset(response, 0x00, EUSART_LINE_SIZE);
        switch(tmp3) {
            case 0:
                A6_SetSpeed(57600);
                tmp3 = 1;
                break;
            case 1:
                A6_SetSpeed(115200);
                tmp3 = 2;
                break;
            case 2:
                A6_SetSpeed(9600);
                tmp3 = 0;
                break;
        }
    }
     */

    if((MILLISECONDS > 2500) && (tmp1 < (MILLISECONDS - 2500))) {
        tmp1 = MILLISECONDS;

        char response[EUSART_LINE_SIZE];
        memset(response, 0x00, EUSART_LINE_SIZE);
        A6_Command(x8, "aa", "bb", 123, response);

        EUSART_RX.zzzzzzzzz += 8;
        TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 50, _TFT_HEIGHT, _TFT_COLOR_BLACK);
        TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), response, _TFT_COLOR_RED, _TFT_COLOR_BLACK, 1);
    }

    if((MILLISECONDS > 4000) && (tmp2 < (MILLISECONDS - 4000))) {
        tmp2 = MILLISECONDS;

        char response[EUSART_LINE_SIZE];
        memset(response, 0x00, EUSART_LINE_SIZE);
        A6_Command(x1, "aa", "bb", 123, response);

        EUSART_RX.zzzzzzzzz += 8;
        TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 50, _TFT_HEIGHT, _TFT_COLOR_BLACK);
        TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), response, _TFT_COLOR_RED, _TFT_COLOR_BLACK, 1);
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