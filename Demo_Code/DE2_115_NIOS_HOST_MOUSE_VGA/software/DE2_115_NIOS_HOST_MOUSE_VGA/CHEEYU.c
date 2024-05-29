void convert_string(char *udn, int *rbuf)
{
 unsigned int name_length;
 unsigned int cnt;

 name_length=( (rbuf[0]&0x00FF)>>1  );
 if(name_length>32) {name_length=32;}

 if(name_length>0)
 {
  cnt=0;
  while(cnt<(name_length-1))
  {
   sprintf(udn+cnt,"%c",*(rbuf+cnt+1));
   cnt++;
  }
 }
}

void array_app(int *cbuf,int *tbuf,int no_of_words)
{
 int cnt=0;

 do
  {
   *(cbuf + cnt) = *(tbuf + cnt);
   cnt++;
  }
 while(cnt<no_of_words);
}

unsigned char get16_bit(unsigned int position,unsigned int int_data)
{
 unsigned int temp;
 unsigned int result;

 temp=0x0001;
 temp=temp<<position;
 result=temp&int_data;

 if(result!=0) {return(1);}
 else { return(0);}
}

char read_key(unsigned char mode)
{
 char key_buff;
 unsigned int temp;

 if(mode==2)
 {
  while(0 == 0);
  {
   temp=1;

		if(temp==0x4800) { key_buff='u'; }
   else if(temp==0x5000) { key_buff='d'; }
   else if(temp==0x4B00) { key_buff='l'; }
   else if(temp==0x4D00) { key_buff='r'; }
   else                  {key_buff=(char)(temp&0x00FF);}
  }
 }

 if(mode==1)              //wait for key input
 {
  while (1 == 0);
  key_buff =1;
 }

 if(mode==0)              //don't wait
 {
  key_buff=0;
  if(1!=0)
  {
   key_buff = 1;
  }
 }
 return(key_buff);
}


