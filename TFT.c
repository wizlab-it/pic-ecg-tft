/*
 * 20191227.047
 * ECG-TFT
 *
 * File: TFT.c
 * Processor: PIC18F2455
 * Author: wizlab.it
 */

#include "TFT.h"

void TFT_WriteRegister(uint16_t reg, uint16_t data) {
    _TFT_CS_ACTIVE;
    _TFT_WRITE_CMD(reg);
    _TFT_WRITE_DATA(data);
    _TFT_CS_IDLE;
}

void TFT_WriteRegisters(uint16_t reg, uint8_t *data, uint8_t dataSize) {
    _TFT_CS_ACTIVE;
    _TFT_WRITE_CMD(reg);
    _TFT_CD_DATA;
    uint8_t i = 0;
    while(i != dataSize) {
        _TFT_WRITE_8BIT(data[i++]);
    }
    _TFT_CS_IDLE;
}

uint16_t TFT_ReadRegister(uint16_t reg) {
    uint16_t data;
    _TFT_CS_ACTIVE;
    _TFT_WRITE_CMD(reg);
    _TFT_DATA_DIR_RD;
    _TFT_CD_DATA;
    _TFT_READ_16BIT(data);
    _TFT_CS_IDLE;
    _TFT_DATA_DIR_WR;
    return data;
}

uint16_t TFT_ReadID(void) {
    return TFT_ReadRegister(0x0000);
}

void TFT_Init(uint8_t orientation, uint16_t color) {
    TFT_Reset();
    __delay_ms(200);

    //Send init sequence
    uint16_t i=0, cmd, data;
    uint16_t initSequenceSize = sizeof(TFT_Init_Sequence) / sizeof(uint16_t);
    while(i != initSequenceSize) {
        cmd = TFT_Init_Sequence[i++];
        data = TFT_Init_Sequence[i++];
        if(cmd == _TFT_DELAY_FLAG) {
            __delay_ms(200);
        } else {
            TFT_WriteRegister(cmd, data);
        }
    }

    //Set display orientation and background
    TFT_OrientationSet(orientation, color);
}

void TFT_Reset(void) {
    _TFT_DATA_DIR_WR;
    _TFT_CS_IDLE;
    _TFT_WR_IDLE;
    _TFT_RD_IDLE;
    _TFT_RESET_ACTIVE;
    __delay_ms(2);
    _TFT_RESET_IDLE;
}

uint16_t TFT_ColorRGBTo16Bit(uint8_t r, uint8_t g, uint8_t b) {
  return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}

uint16_t TFT_GetWidth(void) {
    switch(TFT_OrientationGet()) {
        case _TFT_ORIENTATION_PORTRAIT:
        case _TFT_ORIENTATION_INV_PORTRAIT:
            return _TFT_WIDTH - 1;
        case _TFT_ORIENTATION_LANDSCAPE:
        case _TFT_ORIENTATION_INV_LANDSCAPE:
            return _TFT_HEIGHT - 1;
    }
    return 0;
}

uint16_t TFT_GetHeight(void) {
    switch(TFT_OrientationGet()) {
        case _TFT_ORIENTATION_PORTRAIT:
        case _TFT_ORIENTATION_INV_PORTRAIT:
            return _TFT_HEIGHT - 1;
        case _TFT_ORIENTATION_LANDSCAPE:
        case _TFT_ORIENTATION_INV_LANDSCAPE:
            return _TFT_WIDTH - 1;
    }
    return 0;
}

uint8_t TFT_OrientationGet(void) {
    return TFT_Orientation;
}

void TFT_OrientationSet(uint8_t orientation, uint16_t color) {
    if(orientation > 3) orientation = 0;
    TFT_Orientation = orientation;
    TFT_FullScreen(color);
}

