#include "BASICTYP.h"
#include "HAL4D13.h"

unsigned int device_info(char mode, char itype, char index)
{
 static int iManufacturer=0;
 static int iProduct=0;
 static int iInterface=0;
 static int MaxPacSize=0;

 if(mode=='W')
 {
  if(itype=='M') {iManufacturer=index;}
  if(itype=='P') {iProduct     =index;}
  if(itype=='I') {iInterface   =index;}
  if(itype=='S') {MaxPacSize   =index;}
 }

 if(mode=='R')
 {
  if(itype=='M') {return(iManufacturer);}
  if(itype=='P') {return(iProduct)     ;}
  if(itype=='I') {return(iInterface)   ;}
  if(itype=='S') {return(MaxPacSize)   ;}
 }

 if(mode=='S')
 {
  printf("\niManufacturer = %4X",iManufacturer);
  printf("\niProduct      = %4X",iProduct     );
  printf("\niInterface    = %4X",iInterface   );
  printf("\nMaxPacSize    = %4X",MaxPacSize   );
 }

 return 0;
}

unsigned int set_address(int old_addr, int new_addr, int port)
{
 unsigned int cbuf[128];
 unsigned int rbuf[128];
 unsigned int uni_req[4]={0x0500,0x0000,0x0000,0x0000};
 unsigned int mycode=0;
 unsigned int tcnt;

 uni_req[1]=new_addr;

 w16(HcUpInt,0x100);

 r32(HcATLDone);
 r32(HcATLDone);

 make_ptd(cbuf,SETUP,0,8,0,old_addr,port);
 array_app(cbuf+4,uni_req,4);
 tcnt=send_control(cbuf,rbuf);
 mycode=(*rbuf&0xF000)>>12;

 if(tcnt==0)
 {
  mycode|=0xF000;
 }

 if(mycode==0)
 {
  //send out DATA IN packet
  make_ptd(cbuf,IN,0,0,1,old_addr,port);
  tcnt=send_control(cbuf,rbuf);
  mycode=(*rbuf&0xF000)>>12;
   if(tcnt==0)
	{
	 mycode|=0xF000;
	}
 }

 r32(HcATLDone);

 return(mycode);
}

unsigned int  set_config(int addr, int config)
{
 unsigned int cbuf[128];
 unsigned int rbuf[128];
 unsigned int uni_req[4]={0x0900,0x0000,0x0000,0x0000};
 unsigned int tcnt;
 unsigned int mycode=0;

 uni_req[1]=config;

 w16(HcUpInt,0x100);

 r32(HcATLDone);
 r32(HcATLDone);

 make_ptd(cbuf,SETUP,0,8,0,addr,addr);

 array_app(cbuf+4,uni_req,4);
 tcnt=send_control(cbuf,rbuf);
 //after   -------    GL Lamp light
 if(tcnt==0) { mycode|=0xF000;}
 mycode=mycode | (*rbuf&0xF000)>>12;

 if(mycode==0)
 {
 //send out DATA IN packet
  make_ptd(cbuf,IN,0,0,1,addr,addr);
  tcnt=send_control(cbuf,rbuf);
  if(tcnt==0) { mycode|=0xF000;}
  mycode=mycode | (*rbuf&0xF000)>>12;
 }

 r32(HcATLDone);
 r32(HcATLDone);

 return(mycode);
}


