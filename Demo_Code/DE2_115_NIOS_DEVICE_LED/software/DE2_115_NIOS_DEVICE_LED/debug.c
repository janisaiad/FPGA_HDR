#include <stdio.h> 
#include <stdarg.h> 
//#include "my_includes.h"
#include "debug.h"
#include <stdio.h>
#include <stdlib.h> // malloc, free
#include <string.h>
#include <stddef.h>
#include <unistd.h>  // usleep (unix standard?)
#include "sys/alt_flash.h"
#include "sys/alt_flash_types.h"
#include "io.h"
#include "alt_types.h"  // alt_u32
#include "altera_avalon_pio_regs.h" //IOWR_ALTERA_AVALON_PIO_DATA
#include "sys/alt_irq.h"  // interrupt
#include "sys/alt_alarm.h" // time tick function (alt_nticks(), alt_ticks_per_second())
#include "sys/alt_timestamp.h" 
#include "sys/alt_stdio.h"
#include "system.h"
#include <fcntl.h>




#ifdef ENABLE_UART_DEBUG
#include "uart.h"

void debug_output(char *pMessage){
    if (!UART_IsOpened())
        UART_Open();
    UART_WriteString(pMessage);  // UART debug
}

#else

void debug_output(char *pMessage){
    
    printf(pMessage);
}

#endif





int myprintf(char *format, ...){
    int rc;
    char szText[512];
    
    va_list paramList;
    va_start(paramList, format);
    rc = vsnprintf(szText, 512, format, paramList);
    va_end(paramList);
    
    debug_output(szText);

    return rc;    
}


int myprintf_hexarray(unsigned char *pHex, int len){
    int i;
    unsigned char szText[16];
    for(i=0;i<len;i++){
        sprintf(szText, "[%02X]", *(pHex+i));
        DEBUG((szText));
    }
    return len;
}

int  myprintf_dwordarray(unsigned int *pArray, int nElementCount){
    int i;
    char szText[16];
    for(i=0;i<nElementCount;i++){
        sprintf(szText, "[%08X]", *(pArray+i));
        DEBUG((szText));
    }
    return nElementCount;
}
