#ifndef   __USB_H__
#define   __USB_H__

#include "common.h"

#define MAXIMUM_USB_STRING_LENGTH 255

// values for the bits returned by the USB GET_STATUS command
#define USB_GETSTATUS_SELF_POWERED                0x01
#define USB_GETSTATUS_REMOTE_WAKEUP_ENABLED       0x02


#define USB_DEVICE_DESCRIPTOR_TYPE                0x01
#define USB_CONFIGURATION_DESCRIPTOR_TYPE         0x02
#define USB_STRING_DESCRIPTOR_TYPE                0x03
#define USB_INTERFACE_DESCRIPTOR_TYPE             0x04
#define USB_ENDPOINT_DESCRIPTOR_TYPE              0x05
#define USB_POWER_DESCRIPTOR_TYPE                 0x06

#define STR_INDEX_LANGUAGE						  0x00
#define STR_INDEX_MANUFACTURER					  0x01
#define STR_INDEX_PRODUCT						  0x02
#define STR_INDEX_SERIALNUMBER					  0x03
#define STR_INDEX_CONFIGURATION					  0x04
#define STR_INDEX_INTERFACE						  0x05

#define USB_DESCRIPTOR_MAKE_TYPE_AND_INDEX(d, i) ((USHORT)((USHORT)d<<8 | i))

//
// Values for bmAttributes field of an
// endpoint descriptor
//

#define USB_ENDPOINT_TYPE_MASK                    0x03

#define USB_ENDPOINT_TYPE_CONTROL                 0x00
#define USB_ENDPOINT_TYPE_ISOCHRONOUS             0x01
#define USB_ENDPOINT_TYPE_BULK                    0x02
#define USB_ENDPOINT_TYPE_INTERRUPT               0x03


//
// definitions for bits in the bmAttributes field of a
// configuration descriptor.
//
#define USB_CONFIG_POWERED_MASK                   0xc0

#define USB_CONFIG_BUS_POWERED                    0x80
#define USB_CONFIG_SELF_POWERED                   0x40
#define USB_CONFIG_REMOTE_WAKEUP                  0x20

//
// Endpoint direction bit, stored in address
//

#define USB_ENDPOINT_DIRECTION_MASK               0x80


//
// USB defined request codes
// see chapter 9 of the USB 1.0 specifcation for
// more information.
//

#define USB_REQUEST_GET_STATUS                    0x00
#define USB_REQUEST_CLEAR_FEATURE                 0x01

#define USB_REQUEST_SET_FEATURE                   0x03

#define USB_REQUEST_SET_ADDRESS                   0x05
#define USB_REQUEST_GET_DESCRIPTOR                0x06
#define USB_REQUEST_SET_DESCRIPTOR                0x07
#define USB_REQUEST_GET_CONFIGURATION             0x08
#define USB_REQUEST_SET_CONFIGURATION             0x09
#define USB_REQUEST_GET_INTERFACE                 0x0A
#define USB_REQUEST_SET_INTERFACE                 0x0B
#define USB_REQUEST_SYNC_FRAME                    0x0C


//
// defined USB device classes
//


#define USB_DEVICE_CLASS_RESERVED           0x00
#define USB_DEVICE_CLASS_AUDIO              0x01
#define USB_DEVICE_CLASS_COMMUNICATIONS     0x02
#define USB_DEVICE_CLASS_HUMAN_INTERFACE    0x03
#define USB_DEVICE_CLASS_MONITOR            0x04
#define USB_DEVICE_CLASS_PHYSICAL_INTERFACE 0x05
#define USB_DEVICE_CLASS_POWER              0x06
#define USB_DEVICE_CLASS_PRINTER            0x07
#define USB_DEVICE_CLASS_STORAGE            0x08
#define USB_DEVICE_CLASS_HUB                0x09
#define USB_DEVICE_CLASS_VENDOR_SPECIFIC    0xFF

//
// USB defined Feature selectors
//

#define USB_FEATURE_ENDPOINT_STALL          0x0000
#define USB_FEATURE_REMOTE_WAKEUP           0x0001
#define USB_FEATURE_POWER_D0                0x0002
#define USB_FEATURE_POWER_D1                0x0003
#define USB_FEATURE_POWER_D2                0x0004
#define USB_FEATURE_POWER_D3                0x0005

typedef struct _USB_DEVICE_DESCRIPTOR {
    UCHAR bLength;
	  UCHAR bDescriptorType;
    UCHAR bcdUSB_L;
    UCHAR bcdUSB_H;
    UCHAR bDeviceClass;
    UCHAR bDeviceSubClass;
    UCHAR bDeviceProtocol;
    UCHAR bMaxPacketSize0;
    UCHAR idVendor_L;
    UCHAR idVendor_H; 
    UCHAR idProduct_L;       
    UCHAR idProduct_H;
    UCHAR bcdDevice_L;
    UCHAR bcdDevice_H;
    
    UCHAR iManufacturer;
    UCHAR iProduct;
    UCHAR iSerialNumber;
    UCHAR bNumConfigurations;
} USB_DEVICE_DESCRIPTOR, *PUSB_DEVICE_DESCRIPTOR;