unsigned int get_control_old(unsigned int *rptr,unsigned int addr,char control_type,unsigned int extra,int port)
{
 unsigned int cbuf[128];
 unsigned int rbuf[128];
 unsigned int cnt=0,lcnt=0;
 unsigned int toggle_cnt=0;
 unsigned int word_size;
 unsigned int DesSize,MaxSize,RemainSize;
 unsigned int LocalLimit;

 unsigned int dev_req[4]={0x0680,0x0100      ,0x0000,0x8};
 unsigned int cfg_req[4]={0x0680,0x0200      ,0x0000,0x8};
 unsigned int str_req[4]={0x0680,0x0300      ,0x0000,0x8};
 unsigned int int_req[4]={0x0680,0x0400      ,0x0000,0x8};
 unsigned int end_req[4]={0x0680,0x0500      ,0x0000,0x8};
 unsigned int hid_req[4]={0x0681,0x2100      ,0x0000,0x8};

 unsigned int ccode=0;
 unsigned int stage=1;
 unsigned int tout; //timeout indicator

 //STAGE 1 : Send out first setup packet
 make_ptd(cbuf,SETUP,0,8,0,addr,port);
 if(control_type=='D') {array_app(cbuf+4,dev_req,4);}
 if(control_type=='C') {array_app(cbuf+4,cfg_req,4);}
 if(control_type=='S') {array_app(cbuf+4,str_req,4);}
 if(control_type=='I') {array_app(cbuf+4,int_req,4);}
 if(control_type=='E') {array_app(cbuf+4,end_req,4);}
 if(control_type=='H') {array_app(cbuf+4,hid_req,4);}

 if(control_type=='S')
 {
  cbuf[5]=cbuf[5]|extra;   //This is for string processing
 }

 tout=send_control(cbuf,rbuf);
 if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

 if(ccode==0)
 {
  toggle_cnt++;
  make_ptd(cbuf,IN,0,8,toggle_cnt%2,addr,port);
  tout=send_control(cbuf,rbuf);
  ccode|=(rbuf[0]&0xF000)>>12;

  if(ccode==0x09)  //Descriptor Size is less than 8
  {
   ccode=0;
  }

  if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

  if(control_type!='C')
  {
   DesSize=((rbuf[4]&0x00FF));
  }

  if(control_type=='C')
  {
   DesSize=rbuf[5];
  }

  if(control_type!='D')
  {
   MaxSize=addr_info(addr,'R','M',MaxSize);
  }

  if(control_type=='D')
  {
   MaxSize=(rbuf[7]&0xFF00)>>8;
   if(MaxSize<8) {MaxSize==8;}

   addr_info(addr,'W','M',MaxSize);
  }

  if(control_type=='H')
  {
   DesSize=(rbuf[7]&0xFF00)>>8;
   if(DesSize<8) {DesSize==8;}
  }

 }

 if(ccode==0)
 {
  //send out DATA OUT packet
  make_ptd(cbuf,OUT,0,0,toggle_cnt%2,addr,port);
  tout=send_control(cbuf,rbuf);
  if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

  ccode|=(rbuf[0]&0xF000)>>12;
 }
 //STAGE 1: END

 if(ccode==0)
 {
  stage=2;

  hid_req[1]=0x2200; //Change HID req into HID report descriptor

  //STAGE 2
  make_ptd(cbuf,SETUP,0,8,0,addr,port);
  if(control_type=='D') {array_app(cbuf+4,dev_req,4);}
  if(control_type=='C') {array_app(cbuf+4,cfg_req,4);}
  if(control_type=='S') {array_app(cbuf+4,str_req,4);}
  if(control_type=='I') {array_app(cbuf+4,int_req,4);}
  if(control_type=='E') {array_app(cbuf+4,end_req,4);}
  if(control_type=='H') {array_app(cbuf+4,hid_req,4);}

  if(control_type=='S')
  {
   cbuf[5]=cbuf[5]|extra;
  }

  cbuf[7]=DesSize;
  tout=send_control(cbuf,rbuf);
  if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

  word_size=(DesSize+1)>>1;

  RemainSize=DesSize;

  toggle_cnt=0;
  cnt=0;
  do
  {
   //send out DATA IN packet
   toggle_cnt++;

   //The last transaction where remaining data size < max pac size
   if(RemainSize<MaxSize)
   {
	make_ptd(cbuf,IN,0,RemainSize,toggle_cnt%2,addr,port);
   }

   //Normal
   else
   {
	make_ptd(cbuf,IN,0,MaxSize,toggle_cnt%2,addr,port);
   }

   tout=send_control(cbuf,rbuf);
   if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

   ccode|=(rbuf[0]&0xF000)>>12;

   RemainSize=RemainSize-MaxSize;

   LocalLimit=MaxSize>>1;

   if(ccode==0)//Data In is sucessful
   {
	lcnt=0;
	do
	{
	 //Copy the data located right after the 8 bytes PTD
	 *(rptr+cnt)=rbuf[4+lcnt];

	 cnt++;
	 lcnt++;
	}
	while(lcnt<(LocalLimit));
   }

  }
  while((cnt<word_size)&&(ccode==0));
 //STAGE 2: END
 }

 if(ccode==0)
 {
  stage=3;

  //STAGE 3 :Send out DATA OUT packet
  make_ptd(cbuf,OUT,0,0,toggle_cnt%2,addr,port);
  send_control(cbuf,rbuf);

  ccode=(rbuf[0]&0xF000)>>12;
  //STAGE 3: END
 }

 return( (ccode)|(stage<<8) );

// byte 0 indicates the error code
// byte 2 indicates at which stage the error was encountered
// byte 3 is F if time-out, else 0
}

