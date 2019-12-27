/*
 * 20191227.035
 * A6 GSM Module Library
 *
 * File: A6Lib.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "A6Lib.h"

void A6_Init(void) {
    sleepMS(5000);
    A6_BaudRateAutoDetect();
}

uint8_t A6_IsAlive(void) {
    char response[32];
    A6_Command("AT\r", 0, response, 32);
    if(strcmp(response, "OK") == 0) {
        return 1;
    }
    return 0;
}

uint32_t A6_BaudRateGet(void) {
    uint32_t baudRate;
    char *baudRateToken;
    char response[32];

    A6_Command("AT+IPR?\r", 0, response, 32);
    if(strstr(response, "+IPR: ") != NULL) {
        baudRateToken = strtok(response, " ");
        baudRateToken = strtok(NULL, response);
        if(baudRateToken != NULL) {
            baudRate = atol(baudRateToken);
            for(uint8_t j=0; j<3; j++) {
                if(baudRate == A6_BAUDRATES[j]) {
                    return baudRate;
                }
            }
        }
    }

    return 0;
}

uint32_t A6_BaudRateSet(const uint32_t baudRate) {
    char request[20];
    char response[32];
    uint32_t currentBaudRate = A6_BaudRateGet();

    //If unable to detect current baud rate then exit
    if(currentBaudRate == 0) return 0;

    //Send IPR Command
    sprintf(request, "AT+IPR=%lu\r", baudRate);
    A6_Command(request, 0, response, 32);
    sleepMS(250);
    if(strcmp(response, "OK") == 0) {
        //Set new baud rate on EUSART
        EUSART_BaudRateSet(baudRate);
        sleepMS(150);
        if(A6_IsAlive() == 1) {
            return baudRate;
        }
    }

    //If here, new baud rate has not been set, restore EUSART original baud rate and return error
    EUSART_BaudRateSet(currentBaudRate);
    return 0;
}

uint32_t A6_BaudRateAutoDetect(void) {
    TFT_ConsolePrintLine("Detecting baud rate...", _TFT_COLOR_MAGENTA);

    for(uint8_t i=0; i<3; i++) {
        EUSART_BaudRateSet(A6_BAUDRATES[i]);
        if(A6_IsAlive() == 1) {
            char zzzz[32];
            sprintf(zzzz, "%lu FOUND!", A6_BAUDRATES[i]);
            TFT_ConsolePrintLine(zzzz, _TFT_COLOR_RED);
            return A6_BAUDRATES[i];
        }
        sleepMS(100);
    }

    return 0;
}

void A6_Command(const char *command, int16_t timeout, char *response, uint8_t responseLen) {
    A6_LAST_COMMAND_MILLISECONDS += A6_NEXT_COMMAND_WAIT_TIME;
    while(MILLISECONDS < A6_LAST_COMMAND_MILLISECONDS);
    A6_LAST_COMMAND_MILLISECONDS = MILLISECONDS;

    EUSART_RX_Flush();
    EUSART_TX_String(command, strlen(command));
    A6_ReadLine(response, responseLen, timeout);
    return;
}

uint8_t A6_ReadLine(char *response, uint8_t responseLen, int16_t timeout) {
    char c;
    memset(response, 0x00, responseLen);

    //Skip initial CRLF
    while(1) {
        c = EUSART_BufferGetChar(timeout);
        if(c == NULL) return 0;
        if((c != '\r') && (c != '\n')) break;
    }

    //Read real data
    uint8_t iResponse = 0;
    do {
        if((c == '\r') || (c == NULL)) break;
        response[iResponse] = c;
        iResponse++;
        if(iResponse == responseLen) break;
    } while(c = EUSART_BufferGetChar(timeout));

    return iResponse;
}

void A6_Process_Random_Comms(void) {
    if(EUSART_RX_AvailableData(-1) == 0) return;

    char response[32];
    uint8_t cnt = A6_ReadLine(response, 32, 0);
    if(cnt == 0) return;
    if(strcmp(response, "OK") == 0) return;
    TFT_ConsolePrintLine(response, _TFT_COLOR_CYAN);
}

uint8_t A6_NetworkGetStatus(void) {
    char *networkStatusToken;
    char response[32];

    A6_Command("AT+CREG?\r", 0, response, 32);
    if(strstr(response, "+CREG: ") != NULL) {
        networkStatusToken = strtok(response, " ");
        networkStatusToken = strtok(NULL, response);
        if(networkStatusToken != NULL) {
            networkStatusToken = strtok(networkStatusToken, ",");
            networkStatusToken = strtok(NULL, response);
            return atoi(networkStatusToken);
        }
    }

    return A6_NETWORK_STATUS_UNKNOWN;
}

uint8_t A6_NetworkGetRSSI(void) {
    char *RSSIToken;
    char response[32];

    A6_Command("AT+CSQ\r", 0, response, 32);
    if(strstr(response, "+CSQ: ") != NULL) {
        RSSIToken = strtok(response, " ");
        RSSIToken = strtok(NULL, response);
        if(RSSIToken != NULL) {
            RSSIToken = strtok(RSSIToken, ",");
            return atoi(RSSIToken);
        }
    }

    return 0;
}

int8_t A6_NetworkGetRSSILevel(void) {
    uint8_t RSSI = A6_NetworkGetRSSI();
    if(RSSI == 99) return -1;
    if(RSSI < 3) return 0;
    if(RSSI < 10) return 1;
    if(RSSI < 15) return 2;
    if(RSSI < 20) return 3;
    return 4;
}