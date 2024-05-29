
#ifndef __CHAP_9_H__
#define __CHAP_9_H__


// *************************************************************************
// basic #defines
// *************************************************************************

#define MAX_ENDPOINTS                             0x0F

#define USB_CLASS_CODE_UNKNOWN                    0x00
#define USB_SUBCLASS_CODE_UNKNOWN		              0x00
#define USB_PROTOCOL_CODE_UNKNOWN							    0x00

#define USB_CLASS_CODE_MASSSTORAGE_CLASS_DEVICE   0x08

#define USB_SUBCLASS_CODE_RBC			                0x01
#define USB_SUBCLASS_CODE_SFF8020I			          0x02
#define USB_SUBCLASS_CODE_QIC157			            0x03
#define USB_SUBCLASS_CODE_UFI			                0x04
#define USB_SUBCLASS_CODE_SFF8070I			          0x05
#define USB_SUBCLASS_CODE_SCSI			              0x06

#define USB_PROTOCOL_CODE_CBI0								    0x00
#define USB_PROTOCOL_CODE_CBI1								    0x01
#define USB_PROTOCOL_CODE_BULK								    0x50

   // *************************************************************************
   // masks
   // *************************************************************************


#define USB_RECIPIENT            (UCHAR)0x1F
#define USB_RECIPIENT_DEVICE     (UCHAR)0x00
#define USB_RECIPIENT_INTERFACE  (UCHAR)0x01
#define USB_RECIPIENT_ENDPOINT   (UCHAR)0x02

#define USB_REQUEST_DIR_MASK     (UCHAR)0x80

#define USB_REQUEST_TYPE_MASK    (UCHAR)0x60
#define USB_STANDARD_REQUEST     (UCHAR)0x00
#define USB_CLASS_REQUEST        (UCHAR)0x20
#define USB_VENDOR_REQUEST       (UCHAR)0x40

#define USB_REQUEST_MASK         (UCHAR)0xFF

#define DEVICE_ADDRESS_MASK      0x7F

/* GetStatus */
#define DEVSTS_SELFPOWERED       0x01
#define DEVSTS_REMOTEWAKEUP      0x02

#define ENDPSTS_HALT             0x01

   // *************************************************************************
   // USB Protocol Layer
   // *************************************************************************

typedef struct _USB_STRING_LANGUAGE_DESCRIPTOR 
{
	UCHAR  bLengthL;
	UCHAR  bDescriptorTypeL;
	UCHAR ulanguageIDL;
	UCHAR ulanguageIDH;
} USB_STRING_LANGUAGE_DESCRIPTOR,*PUSB_STRING_LANGUAGE_DESCRIPTOR;

typedef struct _USB_STRING_INTERFACE_DESCRIPTOR 
{
	UCHAR  bLength;
	UCHAR  bDescriptorType;
	UCHAR  Interface[22];
} USB_STRING_INTERFACE_DESCRIPTOR,*PUSB_STRING_INTERFACE_DESCRIPTOR;

typedef struct _USB_STRING_CONFIGURATION_DESCRIPTOR 
{
	UCHAR  bLength;
	UCHAR  bDescriptorType;
	UCHAR  Configuration[16];
} USB_STRING_CONFIGURATION_DESCRIPTOR,*PUSB_STRING_CONFIGURATION_DESCRIPTOR;

typedef struct _USB_STRING_SERIALNUMBER_DESCRIPTOR 
{
	UCHAR  bLength;
	UCHAR  bDescriptorType;
	UCHAR  SerialNum[24];
} USB_STRING_SERIALNUMBER_DESCRIPTOR,*PUSB_STRING_SERIALNUMBER_DESCRIPTOR;

typedef struct _USB_STRING_PRODUCT_DESCRIPTOR 
{
	UCHAR  bLength;
	UCHAR  bDescriptorType;
	UCHAR  Product[64];
} USB_STRING_PRODUCT_DESCRIPTOR,*PUSB_STRING_PRODUCT_DESCRIPTOR;

typedef struct _USB_STRING_MANUFACTURER_DESCRIPTOR 
{
	UCHAR  bLength;
	UCHAR  bDescriptorType;
	UCHAR  Manufacturer[54];
} USB_STRING_MANUFACTURER_DESCRIPTOR,*PUSB_STRING_MANUFACTURER_DESCRIPTOR;

   // *************************************************************************
   // USB standard device requests
   // *************************************************************************

void Chap9_GetStatus(void);
void Chap9_ClearFeature(void);
void Chap9_SetFeature(void);
void Chap9_SetAddress(void);
void Chap9_GetDescriptor(void);
void Chap9_GetConfiguration(void);
void Chap9_SetConfiguration(void);
void Chap9_GetInterface(void);
void Chap9_SetInterface(void);

   // *************************************************************************
   // Chap9 support functions
   // *************************************************************************

void Chap9_StallEP0(void);
void Chap9_StallEP0InControlWrite(void);
void Chap9_StallEP0InControlRead(void);
void Chap9_SingleTransmitEP0(UCHAR * buf, USHORT len);
void Chap9_BurstTransmitEP0(UCHAR * pData, USHORT len);
#endif