//
// values for bmAttributes Field in
// USB_CONFIGURATION_DESCRIPTOR
//

#define BUS_POWERED                           0x80
#define SELF_POWERED                          0x40
#define REMOTE_WAKEUP                         0x20


typedef struct _USB_CONFIGURATION_DESCRIPTOR_a {
    UCHAR bLength_C;//9
    UCHAR bDescriptorType_C;
    UCHAR wTotalLength_C_L;
    UCHAR  wTotalLength_C_H;
    UCHAR bNumInterfaces_C;
    UCHAR bConfigurationValue_C;
    UCHAR iConfiguration_C;
    UCHAR bmAttributes_C;
    UCHAR MaxPower_C;

//typedef struct _USB_INTERFACE_DESCRIPTOR {_0
    UCHAR bLength_I0;//9
    UCHAR bDescriptorType_I0;
    UCHAR bInterfaceNumber_I0;
    UCHAR bAlternateSetting_I0;
    UCHAR bNumEndpoints_I0;
    UCHAR bInterfaceClass_I0;
    UCHAR bInterfaceSubClass_I0;
    UCHAR bInterfaceProtocol_I0;
    UCHAR iInterface_I0;

/*
//typedef struct _USB_INTERFACE_DESCRIPTOR {_1
    UCHAR bLength_I1;//9
    UCHAR bDescriptorType_I1;
    UCHAR bInterfaceNumber_I1;
    UCHAR bAlternateSetting_I1;
    UCHAR bNumEndpoints_I1;
    UCHAR bInterfaceClass_I1;
    UCHAR bInterfaceSubClass_I1;
    UCHAR bInterfaceProtocol_I1;
    UCHAR iInterface_I1;
*/
//typedef struct _USB_ENDPOINT_DESCRIPTOR {_P1
    UCHAR bLength_P1;//7
    UCHAR bDescriptorType_P1;
    UCHAR bEndpointAddress_P1;
    UCHAR bmAttributes_P1;
    UCHAR wMaxPacketSize_P1_L;
    UCHAR wMaxPacketSize_P1_H;
    UCHAR bInterval_P1;

//typedef struct _USB_ENDPOINT_DESCRIPTOR {_P2

    UCHAR bLength_P2;//7
    UCHAR bDescriptorType_P2;
    UCHAR bEndpointAddress_P2;
    UCHAR bmAttributes_P2;
    UCHAR wMaxPacketSize_P2_L;
    UCHAR wMaxPacketSize_P2_H;
    UCHAR bInterval_P2;
    

//typedef struct _USB_ENDPOINT_DESCRIPTOR {_P3
    UCHAR bLength_P3;//7
    UCHAR bDescriptorType_P3;
    UCHAR bEndpointAddress_P3;
    UCHAR bmAttributes_P3;
    UCHAR wMaxPacketSize_P3_L;
    UCHAR wMaxPacketSize_P3_H;
    UCHAR bInterval_P3;

//typedef struct _USB_ENDPOINT_DESCRIPTOR {_P4
    UCHAR bLength_P4;//7
    UCHAR bDescriptorType_P4;
    UCHAR bEndpointAddress_P4;
    UCHAR bmAttributes_P4;
    UCHAR wMaxPacketSize_P4_L;
    UCHAR wMaxPacketSize_P4_H;
    UCHAR bInterval_P4;
  
} USB_CONFIGURATION_DESCRIPTOR_a, *PUSB_CONFIGURATION_DESCRIPTOR_a;

