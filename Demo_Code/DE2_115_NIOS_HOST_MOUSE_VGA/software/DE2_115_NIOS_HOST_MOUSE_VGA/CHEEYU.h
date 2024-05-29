#ifndef   __CHEEYU_H__
#define   __CHEEYU_H__
void convert_string(char *udn, int *rbuf);

void array_app(int *cbuf,int *tbuf,int no_of_words);

unsigned char get16_bit(unsigned int position,unsigned int int_data);

char read_key(unsigned char mode);
#endif