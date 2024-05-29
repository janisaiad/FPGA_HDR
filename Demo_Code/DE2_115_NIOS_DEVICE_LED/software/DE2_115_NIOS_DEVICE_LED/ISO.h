
#ifndef __ISO_H__
#define __ISO_H__

// *************************************************************************
// USB vendor device requests
// *************************************************************************

#define ISO_IN  	0x01
#define ISO_OUT		0x02
#define ISO_LOOP	0x04


void EnableIsoMode(void);
void Wait4Ns( unsigned long timeNs);
USHORT ISOLOOP(UCHAR bINEPIndex, UCHAR bOUTEPIndex, USHORT len);
USHORT Hal4D13_ReadISOEndpoint(UCHAR bEPIndex, USHORT ISOBuffer[512], USHORT len);
USHORT Hal4D13_WriteISOEndpoint(UCHAR bEPIndex, USHORT ISOBuffer[512], USHORT len);

void EnableISOMode_DMA(void);

#endif
