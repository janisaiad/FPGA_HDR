DE2_115_NIOS_DEVICE_LED
-------------------

This designs uses a Nios II system to demonstrate how to communicate with the DE2-115 board via the USB device connection. The software on the PC communicates with the DE2-115 board to tell it to increment an internal counter. The value of the counter is displayed on the board and sent back to the PC software.

A USB cable should be used to connect the host computer to the USB DEVICE port on the DE2-115 board. The design's hardware and software work together to identify the DE2-115 board as a USB device to the host computer. The first time this design is used, the host computer will need to install a driver to work with the DE2-115 USB device - please see 'Running the Design' for driver installation instructions.

Running the Design
------------------

1) Launch the Quartus II software.
2) Open the DE2_115_NIOS_DEVICE_LED.qpf project located in the <install path>\DE2_115_NIOS_DEVICE_LED folder. (File menu -> Open Project)
3) Open the Programmer window. (Tools menu -> Programmer)
4) The DE2_70_NIOS_DEVICE_LED.sof programming file should be listed.
   Check the 'Program/Configure' box and set up the JTAG programming hardware connection via the 'Hardware Setup' button.
5) Press 'Start' to start programming. The design should now be programmed.
6) Launch the Nios II IDE.
7) Switch the workspace to the <install path>\DE2_115_NIOS_DEVICE_LED folder.
8) Build the project. (Project menu -> Build All)
9) Run the project on the board. (Run menu)
10) Plug in a USB cable with one end connected to the USB DEVICE port on the DE2-115 board and the other to the host computer.
11) If this is the first time using this design, the host computer will need install a driver to identify the board as a USB device. In the installation file, specify the USB driver to be the file <install path>\DE2_70_NIOS_DEVICE_LED\driver\D12test.inf.
12) Run the ISP1362DcUsb.exe program, located in the <install path>\DE2_115_NIOS_DEVICE_LED folder.

Use the program to increment and clear the counter on the FPGA.


User Inputs to the Design
-------------------------

None.

Compiling the Design
--------------------

1) Launch the Quartus II software.
2) Open the DE2_115_NIOS_DEVICE_LED.qpf project located in the <install path>\DE2_70_NIOS_DEVICE_LED folder. (File menu -> Open Project)
3) Start compilation. (Processing -> Start Compilation)
4) After compilation is finished, you can run the design with the generated SOF file. See 'Running the Design' above, which includes steps to build the Nios II project.
