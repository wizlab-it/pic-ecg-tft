/*
 * 20200102.050
 * A6 GSM Module Library
 *
 * File: A6Lib.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "A6Lib.h"

uint8_t A6_Init(const uint32_t baudRate) {
    A6_BaudRateAutoDetect();
    A6_BaudRateSet(baudRate);
    A6_Command("AT+COPS=3,0\r", 0, NULL, 0);
    return A6_IsAlive();
}

void A6_Command(const char *command, int16_t timeout, char *response, uint8_t responseLen) {
    A6_LAST_COMMAND_MILLISECONDS += A6_NEXT_COMMAND_WAIT_TIME;
    while(MILLISECONDS < A6_LAST_COMMAND_MILLISECONDS);
    A6_LAST_COMMAND_MILLISECONDS = MILLISECONDS;

    EUSART_RX_Flush();
    EUSART_TX_String(command, strlen(command));
    if(responseLen != 0) {
        A6_ReadLine(response, responseLen, timeout);
    }
    return;
}

uint8_t A6_ReadLine(char *line, uint8_t lineLen, int16_t timeout) {
    char c;
    memset(line, 0x00, lineLen);

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
        line[iResponse] = c;
        iResponse++;
        if(iResponse == lineLen) break;
    } while(c = EUSART_BufferGetChar(timeout));

    return iResponse;
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
        baudRateToken = strtok(NULL, " ");
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
    for(uint8_t i=0; i<3; i++) {
        EUSART_BaudRateSet(A6_BAUDRATES[i]);
        if(A6_IsAlive() == 1) {
            return A6_BAUDRATES[i];
        }
        sleepMS(100);
    }

    return 0;
}

uint8_t A6_SIM_GetStatus(void) {
    char *SIMToken;
    char response[32];

    A6_Command("AT+CPIN?\r", 0, response, 32);
    if(strstr(response, "+CPIN:") != NULL) {
        SIMToken = strtok(response, ":");
        SIMToken = strtok(NULL, ":");
        if(strcmp(SIMToken, "READY") == 0) {
            return A6_SIM_READY;
        } else if(strcmp(SIMToken, "NO SIM") == 0) {
            return A6_SIM_MISSING;
        } else if(strcmp(SIMToken, "SIM PIN") == 0) {
            return A6_SIM_PIN;
        }
    }

    return A6_SIM_UNKNOWN;
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
        networkStatusToken = strtok(NULL, " ");
        if(networkStatusToken != NULL) {
            networkStatusToken = strtok(networkStatusToken, ",");
            networkStatusToken = strtok(NULL, ",");
            return atoi(networkStatusToken);
        }
    }

    return A6_NETWORK_STATUS_UNKNOWN;
}

uint8_t A6_NetworkIsConnected(void) {
    uint8_t ns = A6_NetworkGetStatus();
    if((ns == 1) || (ns == 5)) return 1;
    return 0;
}

uint8_t A6_NetworkGetRSSI(void) {
    char *RSSIToken;
    char response[32];

    A6_Command("AT+CSQ\r", 0, response, 32);
    if(strstr(response, "+CSQ: ") != NULL) {
        RSSIToken = strtok(response, " ");
        RSSIToken = strtok(NULL, " ");
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

void A6_NetworkGetOperator(char *operator, uint8_t operatorLen) {
    char *operatorToken;

    A6_Command("AT+COPS?\r", 0, operator, 32);
    if(strstr(operator, "+COPS: ") != NULL) {
        operatorToken = strtok(operator, " ");
        operatorToken = strtok(NULL, " ");
        operatorToken = strtok(operatorToken, ",");
        if(operatorToken[0] == '0') {
            operatorToken = strtok(NULL, ",");
            operatorToken = strtok(NULL, ",");
            operatorToken = strtok(++operatorToken, "\"");
            strcpy(operator, operatorToken);
            return;
        }
    }
    strcpy(operator, "-");
}

uint8_t A6_NetworkGPRSGetStatus(void) {
    char *GPRSStatusToken;
    char response[32];

    A6_Command("AT+CGATT?\r", 0, response, 32);
    if(strstr(response, "+CGATT:") != NULL) {
        GPRSStatusToken = strtok(response, ":");
        GPRSStatusToken = strtok(NULL, ":");
        return atoi(GPRSStatusToken);
    }

    return A6_NETWORK_STATUS_UNKNOWN;
}

uint8_t A6_NetworkGPRSIsConnected(void) {
    uint8_t gs = A6_NetworkGPRSGetStatus();
    if((gs == 1) || (gs == 5)) return 1;
    return 0;
}

uint8_t A6_NetworkGPRSConnect(const char apn[]) {
    if(A6_NetworkIsConnected() != 1) return 0;
    A6_Command("AT+CGATT=1\r", 0, NULL, 0);

    char apnCommand[64];
    sprintf(apnCommand, "AT+CGDCONT=1,\"IP\",\"%s\"\r", apn);
    A6_Command(apnCommand, 0, NULL, 0);

    A6_Command("AT+CGACT=1,1\r", 0, NULL, 0);
    sleepMS(250);

    return A6_NetworkGPRSIsConnected();
}

uint8_t A6_NetworkGPRSDisconnect(void) {
    A6_NetworkGPRSCloseTCP();
    A6_Command("AT+CGATT=0\r", 0, NULL, 0);
    sleepMS(100);
    return A6_NetworkGPRSIsConnected();
}

uint8_t A6_NetworkGPRSOpenTCP(const char ipAddress[], uint16_t port, uint16_t timeout) {
    char response[32];

    char openCommand[64];
    sprintf(openCommand, "AT+CIPSTART=\"TCP\",\"%s\",%u\r", ipAddress, port);
    A6_Command(openCommand, 0, response, 32);
    if(strcmp(response, "OK") == 0) {
        uint32_t timeoutTimestamp = MILLISECONDS + timeout;
        while(timeoutTimestamp > MILLISECONDS) {
            A6_Command("AT+CIPSTATUS\r", 0, response, 32);
            if(strstr(response, "CONNECT OK") != NULL) {
                return 1;
            } else {
                sleepMS(200);
            }
        }
    }

    return 0;
}

void A6_NetworkGPRSCloseTCP(void) {
    A6_Command("AT+CIPCLOSE\r", 0, NULL, 0);
    A6_Command("AT+CIPSHUT\r", 0, NULL, 0);
}