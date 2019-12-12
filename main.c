/*
 * 20190330.031
 * ECG-TFT
 *
 * File: main.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "main.h"

char xx[] = {'A', 'T', 'H', '0', '\r', '\n'};

void main(void) {
    //Init everything
    init();
    TFT_Init();
    //EUSART_Init();
    Ecg_Init();

    //Loop forever
    while(1) loop();
}


/*==============================================================================
 * Loop routine
 *============================================================================*/
void loop(void) {
    Ecg_Process();

    /*
    EUSART_RX_Process();


    EUSART_TX_String(xx, 6);
    xx[3]++;
    if(xx[3] == '6') {
        xx[3] = '0';
        __delay_ms(2500);
    }
    */
}