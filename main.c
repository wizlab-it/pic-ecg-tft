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
//char x7[] = "AT+COPS=?\r";

void main(void) {
    //Init everything
    init();
    TFT_Init();
    EUSART_Init();
    Ecg_Init();

    //Loop forever
    while(1) loop();
}


/*==============================================================================
 * Loop routine
 *============================================================================*/
void loop(void) {
    //Ecg_Process();

    //EUSART_RX_Process();

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
    /*
    xx[3]++;
    if(xx[3] == '6') {
        xx[3] = '0';
        __delay_ms(2500);
    }
    */
}