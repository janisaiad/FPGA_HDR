
#include <stdio.h>
#include <string.h>
#include "BasicTyp.h"
#include "USB.h"
#include "Hal4D13.h"
#include "Chap_9.h"
#include "D13bus.h"
#include "usb_irq.h"
#include "mainloop.h"


// ***************************************************************************

#define SETUP_DMA_REQUEST 		0x0471
#define GET_FIRMWARE_VERSION    0x0472

#define idata
extern IO_REQUEST idata ioRequest;

// ****************************************************************************


// *************************************************************************
// Public Data
// *************************************************************************

extern CONTROL_XFER ControlData;
extern D13FLAGS bD13flags;

// *************************************************************************
// Subroutines
// *************************************************************************

void D13Bus_ControlEntry(void)
{
	// No support now, just stall it.
	D13Bus_StallEP0();
}

void reserved(void)
{
	// Undefined commands, stall them
	D13Bus_StallEP0();
}

void read_write_register(void)
{
	unsigned char i;

	if(ControlData.DeviceRequest.bmRequestType & (unsigned char)USB_ENDPOINT_DIRECTION_MASK)
	{
		if(bD13flags.bits.verbose)
		{
			printf("Read Registers: Offset = 0x%x, Length = 0x%x, Index = 0x%x.\n",
				ControlData.DeviceRequest.wValue,
				ControlData.DeviceRequest.wLength,
				ControlData.DeviceRequest.wIndex);
		}

		if(ControlData.DeviceRequest.wIndex == GET_FIRMWARE_VERSION &&
			ControlData.DeviceRequest.wValue == 0 &&
			ControlData.DeviceRequest.wLength == 1)
			{
				get_firmware_version();
			}
		else
		{
			Chap9_StallEP0();
			printf("stall: get firmware version\n");
		}

	}
	else
	{
		if(bD13flags.bits.verbose)
		{

			printf("Write Registers: Offset = 0x%x, Length = 0x%x, Index = 0x%x.\n",
				ControlData.DeviceRequest.wValue,
				ControlData.DeviceRequest.wLength,
				ControlData.DeviceRequest.wIndex);

			printf("Data: ");
			for(i = 0; i < ControlData.DeviceRequest.wLength; i ++)
				printf("0x%x, ", *((ControlData.dataBuffer)+i));
			printf("\n");
		}

		if(ControlData.DeviceRequest.wIndex == SETUP_DMA_REQUEST &&
			ControlData.DeviceRequest.wValue == 0 &&
			ControlData.DeviceRequest.wLength == 6)
			{
				RaiseIRQL();
				setup_dma_request();
				LowerIRQL();
			}

	}
}

void setup_dma_request()
{
	memcpy((unsigned char *)&ioRequest + ControlData.DeviceRequest.wValue,
		ControlData.dataBuffer,
		ControlData.DeviceRequest.wLength);

	ioRequest.uSize = SWAP(ioRequest.uSize);
	ioRequest.uAddressL = SWAP(ioRequest.uAddressL);
	printf("Setup Data: addL, addH, uSize =%x, %x, %x \n", \
				ioRequest.uAddressL, ioRequest.bAddressH, ioRequest.uSize);

	if(ioRequest.uSize > DMA_BUFFER_SIZE) // Unaccepted request
	{
		Chap9_StallEP0();
		printf("stall: ioRequest.uSize > DMA_BUFFER_SIZE.\n");
	}
	else
	{
		RaiseIRQL();
		bD13flags.bits.setup_dma = 1;
		LowerIRQL();
	}
}

void get_firmware_version()
{
	unsigned char i;

	i = 0x01; 
	D13Bus_SingleTransmitEP0(&i, 1);
}

// *************************************************************************
// D13Bus support functions
// *************************************************************************

void D13Bus_StallEP0(void)
{
	Chap9_StallEP0();
}

void D13Bus_SingleTransmitEP0(UCHAR * buf, UCHAR len)
{
	Hal4D13_SingleTransmitEP0(buf, len);

	RaiseIRQL();
	if(!ControlData.Abort)
    {
		ControlData.wLength = ControlData.wCount = len;
        bD13flags.bits.DCP_state = USBFSM4DCP_HANDSHAKE;
	}
	LowerIRQL();

}

void D13Bus_BurstTransmitEP0(UCHAR * pData, USHORT len)
{
	ControlData.wCount = 0;
	if(ControlData.wLength > len)
		ControlData.wLength = len;

	ControlData.Addr.pData = pData;
	if( ControlData.wLength >= EP0_PACKET_SIZE)
	{
		Hal4D13_WriteEndpoint(EPINDEX4EP0_CONTROL_IN, ControlData.Addr.pData, EP0_PACKET_SIZE);
		RaiseIRQL();
		if(!ControlData.Abort)
		{
			ControlData.wCount += EP0_PACKET_SIZE;
			bD13flags.bits.DCP_state = USBFSM4DCP_DATAIN;
		}

		LowerIRQL();

	}
	else
	{
		Hal4D13_WriteEndpoint(EPINDEX4EP0_CONTROL_IN, pData, ControlData.wLength);
		RaiseIRQL();
		if(!ControlData.Abort)
		{
			ControlData.wCount += ControlData.wLength;
			bD13flags.bits.DCP_state = USBFSM4DCP_DATAIN;
		}
		LowerIRQL();
	}
}
