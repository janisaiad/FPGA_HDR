library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_hdr is
  port
  (

    ---- PORTION DE LA PROF -----
    CLOCK_50 : in std_logic;
    KEY      : in std_logic_vector(3 downto 0);
    SW       : in std_logic_vector(15 downto 0);

    VGA_CLK     : out std_logic; --Clock
    VGA_HS      : out std_logic; --H_SYNC
    VGA_VS      : out std_logic; --V_SYNC
    VGA_BLANK_N : out std_logic; --BLANK
    VGA_SYNC_N  : out std_logic; --SYNC
    VGA_R       : out std_logic_vector(7 downto 0); --Red  [7:0]
    VGA_G       : out std_logic_vector(7 downto 0); --Green[7:0]
    VGA_B       : out std_logic_vector(7 downto 0); --Blue [7:0]

    -- depuis CMOS
    CMOS_DATA   : in std_logic_vector(9 downto 0);
    CMOS_PIXCLK : in std_logic;
    CMOS_LVAL   : in std_logic;
    CMOS_FVAL   : in std_logic;

    -- vers CMOS
    CMOS_MCLK : out std_logic;
    CMOS_SCLK : out std_logic;
    CMOS_SDAT : inout std_logic;

    LEDG : out std_logic_vector(7 downto 0)
    --GPIO        : out std_logic_vector(31 downto 0) -- vers logicport

    --GPIO_J2     : inout std_logic_vector(35 downto 4) -- depuis camera CMOS
    --GPIO_J3     : inout std_logic_vector(35 downto 4)  -- vers logicport
  );
end top_hdr;

