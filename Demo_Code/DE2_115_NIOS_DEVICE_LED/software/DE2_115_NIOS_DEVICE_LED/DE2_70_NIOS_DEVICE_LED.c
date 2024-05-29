// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions: It can realize a led controller through the USB slave 
//                  interface, then you can light on or off the leds on the
//                  board through a windows appliacation.
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Peli Li           :| 03/25/2010:| Initial Revision
// --------------------------------------------------------------------

#include "system.h"
#include "basic_io.h"
#include "LCD.h"
#include "sys/alt_irq.h"

//  for USB
#include "BASICTYP.h"
#include "COMMON.h"
#include "ISR.h"
#include "USB.h"
#include "MAINLOOP.h"

#include "ISP1362_HAL.h"
#include "SEG7.h"

#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

//-------------------------------------------------------------------------
//  Global Variable
D13FLAGS bD13flags;
USBCHECK_DEVICE_STATES bUSBCheck_Device_State;
CONTROL_XFER ControlData;
IO_REQUEST idata ioRequest;
//-------------------------------------------------------------------------
int main(void)
{
    LCD_Test();
    disable();
    disconnect_USB();
    usleep(1000000);
    Hal4D13_ResetDevice();
    bUSBCheck_Device_State.State_bits.DEVICE_DEFAULT_STATE = 1;
    bUSBCheck_Device_State.State_bits.DEVICE_ADDRESS_STATE = 0;
    bUSBCheck_Device_State.State_bits.DEVICE_CONFIGURATION_STATE = 0;
    bUSBCheck_Device_State.State_bits.RESET_BITS = 0;  
    usleep(1000000);
    reconnect_USB(); 
    CHECK_CHIP_ID();
    Hal4D13_AcquireD13(USB_DC_IRQ,(void*)usb_isr);
    enable();
    bD13flags.bits.verbose=1;
    
    while (1)
    {
      if (bUSBCheck_Device_State.State_bits.RESET_BITS == 1)
      {
        disable();
        break;  
      }
      if (bD13flags.bits.suspend)
      {
        disable();
        bD13flags.bits.suspend= 0;
        enable();
        suspend_change();    
      } // Suspend Change Handler
      if (bD13flags.bits.DCP_state == USBFSM4DCP_SETUPPROC)
      {
        disable();
        SetupToken_Handler();
        enable();
      } // Setup Token Handler 
      if ((bD13flags.bits.DCP_state == USBFSM4DCP_REQUESTPROC) && !ControlData.Abort)
      {
        disable();
        bD13flags.bits.DCP_state = 0x00;
        DeviceRequest_Handler();
        enable();
      } // Device Request Handler
      usleep(1);
    }
  return  0;
}

