
#ifndef __D13BUS_H__
#define __D13BUS_H__

#include "BasicTyp.h"
#include "common.h"

// ************************************************************************
// USB Vendor device requests
// ************************************************************************

void D13Bus_ControlEntry(void);
void reserved(void);
void read_write_register(void);
void get_firmware_version(void);
void setup_dma_request(void);

//*************************************************************************
// D13Bus support functions
//*************************************************************************
void D13Bus_StallEP0(void);
void D13Bus_SingleTransmitEP0(UCHAR * buf, UCHAR len);
void D13Bus_BurstTransmitEP0(UCHAR  * pData, USHORT len);

#endif

