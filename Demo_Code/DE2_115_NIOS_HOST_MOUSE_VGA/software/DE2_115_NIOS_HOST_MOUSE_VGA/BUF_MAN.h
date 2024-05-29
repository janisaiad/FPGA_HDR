#ifndef   __BUF_MAN_H__
#define   __BUF_MAN_H__

void Set_DirAddrLen(unsigned int count,unsigned char flow,unsigned int addr);

long make_DirAddrLen(unsigned int count,unsigned char flow,unsigned int addr);

void direct_read(unsigned int *a_ptr);
void direct_write(unsigned int *w_ptr);
void read_atl(unsigned int *a_ptr, unsigned int data_size);

void write_atl(unsigned int *a_ptr, unsigned int data_size);

void read_int(unsigned int *a_ptr, unsigned int data_size);

void write_int(unsigned int *a_ptr, unsigned int data_size);

void read_ptl(unsigned int *a_ptr, unsigned int data_size, char ptl);

void write_ptl(unsigned int *a_ptr, unsigned int data_size, char ptl);

void erase_all(void);

void set_all(void);

void random_read(unsigned int *a_ptr,unsigned int start_addr,unsigned int data_size);
void random_write(unsigned int *w_ptr,unsigned int start_addr,unsigned int data_size);

void see_buf(void);
#endif
