/*
 * 20191228.044
 * ECG-TFT
 *
 * File: ecg.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "ecg.h"

void Ecg_Init(void) {
    if(Ecg_CheckLeads() == 0) {
        Ecg_Background_Leads_Ok();
    } else {
        Ecg_Background_Leads_Failure();
    }
    ECG_HEARTBEAT.i = 0;
    ECG_BUFFER.i = 0;
    ECG_HEARTRATE.processHeartbeat = 1;
}

void Ecg_Process(void) {
    if(ECG_FLAGS.processInterrupt) {
        Ecg_ProcessInterrupt();
        ECG_FLAGS.processInterrupt = 0;
    }

    if(ECG_FLAGS.processEcg) {
        Ecg_ProcessEcg();
        ECG_FLAGS.processEcg = 0;
    }

    if(ECG_FLAGS.processHeartRate && ECG_FLAGS.leadsOk) {
        Ecg_ProcessHeartRate();
        ECG_FLAGS.processHeartRate = 0;
    }
}

void Ecg_ProcessInterrupt(void) {
    if(ECG_FLAGS.msecDelay >= (ECG_DELAY_SAMPLE / MILLISECONDS_TICK)) {
        ECG_FLAGS.processEcg = 1;
        ECG_FLAGS.msecDelay = 0;
    }
    if(ECG_HEARTRATE.msecDelay >= (ECG_DELAY_HEARTRATE / MILLISECONDS_TICK)) {
        ECG_FLAGS.processHeartRate = 1;
        ECG_HEARTRATE.msecDelay = 0;
    }
}

void Ecg_ProcessEcg(void) {
    Ecg_CheckLeads();

    if(ECG_FLAGS.leadsOk) {
        //Draw background for leads ok
        if(ECG_FLAGS.leadsOkFlag == 0) {
            Ecg_Background_Leads_Ok();
            ECG_FLAGS.leadsOkFlag = 1;
        }

        //Acquire ECG
        Ecg_Draw();

        //Heartbeat
        Ecg_ProcessHeartbeat();
    } else {
        //Draw background for leads disconnected
        if(ECG_FLAGS.leadsOkFlag == 1) {
            Ecg_Background_Leads_Failure();
            ECG_FLAGS.leadsOkFlag = 0;
        }
    }
}

void Ecg_ProcessHeartRate(void) {
    uint8_t heartrate = 0;
    char heartrateString[5];
    uint32_t heartbeatAverage = 0;

    for(uint8_t i=0, j=ECG_HEARTBEAT.i, jPrev=0; i<(ECG_HEARTBEAT_SIZE - 1); i++) {
        j = (j == 0) ? (ECG_HEARTBEAT_SIZE - 1) : (j - 1);
        jPrev = (j == 0) ? (ECG_HEARTBEAT_SIZE - 1) : (j - 1);
        heartbeatAverage += (ECG_HEARTBEAT.data[j] - ECG_HEARTBEAT.data[jPrev]);
    }
    heartbeatAverage /= (ECG_HEARTBEAT_SIZE - 1);
    heartrate = (uint8_t)(60000 / heartbeatAverage);
    sprintf(heartrateString, "%3d", heartrate);
    TFT_DrawString(135, 10, heartrateString, _TFT_COLOR_GREEN, _TFT_COLOR_BLACK, 2);
}

void Ecg_ProcessHeartbeat(void) {
    if(ECG_HEARTRATE.processHeartbeat == 1) {
        //Analize ECG
        int16_t ecgDeltaSum=0, ecgDeltaAbsSum=0, ecgDeltaDiff=0;
        for(uint8_t i=1; i<ECG_BUFFER_SIZE; i++) {
            int16_t delta = ECG_BUFFER.data[i] - ECG_BUFFER.data[i - 1];
            ecgDeltaSum += delta;
            ecgDeltaAbsSum += abs(delta);
        }
        ecgDeltaDiff = ecgDeltaAbsSum - ecgDeltaSum;

        //Detect heartbeat
        if(ecgDeltaDiff > ECG_HEARTBEAT_THRESHOLD) {
            //Store heartbeat timestamp
            ECG_HEARTBEAT.data[ECG_HEARTBEAT.i++] = MILLISECONDS;
            if(ECG_HEARTBEAT.i == ECG_HEARTBEAT_SIZE) ECG_HEARTBEAT.i = 0;

            //Show heart icon
            TFT_DrawBitmap(180, 7, ECG_ICON_HEART, _TFT_COLOR_RED);
            ECG_HEARTRATE.heartIconMsecDelay = ECG_DELAY_HEART_ICON / MILLISECONDS_TICK;
            ECG_HEARTRATE.heartIconShown = 1;

            //Delay heartbeat processing
            ECG_HEARTRATE.heartbeatMsecDelay = ECG_DELAY_HEARTBEAT / MILLISECONDS_TICK;
            ECG_HEARTRATE.processHeartbeat = 0;
        }
    } else {
        //Check when to remove heart icon
        if(ECG_HEARTRATE.heartIconShown == 1) {
            ECG_HEARTRATE.heartIconMsecDelay--;
            if(ECG_HEARTRATE.heartIconMsecDelay == 0) {
                TFT_DrawFillRect(180, 7, 20, 20, _TFT_COLOR_BLACK);
                ECG_HEARTRATE.heartIconShown = 0;
            }
        }

        //Check if to start again to process heartbeat
        ECG_HEARTRATE.heartbeatMsecDelay--;
        if(ECG_HEARTRATE.heartbeatMsecDelay == 0) {
            ECG_HEARTRATE.processHeartbeat = 1;
        }
    }
}

void Ecg_Interrupt(void) {
    ECG_FLAGS.msecDelay++;
    ECG_HEARTRATE.msecDelay++;
    ECG_FLAGS.processInterrupt = 1;
}

uint16_t Ecg_CheckLeads(void) {
    uint8_t leadsStatus = 0;
    if(ECG_LO_P_OFF == 1) leadsStatus |= 0b00000010;
    if(ECG_LO_N_OFF == 1) leadsStatus |= 0b00000001;
    ECG_FLAGS.leadsOk = (leadsStatus == 0) ? 1 : 0;
    return leadsStatus;
}

uint16_t Ecg_Read(void) {
    uint16_t ecg;
    ADCON0bits.CHS = ECG_ANALOG_CHANNEL;
    ADCON0bits.ADON = 1;
    GO_nDONE = 1;
    while(GO_nDONE == 1);
    ecg = ADRESH;
    ecg = ecg << 8;
    ecg &= 0xFF00;
    ecg |= ADRESL;
    ADCON0bits.ADON = 0;
    ECG_BUFFER.data[ECG_BUFFER.i++] = (uint8_t)(ecg >> 2);
    if(ECG_BUFFER.i == ECG_BUFFER_SIZE) ECG_BUFFER.i = 0;
    return ecg;
}

void Ecg_Draw(void) {
    uint16_t ecg = Ecg_Read();
    ecg /= 5;
    Ecg_Y = TFT_GetHeight() - ecg;
    TFT_DrawFillRect(Ecg_X, ECG_GRAPH_TOP_OFFSET, ECG_GRAPH_BLANK_SPACE, (TFT_GetHeight() - ECG_GRAPH_TOP_OFFSET), _TFT_COLOR_BLACK);
    TFT_DrawLine(Ecg_Xold, Ecg_Yold, Ecg_X, Ecg_Y, _TFT_COLOR_GREEN);
    Ecg_Xold = Ecg_X;
    Ecg_Yold = Ecg_Y;
    Ecg_X++;
    if(Ecg_X == TFT_GetWidth()) {
        Ecg_X = 0;
        Ecg_Xold = 0;
    }
}

void Ecg_Background_Leads_Ok(void) {
    TFT_FullScreen(_TFT_COLOR_BLACK);
    TFT_DrawString(8, 10, "Frequenza:", _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 2);
    TFT_DrawLine(0, (ECG_GRAPH_TOP_OFFSET - 1), TFT_GetWidth(), (ECG_GRAPH_TOP_OFFSET -  1), _TFT_COLOR_WHITE);
    Ecg_X = 0;
    Ecg_Xold = 0;
    Ecg_Y = TFT_GetHeight() >> 1;
    Ecg_Yold = Ecg_Y;
}

void Ecg_Background_Leads_Failure(void) {
    TFT_FullScreen(_TFT_COLOR_BLACK);
    TFT_DrawString(36, 75, "*** Collegare elettrodi ***", _TFT_COLOR_WHITE, _TFT_COLOR_BLACK, 2);
}