architecture rtl of top_hdr is
  ---- COMPONENTS AJOUTES ----
  component module_sdram_rw
    port
    (
      -- connections to sdram controller;
      clk_i  : in std_logic; -- 25 MHz;
      rst_i  : in std_logic; -- reset;
      addr_i : out std_logic_vector(24 downto 0); -- address;
      dat_i  : out std_logic_vector(31 downto 0); -- data to write;
      dat_o  : in std_logic_vector(31 downto 0); -- data to read;
      we_i   : out std_logic; -- write enable;
      ack_o  : in std_logic; -- acknowledge;
      stb_i  : out std_logic; -- strobe;
      cyc_i  : out std_logic; -- cycle;
      -- connections or which we need to
      -- generate addresses and pass image data from SDRAM;
      --addr_buf2 : out std_logic_vector (16 downto 0);
      --dout_buf2 : out std_logic_vector(11 downto 0);
      --we_buf2   : out std_logic;
      -- connections from frame buffer 1 from where we 
      -- take snapshot; we of buf 1 is controlled by ov7670_capture
      -- here we only read from buffer 1 but at 50 MHz clock;
      --addr_buf1 : out std_logic_vector (16 downto 0);
      --din_buf1  : in std_logic_vector(11 downto 0);
      -- rw controls
      --take_snapshot    : in std_logic; -- store to SDRAM;
      --display_snapshot : in std_logic; -- read/fetch from SDRAM;
      --led_done         : out std_logic

      -- signals for LUT read mode
      lut_read_mode : in std_logic; -- Indicateur de lecture de la LUT
      lut_read_addr : in std_logic_vector(24 downto 0); -- Adresse de lecture de la LUT
      lut_read_data : out std_logic_vector(23 downto 0); -- Données lues de la LUT
      done_lut      : in std_logic; -- Indicateur que la LUT a bien été lue

      --- Pixel read/write mode;
      -- General info;
      pixel_addr : in std_logic_vector(24 downto 0); -- Address of the pixel to read/write
      pixel_done : out std_logic;                   -- Indicateur que le pixel a bien été lu/écrit

      -- Write mode;
      pixel_write_mode : in std_logic; -- Indicateur de mode d'écriture
      pixel_write_data : in std_logic_vector(31 downto 0); -- Données à écrire

      -- Read mode;
      pixel_read_mode : in std_logic; -- Indicateur de mode de lecture
      pixel_read_data : out std_logic_vector(31 downto 0) -- Données lues
    );
  end component;

  component sdram_controller
    port
    (
      clk_i      : in std_logic; 
      dram_clk_i : in std_logic;
      rst_i      : in std_logic;
      dll_locked : in std_logic;
      -- all ddr signals
      dram_addr  : out std_logic_vector(12 downto 0);
      dram_bank  : out std_logic_vector(1 downto 0);
      dram_cas_n : out std_logic;
      dram_cke   : out std_logic;
      dram_clk   : out std_logic;
      dram_cs_n  : out std_logic;
      dram_dq    : inout std_logic_vector(15 downto 0);
      dram_ldqm  : out std_logic;
      dram_udqm  : out std_logic;
      dram_ras_n : out std_logic;
      dram_we_n  : out std_logic;
      -- wishbone bus
      addr_i : in std_logic_vector(24 downto 0);
      dat_i  : in std_logic_vector(31 downto 0);
      dat_o  : out std_logic_vector(31 downto 0);
      we_i   : in std_logic;
      ack_o  : out std_logic;
      stb_i  : in std_logic;
      cyc_i  : in std_logic
    );
  end component;

  component module_lecture_lut
    port
    (
      rgb_in     : in std_logic_vector(17 downto 0);
      rgb_out    : out std_logic_vector(23 downto 0);
      clk        : in std_logic;
      rst        : in std_logic;
      LUT_SIZE   : in integer;
      LUT_OFFSET : in integer;

      -- Signals for module_sdram_rw
      addr_lut : out std_logic_vector(24 downto 0);
      data_lut : in std_logic_vector(31 downto 0);
      lut_read : out std_logic
      done_lut : out std_logic
    );
  end component;

  component module_interpolation
    port
    (
      clk     : in std_logic;
      rst     : in std_logic;
      rgb_in  : in std_logic_vector(23 downto 0);
      rgb_out : out std_logic_vector(23 downto 0);

      -- Lecture LUT
      rgb_in_lut          : in std_logic_vector(17 downto 0);
      rgb_out_lut         : out std_logic_vector(23 downto 0);
      LUT_SIZE            : in integer;
      done_lut            : in std_logic -- Indicateur que la LUT a bien été lue
      done_interpolation  : out std_logic -- Indicateur que l'interpolation a bien été effectuée
      start_interpolation : in std_logic -- Indicateur de demande d'interpolation
    );
  end component;

  component module_app_lut_per_pixel
    port
    (
      clk   : in std_logic;
      reset : in std_logic;

      --- In/out RGB
      pixel_in  : in std_logic_vector(31 downto 0);
      pixel_out : out std_logic_vector(31 downto 0);

      --- LUT
      LUT_INVERSE_OFFSET : in std_integer;
      LUT_NORMAL_OFFSET  : in std_integer;

      --- Commandes et info
      pixel_start : in std_logic;
      pixel_done  : out std_logic;

      --- Commandes de l'interpolation
      interpolation_start  : out std_logic;
      interpolation_done   : in std_logic;
      LUT_OFFSET           : in std_integer;
      pixel_to_interpolate : out std_logic_vector(31 downto 0);
      pixel_interpolated   : in std_logic_vector(31 downto 0)
    );
  end component;
  ---- COMPONENTS DE LA PROF ----
  component pll is
    port
    (
      inclk0 : in std_logic := '0';
      c0     : out std_logic;
      c1     : out std_logic
    );
  end component;

  -- configuration du CMOS par le bus I2C
  component I2C_CMOS_Config is
    port
    (
      clk        : in std_logic;
      rst_n      : in std_logic;
      exposition : in std_logic_vector(15 downto 0);
      I2C_SCLK   : out std_logic;
      I2C_DIR    : out std_logic;
      I2C_SDATo  : out std_logic;
      I2C_SDATi  : in std_logic
    );
  end component;

  component vga_640_480 is
    port
    (
      CLOCK_25  : in std_logic;
      CLOCK_pix : in std_logic;
      reset     : in std_logic;
      picture   : in std_logic;
      movie     : in std_logic;
      data_in   : in std_logic_vector(7 downto 0);
      Line_val  : in std_logic;
      Frame_val : in std_logic;
      WrAdd     : in std_logic_vector(18 downto 0);

      VGA_CLK     : out std_logic; --Clock
      VGA_HS      : out std_logic; --H_SYNC
      VGA_VS      : out std_logic; --V_SYNC
      VGA_BLANK_N : out std_logic; --BLANK
      VGA_SYNC_N  : out std_logic; --SYNC
      VGA_R       : out std_logic_vector(7 downto 0); --Red[7:0]
      VGA_G       : out std_logic_vector(7 downto 0); --Green[7:0]
      VGA_B       : out std_logic_vector(7 downto 0) --Blue[7:0]
    );
  end component;

  ----SIGNAUX AJOUTES ----

  --- Image LUT application related;
  signal start_lut_image  : std_logic                     := '0';
  signal lut_image_done   : std_logic                     := '0';
  signal NB_PIXELS        : integer                       := 0;
  signal start_image_addr : std_logic_vector(24 downto 0) := (others => '0');
  signal final_image_addr : std_logic_vector(24 downto 0) := (others => '0');
  --- LUT related;
  signal lut_read_mode : std_logic;
  signal lut_read_addr : std_logic_vector(24 downto 0);
  signal         : std_logic_vector(15 downto 0);
  signal LUT_SIZE      : integer := 6; -- 64 elements; 
  signal LUT_OFFSET    : integer := 0;
  signal lut_in        : std_logic_vector(17 downto 0);
  signal done_lut      : std_logic := '0';

  --- Read/write pixel related;
  signal pixel_write_mode : std_logic := '0';
  signal pixel_read_mode  : std_logic := '0';
  signal pixel_write_data : std_logic_vector(31 downto 0);
  signal pixel_read_data  : std_logic_vector(31 downto 0);
  signal pixel_addr       : std_logic_vector(24 downto 0);
  signal pixel_done       : std_logic := '0';

  --- Interpolation related;
  signal rgb_in              : std_logic_vector(23 downto 0);
  signal rgb_out             : std_logic_vector(23 downto 0);
  signal done_interpolation  : std_logic := '0';
  signal start_interpolation : std_logic := '0';

  --- Application par pixel related;
  signal pixel_in    : std_logic_vector(31 downto 0);
  signal pixel_out   : std_logic_vector(31 downto 0);
  signal pixel_start : std_logic := '0';
  signal done_pixel  : std_logic := '0';

  --- Offsets related;
  signal LUT_NORMAL_OFFSET  : integer := 0;
  signal LUT_INVERSE_OFFSET : integer := 0;

  --- SDRAM related;
  signal clk_100       : std_logic; -- clk0: 100 MHz
  signal clk_100_3ns   : std_logic; -- clk1: 100 MHz with phase adjustment of -3ns
  signal clk_50_camera : std_logic; -- clk2: 50 MHz
  signal clk_25_vga    : std_logic; -- clk3: 25 MHz
  signal dll_locked    : std_logic;
  signal dram_bank     : std_logic_vector(1 downto 0);
  signal addr_i        : std_logic_vector(24 downto 0);
  signal dat_i         : std_logic_vector(31 downto 0);
  signal dat_o         : std_logic_vector(31 downto 0);
  signal we_i          : std_logic;
  signal ack_o         : std_logic;
  signal stb_i         : std_logic;
  signal cyc_i         : std_logic;

  ---- SIGNAUX DE LA PROF ----
  signal CLOCK_25, CLOCK_25d : std_logic;
  signal SCLK, SDAT          : std_logic;
  signal I2C_DIR             : std_logic;
  signal I2C_SDATo           : std_logic;
  signal I2C_SDATi           : std_logic;

  constant seuil      : std_logic_vector(9 downto 0)                     := "1000000000";
  signal pix_counter  : integer range 0 to (((640 * 2) * (480 * 2)) - 1) := 0;
  signal line_counter : integer range 0 to ((480 * 2) - 1)               := 0;

  signal lumi        : std_logic_vector(0 downto 0);
  signal lumi_buffer : std_logic_vector(0 downto 0);
  signal Wren        : std_logic;
  signal WrAdd       : std_logic_vector(18 downto 0);

  signal CLK1, CLK2 : std_logic;

  signal rst_n      : std_logic;
  signal exposition : std_logic_vector(15 downto 0);

