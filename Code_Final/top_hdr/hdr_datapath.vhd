
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdr_datapath is
    port (
        clock						:	in		std_logic;
        clock_25					:	in		std_logic;
        reset						:	in		std_logic;  
        
      -- CAMERA INTERFACE
        exposition				:	in		std_logic_vector(11 downto 0);
        camera_serial_clock	:	out	std_logic;
        camera_master_clock	:	out	std_logic;
        camera_serial_data	: 	inout	std_logic;
        camera_line_valid		:	in		std_logic;
        camera_frame_valid	:	in		std_logic;
        camera_pixel_clock	:	in		std_logic;
        camera_data				:	in		std_logic_vector(9 downto 0);

      -- VGA INTERFACE-- 
        vga_hsync				:	inout	std_logic;
        vga_vsync				:	inout	std_logic;
        vga_red					:	out	std_logic_vector(7 downto 0);
        vga_green				:	out	std_logic_vector(7 downto 0);
        vga_blue					:	out	std_logic_vector(7 downto 0);
        vga_nblank				:	out	std_logic;
        vga_nsync				:	out	std_logic;
        vga_clock				 :	out	std_logic;
        --- LUT INTERFACE ---
        lut_normal_offset		:	in		integer; -- Offset de la LUT normale
        lut_inverse_offset		:	in		integer -- Offset de la LUT inverse




    );
    end hdr_datapath;


    
	




architecture rtl of hdr_datapath is



  component ram_image port(
			address_a		: in 	std_logic_vector(15 downto 0);
			address_b		: in 	std_logic_vector(15 downto 0);
			clock				: in 	std_logic;
			data_a			: in 	std_logic_vector (7 downto 0);
			data_b			: in 	std_logic_vector (7 downto 0);
			wren_a			: in 	std_logic;
			wren_b			: in 	std_logic;
			q_a				: out std_logic_vector (7 downto 0);
			q_b				: out std_logic_vector (7 downto 0) 
			);
	end component;


  


    
	component ram_lut_doubleport port(
		address_a		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
		
end component;





    component vga_interface port(
		clock				:	in		std_logic;
		clock_25			:	in		std_logic;
		vga_hsync		:	inout	std_logic;
		vga_vsync		:	inout	std_logic;
		vga_red			:	out	std_logic_vector(7 downto 0);
		vga_green		:	out	std_logic_vector(7 downto 0);
		vga_blue			:	out	std_logic_vector(7 downto 0);
		vga_nblank		:	out	std_logic;
		vga_nsync		:	out	std_logic;
		vga_clock		:	out	std_logic;
		pixel_value		:	in 	std_logic_vector(7 downto 0);
		pixel_address	:	out	std_logic_vector(15 downto 0)
		);
	end component;


    component camera_interface port(
		clock						:	in		std_logic;
		clock_25					:	in		std_logic;
		reset						:	in		std_logic;
		exposition				:	in		std_logic_vector(11 downto 0);
		pixel_address			:	out	std_logic_vector(15 downto 0);
		pixel_data				:	out	std_logic_vector(7 downto 0);
		good_pixel				:	out	std_logic;
		camera_serial_clock	:	out	std_logic;
		camera_master_clock	:	out	std_logic;
		camera_serial_data	:	inout	std_logic;
		camera_line_valid		:	in		std_logic;
		camera_frame_valid	:	in		std_logic;
		camera_pixel_clock	:	in		std_logic;
		camera_data				:	in		std_logic_vector(9 downto 0);
		config_done				:	out	std_logic);
	end component;







	signal config_done : std_LOGIC;








  ----SIGNAUX AJOUTES ----

  signal exposition_internal : std_logic_vector(11 downto 0);

  signal LUT_OFFSET_NORMAL : integer;
  signal LUT_OFFSET_INVERSE : integer ;


  signal pixel_to_write_in_vga_mem : std_logic_vector(7 downto 0);
  signal pixel_after_lut_normal : std_logic_vector(7 downto 0);
  signal pixel_after_lut_inverse : std_logic_vector(7 downto 0);
  signal pixel_captured_camera : std_logic_vector(7 downto 0);



  signal pixel_address_vga, pixel_address_camera : std_logic_vector(15 downto 0);
  signal pixel_value_vga, pixel_value_camera : std_logic_vector(7 downto 0);

  signal address_pixel_ram_lutinverse : std_logic_vector(10 downto 0);
  signal address_pixel_ram_lutnormal : std_logic_vector(10 downto 0);


	signal temp_pixel_after_lut_inverse : std_logic_vector(7 downto 0);
	signal write_enable_camera_data, good_pixel_camera : std_logic;



begin 

	lut_OFFSET_NORMAL <= lut_normal_offset;
	lut_OFFSET_INVERSE <=  lut_inverse_offset;

	
address_pixel_ram_lutinverse <= std_logic_vector(unsigned(pixel_value_camera) + to_unsigned(LUT_OFFSET_INVERSE,11 ));

address_pixel_ram_lutnormal <= std_logic_vector(unsigned(temp_pixel_after_lut_inverse) + to_unsigned(LUT_OFFSET_NORMAL,11));
pixel_to_write_in_vga_mem <= pixel_after_lut_normal;




G1: ram_lut_doubleport port map(
      address_a		=> address_pixel_ram_lutinverse,
			address_b		=> address_pixel_ram_lutnormal,
			clock				=> clock_25,
			data_a			=> "00000000",
			data_b			=> "00000000",
			wren_a			=> '0', -- only read lut
			wren_b			=> '0', -- only read lut
			q_a				=> temp_pixel_after_lut_inverse,
			q_b				=> pixel_after_lut_normal);




    G0: ram_image port map(
			address_a		=> pixel_address_camera, -- address of the pixel that we want to write
			address_b		=> pixel_address_vga, -- address of the pixel in the vga ram that vga want to read
			clock				=> clock_25,
			data_a			=> pixel_to_write_in_vga_mem, -- the pixel that has been read from the lut, pixel_to_write_in_vga_mem
			data_b			=> "00000000",
			wren_a			=> '1', -- we always write in the ram the pixel after lut
			wren_b			=> '0', --port dedicated for vga read
			q_a				=> pixel_captured_camera, -- the pixel that has been read from the camera
			q_b				=> pixel_value_vga
	);



    G2: vga_interface port map(
		clock				=> clock,
		clock_25			=> clock_25,
		
		vga_hsync		=> vga_hsync,
		vga_vsync		=> vga_vsync,
		vga_red			=> vga_red,
		vga_green		=> vga_green,
		vga_blue			=> vga_blue,
		vga_nblank		=> vga_nblank,
		vga_nsync		=> vga_nsync,
		vga_clock		=> vga_clock,
		
		pixel_value		=> pixel_value_vga,
		pixel_address	=> pixel_address_vga);


    G3: camera_interface port map(
		clock						=> clock,
		clock_25					=>	clock_25,
		reset						=> reset,
		exposition				=> exposition_internal,
		pixel_address			=> pixel_address_camera,
		pixel_data				=> pixel_value_camera,
		good_pixel				=> good_pixel_camera,


    -- CAMERA INTERFACE
		camera_serial_clock	=> camera_serial_clock,
		camera_master_clock	=> camera_master_clock,
		camera_serial_data	=> camera_serial_data,
		camera_line_valid		=> camera_line_valid,
		camera_frame_valid	=> camera_frame_valid,
		camera_pixel_clock	=> camera_pixel_clock,
		camera_data				=>	camera_data,
		config_done				=> config_done);







  















  
end rtl;