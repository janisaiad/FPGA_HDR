-- cristinel ababei; Feb.18.2015; CopyLeft (CL);
-- project done using Quartus II 13.1 and tested on DE2-115;
--
-- code name: "digital cam implementation #3";
-- features: 
--   > video mode; 
--   > take snapshot and save on SDRAM; 
--   > display snapshot from sdram;
--   > gray filter; 
--   > edge detection algorithm based on Sobel filter;
--
-- this design basically connects a CMOS camera (OV7670 module) to
-- DE2-115 board; video frames are picked up from camera, buffered
-- on the FPGA (using embedded RAM), and displayed on the VGA monitor,
-- which is also connected to the board; clock signals generated
-- inside FPGA using ALTPLL's that take as input the board's 50MHz signal
-- from on-board oscillator; 
-- in addition, we integrate an sdram controller to write and read
-- from sdram chip a whole frame; plus, we have implemented a B&W filter
-- as well as and edge detection algorithm;
--
-- see detailed description of the "digital camera project" at:
-- http://dejazzer.com/coen4790/DIGITAL_CAMERA/digital_camera.html
-- Credits (these are some projects from where I might have adapted code,
-- thank you!):
-- http://hamsterworks.co.nz/mediawiki/index.php/OV7670_camera <--- ov7670-fpga-vga pipeline
-- http://whoyouvotefor.info/altera_sdram.shtml <--- sdram verilog project for de2 board
-- https://code.google.com/p/vhdl-project <--- sobel filter for edge detection
--
 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity digital_cam_impl3 is
  Port ( clk_50 : in STD_LOGIC;
    slide_sw_RESET : in STD_LOGIC; -- reset the whole animal;
    slide_sw_resend_reg_values : in STD_LOGIC; -- rewrite all OV7670's registers;
    LED_config_finished : out STD_LOGIC; -- lets us know camera registers are now written;
    LED_dll_locked : out STD_LOGIC; -- PLL is locked now;
    btn_take_snapshot : in STD_LOGIC; -- KEY0
    btn_display_snapshot : in STD_LOGIC; -- KEY1
    btn_do_black_white : in STD_LOGIC; -- KEY2
    btn_do_edge_detection : in STD_LOGIC; -- KEY3
    
    vga_hsync : out STD_LOGIC;
    vga_vsync : out STD_LOGIC;
    vga_r     : out STD_LOGIC_vector(7 downto 0);
    vga_g     : out STD_LOGIC_vector(7 downto 0);
    vga_b     : out STD_LOGIC_vector(7 downto 0);
    vga_blank_N : out STD_LOGIC;
    vga_sync_N  : out STD_LOGIC;
    vga_CLK     : out STD_LOGIC;
    
    ov7670_pclk  : in STD_LOGIC;
    ov7670_xclk  : out STD_LOGIC;
    ov7670_vsync : in STD_LOGIC;
    ov7670_href  : in STD_LOGIC;
    ov7670_data  : in STD_LOGIC_vector(7 downto 0);
    ov7670_sioc  : out STD_LOGIC;
    ov7670_siod  : inout STD_LOGIC;
    ov7670_pwdn  : out STD_LOGIC;
    ov7670_reset : out STD_LOGIC;
    
    LED_done : out STD_LOGIC; -- done snapshot just brought from SDRAM, or done BW, or done ED;
    -- SDRAM related signals
    DRAM_ADDR : out STD_LOGIC_vector(12 downto 0); 
    DRAM_BA_0 : out STD_LOGIC;
    DRAM_BA_1 : out STD_LOGIC;
    DRAM_CAS_N : out STD_LOGIC;
    DRAM_CKE : out STD_LOGIC;
    DRAM_CLK : out STD_LOGIC;
    DRAM_CS_N : out STD_LOGIC;
    DRAM_DQ : inout STD_LOGIC_vector(15 downto 0);
    -- we use here just the SDRAM chip U15 shown on page 64 of DE2-115 user manual;
    -- DRAM_DQM[0] is DRAM_LDQM of U15 chip;
    -- DRAM_DQM[1] is DRAM_UDQM of U15 chip;
    DRAM_LDQM : out STD_LOGIC; 
    DRAM_UDQM : out STD_LOGIC;
    DRAM_RAS_N : out STD_LOGIC;
    DRAM_WE_N : out STD_LOGIC    
  );
