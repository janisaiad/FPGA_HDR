#ifndef ISP1362_HAL_H_
#define ISP1362_HAL_H_

#include "basic_io.h"
#include "system.h"

/* richard note:
 A0: phase selection
    0: data phase
    1: command phase
 A1: bus selection
    0: host (HC)
    1: device (DC)
*/



#define USB_HC_DATA_READ()          IORD(USB_HC_BASE, 0)
#define USB_HC_DATA_WRITE(value)    IOWR(USB_HC_BASE, 0, value)
#define USB_HC_CMD_READ()           IORD(USB_HC_BASE, 1)
#define USB_HC_CMD_WRITE(value)     IOWR(USB_HC_BASE, 1, value)


#define USB_DC_DATA_READ()          IORD(USB_DC_BASE, 0)
#define USB_DC_DATA_WRITE(value)    IOWR(USB_DC_BASE, 0, value)
#define USB_DC_CMD_READ()           IORD(USB_DC_BASE, 1)
#define USB_DC_CMD_WRITE(value)     IOWR(USB_DC_BASE, 1, value)

#endif /*USB_DRIVER_H_*/
