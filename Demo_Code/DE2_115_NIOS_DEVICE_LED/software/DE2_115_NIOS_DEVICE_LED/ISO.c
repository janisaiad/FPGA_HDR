#include "isp1362_includes.h"

extern D13FLAGS bD13flags;
extern CONTROL_XFER ControlData;
extern IO_REQUEST idata ioRequest;

unsigned char IsoDisable =1;
unsigned char IsoMode = 0; //ISO_IN:01|ISO_OUT:02;
unsigned short IsoOutPattern=0xF0;
unsigned short IsoOutPktLen=0;
unsigned short IsoOutDataBuff[ISO_FIFOSIZE_512];
unsigned short IsoInPattern=0xF8;
unsigned short IsoInPktLen=0;
unsigned short IsoInDataBuff[ISO_FIFOSIZE_512];

void EnableIsoMode()
{
	IsoMode = 0;
	if( ControlData.DeviceRequest.wLength == 0)
	{
		IsoMode &= ~ControlData.DeviceRequest.wIndex;
		IsoMode |= ControlData.DeviceRequest.wValue;

		printf("IsoMode %x\n",IsoMode );

		if(IsoMode&ISO_LOOP)
		{

		   RaiseIRQL();
		   bD13flags.bits.ISO_state = ISO_LOOP;
		   LowerIRQL();

		   IsoDisable =0;
		   IsoInPattern = 0;
		   IsoInPktLen = ISO_FIFOSIZE_512;
		   IsoOutPattern = 0;
		   IsoOutPktLen = ISO_FIFOSIZE_512;

		}
		else
		{

			 if(IsoMode&ISO_OUT)
			 {

			   RaiseIRQL();
			   bD13flags.bits.ISO_state = ISO_OUT;
			   LowerIRQL();

			   IsoDisable =0;
			   IsoOutPattern = 0;
			   IsoOutPktLen = ISO_FIFOSIZE_512;
			   printf("Iso-Out Pattern %x, PktLen %u bytes\n",IsoInPattern,IsoOutPktLen);

			 }
			 if(IsoMode&ISO_IN)
			 {
				bD13flags.bits.ISO_state = ISO_IN;

			   IsoDisable =0;
			   IsoInPattern = 0;
			   IsoInPktLen = ISO_FIFOSIZE_512;

				//IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_VALID_BUF+EPINDEX4EP06);
                USB_DC_CMD_WRITE(D13CMD_EP_VALID_BUF+EPINDEX4EP06);
				printf("Iso-IN  Pattern %x, PktLen %u bytes\n",IsoInPattern,IsoInPktLen);
			 }

		}

		Chap9_SingleTransmitEP0(0, 0);
	}
	else
	{
		Chap9_StallEP0();
	}
}


void Wait4Ns( unsigned long timeNs)
{
	usleep(timeNs);
}

USHORT ISOLOOP(UCHAR bOUTEPIndex, UCHAR bINEPIndex, USHORT len)
{
	USHORT	ISOBuffer[512];
	UCHAR	ep_last;
	USHORT	j=0;

	ep_last = (UCHAR)Hal4D13_GetEndpointStatusWInteruptClear(bOUTEPIndex);
	if(ep_last & 0x60)
	{
		j = Hal4D13_ReadISOEndpoint(bOUTEPIndex, ISOBuffer, len);
		Hal4D13_WriteISOEndpoint(bINEPIndex, ISOBuffer, j);
	}

	return j;
}

USHORT Hal4D13_ReadISOEndpoint(UCHAR bEPIndex, USHORT ISOBuffer[512], USHORT len)
{
	USHORT i, j;

	//IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_RD_FIFO + bEPIndex);
    USB_DC_CMD_WRITE(D13CMD_EP_RD_FIFO + bEPIndex);

//	j = IORD(ISP1362_BASE,D13_DATA_PORT);
    j = USB_DC_DATA_READ();

	if(j != len)
		j = len;

	for(i=0; i<j; i++)
	{
//		ISOBuffer[i] = IORD(ISP1362_BASE,D13_DATA_PORT);
        ISOBuffer[i] = USB_DC_DATA_READ();

	}

	/* Clear Buffer */
//	IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_CLEAR_BUF+bEPIndex);
    USB_DC_CMD_WRITE(D13CMD_EP_CLEAR_BUF+bEPIndex);

	return j;
}

USHORT Hal4D13_WriteISOEndpoint(UCHAR bEPIndex, USHORT ISOBuffer[512], USHORT len)
{
	USHORT i;

	if(bD13flags.bits.At_IRQL1 == 0)
		RaiseIRQL();

	//IOWR(ISP1362_BASE,D13_COMMAND_PORT, D13CMD_EP_WR_FIFO + bEPIndex);
    USB_DC_CMD_WRITE(D13CMD_EP_WR_FIFO + bEPIndex);

	//IOWR(ISP1362_BASE,D13_DATA_PORT, 512);
    USB_DC_DATA_WRITE(512);

	/* Write Buffer */

	for(i=0; i<len; i++)
	{
		//IOWR(ISP1362_BASE,D13_DATA_PORT, ISOBuffer[i]);
        USB_DC_DATA_WRITE(ISOBuffer[i]);
	}



	if(bD13flags.bits.At_IRQL1 == 0)
		LowerIRQL();

	return i;
}


