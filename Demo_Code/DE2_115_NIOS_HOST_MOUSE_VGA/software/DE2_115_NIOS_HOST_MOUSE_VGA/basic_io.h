#ifndef   __basic_io_H__
#define   __basic_io_H__

#include <io.h>

//  for GPIO
#define inport(base)                                  IORD(base, 0) 
#define outport(base, data)                           IOWR(base, 0, data)
#define get_pio_dir(base)                             IORD(base, 1) 
#define set_pio_dir(base, data)                       IOWR(base, 1, data)
#define get_pio_irq_mask(base)                        IORD(base, 2) 
#define set_pio_irq_mask(base, data)                  IOWR(base, 2, data)
#define get_pio_edge_cap(base)                        IORD(base, 3) 
#define set_pio_edge_cap(base, data)                  IOWR(base, 3, data)

//  for SEG7 Display
#define seg7_show(base,data)                          IOWR(base, 0, data)


#endif
