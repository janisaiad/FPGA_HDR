
#include "ISP1362_HAL.h"
#include "BASICTYP.h"
#include "HAL4D13.h"
#include "REG.h"

void Set_DirAddrLen(unsigned int count,unsigned char flow,unsigned int addr)
{
 unsigned long addr2return;

 addr2return =(long)(addr&0x7FFF);
 addr2return|=((long)flow)<<15;
 addr2return|=(((long)count)<<16);

 w32(HcDirAddrLen,addr2return);
}

long make_DirAddrLen(unsigned int count,unsigned char flow,unsigned int addr)
{
 unsigned long addr2return;

 addr2return =(long)(addr&0x7FFF);
 addr2return|=((long)flow)<<15;
 addr2return|=(((long)count)<<16);

 return(addr2return);
}

void direct_read(unsigned int *a_ptr)
{
 unsigned long word_cnt,test_target;
 unsigned int test_size=4096;
 unsigned long DirAddrLen_data;
 unsigned cnt;
 unsigned long rb;

 DirAddrLen_data=make_DirAddrLen(test_size,0,0);
 w32(HcDirAddrLen,DirAddrLen_data);

 USB_HC_CMD_WRITE(HcDirAddr_Port);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcDirAddr_Port);

 uSDelay(10);	//waste some time

 cnt=0;
  do
   {
    *(a_ptr+cnt)=USB_HC_DATA_READ();//IORD(ISP1362_BASE,HC_DATA_PORT);
	cnt++;
   }
  while(cnt<2048);
}

void direct_write(unsigned int *w_ptr)
{
 unsigned long word_cnt,test_target;
 unsigned long DirAddrLen_data;
 unsigned cnt;
 unsigned long rb;
 unsigned long *data_ptr;

 DirAddrLen_data=make_DirAddrLen(4096,0,0);
 w32(HcDirAddrLen,DirAddrLen_data);

 USB_HC_CMD_WRITE(HcDirAddr_Port|0x80);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcDirAddr_Port|0x80);

 uSDelay(10);	//waste some time

 cnt=0;
  do
   {
    USB_HC_DATA_WRITE(*(w_ptr+cnt));//IOWR(ISP1362_BASE,HC_DATA_PORT,*(w_ptr+cnt));
	cnt++;
   }
  while(cnt<2048);
}

void read_atl(unsigned int *a_ptr, unsigned int data_size)
{
 int cnt;

 w16(HcTransferCnt,data_size*2);
 USB_HC_CMD_WRITE(HcATL_Port);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcATL_Port);

 uSDelay(10);	//waste some time

 cnt=0;
 do
  {
   *(a_ptr+cnt)=USB_HC_DATA_READ();//IORD(ISP1362_BASE,HC_DATA_PORT);
   cnt++;
  }
 while(cnt<(data_size));
}

void write_atl(unsigned int *a_ptr, unsigned int data_size)
{
 int cnt;

 w16(HcTransferCnt,data_size*2);
 USB_HC_CMD_WRITE(HcATL_Port|0x80);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcATL_Port|0x80);

 uSDelay(10);	//waste some time

 cnt=0;
 do
  {
   //IOWR(ISP1362_BASE,HC_DATA_PORT,*(a_ptr+cnt));
   USB_HC_DATA_WRITE(*(a_ptr+cnt));
   cnt++;
  }
 while(cnt<(data_size));
}

void read_int(unsigned int *a_ptr, unsigned int data_size)
{
 int cnt;

 w16(HcTransferCnt,data_size*2);
 USB_HC_CMD_WRITE(HcInt_Port);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcInt_Port);

 uSDelay(10);	//waste some time
 cnt=0;
 do
  {
   *(a_ptr+cnt)=USB_HC_DATA_READ();//IORD(ISP1362_BASE,HC_DATA_PORT);
   cnt++;
  }
 while(cnt<(data_size));
}

void write_int(unsigned int *a_ptr, unsigned int data_size)
{
 int cnt;

 w16(HcTransferCnt,data_size*2);
 USB_HC_CMD_WRITE(HcInt_Port|0x80);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcInt_Port|0x80);

 uSDelay(10);	//waste some time
 cnt=0;
 do
  {
   //IOWR(ISP1362_BASE,HC_DATA_PORT,*(a_ptr+cnt));
   USB_HC_DATA_WRITE(*(a_ptr+cnt));
   cnt++;
  }
 while(cnt<(data_size));
}

void read_ptl(unsigned int *a_ptr, unsigned int data_size, char ptl)
{
 int cnt;

 w16(HcTransferCnt,data_size*2);
// if(ptl==0){IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcPTL0_Port);}
// if(ptl==1){IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcPTL1_Port);}
 if(ptl==0){USB_HC_CMD_WRITE(HcPTL0_Port);}
 if(ptl==1){USB_HC_CMD_WRITE(HcPTL1_Port);}


 uSDelay(10);	//waste some time
 cnt=0;
 do
  {
   *(a_ptr+cnt)=USB_HC_DATA_READ();//IORD(ISP1362_BASE,HC_DATA_PORT);
   cnt++;
  }
 while(cnt<(data_size));
}

