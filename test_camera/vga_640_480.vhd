library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_640_480 is
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

      VGA_CLK     : out std_logic; --Clock
	  
      VGA_HS      : out std_logic; --H_SYNC
      VGA_VS      : out std_logic; --V_SYNC
      VGA_BLANK_N : out std_logic; --BLANK
      VGA_SYNC_N  : out std_logic; --SYNC
      VGA_R       : out std_logic_vector(7 downto 0); --Red  [7:0]
      VGA_G       : out std_logic_vector(7 downto 0); --Green[7:0]
      VGA_B       : out std_logic_vector(7 downto 0)  --Blue [7:0]
      );
end vga_640_480;

architecture rtl of vga_640_480 is

--Video parameters
constant HFRONT_PORCH     : integer := 16;
constant HSYNC            : integer := 96;
constant HBACK_PORCH      : integer := 44;
constant HACTIVE          : integer := 640;
constant HTOTAL           : integer := HFRONT_PORCH + HSYNC + HBACK_PORCH + HACTIVE;

constant VFRONT_PORCH     : integer := 10;
constant VSYNC            : integer := 2;
constant VBACK_PORCH      : integer := 33;
constant VACTIVE          : integer := 480;
constant VTOTAL           : integer := VFRONT_PORCH + VSYNC + VBACK_PORCH + VACTIVE;
constant mem_lenght       : integer := HACTIVE * VACTIVE;

signal RdAdd            : integer range 0 to mem_lenght-1 := 0;

subtype data is std_logic;
--type memory_t is array(2**19-1 downto 0) of data;
type memory_t is array(mem_lenght-1 downto 0) of data;
signal mem : memory_t := (others => '0');
signal RGB : std_logic_vector(7 downto 0);

signal write_enable : std_logic;
signal wren_ram     : std_logic;

component ram
    PORT
    (
		rdclock		: IN STD_LOGIC ;
		wrclock		: IN STD_LOGIC  := '1';
        data        : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        rdaddress   : IN STD_LOGIC_VECTOR (18 DOWNTO 0);
        wraddress   : IN STD_LOGIC_VECTOR (18 DOWNTO 0);
        wren        : IN STD_LOGIC  := '0';
        q           : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
end component;

-- Signals for the video controller

-- Horizontal position (0800)
signal Hcount : unsigned(9 downto 0) := (others => '0');

-- Vertical position (0524)
signal Vcount     : unsigned(9 downto 0) := (others => '0');
signal EndOfLine  : std_logic;
signal EndOfField : std_logic;

--Sync. signals
signal vga_hblank : std_logic := '1';
signal vga_hsync  : std_logic := '1';
signal vga_vblank : std_logic := '1';
signal vga_vsync  : std_logic := '1';

begin

HCounter : process (CLOCK_25)
begin
    if rising_edge(CLOCK_25) then
        if reset = '1' or EndOfLine = '1'
            then Hcount <= (others => '0');
            else Hcount <= Hcount + 1;
        end if;
    end if;
end process HCounter;

EndOfLine <= '1' when Hcount = HTOTAL - 1 else '0';

VCounter: process (CLOCK_25)
begin
    if rising_edge(CLOCK_25) then
        if reset = '1' then Vcount <= (others => '0');
     elsif EndOfLine = '1' then
            if EndOfField = '1'
            then Vcount <= (others => '0');
            else Vcount <= Vcount + 1;
            end if;
        end if;
    end if;
end process VCounter;

EndOfField <= '1' when Vcount = VTOTAL - 1 else '0';

HSyncGen : process (CLOCK_25)
begin
    if rising_edge(CLOCK_25) then
        if reset = '1' or EndOfLine = '1'
        then vga_hsync <= '1';
     elsif Hcount = HSYNC - 1
     then vga_hsync <= '0';
        end if;
    end if;
end process HSyncGen;

HBlankGen : process (CLOCK_25)
begin
    if rising_edge(CLOCK_25) then
        if reset = '1'
        then vga_hblank <= '1';
     elsif Hcount = HSYNC + HBACK_PORCH -1
        then vga_hblank <= '0';
     elsif Hcount = HSYNC + HBACK_PORCH -1 + HACTIVE
        then vga_hblank <= '1';
        end if;
    end if;
end process HBlankGen;

VSyncGen : process (CLOCK_25)
begin
    if rising_edge(CLOCK_25) then
        if reset = '1' then vga_vsync <= '1';
     elsif EndOfLine ='1' then
            if EndOfField = '1'   then vga_vsync <= '1';
        elsif Vcount = VSYNC - 1 then vga_vsync <= '0';
            end if;
        end if;
    end if;
end process VSyncGen;

VBlankGen : process (CLOCK_25)
begin
    if rising_edge(CLOCK_25) then
        if reset = '1' then vga_vblank <= '1';
     elsif EndOfLine = '1' then
            if Vcount = VSYNC + VBACK_PORCH - 1
            then vga_vblank <= '0';
         elsif Vcount = VSYNC + VBACK_PORCH + VACTIVE - 1
            then vga_vblank <= '1';
            end if;
        end if;
    end if;
end process VBlankGen;

AddrGen : process (CLOCK_25, reset)
begin
    if reset = '1' then
        RdAdd <= 0;
 elsif rising_edge(CLOCK_25) then
        if RdAdd = mem_lenght-1 then
            RdAdd <= 0;
     elsif vga_hblank = '0' and vga_vblank ='0' then  -- partie visible de l'ecran
            RdAdd <= RdAdd + 1;
        end if;
    end if;
end process;

-- take pictures
picture_proc : process (CLOCK_25, reset)
begin
    if reset = '1' then
        write_enable <= '1';
 elsif rising_edge(CLOCK_25) then
        if picture = '1' then write_enable <= '0';
		end if;
		if movie   = '1' then write_enable <= '1';
        end if;
    end if;
end process;
      
wren_ram <= Frame_val and Line_val and write_enable;

ram_inst : ram
    PORT map
    (
		rdclock	  => CLOCK_25,
		wrclock	  => CLOCK_25,
        data      => data_in,
        rdaddress => std_logic_vector(to_unsigned(RdAdd,19)),
        wraddress => WrAdd,
        wren      => wren_ram,
        q         => RGB
    );

VGA_R <= RGB(7 downto 0);
VGA_G <= RGB(7 downto 0);
VGA_B <= RGB(7 downto 0);

VGA_CLK      <= CLOCK_25;
VGA_HS       <= not vga_hsync;
VGA_VS       <= not vga_vsync;
VGA_SYNC_N   <= '0';
VGA_BLANK_N  <= not (vga_hblank or vga_vblank);
end rtl;