unsigned int get_control(unsigned int *rptr,unsigned int addr,char control_type,unsigned int extra,int port)
{
 unsigned int cbuf[128];
 unsigned int rbuf[128];
 unsigned int cnt=0,lcnt=0;
 unsigned int toggle_cnt=0;
 unsigned int word_size;
 unsigned int DesSize,MaxSize;

 unsigned int dev_req[4]={0x0680,0x0100      ,0x0000,0x8};
 unsigned int cfg_req[4]={0x0680,0x0200      ,0x0000,0x8};
 unsigned int str_req[4]={0x0680,0x0300      ,0x0000,0x8};
 unsigned int int_req[4]={0x0680,0x0400      ,0x0000,0x8};
 unsigned int end_req[4]={0x0680,0x0500      ,0x0000,0x8};
 unsigned int hid_req[4]={0x0681,0x2100      ,0x0000,0x8};

 unsigned int ccode=0;
 unsigned int stage=1;
 unsigned int tout; //timeout indicator

 //STAGE 1 : Send out first setup packet
 make_ptd(cbuf,SETUP,0,8,0,addr,port);
 if(control_type=='D') {array_app(cbuf+4,dev_req,4);}
 if(control_type=='C') {array_app(cbuf+4,cfg_req,4);}
 if(control_type=='S') {array_app(cbuf+4,str_req,4);}
 if(control_type=='I') {array_app(cbuf+4,int_req,4);}
 if(control_type=='E') {array_app(cbuf+4,end_req,4);}
 if(control_type=='H') {array_app(cbuf+4,hid_req,4);}

 if(control_type=='S')
 {
  cbuf[5]=cbuf[5]|extra;   //This is for string processing
 }

 tout=send_control(cbuf,rbuf);
 if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

 if(ccode==0)
 {
  toggle_cnt++;
  make_ptd(cbuf,IN,0,8,toggle_cnt%2,addr,port);
  tout=send_control(cbuf,rbuf);
  ccode|=(rbuf[0]&0xF000)>>12;

  if(ccode==0x09)  //Descriptor Size is less than 8
  {
   ccode=0;
  }

  if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

  if(control_type!='C')
  {
   DesSize=((rbuf[4]&0x00FF));
  }

  if(control_type=='C')
  {
   DesSize=rbuf[5];
  }

  if(control_type!='D')
  {
   MaxSize=addr_info(addr,'R','M',MaxSize);
  }

  if(control_type=='D')
  {
   MaxSize=(rbuf[7]&0xFF00)>>8;
   if(MaxSize<8) {MaxSize==8;}

   addr_info(addr,'W','M',MaxSize);
  }

  if(control_type=='H')
  {
   DesSize=(rbuf[7]&0xFF00)>>8;
   if(DesSize<8) {DesSize==8;}
  }
 }

 if(ccode==0)
 {
  //send out DATA OUT packet
  make_ptd(cbuf,OUT,0,0,toggle_cnt%2,addr,port);
  tout=send_control(cbuf,rbuf);
  if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

  ccode|=(rbuf[0]&0xF000)>>12;
 }
 //STAGE 1: END

 if(ccode==0)
 {
  stage=2;

  hid_req[1]=0x2200; //Change HID req into HID report descriptor

  //STAGE 2
  make_ptd(cbuf,SETUP,0,8,0,addr,port);
  if(control_type=='D') {array_app(cbuf+4,dev_req,4);}
  if(control_type=='C') {array_app(cbuf+4,cfg_req,4);}
  if(control_type=='S') {array_app(cbuf+4,str_req,4);}
  if(control_type=='I') {array_app(cbuf+4,int_req,4);}
  if(control_type=='E') {array_app(cbuf+4,end_req,4);}
  if(control_type=='H') {array_app(cbuf+4,hid_req,4);}

  if(control_type=='S')
  {
   cbuf[5]=cbuf[5]|extra;
  }

  cbuf[7]=DesSize;
  tout=send_control(cbuf,rbuf);
  if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

  word_size=(DesSize+1)>>1;

  cnt=0;

  //send out DATA IN packet
   new_make_ptd(cbuf,IN,0,MaxSize,1,addr,port,DesSize);

   tout=send_control(cbuf,rbuf);
   if(tout==0) {ccode|=0xF000;}   //Indicates Timeout in transaction

   ccode|=(rbuf[0]&0xF000)>>12;

   if(ccode==0)//Data In is sucessful
   {
	lcnt=0;
	do
	{
	 //Copy the data located right after the 8 bytes PTD
	 *(rptr+cnt)=rbuf[4+lcnt];

	 cnt++;
	 lcnt++;
	}
	while(lcnt<DesSize);
   }
 //STAGE 2: END
 }

 if(ccode==0)
 {
  stage=3;

  //STAGE 3 :Send out DATA OUT packet
  make_ptd(cbuf,OUT,0,0,toggle_cnt%2,addr,port);
  send_control(cbuf,rbuf);

  ccode=(rbuf[0]&0xF000)>>12;
  //STAGE 3: END
 }

 return( (ccode)|(stage<<8) );
// byte 0 indicates the error code
// byte 2 indicates at which stage the error was encountered
// byte 3 is F if time-out, else 0
}