end digital_cam_impl3;


architecture my_structural of digital_cam_impl3 is


  COMPONENT do_edge_detection 
  Port ( 
    rst_i : in  STD_LOGIC;
    clk_i : in  STD_LOGIC; -- 25 MHz
    enable_sobel_filter : in  STD_LOGIC;
    led_sobel_done : out  STD_LOGIC; 
    rdaddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    din_buf2 : IN std_logic_vector(11 downto 0);
    wraddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    dout_buf2 : OUT std_logic_vector(11 downto 0);
    we_buf2 : OUT std_logic
  );
  end COMPONENT;

  COMPONENT do_black_white
  Port ( 
    rst_i : in  STD_LOGIC;
    clk_i : in  STD_LOGIC; -- 25 MHz
    enable_filter : in  STD_LOGIC;
    led_done : out  STD_LOGIC;
    rdaddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    din_buf2 : IN std_logic_vector(11 downto 0);
    wraddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    dout_buf2 : OUT std_logic_vector(11 downto 0);
    we_buf2 : OUT std_logic
  );
  end COMPONENT;

  COMPONENT sdram_rw 
    Port ( 
      -- connections to sdram controller;
      clk_i : in  STD_LOGIC;
      rst_i : in  STD_LOGIC;
      addr_i : out  STD_LOGIC_vector(24 downto 0); 
      dat_i : out  STD_LOGIC_vector(31 downto 0);
      dat_o : in  STD_LOGIC_vector(31 downto 0);
      we_i : out  STD_LOGIC;
      ack_o : in  STD_LOGIC;
      stb_i : out  STD_LOGIC;
      cyc_i : out  STD_LOGIC;
      -- connections to frame buffer 2 for which we need to
      -- generate addresses and pass image data from SDRAM;
      addr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
      dout_buf2 : OUT std_logic_vector(11 downto 0);
      we_buf2 : OUT std_logic;
      -- connections from frame buffer 1 from where we 
      -- take snapshot; we of buf 1 is controlled by ov7670_capture
      -- here we only read from buffer 1 but at 50 MHz clock;
      addr_buf1 : OUT STD_LOGIC_VECTOR (16 downto 0);
      din_buf1 : IN std_logic_vector(11 downto 0);
      -- rw controls
      take_snapshot : in  STD_LOGIC; -- store to SDRAM;
      display_snapshot : in  STD_LOGIC; -- read/fetch from SDRAM;
      led_done : out  STD_LOGIC
    );
  end COMPONENT;

  COMPONENT sdram_controller 
    Port (
      clk_i: in  STD_LOGIC;
      dram_clk_i: in  STD_LOGIC;
      rst_i: in  STD_LOGIC;
      dll_locked: in  STD_LOGIC;
      -- all ddr signals
      dram_addr: out  STD_LOGIC_vector(12 downto 0); 
      dram_bank: out  STD_LOGIC_vector(1 downto 0);
      dram_cas_n: out  STD_LOGIC;
      dram_cke: out  STD_LOGIC;
      dram_clk: out  STD_LOGIC;
      dram_cs_n: out  STD_LOGIC;
      dram_dq: inout  STD_LOGIC_vector(15 downto 0);
      dram_ldqm: out  STD_LOGIC;
      dram_udqm: out  STD_LOGIC;
      dram_ras_n: out  STD_LOGIC;
      dram_we_n: out  STD_LOGIC;
      -- wishbone bus
      addr_i: in  STD_LOGIC_vector(24 downto 0); 
      dat_i: in  STD_LOGIC_vector(31 downto 0);
      dat_o: out  STD_LOGIC_vector(31 downto 0);
      we_i: in  STD_LOGIC;
      ack_o: out  STD_LOGIC;
      stb_i: in  STD_LOGIC;
      cyc_i: in  STD_LOGIC
    );
  end COMPONENT;


  COMPONENT VGA
  PORT(
    CLK25 : IN std_logic;    
    Hsync : OUT std_logic;
    Vsync : OUT std_logic;
    Nblank : OUT std_logic;      
    clkout : OUT std_logic;
    activeArea : OUT std_logic;
    Nsync : OUT std_logic
    );
  END COMPONENT;

  COMPONENT ov7670_controller
  PORT(
    clk : IN std_logic;
    resend : IN std_logic;    
    siod : INOUT std_logic;      
    config_finished : OUT std_logic;
    sioc : OUT std_logic;
    reset : OUT std_logic;
    pwdn : OUT std_logic;
    xclk : OUT std_logic
    );
  END COMPONENT;

  COMPONENT frame_buffer
  PORT(
    data : IN std_logic_vector(11 downto 0);
    rdaddress : IN std_logic_vector(16 downto 0);
    rdclock : IN std_logic;
    wraddress : IN std_logic_vector(16 downto 0);
    wrclock : IN std_logic;
    wren : IN std_logic;          
    q : OUT std_logic_vector(11 downto 0)
    );
  END COMPONENT;

  COMPONENT ov7670_capture
  PORT(
    pclk : IN std_logic;
    vsync : IN std_logic;
    href : IN std_logic;
    d : IN std_logic_vector(7 downto 0);          
    addr : OUT std_logic_vector(16 downto 0);
    dout : OUT std_logic_vector(11 downto 0);
    we : OUT std_logic
    );
  END COMPONENT;

  COMPONENT RGB
  PORT(
    Din : IN std_logic_vector(11 downto 0);
    Nblank : IN std_logic;          
    R : OUT std_logic_vector(7 downto 0);
    G : OUT std_logic_vector(7 downto 0);
    B : OUT std_logic_vector(7 downto 0)
    );
  END COMPONENT;

  COMPONENT Address_Generator
  PORT(
    rst_i : in std_logic;
    CLK25       : IN  std_logic;
    enable      : IN  std_logic;       
    vsync       : in  STD_LOGIC;
    address     : OUT std_logic_vector(16 downto 0)
    );
  END COMPONENT;

  COMPONENT debounce
    Port ( 
      clk : in  STD_LOGIC;
      i : in  STD_LOGIC;
      o : out  STD_LOGIC);
  end COMPONENT;
  
  -- DE2-115 board has an Altera Cyclone V E, which has ALTPLLs;
  COMPONENT my_altpll
  PORT
  (
    areset    : IN STD_LOGIC  := '0';
    inclk0    : IN STD_LOGIC  := '0';
    c0    : OUT STD_LOGIC ;
    c1    : OUT STD_LOGIC ;
    c2    : OUT STD_LOGIC ;
    c3    : OUT STD_LOGIC ;
    locked    : OUT STD_LOGIC 
  );
  END COMPONENT;

  -- use the Altera MegaWizard to generate the ALTPLL module; generate 3 clocks, 
  -- clk0 @ 100 MHz
  -- clk1 @ 100 MHz with a phase adjustment of -3ns
  -- clk2 @ 50 MHz and 
  -- clk3 @ 25 MHz 
  signal clk_100 : std_logic;       -- clk0: 100 MHz
  signal clk_100_3ns : std_logic;   -- clk1: 100 MHz with phase adjustment of -3ns
  signal clk_50_camera : std_logic; -- clk2: 50 MHz
  signal clk_25_vga : std_logic;    -- clk3: 25 MHz
  signal dll_locked : std_logic;
  signal done_snapshot : std_logic := '0';
  signal done_BW : std_logic := '0';
  signal done_ED : std_logic := '0';

  -- buffer 1: when in video mode, rd address comes from address_generator and rd clock is 25 MHz
  -- when take snapshot mode, rd address comes from sdram_rw and rd clock is 25 MHz;
  signal wren_buf_1 : std_logic;
  signal wraddress_buf_1 : std_logic_vector(16 downto 0);
  signal wrdata_buf_1 : std_logic_vector(11 downto 0);
  signal rdaddress_buf_1 : std_logic_vector(16 downto 0); 
  signal rddata_buf_1 : std_logic_vector(11 downto 0);
  -- signals generated by different entities will be multiplexed to the
  -- inputs above of the buffer 1;
  signal wren_buf1_from_ov7670_capture : std_logic;
  signal rdaddress_buf12_from_addr_gen : std_logic_vector(16 downto 0); -- muxed to both buf1 and buf2;
  signal rdaddress_buf1_from_sdram_rw : std_logic_vector(16 downto 0); 
  
  -- buffer 2: is written into snapshot image to be displayed; also, written
  -- into snapshot converted to grey image; also, written into the edge detected
  -- image;
  signal wren_buf_2 : std_logic;
  signal wraddress_buf_2 : std_logic_vector(16 downto 0);
  signal wrdata_buf_2 : std_logic_vector(11 downto 0);  
  signal rdaddress_buf_2 : std_logic_vector(16 downto 0);
  signal rddata_buf_2 : std_logic_vector(11 downto 0);
  -- signals to control buffer 2 when reading SDRAM and writing into buffer 2;
  signal wren_buf2_from_sdram_rw : std_logic; 
  signal wraddress_buf2_from_sdram_rw : std_logic_vector(16 downto 0);
  signal wrdata_buf2_from_sdram_rw : std_logic_vector(11 downto 0);
  -- signals to control buffer 2 when reading it, do black and white, and then write back into it;
  signal rdaddress_buf2_from_do_BW : std_logic_vector(16 downto 0);
  signal wren_buf2_from_do_BW : std_logic; 
  signal wraddress_buf2_from_do_BW : std_logic_vector(16 downto 0);
  signal wrdata_buf2_from_do_BW : std_logic_vector(11 downto 0);
  -- signals to control buffer 2 when reading it, do edge detection, and then write back into it;
  signal rdaddress_buf2_from_do_ED : std_logic_vector(16 downto 0);
  signal wren_buf2_from_do_ED : std_logic; 
  signal wraddress_buf2_from_do_ED : std_logic_vector(16 downto 0);
  signal wrdata_buf2_from_do_ED : std_logic_vector(11 downto 0);  
  
  -- user controls;
  signal resend_reg_values : std_logic;
  signal take_snapshot : std_logic;
  signal display_snapshot : std_logic;
  signal call_black_white : STD_LOGIC;
  signal call_edge_detection : STD_LOGIC;
  signal take_snapshot_synchronized : std_logic := '0';  
  signal display_snapshot_synchronized : std_logic := '0';
  signal call_black_white_synchronized : std_logic := '0';  
  signal call_edge_detection_synchronized : std_logic := '0';
  
  signal reset_global : std_logic;
  signal reset_manual : std_logic; -- by the user;
  signal reset_automatic : std_logic;
  signal reset_sdram_interface : std_logic;
  signal reset_BW_entity : std_logic;
  signal reset_ED_entity : std_logic;

  -- RGB related;
  signal red,green,blue : std_logic_vector(7 downto 0);
  signal activeArea : std_logic;
  signal nBlank     : std_logic;
  signal vSync      : std_logic;
  -- data_to_rgb should the multiplexing of rddata_buf_1 (when displaying
  -- video directly) or rddata_buf_2 (when displaying the contents of buffer 2
  -- which has snapshot taken earlier and saved in SDRAM or some "processed"
  -- version of that snapshot);
  signal data_to_rgb : std_logic_vector(11 downto 0);

  --- SDRAM relted;
  signal dram_bank: std_logic_vector(1 downto 0);
  signal addr_i: std_logic_vector(24 downto 0);
  signal dat_i: std_logic_vector(31 downto 0);
  signal dat_o: std_logic_vector(31 downto 0);
  signal we_i: std_logic;
  signal ack_o: std_logic;
  signal stb_i: std_logic;
  signal cyc_i: std_logic;