void TFT_SetAddrWindow(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2) {
    uint16_t tmp;
    switch(TFT_OrientationGet()) {
        case _TFT_ORIENTATION_PORTRAIT:
            //Set address window
            TFT_WriteRegister(0x0210, x1);
            TFT_WriteRegister(0x0211, x2);
            TFT_WriteRegister(0x0212, y1);
            TFT_WriteRegister(0x0213, y2);
            //Set address counter to top left
            TFT_WriteRegister(0x0200, x1);
            TFT_WriteRegister(0x0201, y2);
            break;
        case _TFT_ORIENTATION_LANDSCAPE:
            //Set address window
            TFT_WriteRegister(0x0210, _TFT_WIDTH - 1 - y2);
            TFT_WriteRegister(0x0211, _TFT_WIDTH - 1 - y1);
            TFT_WriteRegister(0x0212, x1);
            TFT_WriteRegister(0x0213, x2);
            //Set address counter to top left
            TFT_WriteRegister(0x0200, _TFT_WIDTH - 1 - y1);
            TFT_WriteRegister(0x0201, x1);
            break;
        case _TFT_ORIENTATION_INV_PORTRAIT:
            //Set address window
            TFT_WriteRegister(0x0210, _TFT_WIDTH - 1 - x2);
            TFT_WriteRegister(0x0211, _TFT_WIDTH - 1 - x1);
            TFT_WriteRegister(0x0212, _TFT_HEIGHT - 1 - y2);
            TFT_WriteRegister(0x0213, _TFT_HEIGHT - 1 - y1);
            //Set address counter to top left
            TFT_WriteRegister(0x0200, _TFT_WIDTH - 1 - x1);
            TFT_WriteRegister(0x0201, _TFT_HEIGHT - 1 - y1);
            break;
        case _TFT_ORIENTATION_INV_LANDSCAPE:
            //Set address window
            TFT_WriteRegister(0x0210, y1);
            TFT_WriteRegister(0x0211, y2);
            TFT_WriteRegister(0x0212, _TFT_HEIGHT - 1 - x2);
            TFT_WriteRegister(0x0213, _TFT_HEIGHT - 1 - x1);
            //Set address counter to top left
            TFT_WriteRegister(0x0200, y1);
            TFT_WriteRegister(0x0201, _TFT_HEIGHT - 1 - x1);
            break;
    }
}

void TFT_FullScreen(uint16_t color) {
    TFT_SetAddrWindow(0, 0, TFT_GetWidth(), TFT_GetHeight());
    if(color != 0) {
        TFT_Flood(color, (uint32_t)_TFT_WIDTH * (uint32_t)_TFT_HEIGHT);
    }
}

void TFT_DrawPixel(uint16_t x, uint16_t y, uint16_t color) {
    uint16_t h, v;
    switch(TFT_OrientationGet()) {
        case _TFT_ORIENTATION_PORTRAIT:
            h = x;
            v = y;
            break;
        case _TFT_ORIENTATION_LANDSCAPE:
            h = _TFT_WIDTH - y;
            v = x;
            break;
        case _TFT_ORIENTATION_INV_PORTRAIT:
            h = _TFT_WIDTH - x;
            v = _TFT_HEIGHT - y;
            break;
        case _TFT_ORIENTATION_INV_LANDSCAPE:
            h = y;
            v = _TFT_HEIGHT - x;
            break;
    }
    TFT_WriteRegister(0x0200, h);
    TFT_WriteRegister(0x0201, v);
    TFT_WriteRegister(0x0202, color);
}

void TFT_DrawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
    int16_t steep = abs(y1 - y0) > abs(x1 - x0);
    if(steep) {
        _TFT_SWAP_INT16_T(x0, y0);
        _TFT_SWAP_INT16_T(x1, y1);
    }
    if(x0 > x1) {
        _TFT_SWAP_INT16_T(x0, x1);
        _TFT_SWAP_INT16_T(y0, y1);
    }

    int16_t dx, dy;
    dx = x1 - x0;
    dy = abs(y1 - y0);

    int16_t err = dx / 2;
    int16_t ystep;

    if(y0 < y1) {
        ystep = 1;
    } else {
        ystep = -1;
    }

    for(; x0<=x1; x0++) {
        if(steep) {
            TFT_DrawPixel(y0, x0, color);
        } else {
            TFT_DrawPixel(x0, y0, color);
        }
        err -= dy;
        if(err < 0) {
            y0 += ystep;
            err += dx;
        }
    }
}

void TFT_DrawFillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    TFT_SetAddrWindow(x, y, (x + w - 1), (y + h - 1));
    TFT_Flood(color, (w * h));
    TFT_FullScreen(0);
}

