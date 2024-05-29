
#include <unistd.h>
#include <stdio.h>
#include "system.h"
#include "basic_io.h"
#include "LCD.h"
#include "sys/alt_irq.h"
#include "Test.h"

//-------------------------------------------------------------------------
void handle_button_interrupts()
{
  //outport(LED_GREEN_BASE,get_pio_edge_cap(BUTTON_PIO_BASE)*get_pio_edge_cap(BUTTON_PIO_BASE));
  //set_pio_edge_cap(BUTTON_PIO_BASE,0x0);
  //usleep(BUTTON_STOP_TIME);
  //outport(LED_GREEN_BASE,LED_GREEN_VALUE);
}
//-------------------------------------------------------------------------
void init_button_irq()
{
  /* Enable all 4 button interrupts. */
  //set_pio_irq_mask(BUTTON_PIO_BASE, BUTTON_INT_MASK);
  /* Reset the edge capture register. */
  //set_pio_edge_cap(BUTTON_PIO_BASE, 0x0);
  /* Register the interrupt handler. */
  //alt_irq_register( BUTTON_PIO_IRQ, NULL, (void*)handle_button_interrupts ); 
}
//-------------------------------------------------------------------------
void basic_test()
{
    //  Show LCD Test Text
  LCD_Test();
  
  //  Refresh LED
  //outport(LED_GREEN_BASE,LED_GREEN_VALUE);
  //outport(LED_RED_BASE,LED_RED_VALUE);
  //  Refresh SEG7
  //seg7_show(SEG7_DISPLAY_BASE,SEG7_VALUE);
  //  Set Button PIO Interrupts
  init_button_irq();
}
//-------------------------------------------------------------------------
