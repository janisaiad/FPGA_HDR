#ifndef _INC_PTD_H_
#define _INC_PTD_H_


extern int port1speed;
extern unsigned int port2speed;
extern unsigned int port_speed;

extern unsigned int wait_time;
extern unsigned int retry;

extern unsigned int c_ptd[];

void send_iso(unsigned int *a_ptr,unsigned int bytesize,unsigned int ptl,unsigned int addr);
unsigned int error_recorder(char mode,int ccode1, int ccode2);
unsigned int addr_info(int addr,int mode,int dtype,int para);
unsigned int get_port_speed(unsigned int port);
void set_port_speed(unsigned int port, unsigned int speed);

void poll(unsigned int poll_len);


unsigned int send_control(unsigned int *a_ptr,unsigned int *r_ptr);

unsigned int send_int(unsigned int *a_ptr,unsigned int *r_ptr);
void full_ptd(int *rptr,char token,char ep,int max,int total,char tog,char addr,char port);

void make_ptd(int *rptr,char token,char ep,int max,char tog,char addr,char port);
void new_make_ptd(int *rptr,char token,char ep,int max,char tog,char addr,char port, unsigned int total);
void make_int_ptd(int *rptr,char token,char ep,int max,char tog,char addr,char port,int freq);
//This PTD is used to simple bulk test to check the mechanism of Skip/Last
void make_xbulk(char ep,char addr,int *rptr);

void send_ptl(unsigned int *a_ptr,unsigned int bytesize,unsigned int ptl,unsigned int addr);

unsigned int ptl_ptd(char type_ptd,char last,char ep,unsigned int max,char tog,char addr,unsigned char frame_no);
void iso_ptd(unsigned int *iso,char type_ptd,char last,char ep,unsigned int max,char tog,char addr,unsigned char frame_no);


#endif //_INC_PTD_H_

