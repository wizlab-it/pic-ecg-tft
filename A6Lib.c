/*
 * 20191224.001
 * A6 GSM Module Library
 *
 * File: A6Lib.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "A6Lib.h"

void A6_ReadLine(char *response, uint8_t len) {
    uint8_t iLine = 0;
    memset(response, 0x00, len);
    while(1) {
        while(EUSART_RX.iRead == EUSART_RX.iWrite);
        EUSART_RX.iRead++;
        if(EUSART_RX.buffer[EUSART_RX.iRead] == '\r') break;
        response[iLine] = EUSART_RX.buffer[EUSART_RX.iRead];
        iLine++;
    }
    response[iLine] = 0x00;
    return;
}

void A6_Command(const char *command, const char *resp1, const char *resp2, int timeout, char *response) {
    EUSART_RX.iRead = EUSART_RX.iWrite;
    EUSART_TX_String(command, strlen(command));

    //Skip initial CRLF
    do {
        while(EUSART_RX.iRead == EUSART_RX.iWrite);
        EUSART_RX.iRead++;
    } while(EUSART_RX.buffer[EUSART_RX.iRead] != '\n');

    //Get response
    A6_ReadLine(response, EUSART_LINE_SIZE);

    return;
}

void A6_SetSpeed(const uint32_t speed) {
    char response[EUSART_LINE_SIZE];
    memset(response, 0x00, EUSART_LINE_SIZE);

    switch(speed) {
        case 57600:
            A6_Command("AT+IPR=57600\r\0", "aa", "bb", 123, response);
            break;
        case 115200:
            A6_Command("AT+IPR=115200\r\0", "aa", "bb", 123, response);
            break;
        case 9600:
        default:
            A6_Command("AT+IPR=9600\r\0", "aa", "bb", 123, response);
            break;
    }
    EUSART_SetSpeed(speed);

    EUSART_RX.zzzzzzzzz += 8;
    TFT_DrawFillRect(EUSART_RX.zzzzzzzzz, 0, 50, _TFT_HEIGHT, _TFT_COLOR_BLACK);
    TFT_DrawString(EUSART_RX.zzzzzzzzz, (_TFT_HEIGHT - 1), response, _TFT_COLOR_GREEN, _TFT_COLOR_BLACK, 1);
    __delay_ms(500);

    return;
}