begin

  ---- INSTANCIATION DES MODULES AJOUTES ----
  component module_app_lut_image
    port
    (
      clk   : in std_logic;
      reset : in std_logic;

      -- Commandes application de la LUT à l'image
      start_lut_image  : in std_logic;
      lut_image_done   : out std_logic;
      NB_PIXELS        : in integer;
      start_image_addr : in std_logic_vector(24 downto 0);
      final_image_addr : in std_logic_vector(24 downto 0);

      -- Read/write pixels from/to SDRAM
      write_mode : out std_logic;
      read_mode  : out std_logic;
      address    : out std_logic_vector(24 downto 0);
      read_data  : in std_logic_vector(31 downto 0);
      write_data : out std_logic_vector(31 downto 0);
      rw_done    : in std_logic;

      -- Commandes pour la LUT
      start_pixel_lut : out std_logic;
      pixel_todo      : out std_logic_vector(31 downto 0);
      pixel_did       : in std_logic_vector(31 downto 0);
      pixel_lut_done  : in std_logic
    );

    component module_lecture_lut
      port
      (
        rgb_in     : in std_logic_vector(17 downto 0);
        rgb_out    : out std_logic_vector(23 downto 0);
        clk        : in std_logic;
        rst        : in std_logic;
        LUT_SIZE   : in integer;
        LUT_OFFSET : in integer;

        -- Signals for module_sdram_rw
        addr_lut : out std_logic_vector(24 downto 0);
        data_lut : in std_logic_vector(31 downto 0);
        lut_read : out std_logic
        done_lut : out std_logic
      );
    end component;

  component module_interpolation
    port
    (
      clk     : in std_logic;
      rst     : in std_logic;
      rgb_in  : in std_logic_vector(23 downto 0);
      rgb_out : out std_logic_vector(23 downto 0);

      -- Lecture LUT
      rgb_in_lut          : in std_logic_vector(17 downto 0);
      rgb_out_lut         : out std_logic_vector(23 downto 0);
      LUT_SIZE            : in integer;
      done_lut            : in std_logic -- Indicateur que la LUT a bien été lue
      done_interpolation  : out std_logic -- Indicateur que l'interpolation a bien été effectuée
      start_interpolation : in std_logic -- Indicateur de demande d'interpolation
    );
  end component;

  component module_app_lut_per_pixel
    port
    (
      clk   : in std_logic;
      reset : in std_logic;

      --- In/out RGB
      pixel_in  : in std_logic_vector(31 downto 0);
      pixel_out : out std_logic_vector(31 downto 0);

      --- LUT
      LUT_INVERSE_OFFSET : in std_integer;
      LUT_NORMAL_OFFSET  : in std_integer;

      --- Commandes et info
      pixel_start : in std_logic;
      pixel_done  : out std_logic;

      --- Commandes de l'interpolation
      interpolation_start  : out std_logic;
      interpolation_done   : in std_logic;
      LUT_OFFSET           : in std_integer;
      pixel_to_interpolate : out std_logic_vector(31 downto 0);
      pixel_interpolated   : in std_logic_vector(31 downto 0)
    );
  end component;

  -- DE2-115 board has an Altera Cyclone V E, which has ALTPLLs;
  component my_altpll
    port
    (
      areset : in std_logic := '0';
      inclk0 : in std_logic := '0';
      c0     : out std_logic;
      c1     : out std_logic;
      c2     : out std_logic;
      c3     : out std_logic;
      locked : out std_logic
    );
  end component;

  ---- MAPPING DES MODULES AJOUTES ----
  start_lut_image <= '1' when KEY(0) = '1' else
    '0';

  Inst_module_app_lut_image : module_app_lut_image
  port map
  (
    clk   => CLOCK_25,
    reset => rst
    -- Commandes application de la LUT à l'image
    start_lut_image  => start_lut_image,
    lut_image_done   => lut_image_done,
    NB_PIXELS        => NB_PIXELS,
    start_image_addr => start_image_addr,
    final_image_addr => final_image_addr,
    -- Read/write pixels from/to SDRAM
    write_mode => pixel_write_mode,
    read_mode  => pixel_read_mode,
    address    => pixel_addr,
    read_data  => pixel_read_data,
    write_data => pixel_write_data,
    rw_done    => done_pixel,
    -- Commandes pour la LUT
    start_pixel_lut => pixel_start,
    pixel_todo      => pixel_in,
    pixel_did       => pixel_out,
    pixel_lut_done  => done_pixel
  );

  -- clocks generation;
  Inst_four_clocks_pll : my_altpll port
  map
  (
  areset => '0', -- reset_general?
  inclk0 => clk_50,
  c0     => clk_100,
  c1     => clk_100_3ns,
  c2     => clk_50_camera,
  c3     => clk_25_vga,
  locked => dll_locked -- drives an LED and SDRAM controller;
  );

  Inst_sdram_controller : sdram_controller port
  map (
  clk_i      => clk_100,
  dram_clk_i => clk_100_3ns,
  rst_i      => reset_sdram_interface,
  dll_locked => dll_locked,
  -- all sdram signals
  dram_addr  => DRAM_ADDR,
  dram_bank  => dram_bank,
  dram_cas_n => DRAM_CAS_N,
  dram_cke   => DRAM_CKE,
  dram_clk   => DRAM_CLK,
  dram_cs_n  => DRAM_CS_N,
  dram_dq    => DRAM_DQ,
  dram_ldqm  => DRAM_LDQM,
  dram_udqm  => DRAM_UDQM,
  dram_ras_n => DRAM_RAS_N,
  dram_we_n  => DRAM_WE_N,
  -- wishbone bus;
  addr_i => addr_i,
  dat_i  => dat_i,
  dat_o  => dat_o,
  we_i   => we_i,
  ack_o  => ack_o,
  stb_i  => stb_i,
  cyc_i  => cyc_i
  );

  Inst_module_sdram_rw : module_sdram_rw port
  map (
  -- connections to sdram controller;
  clk_i  => clk_25_vga,
  rst_i  => reset_sdram_interface,
  addr_i => addr_i,
  dat_i  => dat_i,
  dat_o  => dat_o,
  we_i   => we_i,
  ack_o  => ack_o,
  stb_i  => stb_i,
  cyc_i  => cyc_i,

  -- connection for module_lecture_lut
  lut_read_mode => lut_read_mode,
  lut_read_addr => lut_read_addr,
  lut_read_data => lut_read_data,
  done_lut      => done_lut,

  -- connections for read/write pixel
  pixel_addr       => pixel_addr,
  pixel_done       => pixel_done,
  pixel_write_mode => pixel_write_mode,
  pixel_write_data => pixel_write_data,
  pixel_read_mode  => pixel_read_mode,
  pixel_read_data  => pixel_read_data
  );

  -- Instanciation du module de traitement de la LUT par pixel
  Inst_module_app_lut_per_pixel : module_app_lut_per_pixel
  port
  map
  (
  clk                  => clk_50_camera,
  reset                => rst,
  pixel_in             => pixel_in,
  pixel_out            => pixel_out,
  LUT_INVERSE_OFFSET   => LUT_INVERSE_OFFSET,
  LUT_NORMAL_OFFSET    => LUT_NORMAL_OFFSET,
  pixel_start          => pixel_start,
  pixel_done           => pixel_done,
  interpolation_start  => start_interpolation,
  interpolation_done   => done_interpolation,
  LUT_OFFSET           => LUT_OFFSET,
  pixel_to_interpolate => rgb_in,
  pixel_interpolated   => rgb_out
  );

  -- Instanciation du module de lecture de la LUT
  Inst_module_lecture_lut : module_lecture_lut
  port
  map
  (
  clk        => clk_50_camera, -- 50MHz pour la caméra
  rst        => rst, -- Reset général
  rgb_in     => lut_in, -- Entrée de la LUT
  lut_out    => lut_out -- Sortie de la LUT // rgb_out
  LUT_SIZE   => LUT_SIZE, -- Taille de la LUT
  LUT_OFFSET => LUT_OFFSET,  -- Offset de la LUT

  -- Signals for module_sdram_rw
  addr_lut => lut_read_addr,
  data_lut => lut_read_data,
  lut_read => lut_read_mode
  done_lut => done_lut
  );

  -- Instanciation du module d'interpolation
  Inst_module_interpolation : module_interpolation
  port
  map
  (
  clk     => clk,
  rst     => rst,
  rgb_in  => rgb_in,
  rgb_out => rgb_out,

  -- Lecture LUT
  rgb_in_lut          => lut_in,
  rgb_out_lut         => lut_out,
  LUT_SIZE            => LUT_SIZE,
  done_lut            => done_lut,
  done_interpolation  => done_interpolation,
  start_interpolation => start_interpolation
  );
  --- Process de choix des LUT
  process (CLOCK_25)
  begin
    if rising_edge(CLOCK_25) then

      -- Gestion des différentes LUT avec les switchs
      -- En fonction du switch on va modifier le LUT_OFFSET avec l'adresse des LUT choisies

      -- Choix de la LUT normale
      if SW(1 downto 0) = "00" then
        LUT_NORMAL_OFFSET <= 00800000; -- Reinhard Normal
      elsif SW(1 downto 0) = "01" then
        LUT_NORMAL_OFFSET <= 0; -- Uncharted2filmic Normal
      elsif SW(1 downto 0) = "10" then
        LUT_NORMAL_OFFSET <= 0; -- BakingLabACES Normal
      elsif SW(1 downto 0) = "11" then
        LUT_NORMAL_OFFSET <= 0; -- NarkowiczACES Normal
      else
        LUT_NORMAL_OFFSET <= 0; -- Reinhard Normal par défaut
      end if;

      -- Choix de la LUT inverse
      if SW(3 downto 2) = "00" then
        LUT_INVERSE_OFFSET <= 0; -- Reinhard Inverse
      elsif SW(3 downto 2) = "01" then
        LUT_INVERSE_OFFSET <= 0; -- Uncharted2filmic Inverse
      elsif SW(3 downto 2) = "10" then
        LUT_INVERSE_OFFSET <= 0; -- BakingLabACES Inverse
      elsif SW(3 downto 2) = "11" then
        LUT_INVERSE_OFFSET <= 0; -- NarkowiczACES Inverse
      else
        LUT_INVERSE_OFFSET <= 0; -- Reinhard Inverse par défaut
      end if;

    end if;
  end process;

  ---- INSTANCIATION DES MODULES DE LA PROF ----
  pll_inst : pll port
  map
  (inclk0 => CLOCK_50, c0 => CLOCK_25, c1 => CLOCK_25d);
  CMOS_MCLK <= CLOCK_25; -- 25MHz
  rst_n <= KEY(1);
  LEDG(0) <= CMOS_PIXCLK;
  exposition <= SW(15 downto 4);
  CMOS_SCLK <= SCLK;
  CMOS_SDAT <= I2C_SDATo when I2C_DIR = '1' else
    'Z';
  I2C_SDATi <= CMOS_SDAT;

  I2C_CMOS_Config_inst : I2C_CMOS_Config
  port
  map (
  clk        => CLOCK_50,
  rst_n      => rst_n,
  exposition => exposition,
  I2C_SCLK   => SCLK,
  I2C_DIR    => I2C_DIR,
  I2C_SDATo  => I2C_SDATo, -- !!!! inout vers/depuis CMOS
  I2C_SDATi  => I2C_SDATi -- !!!! inout vers/depuis CMOS
  );

  process (CLOCK_25)
  begin
    if rising_edge(CLOCK_25) then
      if CMOS_FVAL = '1' then
        if CMOS_LVAL = '1' then
          lumi_buffer <= lumi;
          if pix_counter < (((640 * 2) * (480 * 2)) - 1) then
            pix_counter <= pix_counter + 1;
          else
            pix_counter <= 0;
          end if;
        end if;
      else
        pix_counter <= 0;
      end if;
    end if;
  end process;

  lumi <= "1" when CMOS_DATA > seuil else
    "0";

  WrAdd <= std_logic_vector(to_unsigned(pix_counter, 19));

  VGA_inst : vga_640_480
  port
  map(
  CLOCK_25  => CLOCK_25,
  CLOCK_pix => CMOS_PIXCLK,
  reset     => not rst_n,
  picture   => not KEY(3),
  movie     => not KEY(2),
  data_in   => CMOS_DATA(9 downto 2),
  Line_val  => CMOS_LVAL,
  Frame_val => CMOS_FVAL,
  WrAdd     => WrAdd,

  VGA_CLK     => VGA_CLK, --Clock
  VGA_HS      => VGA_HS, --H_SYNC
  VGA_VS      => VGA_VS, --V_SYNC
  VGA_BLANK_N => VGA_BLANK_N, --BLANK
  VGA_SYNC_N  => VGA_SYNC_N, --SYNC
  VGA_R       => VGA_R, --Red  [7:0]
  VGA_G       => VGA_G, --Green[7:0]
  VGA_B       => VGA_B --Blue [7:0]
  );
  --GPIO(9 downto 0) <= CMOS_DATA;
  --GPIO(10) <= CMOS_PIXCLK;
  --GPIO(11) <= CLOCK_25; -- 25MHz
  --GPIO(12) <= CMOS_LVAL;
  --GPIO(13) <= CMOS_FVAL;
  --GPIO(14) <= SCLK;
  --GPIO(15) <= I2C_SDATi;
  --GPIO(31 downto 16) <= (others => '0');

  --GPIO_J2(13 downto 4) <= CMOS_DATA;
  --GPIO_J2(14) <= CMOS_PIXCLK;
  --GPIO_J2(15) <= CMOS_MCLK;
  --GPIO_J2(16) <= CMOS_LVAL;
  --GPIO_J2(17) <= CMOS_FVAL;
  --GPIO_J2(18) <= GPIO(14);
  --GPIO_J2(19) <= GPIO(15);

  CLK1 <= CLOCK_25;
  CLK2 <= CMOS_PIXCLK;

  --GPIO_J2(31 downto 20) <= (others => '0');
  --GPIO_J2(32) <= '0';
  --GPIO_J2(33) <= CLK1;
  --GPIO_J2(34) <= '0';
  --GPIO_J2(35) <= CLK2;

  --GPIO_J3(13 downto 4) <= CMOS_DATA;
  --GPIO_J3(14) <= CMOS_PIXCLK;
  --GPIO_J3(15) <= CLOCK_25;
  --GPIO_J3(16) <= CMOS_LVAL;
  --GPIO_J3(17) <= CMOS_FVAL;
  --GPIO_J3(18) <= SCLK;
  --GPIO_J3(19) <= SDAT;
  --GPIO_J3(31 downto 20) <= (others => '0');
  --GPIO_J3(32) <= '0';
  --GPIO_J3(33) <= CLK1;
  --GPIO_J3(34) <= '0';
  --GPIO_J3(35) <= CLK2;

end rtl;