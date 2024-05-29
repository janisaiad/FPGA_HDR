#ifndef __Test_H__
#define __Test_H__

#define BUTTON_STOP_TIME  500000        //  us
#define BUTTON_INT_MASK   0xF
#define SEG7_VALUE        0x88888888
#define LED_GREEN_VALUE   0x1FF
#define LED_RED_VALUE     0x3FFFF
#define I2C_FREQ          100000        //  100Khz

void handle_button_interrupts();
void init_button_irq();
void basic_test();

#endif