void TFT_Flood(uint16_t color, uint32_t len) {
    uint16_t blocks;
    uint8_t i;
    uint8_t color_hi = color >> 8;
    uint8_t color_lo = color;

    //Send first pixel
    TFT_WriteRegister(0x0202, color);
    len--;

    //Send other pixels, in 4 pixels per block to optimize speed
    //If high and low part of the color are the same, then only send the strobes, no need to change the value on the port (super optimizes speed)
    _TFT_CS_ACTIVE;
    blocks = (uint16_t)(len / 4);
    if(color_hi == color_lo) {
        while(blocks--) {
            _TFT_WR_STROBE; _TFT_WR_STROBE; //1st pixel
            _TFT_WR_STROBE; _TFT_WR_STROBE; //2nd pixel
            _TFT_WR_STROBE; _TFT_WR_STROBE; //3rd pixel
            _TFT_WR_STROBE; _TFT_WR_STROBE; //4th pixel
        }
        for(i = (uint8_t)len & 3; i--; ) {
            _TFT_WR_STROBE; _TFT_WR_STROBE; //Remaining pixels if len is not a len multiply
        }
    } else {
        while(blocks--) {
            _TFT_WRITE_8BIT(color_hi); _TFT_WRITE_8BIT(color_lo); //1st pixel
            _TFT_WRITE_8BIT(color_hi); _TFT_WRITE_8BIT(color_lo); //2nd pixel
            _TFT_WRITE_8BIT(color_hi); _TFT_WRITE_8BIT(color_lo); //3rd pixel
            _TFT_WRITE_8BIT(color_hi); _TFT_WRITE_8BIT(color_lo); //4th pixel
        }
        for(i = (uint8_t)len & 3; i--; ) {
            _TFT_WRITE_8BIT(color_hi); _TFT_WRITE_8BIT(color_lo); //Remaining pixels if len is not a len multiply
        }
    }
    _TFT_CS_IDLE;
}

void TFT_DrawChar(uint16_t x, uint16_t y, unsigned char c, uint16_t color, uint16_t bg, uint8_t size) {
    for(int8_t i=0; i<5; i++ ) {
        uint8_t line = TFT_Font[c * 5 + i];
        for(int8_t j=0; j<8; j++, line >>= 1) {
            if(line & 1) {
                if(size == 1) {
                    TFT_DrawPixel((x + i), (y + j), color);
                } else {
                    TFT_DrawFillRect((x + i * size), (y + j * size), size, size, color);
                }
            } else if(bg != color) {
                if(size == 1) {
                    TFT_DrawPixel((x + i), (y + j), bg);
                } else {
                    TFT_DrawFillRect((x + i * size), (y + j * size), size, size, bg);
                }
            }
        }
    }
    if(bg != color) {
        if(size == 1) {
            uint16_t xl = x + 5;
            TFT_DrawLine(xl, y, xl, y + 7, bg);
        } else {
            TFT_DrawFillRect((x + 5 * size), y, size, 8 * size, bg);
        }
    }
}

void TFT_DrawString(uint16_t x, uint16_t y, const char *str, uint16_t color, uint16_t bg, uint8_t size) {
    while(*str) {
        TFT_DrawChar(x, y, *str, color, bg, size);
        x += (6 * size);
        str++;
    }
}

void TFT_DrawBitmap(uint16_t x, uint16_t y, const uint8_t *bitmap, uint16_t color) {
    uint8_t w = *bitmap++;
    uint8_t h = *bitmap++;
    uint8_t byte = 0;

    for(uint16_t j=0; j<h; j++, y++) {
        for(uint16_t i=0; i<w; i++) {
            if(i & 7) {
                byte >>= 1;
            } else {
                byte = *bitmap++;
            }
            if(byte & 0x01) TFT_DrawPixel((x + i), y, color);
        }
    }
}

void TFT_ConsoleInit(uint8_t orientation) {
    TFT_ConsoleRow = 0;
    TFT_OrientationSet(orientation, _TFT_COLOR_BLACK);
}

void TFT_ConsolePrintLine(const char *str, uint16_t color) {
    TFT_DrawFillRect(0, TFT_ConsoleRow, TFT_GetWidth(), 40, _TFT_COLOR_BLACK);
    TFT_DrawString(2, TFT_ConsoleRow + 2, str, color, _TFT_COLOR_BLACK, 1);
    TFT_ConsoleRow += 10;
    if(TFT_ConsoleRow > TFT_GetHeight() - 12) TFT_ConsoleRow = 0;
}