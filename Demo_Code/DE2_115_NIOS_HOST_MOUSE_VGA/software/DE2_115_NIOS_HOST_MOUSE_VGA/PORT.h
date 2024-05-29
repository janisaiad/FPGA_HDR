#ifndef   __PORT_H__
#define   __PORT_H__
void enable_port(void);
void reset_usb(void);

void set_operational(void);


void port_monitor(void);

void check_ports(void);
unsigned int assign_address(unsigned int addr1, unsigned int addr2, int mode);
#endif