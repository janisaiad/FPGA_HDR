--- /!\ NE PAS OUBLIER D INDIQUER LES ADRESSES DES LUT /!\

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_hdr is
  -- Déclarer les ports ici
  port
  (
    clk : in std_logic;
    rst : in std_logic;

    -- Switchs de contrôle
    switchs : in std_logic_vector(7 downto 0)

  );
end entity top_hdr;
architecture rtl of top_hdr is
  -- Déclarer les signaux internes ici
  --- LUT related;
  signal lut_read_mode : std_logic;
  signal lut_read_addr : std_logic_vector(24 downto 0);
  signal lut_out       : std_logic_vector(15 downto 0);
  signal LUT_SIZE      : integer := 6;
  signal LUT_OFFSET    : integer := 0;
  signal lut_in        : std_logic_vector(17 downto 0);
  signal done_lut      : std_logic := '0';

  --- Interpolation related;
  signal rgb_in              : std_logic_vector(23 downto 0);
  signal rgb_out             : std_logic_vector(23 downto 0);
  signal done_interpolation  : std_logic := '0';
  signal start_interpolation : std_logic := '0';

  --- Application par pixel related;
  signal pixel_in            : std_logic_vector(31 downto 0);
  signal pixel_out           : std_logic_vector(31 downto 0);
  signal pixel_start         : std_logic := '0';
  signal done_pixel          : std_logic := '0';

  --- SDRAM related;
  signal dram_bank : std_logic_vector(1 downto 0);
  signal addr_i    : std_logic_vector(24 downto 0);
  signal dat_i     : std_logic_vector(31 downto 0);
  signal dat_o     : std_logic_vector(31 downto 0);
  signal we_i      : std_logic;
  signal ack_o     : std_logic;
  signal stb_i     : std_logic;
  signal cyc_i     : std_logic;

  -- clk0 @ 100 MHz
  -- clk3 @ 25 MHz 
  signal clk_100       : std_logic; -- clk0: 100 MHz
  signal clk_25_vga    : std_logic; -- clk3: 25 MHz
  signal dll_locked    : std_logic;
  signal done_snapshot : std_logic := '0';
  signal done_BW       : std_logic := '0';
  signal done_ED       : std_logic := '0';

  -- Signaux des switchs et gestion des LUT
  -- On doit pouvoir choisir parmis 4 LUT inverses et 4 LUT normales un duo de LUT ave cces switchs.
  -- Les switchs 0 à 3 déterminent la LUT normale et les switchs 4 à 7 déterminent la LUT inverse.
  -- Les LUT présentes sont les suivantes:
  -- 0 et 4 : Reinhard
  -- 1 et 5 : Uncharted2filmic
  -- 2 et 6 : BakingLabACES
  -- 3 et 7 : NarkowiczACES
  signal switchs            : std_logic_vector(7 downto 0);
  signal LUT_NORMAL_OFFSET  : integer := 0;
  signal LUT_INVERSE_OFFSET : integer := 0;

  component module_sdram_rw
    port
    (
      -- connections to sdram controller;
      clk_i  : in std_logic;
      rst_i  : in std_logic;
      addr_i : out std_logic_vector(24 downto 0);
      dat_i  : out std_logic_vector(31 downto 0);
      dat_o  : in std_logic_vector(31 downto 0);
      we_i   : out std_logic;
      ack_o  : in std_logic;
      stb_i  : out std_logic;
      cyc_i  : out std_logic;
      -- connections to frame buffer 2 for which we need to
      -- generate addresses and pass image data from SDRAM;
      addr_buf2 : out std_logic_vector (16 downto 0);
      dout_buf2 : out std_logic_vector(11 downto 0);
      we_buf2   : out std_logic;
      -- connections from frame buffer 1 from where we 
      -- take snapshot; we of buf 1 is controlled by ov7670_capture
      -- here we only read from buffer 1 but at 50 MHz clock;
      addr_buf1 : out std_logic_vector (16 downto 0);
      din_buf1  : in std_logic_vector(11 downto 0);
      -- rw controls
      take_snapshot    : in std_logic; -- store to SDRAM;
      display_snapshot : in std_logic; -- read/fetch from SDRAM;
      led_done         : out std_logic

      -- signals for LUT read mode
      lut_read_mode : in std_logic;
      lut_read_addr : in std_logic_vector(24 downto 0);
      lut_read_data : out std_logic_vector(23 downto 0);
      done_lut      : in std_logic
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

begin
  -- Instanciation des composants


  -- Instanciation du module de traitement de la LUT par pixel
  Inst_module_app_lut_per_pixel : module_app_lut_per_pixel
  port map
  (
    clk                 => clk,
    reset               => rst,
    pixel_in            => pixel_in,
    pixel_out           => pixel_out,
    LUT_INVERSE_OFFSET  => LUT_INVERSE_OFFSET,
    LUT_NORMAL_OFFSET   => LUT_NORMAL_OFFSET,
    pixel_start         => pixel_start,
    pixel_done          => pixel_done,
    interpolation_start => start_interpolation,
    interpolation_done  => done_interpolation,
    LUT_OFFSET          => LUT_OFFSET,
    pixel_to_interpolate => rgb_in,
    pixel_interpolated   => rgb_out
  );

  -- Instanciation du module de lecture de la LUT
  Inst_module_lecture_lut : module_lecture_lut
  port map
  (
    clk        => clk,
    rst        => rst,
    rgb_in     => lut_in,
    lut_out    => lut_out
    LUT_SIZE   => LUT_SIZE,
    LUT_OFFSET => LUT_OFFSET,

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
  -- connections to frame buffer 2 
  addr_buf2 => wraddress_buf2_from_sdram_rw, -- goes to mux of wraddress_buf_2;
  dout_buf2 => wrdata_buf2_from_sdram_rw, -- goes to mux of wrdata_buf_2;
  we_buf2   => wren_buf2_from_sdram_rw, -- goes to mux of wren_buf_2;
  -- connections from frame buffer 1
  addr_buf1 => rdaddress_buf1_from_sdram_rw, -- goes to mux of rdaddress_buf_1;
  din_buf1  => rddata_buf_1, -- comes from out of buf1;
  -- rw controls
  take_snapshot    => take_snapshot_synchronized,
  display_snapshot => display_snapshot_synchronized,
  led_done         => done_snapshot -- notify user on LEDGreen[1] that image from/to SDRAM is finished;
  -- connection for module_lecture_lut
  lut_read_mode => lut_read_mode,
  lut_read_addr => lut_read_addr,
  lut_read_data => lut_read_data
  done_lut      => done_lut
  );

begin

  process (clk)
  begin
    if rising_edge(clk) then

      -- Gestion des différentes LUT avec les switchs
      -- En fonction du switch on va modifier le LUT_OFFSET avec l'adresse des LUT choisies

      -- Choix de la LUT normale
      if switchs(0) = '1' then
        LUT_NORMAL_OFFSET <= 0; -- Reinhard Normal
      elsif switchs(1) = '1' then
        LUT_NORMAL_OFFSET <= 0; -- Uncharted2filmic Normal
      elsif switchs(2) = '1' then
        LUT_NORMAL_OFFSET <= 0; -- BakingLabACES Normal
      elsif switchs(3) = '1' then
        LUT_NORMAL_OFFSET <= 0; -- NarkowiczACES Normal
      else
        LUT_NORMAL_OFFSET <= 0; -- Reinhard Normal par défaut
      end if;

      -- Choix de la LUT inverse
      if switchs(4) = '1' then
        LUT_INVERSE_OFFSET <= 0; -- Reinhard Inverse
      elsif switchs(5) = '1' then
        LUT_INVERSE_OFFSET <= 0; -- Uncharted2filmic Inverse
      elsif switchs(6) = '1' then
        LUT_INVERSE_OFFSET <= 0; -- BakingLabACES Inverse
      elsif switchs(7) = '1' then
        LUT_INVERSE_OFFSET <= 0; -- NarkowiczACES Inverse
      else
        LUT_INVERSE_OFFSET <= 0; -- Reinhard Inverse par défaut
      end if;

    end if;
  end process;

end architecture rtl;