typedef struct _USB_CONFIGURATION_DESCRIPTOR {
//CONF// 9
    unsigned char bLength1;
    unsigned char bDescriptorType1;
//    USHORT wTotalLength1;
    unsigned int bTotalLength1;
   
    unsigned char bNumInterfaces1;
    unsigned char bConfigurationValue1;
    unsigned char iConfiguration1;
    unsigned char bmAttributes1;
    unsigned char MaxPower1;
//INFACE 9
    unsigned char bLength2;
    unsigned char bDescriptorType2;
    unsigned char bInterfaceNumber2;
    unsigned char bAlternateSetting2;
    unsigned char bNumEndpoints2;
    unsigned char bInterfaceClass2;
    unsigned char bInterfaceSubClass2;
    unsigned char bInterfaceProtocol2;
    unsigned char iInterface2;
//HIT  9
	 // unsigned char bLengthH;
  //  unsigned char bDescriptorTypeH;
  //  unsigned int bcdHIDH;
  //  unsigned char bCountryCodeH;
  //  unsigned char bNumDescriptorsH;
  //  unsigned char bReportDescriptorTypeH;
  //  unsigned int wItemLengthH;
//P0   /7
    unsigned char bLength3;
    unsigned char bDescriptorType3;
    unsigned char bEndpointAddress3;
    unsigned char bmAttributes3;
    unsigned int  wMaxPacketSize3;
    unsigned char bInterval3;

//P1
    unsigned char bLength4;
    unsigned char bDescriptorType4;
    unsigned char bEndpointAddress4;
    unsigned char bmAttributes4;
    unsigned int wMaxPacketSize4;
    unsigned char bInterval4;

//P2
    unsigned char bLength5;
    unsigned char bDescriptorType5;
    unsigned char bEndpointAddress5;
    unsigned char bmAttributes5;
    unsigned int wMaxPacketSize5;
    unsigned char bInterval5;

//P3
    unsigned char bLength6;
    unsigned char bDescriptorType6;
    unsigned char bEndpointAddress6;
    unsigned char bmAttributes6;
    unsigned int wMaxPacketSize6;
    unsigned char bInterval6;

} USB_CONFIGURATION_DESCRIPTOR, *PUSB_CONFIGURATION_DESCRIPTOR;



typedef struct _USB_INTERFACE_DESCRIPTOR {
    UCHAR bLength;
    UCHAR bDescriptorType;
    UCHAR bInterfaceNumber;
    UCHAR bAlternateSetting;
    UCHAR bNumEndpoints;
    UCHAR bInterfaceClass;
    UCHAR bInterfaceSubClass;
    UCHAR bInterfaceProtocol;
    UCHAR iInterface;
} USB_INTERFACE_DESCRIPTOR, *PUSB_INTERFACE_DESCRIPTOR;

typedef struct _USB_ENDPOINT_DESCRIPTOR {
    UCHAR bLength;
    UCHAR bDescriptorType;
    UCHAR bEndpointAddress;
    UCHAR bmAttributes;
    USHORT wMaxPacketSize;
    UCHAR bInterval;
} USB_ENDPOINT_DESCRIPTOR, *PUSB_ENDPOINT_DESCRIPTOR;


//typedef struct _USB_STRING_LANGUAGE_DESCRIPTOR {
//	UCHAR   bLengthL;/
//	UCHAR   bDescriptorTypeL;
//	UCHAR   ulanguageID_LL;
//	UCHAR   ulanguageID_HL;
//} USB_STRING_LANGUAGE_DESCRIPTOR,*PUSB_STRING_LANGUAGE_DESCRIPTOR;



typedef struct _USB_STRING_DESCRIPTOR {
    UCHAR bLength;
    UCHAR bDescriptorType;
    UCHAR bString[1];
} USB_STRING_DESCRIPTOR, *PUSB_STRING_DESCRIPTOR;

//
// USB power descriptor added to core specification
//

#define USB_SUPPORT_D0_COMMAND      0x01
#define USB_SUPPORT_D1_COMMAND      0x02
#define USB_SUPPORT_D2_COMMAND      0x04
#define USB_SUPPORT_D3_COMMAND      0x08

#define USB_SUPPORT_D1_WAKEUP       0x10
#define USB_SUPPORT_D2_WAKEUP       0x20




typedef struct _USB_POWER_DESCRIPTOR {
    UCHAR bLength;
    UCHAR bDescriptorType;
    UCHAR bCapabilitiesFlags;
    USHORT EventNotification;
    USHORT D1LatencyTime;
    USHORT D2LatencyTime;
    USHORT D3LatencyTime;
    UCHAR PowerUnit;
    USHORT D0PowerConsumption;
    USHORT D1PowerConsumption;
    USHORT D2PowerConsumption;
} USB_POWER_DESCRIPTOR, *PUSB_POWER_DESCRIPTOR;


typedef struct _USB_COMMON_DESCRIPTOR {
    UCHAR bLength;
    UCHAR bDescriptorType;
} USB_COMMON_DESCRIPTOR, *PUSB_COMMON_DESCRIPTOR;


//
// Standard USB HUB definitions
//
// See Chapter 11
//

typedef struct _USB_HUB_DESCRIPTOR {
    UCHAR        bDescriptorLength;      // Length of this descriptor
    UCHAR        bDescriptorType;        // Hub configuration type
    UCHAR        bNumberOfPorts;         // number of ports on this hub
    USHORT       wHubCharacteristics;    // Hub Charateristics
    UCHAR        bPowerOnToPowerGood;    // port power on till power good in 2ms
    UCHAR        bHubControlCurrent;     // max current in mA
    //
    // room for 255 ports power control and removable bitmask
    UCHAR        bRemoveAndPowerMask[64];
} USB_HUB_DESCRIPTOR, *PUSB_HUB_DESCRIPTOR;


#endif
