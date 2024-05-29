-- this entity is the middle-man between the SDRAM controller
-- (which is hooked to the SDRAM chip on board) and my application;
-- used here to write into sdram the frame from frame buffer 1;
-- also, used to read from sdram and place the frame into frame buffer 2;
-- the led done is asserted to signal that all pixels have been written or read;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;
entity sdram_rw is
  port
  (
    -- connections to sdram controller;
    clk_i  : in std_logic; -- 25 MHz
    rst_i  : in std_logic; -- reset signal;
    addr_i : out std_logic_vector(24 downto 0); -- address to sdram controller;
    dat_i  : out std_logic_vector(31 downto 0); -- data to sdram controller;
    dat_o  : in std_logic_vector(31 downto 0); -- data from sdram controller;
    we_i   : out std_logic; -- write enable signal;
    ack_o  : in std_logic; -- acknowledge signal;
    stb_i  : out std_logic; -- strobe signal;
    cyc_i  : out std_logic; -- cycle signal;

    -- LUT read mode;
    lut_read_mode : in std_logic;
    lut_read_addr : in std_logic_vector(24 downto 0);
    lut_read_data : out std_logic_vector(23 downto 0)
    done_lut      : out std_logic

    --- Pixel read/write mode;
    -- General info;
    pixel_addr : in std_logic_vector(24 downto 0);
    pixel_done : out std_logic;

    -- Write mode;
    pixel_write_mode : in std_logic;
    pixel_write_data : in std_logic_vector(31 downto 0);

    -- Read mode;
    pixel_read_mode : in std_logic;
    pixel_read_data : out std_logic_vector(31 downto 0)

  );
end sdram_rw;
architecture my_behavioral of module_sdram_rw is

  -- Sates for pixels read/write mode;
  constant PIXEL_READ_ST           : std_logic_vector(3 downto 0) := "0000";
  constant WAIT_PIXEL_READ_ACK_ST  : std_logic_vector(3 downto 0) := "0001";
  constant PIXEL_WRITE_ST          : std_logic_vector(3 downto 0) := "0010";
  constant WAIT_PIXEL_WRITE_ACK_ST : std_logic_vector(3 downto 0) := "0011";

  -- States for LUT read mode;
  constant DONE_ST              : std_logic_vector(3 downto 0) := "1000";
  constant IDLE_ST              : std_logic_vector(3 downto 0) := "1001";
  constant LUT_READ_ST          : std_logic_vector(3 downto 0) := "1010";
  constant WAIT_LUT_READ_ACK_ST : std_logic_vector(3 downto 0) := "1011";

  -- signals for pixel read/write mode;
  signal pixel_addr       : std_logic_vector(24 downto 0);
  signal pixel_read_mode  : std_logic;
  signal pixel_read_data  : std_logic_vector(31 downto 0);
  signal pixel_write_mode : std_logic;
  signal pixel_write_data : std_logic_vector(31 downto 0);
  signal pixel_done       : std_logic := '0';

  -- signals for LUT read mode
  signal lut_read_mode : std_logic;
  signal lut_read_addr : std_logic_vector(24 downto 0);
  signal lut_read_data : std_logic_vector(23 downto 0);
  signal done_lut      : std_logic := '0';

  -- state of the FSM that implements the read or write steps;
  signal state : std_logic_vector(3 downto 0) := IDLE_ST;

  -- address bus to sdram_controller;
  signal addr_i_r : std_logic_vector(24 downto 0) := (others => '0');
  signal dat_i_r  : std_logic_vector(31 downto 0);
  signal dat_o_r  : std_logic_vector(31 downto 0);
  signal we_i_r   : std_logic := '0';
  signal stb_i_r  : std_logic := '0';
  signal cyc_i_r  : std_logic := '0';
begin

  dat_o_r <= dat_o; -- should not be really necessary;
  addr_i  <= addr_i_r; -- should not be really necessary;
  dat_i   <= dat_i_r; -- should not be really necessary;
  stb_i   <= stb_i_r; -- should not be really necessary;
  cyc_i   <= cyc_i_r; -- should not be really necessary;
  we_i    <= we_i_r;  -- should not be really necessary;

  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        state           <= IDLE_ST;
        done_lut        <= '0';
        lut_read_data   <= (others => '0');
        pixel_done      <= '0';
        pixel_read_data <= (others => '0');

      elsif (pixel_read_mode = '1' and state = IDLE_ST) then
        state      <= PIXEL_READ_ST;
        pixel_done <= '0';
        pixel_addr <= pixel_addr;

      elsif (pixel_write_mode = '1' and state = IDLE_ST) then
        state            <= PIXEL_WRITE_ST;
        pixel_done       <= '0';
        pixel_write_data <= pixel_write_data;
        pixel_addr       <= pixel_addr;

      elsif (lut_read_mode = '1' and state = IDLE_ST) then
        state    <= LUT_READ_ST;
        done_lut <= '0';

      else
        case state is

            -- part 1: states below related to pixel read mode;
          when PIXEL_READ_ST =>
            state    <= WAIT_PIXEL_READ_ACK_ST;
            stb_i_r  <= '1';
            cyc_i_r  <= '1';
            we_i_r   <= '0';
            addr_i_r <= pixel_addr; -- read from the address of the pixel

          when WAIT_PIXEL_READ_ACK_ST =>
            if (ack_o = '1') then
              stb_i_r         <= '0';
              cyc_i_r         <= '0';
              pixel_read_data <= dat_o_r;
              state           <= DONE_ST;
              pixel_done      <= '1';
            end if;

            -- part 2: states below related to pixel write mode;
          when PIXEL_WRITE_ST =>
            state   <= WAIT_PIXEL_WRITE_ACK_ST;
            stb_i_r <= '1';
            cyc_i_r <= '1';
            we_i_r  <= '1';
            dat_i_r <= pixel_write_data;

          when WAIT_WRITE_ACK_ST =>
            if (ack_o = '1') then
              state   <= WRITE_WAIT_ST;
              stb_i_r <= '0';
              cyc_i_r <= '0';
              state <= DONE_ST;
              pixel_done <= '1';
            end if;

            -- part 3: states below related to LUT read mode;
          when LUT_READ_ST =>
            state    <= WAIT_LUT_READ_ACK_ST;
            stb_i_r  <= '1';
            cyc_i_r  <= '1';
            we_i_r   <= '0';
            addr_i_r <= lut_read_addr; -- read from the address of the LUT

          when WAIT_LUT_READ_ACK_ST =>
            if (ack_o = '1') then
              stb_i_r       <= '0';
              cyc_i_r       <= '0';
              lut_read_data <= dat_o_r(23 downto 0);
              state         <= DONE_ST;
              done_lut      <= '1';
            end if;

          when DONE_ST =>
            state      <= DONE_ST; -- this ways we read or write all pixels only once;
            led_done_r <= '1'; -- notify user it's success; will be used for self reset too at top_level;

          when others =>
            state      <= IDLE_ST;
            led_done_r <= '0';

        end case;
      end if;
    end if;
  end process;
end my_behavioral;