#ifndef _INC_ISA290_H_
#define _INC_ISA290_H_

unsigned long  findPCIdev(unsigned long classcode, unsigned long *puBaseAddress, unsigned long *puIntLevel);
void	set_pci_bridge( void );

extern unsigned int		hc_data;
extern unsigned int		hc_com;
extern unsigned int		dc_data;
extern unsigned int		dc_com;
extern unsigned int		g_ISA_base_address;
extern unsigned int		g_1161_command_address;
extern unsigned int		g_1161_data_address;
extern unsigned char	g_host_IRQ_num;
extern unsigned char	g_is_PCI;

#endif //_INC_ISA290_H_

