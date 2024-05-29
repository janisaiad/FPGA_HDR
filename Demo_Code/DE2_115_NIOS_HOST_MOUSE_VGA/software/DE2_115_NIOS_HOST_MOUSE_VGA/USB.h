#ifndef _INC_USB_H_
#define _INC_USB_H_

unsigned int device_info(char mode, char itype, char index);

unsigned int set_address(int old_addr, int new_addr, int port);
unsigned int set_config(int addr, int config);
unsigned int get_control_old(unsigned int *rptr,unsigned int addr,char control_type,unsigned int extra,int port);
unsigned int get_control(unsigned int *rptr,unsigned int addr,char control_type,unsigned int extra,int port);
unsigned int set_sound(int addr,int port,int r0,int r1,int r2,int r3,int d0);
unsigned int set_interface(int addr, int interface, int port);

#endif //_INC_USB_H_







