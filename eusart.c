/*
 * 20190330.018
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
    TXSTAbits.BRGH = 0;     //Low speed

    //RX Register
    RCSTAbits.SPEN = 1;     //Enable EUSART
    RCSTAbits.RX9 = 0;      //8-bit RX
    RCSTAbits.CREN = 1;     //Enable RX

    //Baud rate generator
    BAUDCONbits.BRG16 = 0;  //8-bit baud rate generator
    BAUDCONbits.WUE = 0;    //No wake-up
    BAUDCONbits.ABDEN = 0;  //No auto baud detect
    SPBRGH = 0;             //Set baud rate (9600bps)
    SPBRG = 77;             //Set baud rate (9600bps)

    //Interrupts
    RCIE = 1; //EUSART RX

    //Init RX Buffer
    EUSART_RX.iRead = 0;
    EUSART_RX.iWrite = 0;
    EUSART_RX.zzzzzzzzz = 1;
    memset(EUSART_RX.buffer, 0x00, EUSART_RX_BUFFER_SIZE);
}

void EUSART_TX_Char(uint8_t c) {
    while(TXIF == 0) { }
    TXREG = c;
    __asm("nop");
}

void EUSART_TX_String(char *str, uint8_t len) {
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
    switch(c) {
      case '\r':
        break;

      case '\n':
        if(EUSART_RX.iWrite != 0) {
          //EUSART_RX.processRX = 1;
          _LED = 0;
        }
        EUSART_RX.zzzzzzzzz += 6;
        TFT_DrawFillRect(EUSART_RX.zzzzzzzzz + 18, 0, 6, _TFT_HEIGHT, _TFT_COLOR_BLACK);
        EUSART_RX.iWrite = 0;
        break;

      default:
        _LED = 1;
        EUSART_RX.buffer[EUSART_RX.iWrite] = c;
        EUSART_RX.iWrite++;
        if(EUSART_RX.iWrite == EUSART_RX_BUFFER_SIZE) EUSART_RX.iWrite = 0;
        EUSART_RX.buffer[EUSART_RX.iWrite] = 0x00;
        
        TFT_DrawChar(EUSART_RX.zzzzzzzzz, ((_TFT_HEIGHT - 1) - (EUSART_RX.iWrite * 6)), c, _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 1);

        break;
    }
}

void EUSART_RX_Process(void) {
    if(EUSART_RX.processRX == 0) return;

    TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 18, _TFT_HEIGHT, _TFT_COLOR_BLACK);
    for(uint8_t i=0; i!=EUSART_RX_BUFFER_SIZE; i++) {
      if(EUSART_RX.buffer[i] == 0) break;
      TFT_DrawChar(EUSART_RX.zzzzzzzzz, ((_TFT_HEIGHT - 1) - (i * 6)), EUSART_RX.buffer[i], _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 1);
    }
    EUSART_RX.zzzzzzzzz += 8;
    if(EUSART_RX.zzzzzzzzz > 210) EUSART_RX.zzzzzzzzz = 1;
    EUSART_RX.iWrite = 0;
    EUSART_RX.buffer[EUSART_RX.iWrite] = 0x00;
    EUSART_RX.buffer[EUSART_RX.iWrite + 1] = 0x00;

    EUSART_RX.processRX = 0;

    //DEBUG CODE
    /*
    TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 18, _TFT_HEIGHT, _TFT_COLOR_BLACK);
    for(uint8_t i=0; i!=EUSART_RX_BUFFER_SIZE; i++) {
        TFT_DrawChar(EUSART_RX.zzzzzzzzz, ((_TFT_HEIGHT - 1) - (i * 6)), EUSART_RX.buffer[i], _TFT_COLOR_RED, _TFT_COLOR_BLACK, 1);
    }
    EUSART_RX.zzzzzzzzz += 12;
    if(EUSART_RX.zzzzzzzzz > 210) EUSART_RX.zzzzzzzzz = 1;
     */
    //DEBUG CODE

    //Extract lines from raw data buffer
    /*
    uint8_t i = 0;
    uint8_t iRead = EUSART_RX.iRead;
    while(i != (EUSART_RX_BUFFER_SIZE - 1)) {
        char c = EUSART_RX.buffer[iRead++];
        if(iRead == EUSART_RX_BUFFER_SIZE) iRead = 0;
        switch(c) {
            case '\r':
                _LED = (_LED == 1) ? 0 : 1;
                EUSART_RX.line[i] = 0x00;
                TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 36, _TFT_HEIGHT, _TFT_COLOR_BLACK);
                TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 2), EUSART_RX.line, _TFT_COLOR_BLUE, _TFT_COLOR_BLACK, 2);
                EUSART_RX.zzzzzzzzz += 24;
                if(EUSART_RX.zzzzzzzzz > 210) EUSART_RX.zzzzzzzzz = 1;
                EUSART_RX.iRead = iRead;
                i = 0;
                break;
            case 0x00:
                i = (EUSART_RX_BUFFER_SIZE - 1);
                break;
            default:
                EUSART_RX.line[i++] = c;
                break;
        }
    }

    EUSART_RX.processRX = 0;
    */
}