begin

  -- take the inverted push buttons because KEY# on DE2-115 board generates
  -- a signal 111000111; with 1 with not pressed and 0 when pressed/pushed;
  take_snapshot <= not btn_take_snapshot; -- KEY0
  display_snapshot <= not btn_display_snapshot; -- KEY1
  call_black_white <= not btn_do_black_white; -- KEY2
  call_edge_detection <= not btn_do_edge_detection; -- KEY3 
  
  vga_r <= red(7 downto 0);
  vga_g <= green(7 downto 0);
  vga_b <= blue(7 downto 0);
  vga_vsync <= vsync;
  vga_blank_N <= nBlank;
  
  LED_dll_locked <= '1'; -- dll_locked; -- LEDRed[0] notifies user;
  LED_done <= (done_snapshot or done_BW or done_ED); -- output of top-level entity;
  
  -- clocks generation;
  Inst_four_clocks_pll: my_altpll PORT MAP(
    areset => '0', -- reset_general?
    inclk0 => clk_50,
    c0 => clk_100,
    c1 => clk_100_3ns,
    c2 => clk_50_camera,
    c3 => clk_25_vga,
    locked => dll_locked -- drives an LED and SDRAM controller;
  );
  
  -- debouncing slide switches;
  -- take entity input slide_sw_resend_reg_values and debounce it to
  -- get clean resend_reg_values signal;
  -- same for debouncing of slide_sw_RESET to get clean reset_general;
  Inst_debounce_resend: debounce PORT MAP(
    clk => clk_25_vga,
    i   => slide_sw_resend_reg_values,
    o   => resend_reg_values
  );  
  Inst_debounce_reset: debounce PORT MAP(
    clk => clk_25_vga,
    i   => slide_sw_RESET,
    o   => reset_manual
  );  
  -- first thing when the system is powered on, I should automatically
  -- reset everything for a few clock cycles;
  reset_automatic <= '0'; -- for the time being;
  reset_global <= (reset_manual or reset_automatic);
  
  
  -- generate pulse signals only when vsync is '0' to take frame
  -- synchronized with the beginning of it; otherwise, pixels may be picked-up 
  -- from different frames;
  take_snapshot_synchronized <= take_snapshot and (not vsync);
  display_snapshot_synchronized <= display_snapshot and (not vsync);
  call_black_white_synchronized <= call_black_white and (not vsync);
  call_edge_detection_synchronized <= call_edge_detection and (not vsync);

  
  -- implementing muxes for rdaddress inputs of the frame buffers;
  process (clk_100)
  begin
    if rising_edge (clk_100) then
      if (take_snapshot = '1') then
        wren_buf_1 <= '0'; -- disable writing into buffer 1 while taking a snapshot;
        rdaddress_buf_1 <= rdaddress_buf1_from_sdram_rw; -- comes from sdram_rw entity;
        wren_buf_2 <= wren_buf2_from_sdram_rw; -- buf2 wr signals hooked to sdram_rw;
        wraddress_buf_2 <= wraddress_buf2_from_sdram_rw;
        wrdata_buf_2 <= wrdata_buf2_from_sdram_rw;
        rdaddress_buf_2 <= rdaddress_buf12_from_addr_gen; -- buf2 rd signals default;        
        data_to_rgb <= rddata_buf_2; -- show buf 2 on VGA monitor;
      elsif (display_snapshot = '1') then
        wren_buf_1 <= '0'; -- buf1 writing disabled;
        rdaddress_buf_1 <= rdaddress_buf12_from_addr_gen; -- default
        wren_buf_2 <= wren_buf2_from_sdram_rw; -- buf2 wr signals hooked to sdram_rw;
        wraddress_buf_2 <= wraddress_buf2_from_sdram_rw;
        wrdata_buf_2 <= wrdata_buf2_from_sdram_rw;
        rdaddress_buf_2 <= rdaddress_buf12_from_addr_gen; -- buf2 rd signals default;
        data_to_rgb <= rddata_buf_2; -- show buf2 on VGA monitor;
      elsif (call_black_white = '1') then
        wren_buf_1 <= '0'; -- buf1 writing disabled;
        rdaddress_buf_1 <= rdaddress_buf12_from_addr_gen; -- default
        wren_buf_2 <= wren_buf2_from_do_BW; -- buf2 wr signals hooked to do_black_white;
        wraddress_buf_2 <= wraddress_buf2_from_do_BW;
        wrdata_buf_2 <= wrdata_buf2_from_do_BW;
        -- Note: here is a tricky aspect; buf2 rdaddress signal is hooked to the do_black_white
        -- entity *only* for the duration of applyng the BW filter (actually grey filter) to each
        -- individual pixel data, which is written back to buf2; once all pixels are done, we
        -- should "switch" rdaddress signal to be used from rdaddress_buf12_from_addr_gen entity,
        -- because do_black_white entity enters into idle state where all is still; but, we still
        -- need draddress to drive buf2 so that its content is displayed on the VGA monitor;
        -- we do that by making the switch with the help of done_BW:
        if (done_BW = '0') then
          rdaddress_buf_2 <= rdaddress_buf2_from_do_BW;
        else 
          rdaddress_buf_2 <= rdaddress_buf12_from_addr_gen;
        end if; 
        data_to_rgb <= rddata_buf_2; -- show buf2 on VGA monitor;      
      elsif (call_edge_detection = '1') then
        wren_buf_1 <= '0'; -- buf1 writing disabled;
        rdaddress_buf_1 <= rdaddress_buf12_from_addr_gen; -- default
        wren_buf_2 <= wren_buf2_from_do_ED; -- buf2 wr signals hooked to do_edge_detection;
        wraddress_buf_2 <= wraddress_buf2_from_do_ED;
        wrdata_buf_2 <= wrdata_buf2_from_do_ED;
        if (done_ED = '0') then
          rdaddress_buf_2 <= rdaddress_buf2_from_do_ED;
        else 
          rdaddress_buf_2 <= rdaddress_buf12_from_addr_gen;
        end if;
        data_to_rgb <= rddata_buf_2; -- show buf2 on VGA monitor;
      else -- this is default "video mode";
        wren_buf_1 <= wren_buf1_from_ov7670_capture; -- wr into buf1 frames from camera;
        rdaddress_buf_1 <= rdaddress_buf12_from_addr_gen; -- default;
        wren_buf_2 <= wren_buf2_from_sdram_rw; -- buf2 wr signals hooked to sdram_rw;
        wraddress_buf_2 <= wraddress_buf2_from_sdram_rw;
        wrdata_buf_2 <= wrdata_buf2_from_sdram_rw;
        rdaddress_buf_2 <= rdaddress_buf12_from_addr_gen; -- buf2 rd signals default;        
        data_to_rgb <= rddata_buf_1; -- show buf1 on VGA monitor;
      end if;
    end if;
  end process;
  -- process resposible with generating reset pulse on falling edge of take_snapshot
  -- or display_snapshot; 
  process (clk_100)
  begin
    if rising_edge (clk_100) then
      if (reset_global = '1') then
        reset_sdram_interface <= '1';
        reset_BW_entity <= '1';
        reset_ED_entity <= '1';
      elsif ((take_snapshot='0' and display_snapshot='0' and call_black_white='0' and call_edge_detection='0') and 
          (done_snapshot='1' or done_BW='1' or done_ED='1')) then
        reset_sdram_interface <= '1';
        reset_BW_entity <= '1';
        reset_ED_entity <= '1';
      else
        reset_sdram_interface <= '0';
        reset_BW_entity <= '0';
        reset_ED_entity <= '0';
      end if;
    end if;
  end process;
  
  
  -- video frames are buffered into buffer_1; from here frames are "pipelined"
  -- into the VGA thing; also from buffer_1 we take one frame and
  -- save into SDRAM when push button KEY0 is pressed - that means "take snapshot!";
  Inst_frame_buf_1: frame_buffer PORT MAP(
    rdaddress => rdaddress_buf_1,
    rdclock   => clk_25_vga, 
    q         => rddata_buf_1, -- goes to data_to_rgb thru mux;    
    wrclock   => ov7670_pclk, -- clock from camera module;
    wraddress => wraddress_buf_1,
    data      => wrdata_buf_1,
    wren      => wren_buf_1
  );
  -- buffer 2 is used to bring frame from sdram; and displayed then on VGA thing;
  Inst_frame_buf_2: frame_buffer PORT MAP(
    rdaddress => rdaddress_buf_2,
    rdclock   => clk_25_vga,
    q         => rddata_buf_2, -- goes to data_to_rgb thru mux;    
    wrclock   => clk_25_vga, 
    wraddress => wraddress_buf_2,
    data      => wrdata_buf_2,
    wren      => wren_buf_2
  );  
  

  -- camera module related blocks;
  Inst_ov7670_controller: ov7670_controller PORT MAP(
    clk             => clk_50_camera,
    resend          => resend_reg_values, -- debounced;
    config_finished => LED_config_finished, -- LEDRed[1] notifies user;
    sioc            => ov7670_sioc,
    siod            => ov7670_siod,
    reset           => ov7670_reset,
    pwdn            => ov7670_pwdn,
    xclk            => ov7670_xclk
  );
   
  Inst_ov7670_capture: ov7670_capture PORT MAP(
    pclk  => ov7670_pclk,
    vsync => ov7670_vsync,
    href  => ov7670_href,
    d     => ov7670_data,
    addr  => wraddress_buf_1, -- default; wraddress_buf_1 always driven by ov7670_capture;
    dout  => wrdata_buf_1, -- default; wrdata_buf_1 always driven by ov7670_capture;
    we    => wren_buf1_from_ov7670_capture -- goes to mux of wren_buf_1;
  );
  
  
  -- VGA related stuff;
  Inst_VGA: VGA PORT MAP(
    CLK25      => clk_25_vga,
    clkout     => vga_CLK,
    Hsync      => vga_hsync,
    Vsync      => vsync,
    Nblank     => nBlank,
    Nsync      => vga_sync_N,
    activeArea => activeArea
  );  
  
  Inst_RGB: RGB PORT MAP(
    Din => data_to_rgb, -- comes from rddata_buf_1 or rddata_buf_2;
    Nblank => activeArea,
    R => red,
    G => green,
    B => blue
  );

  Inst_Address_Generator: Address_Generator PORT MAP(
    rst_i => '0',
    CLK25 => clk_25_vga,
    enable => activeArea,
    vsync => vsync,
    address => rdaddress_buf12_from_addr_gen -- goes to muxes of rdaddress_buf_1 and rdaddress_buf_2;
  );
  
  -- SDRAM related;
  DRAM_BA_1 <= dram_bank(1);
  DRAM_BA_0 <= dram_bank(0);
  
  Inst_sdram_controller: sdram_controller PORT MAP (
    clk_i => clk_100,
    dram_clk_i => clk_100_3ns,
    rst_i => reset_sdram_interface,
    dll_locked => dll_locked,
    -- all sdram signals
    dram_addr => DRAM_ADDR,
    dram_bank => dram_bank,
    dram_cas_n => DRAM_CAS_N,
    dram_cke => DRAM_CKE,
    dram_clk => DRAM_CLK,
    dram_cs_n => DRAM_CS_N,
    dram_dq => DRAM_DQ,
    dram_ldqm => DRAM_LDQM,
    dram_udqm => DRAM_UDQM,
    dram_ras_n => DRAM_RAS_N,
    dram_we_n => DRAM_WE_N,
    -- wishbone bus;
    addr_i => addr_i,
    dat_i => dat_i,
    dat_o => dat_o,
    we_i => we_i,
    ack_o => ack_o,
    stb_i => stb_i,
    cyc_i => cyc_i
  );

  -- Note: here I use take_snapshot_synchronized and display_snapshot_synchronized
  -- so that taking or displaying is done once only for a press of the push buttons,
  -- no matter how long by the user;
  -- however, once the user released the pushbutton, the system should be ready to take 
  -- another shot again; to achieve that, I apply an automatic reset pulse,
  -- once take_snapshot and display_snapshot are released, i.e., they go back to '0';
  Inst_sdram_rw: sdram_rw PORT MAP (
    -- connections to sdram controller;
    clk_i => clk_25_vga,
    rst_i => reset_sdram_interface,
    addr_i => addr_i,
    dat_i => dat_i,
    dat_o => dat_o,
    we_i => we_i,
    ack_o => ack_o,
    stb_i => stb_i,
    cyc_i => cyc_i,
    -- connections to frame buffer 2 
    addr_buf2 => wraddress_buf2_from_sdram_rw, -- goes to mux of wraddress_buf_2;
    dout_buf2 => wrdata_buf2_from_sdram_rw, -- goes to mux of wrdata_buf_2;
    we_buf2 => wren_buf2_from_sdram_rw, -- goes to mux of wren_buf_2;
    -- connections from frame buffer 1
    addr_buf1 => rdaddress_buf1_from_sdram_rw, -- goes to mux of rdaddress_buf_1;
    din_buf1 => rddata_buf_1, -- comes from out of buf1;
    -- rw controls
    take_snapshot => take_snapshot_synchronized,
    display_snapshot => display_snapshot_synchronized,
    led_done => done_snapshot -- notify user on LEDGreen[1] that image from/to SDRAM is finished;
  );  

  
  -- black_white (actually grey) filter; reads and writes into buf2;
  Inst_black_white: do_black_white PORT MAP (
    rst_i => reset_BW_entity,
    clk_i => clk_25_vga,
    enable_filter => call_black_white_synchronized,
    led_done => done_BW,
    rdaddr_buf2 => rdaddress_buf2_from_do_BW, -- goes to mux of rdaddress_buf_2;
    din_buf2 => rddata_buf_2, -- comes from out of buf2;
    wraddr_buf2 => wraddress_buf2_from_do_BW, -- goes to mux of wraddress_buf_2;
    dout_buf2 => wrdata_buf2_from_do_BW, -- goes to mux of wrdata_buf_2;
    we_buf2 => wren_buf2_from_do_BW -- goes to mux of wren_buf_2;
  );


  -- Sobel edge detection;
  Inst_edge_detection: do_edge_detection PORT MAP (  
    rst_i => reset_ED_entity,
    clk_i => clk_25_vga, 
    enable_sobel_filter => call_edge_detection_synchronized,
    led_sobel_done => done_ED,
    rdaddr_buf2 => rdaddress_buf2_from_do_ED, -- goes to mux of rdaddress_buf_2;
    din_buf2 => rddata_buf_2, -- comes from out of buf2;
    wraddr_buf2 => wraddress_buf2_from_do_ED, -- goes to mux of wraddress_buf_2;
    dout_buf2 => wrdata_buf2_from_do_ED, -- goes to mux of wrdata_buf_2;
    we_buf2 => wren_buf2_from_do_ED -- goes to mux of wren_buf_2;
  );
  
end my_structural;
