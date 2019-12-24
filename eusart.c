/*
 * 20191224.019
 * ECG-TFT
 *
 * File: eusart.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "eusart.h"

void EUSART_Init(void) {
    //TX Register
    TXSTAbits.TX9 = 0;      //8-bit TX
    TXSTAbits.TXEN = 1;     //Enable TX
    TXSTAbits.SYNC = 0;     //Asynchronous
    TXSTAbits.SENDB = 0;    //Sync Break transmission completed
    TXSTAbits.BRGH = 1;     //High speed

    //RX Register
    RCSTAbits.SPEN = 1;     //Enable EUSART
    RCSTAbits.RX9 = 0;      //8-bit RX
    RCSTAbits.CREN = 1;     //Enable RX

    //Baud rate generator
    BAUDCONbits.BRG16 = 1;  //16-bit baud rate generator
    BAUDCONbits.WUE = 0;    //No wake-up
    BAUDCONbits.ABDEN = 0;  //No auto baud detect
    SPBRGH = 0x04;          //Set baud rate (9600bps)
    SPBRG = 0xE1;           //Set baud rate (9600bps)

    //Interrupts
    RCIE = 1; //EUSART RX

    //Init RX Buffer
    EUSART_RX.iRead = 0;
    EUSART_RX.iWrite = 0;
    EUSART_RX.processRX = 0;
    EUSART_RX.zzzzzzzzz = 1;
    memset(EUSART_RX.buffer, 0x00, EUSART_BUFFER_SIZE);
    memset(EUSART_RX.line, 0x00, EUSART_LINE_SIZE);
}

void EUSART_SetSpeed(const uint32_t speed) {
    TXSTAbits.SYNC = 0;     //Asynchronous
    TXSTAbits.BRGH = 1;     //High speed
    BAUDCONbits.BRG16 = 1;  //16-bit baud rate generator

    uint32_t tmp = (_XTAL_FREQ / speed);
    tmp = tmp / 4;
    tmp--;

    SPBRG = (uint8_t) tmp;
    SPBRGH = (uint8_t) (tmp >> 8);

    return;
}

void EUSART_TX_Char(uint8_t c) {
    while(TXIF == 0) { }
    TXREG = c;
    __asm("nop");
}

void EUSART_TX_String(const char *str, uint8_t len) {
    while(len--) {
        EUSART_TX_Char(*str++);
    }
}

void EUSART_RX_Interrupt(void) {
    uint8_t c = RCREG;
    if(OERR == 1) {
        CREN = 0;
        CREN = 1;
    }
    EUSART_RX.iWrite++;
    if(EUSART_RX.iWrite == EUSART_BUFFER_SIZE) EUSART_RX.iWrite = 0;
    EUSART_RX.buffer[EUSART_RX.iWrite] = c;
    return;
}

void EUSART_RX_Process(void) {
    //if(EUSART_RX.iRead == EUSART_RX.iWrite)
    if(EUSART_RX.processRX == 0) return;
    EUSART_RX.processRX--;

    //Extract line
    EUSART_RX.zzzzzzzzz += 8;
    for(uint8_t iLine=0; iLine<EUSART_LINE_SIZE; iLine++) {
        EUSART_RX.line[iLine] = EUSART_RX.buffer[EUSART_RX.iRead];
        EUSART_RX.iRead++;
        if(EUSART_RX.iRead == EUSART_BUFFER_SIZE) EUSART_RX.iRead = 0;
        if(EUSART_RX.line[iLine] == 0x00) break;
    }
    EUSART_RX.line[EUSART_LINE_SIZE - 1] = 0x00;

    TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 50, _TFT_HEIGHT, _TFT_COLOR_BLACK);
    TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), EUSART_RX.line, _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 1);

    return;
}