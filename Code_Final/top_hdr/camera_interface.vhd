library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity camera_interface is port(
	clock						:	in		std_logic;
	clock_25					:	in		std_logic;
	reset						:	in		std_logic;
	
	exposition				:	in		std_logic_vector(11 downto 0);
	pixel_address			:	out	std_logic_vector(15 downto 0);
	pixel_data				:	out	std_logic_vector(7 downto 0);
	good_pixel				:	out	std_logic;
	

	-- Camera interface()
	camera_serial_clock	:	out	std_logic;
	camera_master_clock	:	out	std_logic;
	camera_serial_data	:	inout	std_logic;
	camera_line_valid		:	in		std_logic;
	camera_frame_valid	:	in		std_logic;
	camera_pixel_clock	:	in		std_logic;
	camera_data				:	in		std_logic_vector(9 downto 0);
	
	config_done				:	out	std_logic
);
end camera_interface;

architecture rtl of camera_interface is

	component I2C_CMOS_Config port(
		 clk        : in std_logic;
		 rst_n      : in std_logic;
		 exposition : in std_logic_vector(11 downto 0);
		 I2C_SCLK   : out std_logic;
		 I2C_DIR    : out std_logic;
		 I2C_SDATo  : out std_logic;
		 I2C_SDATi  : in std_logic);
	end component;
	
	signal i2c_serial_clock		:	std_logic;
	signal i2c_serial_data		:	std_logic;
	signal i2c_dir					:	std_logic;
	
	constant memory_size	:	integer := 65536;
	signal cnt	:	integer range 0 to memory_size;

begin

	G0: I2C_CMOS_Config port map(
		clk 			=> clock,
		rst_n			=>	not reset,
		exposition	=> exposition,
		I2C_SCLK		=> i2c_serial_clock,
		I2C_DIR		=> i2c_dir,
		I2C_SDATo	=>	i2c_serial_data,
		I2C_SDATi	=> camera_serial_data);
		
	camera_serial_data <= i2c_serial_data when i2c_dir='1' else 'Z';
	camera_serial_clock <= i2c_serial_clock;
	camera_master_clock <= clock_25;
	
	--get data from the camera
	p1: process(clock_25)
	begin
		if rising_edge(clock_25) then
			--read valid pixel
			if camera_line_valid='1' and camera_frame_valid='1' then
				--update memory index for write
				if cnt = memory_size - 1 then
					cnt <= 0;
				else
					cnt <= cnt + 1;
				end if;
				
				good_pixel <= '1';
				pixel_address <= std_logic_vector(to_unsigned(cnt, pixel_address'length));
				pixel_data <= camera_data(9 downto 2);
			else
				good_pixel <= '0';
				pixel_address <= "0000000000000000";
			end if;
		end if;
	end process;
	
end rtl;