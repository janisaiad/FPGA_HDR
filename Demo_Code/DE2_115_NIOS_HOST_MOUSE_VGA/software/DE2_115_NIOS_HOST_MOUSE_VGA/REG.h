#ifndef _INC_REG_H__
#define _INC_REG_H__


extern void OneuSDelay(void);

extern void uSDelay(unsigned wDlyTime);

extern unsigned long r32(unsigned char reg_no);
extern void w32(unsigned char reg_no, unsigned long data2write);
extern unsigned int r16(unsigned char reg_no);
extern void w16(unsigned char reg_no, unsigned int data2write);

extern unsigned long dc_r32(unsigned char reg_no);
extern void dc_w32(unsigned char reg_no, unsigned long data2write);
extern unsigned int dc_r16(unsigned char reg_no);
extern void dc_w16(unsigned char reg_no, unsigned int data2write);



#endif //_INC_REG_H__