void write_ptl(unsigned int *a_ptr, unsigned int data_size, char ptl)
{
 int cnt;

 w16(HcTransferCnt,data_size*2);
// if(ptl==0) {IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcPTL0_Port|0x80);}
// if(ptl==1) {IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcPTL1_Port|0x80);}
 if(ptl==0) {USB_HC_CMD_WRITE(HcPTL0_Port|0x80);}
 if(ptl==1) {USB_HC_CMD_WRITE(HcPTL1_Port|0x80);}

 uSDelay(10);	//waste some time
 cnt=0;
 do
  {
   //IOWR(ISP1362_BASE,HC_DATA_PORT,*(a_ptr+cnt));
   USB_HC_DATA_WRITE(*(a_ptr+cnt));
   cnt++;
  }
 while(cnt<(data_size));
}

void erase_all(void)
{
 unsigned long word_cnt,test_target;
 unsigned int test_size=4096;
 unsigned long DirAddrLen_data;
 unsigned long cnt;
 unsigned long rb;
 unsigned long *data_ptr;

 DirAddrLen_data=make_DirAddrLen(test_size,0,0);
 w32(HcDirAddrLen,DirAddrLen_data);

 USB_HC_CMD_WRITE(HcDirAddr_Port|0x80); //IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcDirAddr_Port|0x80);
 cnt=0;
  do
   {
    //IOWR(ISP1362_BASE,HC_DATA_PORT,0);
    USB_HC_DATA_WRITE(0);
	cnt++;
   }
  while(cnt<2048);
}

void set_all(void)
{
 unsigned long word_cnt,test_target;
 unsigned long DirAddrLen_data;
 unsigned long cnt;
 unsigned long rb;

 DirAddrLen_data=make_DirAddrLen(4096,0,0);
 w32(HcDirAddrLen,DirAddrLen_data);

 USB_HC_CMD_WRITE(HcDirAddr_Port|0x80);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcDirAddr_Port|0x80);

 uSDelay(10);	//waste some time
 cnt=0;
  do
   {
    //IOWR(ISP1362_BASE,HC_DATA_PORT,0xFFFF-cnt);
    USB_HC_DATA_WRITE(0xFFFF-cnt);
	cnt++;
   }
  while(cnt<2048);
}

void random_read(unsigned int *a_ptr,unsigned int start_addr,unsigned int data_size)
{
 unsigned int test_size=data_size*2;
 unsigned long DirAddrLen_data;
 unsigned long cnt;

 DirAddrLen_data=make_DirAddrLen(test_size,0,start_addr);
 w32(HcDirAddrLen,DirAddrLen_data);

 USB_HC_CMD_WRITE(HcDirAddr_Port);//IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcDirAddr_Port);

 uSDelay(10);	//waste some time
 cnt=0;
  do
   {
    *(a_ptr+cnt)=USB_HC_DATA_READ();//IORD(ISP1362_BASE,HC_DATA_PORT);
	cnt++;
   }
  while(cnt<data_size);
}

void random_write(unsigned int *w_ptr,unsigned int start_addr,unsigned int data_size)
{
 unsigned long word_cnt,test_target;
 unsigned int test_size=data_size*2;
 unsigned long DirAddrLen_data;
 unsigned long cnt;
 unsigned long rb;

 DirAddrLen_data=make_DirAddrLen(test_size,0,start_addr);
 w32(HcDirAddrLen,DirAddrLen_data);

 USB_HC_CMD_WRITE(HcDirAddr_Port|0x80); //IOWR(ISP1362_BASE,HC_COMMAND_PORT,HcDirAddr_Port|0x80);
 uSDelay(10);	//waste some time
 cnt=0;
  do
   {
    //IOWR(ISP1362_BASE,HC_DATA_PORT,*(w_ptr+cnt));
    USB_HC_DATA_WRITE(*(w_ptr+cnt));
	cnt++;
   }
  while(cnt<data_size);
}

void see_buf(void)
{
 unsigned int word_cnt,test_target;
 unsigned int test_word;
 unsigned int buf_image[ram_size];
 unsigned int *ptr;

// clrscr();
//cleardevice();

 ptr=buf_image;

 direct_read(ptr);

// gotoxy(1,2);
 word_cnt=0;
  do
   {
	test_word=buf_image[word_cnt];
	word_cnt++;
	printf("%04X ",test_word);
	if(word_cnt%256==0)
	{
	 printf("\n  ISP1362 Memory Map Page %4X",word_cnt>>8);
	 printf("\n  From Address %06X to %06X",(word_cnt<<1)-512,word_cnt<<1);
	 printf("\n  From Address %06d to %06d",(word_cnt<<1)-512,word_cnt<<1);

//	 read_key(1);
//	 gotoxy(1,2);
	}
   }
  while(word_cnt<2048);

// if(word_cnt<256) {read_key(1); }
}

