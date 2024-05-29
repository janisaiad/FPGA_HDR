
#include "isa290.h"
#include "reg.h"
#include "cheeyu.h"
#include "BASICTYP.h"
#include "HAL4D13.h"

void enable_port(void)
{
 unsigned long dat32;

 w32(HcRhP1,0x00000102);
 w32(HcRhP2,0x00000102);
 w32(HcRhStatus,0x00010000);	//set Global Power

 w32(HcRhA,0x20000102);
 w32(HcRhB,0x00000000);

 dat32=r32(HcRhP2);
 if((dat32&0x00000001)==1)
 {
  set_port_speed(2,0);
  if(((dat32)&(0x00000200))!=0)
  {
   set_port_speed(2,1);
  }
 }

 dat32=r32(HcRhP1);
 if((dat32&0x00000001)==1)
 {
  set_port_speed(1,0);
  if(((dat32)&(0x00000200))!=0)
  {
   set_port_speed(1,1);
  }
 }
}

void reset_usb(void)
{
//if (g_is_PCI == TRUE)		
 w16(HcHWCfg		, 0x302d	);	// set INT1 to Active LOW, Level Triggered
//else						w16(HcHWCfg		, 0x342D	);
 w32(HcFmItv  		, 0x25002EDF);
 w32(HcControl		, 0x00000600);
}

void set_operational(void)
{
//if (g_is_PCI == TRUE)	
 w16(HcHWCfg		, 0x302d	);	// set INT1 to Active LOW, Level Triggered
//else 	w16(HcHWCfg		, 0x342D	);
 w32(HcFmItv  		, 0x25002EDF);
 w32(HcControl		, 0x00000680);
}


void port_monitor(void)
{
 unsigned long control,irq_status,status1,status2;
 unsigned int start_y=10;
 unsigned int user_in;

// clrscr();

 set_operational();

 w32(HcRhP1,0x00000102);
 w32(HcRhP2,0x00000102);
 w32(HcRhA,0x20000002);
 w32(HcRhB,0x00000000);
 w32(HcRhStatus,0x00010000);	//set Global Power

 do
 {
  control   =r32(HcControl);
  irq_status=r32(HcIntStatus);
  status1   =r32(HcRhP1);
  status2   =r32(HcRhP2);

  if((status1&0x00000001)==1)
  {
//   gotoxy(20,start_y+6);
   w32(HcRhP1,0x00000102);
   if((status1&0x00000200)!=0)
   {
	printf("LS Device connected to Port 1");
	set_port_speed(1,1);
   }
   else
   {
	printf("FS Device connected to Port 1");
	set_port_speed(1,0);
   }
  }

  else
  {
//   gotoxy(20,start_y+6);
   printf("                                      ");
  }

  if((status2&0x00000001)==1)
  {
//   gotoxy(20,start_y+7);
   w32(HcRhP2,0x00000102);
   if((status2&0x00000200)!=0)
   {
	printf("LS Device connected to Port 2");
	set_port_speed(2,1);
   }
   else
   {
	printf("FS Device connected to Port 2");
	set_port_speed(2,0);
   }
  }

  else
  {
//   gotoxy(20,start_y+7);
   printf("                                      ");
  }

//  gotoxy(20,start_y);
  printf("Port Status Monitor");
 // gotoxy(20,start_y-1);
  printf("OTGStatus  Register = %8X.\n",r16(0x67));
 // gotoxy(20,start_y+1);
  printf("OTGControl Register = %8X.\n",r16(0x62));
//  gotoxy(20,start_y+2);
  printf("Control    Register = %8lX.\n",control);
//  gotoxy(20,start_y+3);
  printf("Int Status Register = %8lX.\n",irq_status);
//  gotoxy(20,start_y+4);
  printf("P1  Status Register = %8lX.\n",status1);
//  gotoxy(20,start_y+5);
  printf("P2  Status Register = %8lX.\n",status2);
//  gotoxy(20,start_y+8);
  printf("Press '1' to go back to main menu\n");

  user_in='1';//read_key(0);
 }
 while(user_in!='1');
}

void check_ports(void)
{
 unsigned long control,irq_status,status1,status2;

 control   =r32(HcControl);
 irq_status=r32(HcIntStatus);
 status1   =r32(HcRhP1);
 status2   =r32(HcRhP2);

  if((status1&0x00000001)==1)
  {
   w32(HcRhP1,0x00000102);
   if((status1&0x00000200)!=0)
   {
	printf("\nLS Device connected to Port 1     ");
	set_port_speed(1,1);
   }
   else
   {
	printf("\nFS Device connected to Port 1     ");
 	set_port_speed(1,0);
   }
  }

  if((status2&0x00000001)==1)
  {
   w32(HcRhP2,0x00000102);
   if((status2&0x00000200)!=0)
   {
	printf("\nLS Device connected to Port 2     ");
	set_port_speed(2,1);
   }
   else
   {
	printf("\nFS Device connected to Port 2     ");
	set_port_speed(2,0);
   }
  }

 printf("\nControl    Register = %8lX.",control);
 printf("\nInt Status Register = %8lX.",irq_status);
 printf("\nP1  Status Register = %8lX.",status1);
 printf("\nP2  Status Register = %8lX.",status2);
}

unsigned int assign_address(unsigned int addr1, unsigned int addr2, int mode)
{
 unsigned long rhp1,rhp2;
 unsigned int status;
 unsigned int ccode=0;

 rhp1=r32(HcRhP1);
 rhp2=r32(HcRhP2);

 enable_port();

// gotoxy(1,5);

 if(mode==1)
 {
  printf("\nRhP1 = %8lX  RhP2 = %8lX",rhp1,rhp2);
  printf("\nPort1Speed = %2d",get_port_speed(1));
  printf("\nPort2Speed = %2d",get_port_speed(2));
 }

 if(  ((rhp1&0x01)==1)  &&  ((rhp2&0x01)==1)  )
 {
  if(mode==1)printf("\nBoth ports has USB device connected.");

  w32(HcRhP1,0x00000010); //Resets port 1
//  delay(500);
  w32(HcRhP2,0x00000010); //Resets port 2

  ccode=set_address(0,1,1);
  status=0x0100|(ccode<<12);

  enable_port();

//  delay(200);
  ccode=set_address(0,2,2);

  status=0x0001|(ccode<<4);
 }

 else if(  ((rhp1&0x01)==1)  &&  ((rhp2&0x01)==0)  )
 {
  if(mode==1)printf("\nPort 1 has USB device connected, assigning address 1...");
   ccode=set_address(0,1,1);

  status=0x0100|(ccode<<12);
 }

 else if(  ((rhp1&0x01)==0)  &&  ((rhp2&0x01)==1)  )
 {
  if(mode==1)printf("\nPort 2 has USB device connected, assigning address 2...");
   ccode=set_address(0,2,2);

  status=0x0001|(ccode<<4);
 }

 else
 {
  if(mode==1)printf("\nNo device connected to ISP1362, aborting enumeration...");

  status=0x0000;
 }

 return(status);
}
