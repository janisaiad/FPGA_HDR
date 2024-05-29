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
// Last Compile Tools: NIOS II 9.1 SP2(Build 350)
/* Revision 2.0
 *  change the background picture,Add screen clear
 * 
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <io.h>
#include <fcntl.h>

#include "system.h"
#include "VGA.h"
#include "basic_io.h"
#include "LCD.h"

#include "Test.h"
#include "sys/alt_irq.h"
#include "HAL4D13.h"

#include "isa290.h"
#include "reg.h"
#include "buf_man.h"
#include "port.h"
#include "usb.h"
#include "ptd.h"
#include "cheeyu.h"
#include "mouse.h"
#include "ISP1362_HAL.h"

unsigned int		hc_data;
unsigned int		hc_com;
unsigned int		dc_data;
unsigned int		dc_com;

//----------clear screen----------------
void Vga_clear_screen(base)
{
    alt_u16 x_col,y_col;
    for(y_col=0;y_col<VGA_HEIGHT;y_col++)
      {
        for(x_col=0;x_col<VGA_WIDTH;x_col++)
        {
            Vga_Clr_Pixel(base,x_col,y_col);
        }
      }
}
//--------------------------------------

int main(void)
{
  VGA_Ctrl_Reg vga_ctrl_set;
  
  vga_ctrl_set.VGA_Ctrl_Flags.RED_ON    = 1;
  vga_ctrl_set.VGA_Ctrl_Flags.GREEN_ON  = 1;
  vga_ctrl_set.VGA_Ctrl_Flags.BLUE_ON   = 1;
  vga_ctrl_set.VGA_Ctrl_Flags.CURSOR_ON = 1;
  
  Vga_Write_Ctrl(VPG_BASE, vga_ctrl_set.Value);
  Vga_clear_screen(VPG_BASE); //clear the screen
  Set_Pixel_On_Color(512,512,512);  
  Set_Pixel_Off_Color(0,0,0);
  Set_Cursor_Color(0,1023,0);
  LCD_Test();

  w16(HcReset,0x00F6);//reset      
  reset_usb();//config  
  mouse();
  return 0;
}

