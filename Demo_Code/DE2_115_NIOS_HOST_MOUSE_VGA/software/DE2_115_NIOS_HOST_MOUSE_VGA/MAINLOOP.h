
#ifndef __MAINLOOP_H__
#define __MAINLOOP_H__

#include "BasicTyp.h"

//***************************************************************************
#define DMA_IDLE		0
#define DMA_RUNNING	1
#define DMA_PENDING	2
#define DMA_IN_DONE	3
// **************************************************************************
#define DMA_BUFFER_SIZE		65536

   //*************************************************************************
   // Function Prototypes
   //*************************************************************************
void SetupToken_Handler(void);
void DeviceRequest_Handler(void);
void help_devreq(UCHAR type, UCHAR req);
void disconnect_USB(void);
void connect_USB(void);
void reconnect_USB(void);
void config_endpoint(void);
void suspend_change(void);
void ML_AcknowledgeSETUP(void);
void ML_StallEP0(void);
void ML_Reserved(void);

unsigned short CHECK_CHIP_ID(void);


#endif