unsigned int set_sound(int addr,int port,int r0,int r1,int r2,int r3,int d0)
{
 unsigned int cbuf[128];
 unsigned int rbuf[128];
 unsigned int uni_req[4]={0x0212,0x0201,0x0200,0x0002};
 unsigned int audio_req[4]={0xF416,0x0,0x0,0x0};
 unsigned int mycode=0;
 unsigned int tcnt;

 uni_req[0]=r0;
 uni_req[1]=r1;
 uni_req[2]=r2;
 uni_req[3]=r3;

 audio_req[0]=d0;

 w16(HcUpInt,0x100);

 r32(HcATLDone);
 r32(HcATLDone);

 make_ptd(cbuf,SETUP,0,8,0,addr,port);
 array_app(cbuf+4,uni_req,4);
 tcnt=send_control(cbuf,rbuf);
 mycode=(*rbuf&0xF000)>>12;

 if(tcnt==0)
 {
  mycode|=0xF000;
 }

 if(mycode==0)
 {
  //send out DATA IN packet
  make_ptd(cbuf,OUT,0,2,1,addr,port);
  array_app(cbuf+4,audio_req,4);
  tcnt=send_control(cbuf,rbuf);
  mycode=(*rbuf&0xF000)>>12;
   if(tcnt==0)
	{
	 mycode|=0xF000;
	}
 }
 r32(HcATLDone);

 if(mycode==0)
 {
  //send out DATA IN packet
  make_ptd(cbuf,IN,0,0,1,addr,port);
  tcnt=send_control(cbuf,rbuf);
  mycode=(*rbuf&0xF000)>>12;
   if(tcnt==0)
	{
	 mycode|=0xF000;
	}
 }

 r32(HcATLDone);

 return(mycode);
}

unsigned int set_interface(int addr, int interface, int port)
{
 unsigned int cbuf[128];
 unsigned int rbuf[128];
 unsigned int uni_req[4]={0x0B01,0x0000,0x0001,0x0000};
 unsigned int mycode=0;
 unsigned int tcnt;

 uni_req[1]=interface;

 w16(HcUpInt,0x100);

 r32(HcATLDone);
 r32(HcATLDone);

 make_ptd(cbuf,SETUP,0,8,0,addr,port);
 array_app(cbuf+4,uni_req,4);
 tcnt=send_control(cbuf,rbuf);
 mycode=(*rbuf&0xF000)>>12;

 if(tcnt==0)
 {
  mycode|=0xF000;
 }

 if(mycode==0)
 {
  //send out DATA IN packet
  make_ptd(cbuf,IN,0,0,1,addr,port);
  tcnt=send_control(cbuf,rbuf);
  mycode=(*rbuf&0xF000)>>12;
   if(tcnt==0)
	{
	 mycode|=0xF000;
	}
 }

 r32(HcATLDone);

 return(mycode);
}





