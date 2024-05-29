Readme - Web Server Software Example

DESCRIPTION:	
A Web Server running from a file system in flash memory.

PERIPHERALS USED:
This example exercises the following peripherals:
- Ethernet MAC (named "lan91c111" in SOPC Builder)
- STDOUT device (UART or JTAG UART)
- LCD Display (named "lcd_display" in SOPC Builder)

SOFTWARE SOURCE FILES:
This example includes the following software source files:

- web_server.c: Contains the bulk of the code, including main(), the
  networking initialization routines, the web server task (WSTask), and all of
  board control utilities/tasks.  

- http.c: Implementation of an HTTP server including all necessary sockets
  calls to handle a multiple connections and parsing basic HTTP commands to 
  handle GET and POST requests. Requests for files via HTTP GET requests direct
  the server to fetch the file, if available, from the flash file system and 
  send it to the client requesting it.

- http.h: Header information defining HTTP server implementation and common
  HTTP server strings & constants.

- web_server.h: Definitions for the entire example application.

- network_utilities.c: Contains MAC address, IP address, and DHCP routines to
  manage addressing. These are used by NicheStack during initialization, but are
  implementation-specific (for any implementation of this example not an Altera 
  Nios development board, Stratix, Stratix Professional, or Cyclone edition, 
  this file will need to be modified to control addressing in your system).

- alt_error_handler.[ch]:  Contains a simple error handler for MicroC/OS-II
  errors.

- srec_flash.c:  Contain the SREC parsing and flash programming routines needed   for remote configuration.

BOARD/HOST REQUIREMENTS:
This example requires an Ethernet cable connected to the development board's 
RJ-45 jack, and a JTAG connection with the development board. If the host 
communication settings are changed from JTAG UART (default) to use a
conventional UART, a serial cable between board DB-9 connector  and the host is
required. 

If DHCP is available, the application will attempt to obtain an IP
address from a DHCP server. Otherwise, a static IP address (defined in
web_server.h) will be assigned after a timeout. 

KNOWN ISSUES/LIMITATIONS
The read-only zip filesystem must be set to a flash memory device whose base
address is 0x0 (note that you may place read-only zip file system contents 
at any offset within the flash memory device). This limitation is scheduled
to be corrected in a future Nios development kit release.

ADDITIONAL INFORMATION:
Not all characters will display as typed on the LCD display.  This is because
HTML forms send unicode, for some characters, and standard ASCII for others.
This HTTP server will "translate" unicode (%20) spaces, but any other charac-
ters sent with leading spaces will pass through to the LCD.

This is an example HTTP server using NichStack on MicroC/OS-II. The server can 
process basic requests to serve HTML, JPEG, and GIF files from the Altera 
read-only zip file system. It is in no way a complete implementation of a 
full-featured HTTP server.

This example uses the sockets interface. A good introduction to sockets 
programming is the book Unix Network Programming by Richard Stevens. Additionally, 
the text "Sockets in C", by Donahoo & Calvert, is a concise & inexpensive text for
getting started with sockets programming.

To run the HTTP server, you must first program the file system using the Nios II Flash 
Programmer. The read-only zip file system contents 
come from a .zip file ("ro_zipfs.zip" by default) in your application's BSP project by default. When the web-server application is built, the 
contents of this zip file are extracted and converted into a flash programming
file.
This file will be programmed into flash allowing the HTTP server
to fetch content at runtime. 

To build & run the web-server application, perform the following steps:

   === I.  BUILD PROJECT ===
1. After creating a new "Web Server" software example project and referring to 
   a Nios II hardware example design .sopcinfo file, 
   you may build it by choosing "Build All" from the Nios II Software Build Tools
   for Eclipse "Project" menu.
  
2. Wait for the build process to complete. During the software build, the
   files necessary to run this example are generated.

   === II. PROGRAM FLASH === 
1. Select the web-server application project (the default project name is 
   "web_server_0" unless specified otherwise during project creation).
   
2. From the "Nios II" menu, select "Flash Programmer".

2. Select "Flash Programmer" under the list of "Configurations:".

3. Press New.

4. Press Program Flash.

   Flash on your development board will now be programmed with the 
   web-server application, read-only zip file system contents, and a 
   boot-copier program. When your board is programmed with an
   appropriate .sof file, the web-server application will boot and
   serve web content from flash in the read-only zip file system.

   === III. DEBUG ===
   The above instructions will allow you to run the web server when the FPGA
   has been configured. If you wish to manually download the web-server 
   application (for example, after making an edit and re-compiling), or if you
   wish to debug the web-server application, the following steps apply:

1. Program an appropriate hardware design (.sof file) into the FPGA 
   using the Quartus II Programmer.
   
2. In the Nios II Software Build Tools for Eclipse,
   again select the web server application project.

3. From the "Run" menu, select "Debug..." (to launch the debugger) or 
   "Run..." (to   download software to RAM and execute).

4. Select a "Nios II Hardware".

5. Press "New".

6. Press "Run" or "Debug" as appropriate.

=== Remote Configuration ===
Basic remote configuration features are included with this webserver.  The
methodology chosen uses multipart forms (HTML standard) to upload the hardware
or software images and then a series of additional web pages to control the
flow.

The basic steps are:

1.  Fill out the multipart-form.
    - Choose the flash for your image when doing this.
    NOTE:  Only the Develop Kit flash names are currently supported.
           - ext_flash(CFI)
           - epcs_controller(EPCS)
           If you have differing flash names, you'll need to change the web
           content to reflect these names.
    - Select the image you'd like to upload
           - This is usually a .flash file produced (and tested) using
             the flash programmer.
2.  Upload your selected image.
    - This could take a while, depending on the size of your image.
    - On completion, a new page will load giving you a new form for programming
      the flash.
3.  Program the Flash
    - Click the button in the form located on the Remote Configuration section
      of this page and the flash will start programming.
    - Again, this could take a while...
    - Upon completion, you'll see a "reset system" option in the Remote
      Configuration section.
4.  Reset the System
    - If this is the only image you need to update, then reset your system to 
      see if it functions.
    - If you need to update more images (hardware or software) click the main
      hyperlink (takes you back to the main/index page) and repeat steps
      1-3 as necessary.


Note: This example will not run on the Instruction Set Simulator (ISS).
