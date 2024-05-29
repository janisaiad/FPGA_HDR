library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_camera is
    port (
    CLOCK_50  : in std_logic;
    KEY       : in std_logic_vector( 3 downto 0);
    SW        : in std_logic_vector(15 downto 0);

    VGA_CLK     : out std_logic; --Clock
    VGA_HS      : out std_logic; --H_SYNC
    VGA_VS      : out std_logic; --V_SYNC
    VGA_BLANK_N : out std_logic; --BLANK
    VGA_SYNC_N  : out std_logic; --SYNC
    VGA_R       : out std_logic_vector(7 downto 0); --Red  [7:0]
    VGA_G       : out std_logic_vector(7 downto 0); --Green[7:0]
    VGA_B       : out std_logic_vector(7 downto 0); --Blue [7:0]

	 -- depuis CMOS
	CMOS_DATA    : in std_logic_vector(9 downto 0);
	CMOS_PIXCLK  : in std_logic;
	CMOS_LVAL    : in std_logic;
	CMOS_FVAL    : in std_logic;
	-- vers CMOS
	CMOS_MCLK    : out std_logic;
   CMOS_SCLK    : out std_logic;
   CMOS_SDAT    : inout std_logic;

	LEDG         : out std_logic_vector(7 downto 0)
   --GPIO        : out std_logic_vector(31 downto 0) -- vers logicport

    --GPIO_J2     : inout std_logic_vector(35 downto 4) -- depuis camera CMOS
    --GPIO_J3     : inout std_logic_vector(35 downto 4)  -- vers logicport
    );
end test_camera;

architecture rtl of test_camera is

component pll IS
PORT(
     inclk0 : IN  STD_LOGIC  := '0';
     c0     : OUT STD_LOGIC;
     c1     : OUT STD_LOGIC
    );
END component;

-- configuration du CMOS par le bus I2C
component I2C_CMOS_Config is
    port (
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
port (
      CLOCK_25  : in std_logic;
	  CLOCK_pix : in std_logic;
      reset     : in std_logic;
	  picture   : in std_logic;
	  movie     : in std_logic;
      data_in   : in std_logic_vector(7 downto 0);
      Line_val  : in std_logic;
      Frame_val : in std_logic;
      WrAdd     : in std_logic_vector(18 downto 0);

      VGA_CLK    : out std_logic; --Clock
      VGA_HS     : out std_logic; --H_SYNC
      VGA_VS     : out std_logic; --V_SYNC
      VGA_BLANK_N  : out std_logic; --BLANK
      VGA_SYNC_N : out std_logic; --SYNC
      VGA_R      : out std_logic_vector(7 downto 0); --Red[7:0]
      VGA_G      : out std_logic_vector(7 downto 0); --Green[7:0]
      VGA_B      : out std_logic_vector(7 downto 0)  --Blue[7:0]
      );
end component;

signal CLOCK_25, CLOCK_25d : std_logic;
signal SCLK, SDAT : std_logic;
signal I2C_DIR    : std_logic;
signal I2C_SDATo  : std_logic;
signal I2C_SDATi  : std_logic;

constant seuil      : std_logic_vector(9 downto 0) := "1000000000" ;
signal pix_counter  : integer range 0 to (((640*2)*(480*2))-1) := 0;
signal line_counter : integer range 0 to ((480*2)-1)           := 0;

signal lumi        : std_logic_vector(0 downto 0);
signal lumi_buffer : std_logic_vector(0 downto 0);
signal Wren        : std_logic;
signal WrAdd       : std_logic_vector(18 downto 0);

signal CLK1, CLK2 : std_logic;

signal rst_n      : std_logic;
signal exposition : std_logic_vector(15 downto 0);

begin

pll_inst : pll PORT MAP (inclk0  => CLOCK_50, c0 => CLOCK_25, c1 => CLOCK_25d);
CMOS_MCLK <= CLOCK_25; -- 25MHz

rst_n <= KEY(0);

LEDG(0) <= CMOS_PIXCLK;

exposition <= SW(15 downto 0);

CMOS_SCLK <= SCLK;
CMOS_SDAT <= I2C_SDATo when I2C_DIR = '1' else 'Z';
I2C_SDATi <= CMOS_SDAT;

I2C_CMOS_Config_inst : I2C_CMOS_Config
port map (
          clk        => CLOCK_50,
          rst_n      => rst_n,
          exposition => exposition,
          I2C_SCLK   => SCLK,
			 I2C_DIR    => I2C_DIR,
			 I2C_SDATo  => I2C_SDATo, -- !!!! inout vers/depuis CMOS
			 I2C_SDATi  => I2C_SDATi  -- !!!! inout vers/depuis CMOS
          );

process (CLOCK_25)
begin
    if rising_edge(CLOCK_25) then
        if CMOS_FVAL ='1' then
            if CMOS_LVAL = '1' then
                lumi_buffer <= lumi;
                if pix_counter < (((640*2)*(480*2))-1) then
                pix_counter <= pix_counter + 1;
                else pix_counter <= 0;
                end if;
            end if;
        else pix_counter <= 0;
        end if;
    end if;
end process ;

lumi <= "1" when CMOS_DATA > seuil else "0";

WrAdd <= std_logic_vector(to_unsigned(pix_counter,19));

VGA_inst : vga_640_480
port map(
      CLOCK_25  => CLOCK_25,
	  CLOCK_pix => CMOS_PIXCLK,
      reset     => not rst_n,
	  picture   => not KEY(3),
	  movie     => not KEY(2),
      data_in   => CMOS_DATA(9 downto 2),
      Line_val  => CMOS_LVAL,
      Frame_val => CMOS_FVAL,
      WrAdd     => WrAdd,

      VGA_CLK     => VGA_CLK,    --Clock
      VGA_HS      => VGA_HS,     --H_SYNC
      VGA_VS      => VGA_VS,     --V_SYNC
      VGA_BLANK_N => VGA_BLANK_N,--BLANK
      VGA_SYNC_N  => VGA_SYNC_N, --SYNC
      VGA_R       => VGA_R,      --Red  [7:0]
      VGA_G       => VGA_G,      --Green[7:0]
      VGA_B       => VGA_B       --Blue [7:0]
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
