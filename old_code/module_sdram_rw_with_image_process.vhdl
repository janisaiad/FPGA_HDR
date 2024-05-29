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
    -- here we only read from buffer 1;
    addr_buf1 : out std_logic_vector (16 downto 0);
    din_buf1  : in std_logic_vector(11 downto 0);

    -- rw controls
    apply_lut_image  : in std_logic;
    take_snapshot    : in std_logic; -- write to SDRAM
    display_snapshot : in std_logic; -- display stored image
    led_done         : out std_logic;

    -- LUT read mode;
    lut_read_mode : in std_logic;
    lut_read_addr : in std_logic_vector(24 downto 0);
    lut_read_data : out std_logic_vector(23 downto 0)
    done_lut      : out std_logic

    -- Connections to module_app_per_pixel.vhdl
    pixel_start    : out std_logic;
    pixel_done     : in std_logic;
    pixel_for_lut  : out std_logic_vector(31 downto 0);
    pixel_from_lut : in std_logic_vector(31 downto 0)
  );
end sdram_rw;
architecture my_behavioral of module_sdram_rw is

  -- Etats de la machine d'état
  constant START_WRITE_ST       : std_logic_vector(3 downto 0) := "0000";
  constant WRITE_ST             : std_logic_vector(3 downto 0) := "0001";
  constant WAIT_WRITE_ACK_ST    : std_logic_vector(3 downto 0) := "0010";
  constant READ_ST              : std_logic_vector(3 downto 0) := "0011";
  constant WAIT_READ_ACK_ST     : std_logic_vector(3 downto 0) := "0100";
  constant WRITE_WAIT_ST        : std_logic_vector(3 downto 0) := "0101";
  constant START_READ_ST        : std_logic_vector(3 downto 0) := "0110";
  constant READ_WAIT_ST         : std_logic_vector(3 downto 0) := "0111";
  constant DONE_ST              : std_logic_vector(3 downto 0) := "1000";
  constant IDLE_ST              : std_logic_vector(3 downto 0) := "1001";
  constant LUT_READ_ST          : std_logic_vector(3 downto 0) := "1010";
  constant WAIT_LUT_READ_ACK_ST : std_logic_vector(3 downto 0) := "1011";

  -- Etats de la sous machine d'état pour l'application de la LUT à une image
  constant LUT_APPLY_START_ST          : std_logic_vector(3 downto 0) := "0000";
  constant LUT_APPLY_READ_ST           : std_logic_vector(3 downto 0) := "0001";
  constant LUT_APPLY_WAIT_READ_ACK_ST  : std_logic_vector(3 downto 0) := "0010";
  constant LUT_APPLY_PIXEL_SEND_ST     : std_logic_vector(3 downto 0) := "0011";
  constant LUT_APPLY_PIXEL_WAIT_ST     : std_logic_vector(3 downto 0) := "0100";
  constant LUT_APPLY_WRITE_ST          : std_logic_vector(3 downto 0) := "0101";
  constant LUT_APPLY_WAIT_WRITE_ACK_ST : std_logic_vector(3 downto 0) := "0110";
  constant LUT_DONE_ST                 : std_logic_vector(3 downto 0) := "0111";
  constant LUT_IDLE_ST                 : std_logic_vector(3 downto 0) := "1000";

  -- we need to read 320x240 = 76800 words; we use 1 word in SDRAM per pixel
  -- even though right now pixel data is only 12 bits of useful info; 
  -- this is just in case we'll use 24 bits per pixel in the future;
  constant NUM_PIXELS : std_logic_vector(16 downto 0) := std_logic_vector(to_unsigned(76799, 17));

  -- signals for LUT read mode
  signal lut_read_mode : std_logic;
  signal lut_read_addr : std_logic_vector(24 downto 0);
  signal lut_read_data : std_logic_vector(23 downto 0);
  signal done_lut      : std_logic := '0';

  -- signals for applying LUT to image
  signal apply_lut_image : std_logic;
  signal pixel_start     : std_logic := '0';
  signal pixel_done      : std_logic;
  signal pixel_for_lut   : std_logic_vector(31 downto 0);
  signal pixel_from_lut  : std_logic_vector(31 downto 0);
  -- signal that storing or fetching one frame is done;
  signal led_done_r : std_logic := '0';

  -- coming from buffer 1, for storage of snapshot into SDRAM;
  signal addr_buf1_r : std_logic_vector(16 downto 0) := (others => '0');
  signal din_buf1_r  : std_logic_vector(11 downto 0);
  -- going to buffer 2, for display;
  signal addr_buf2_r : std_logic_vector(16 downto 0) := (others => '0');
  signal dout_buf2_r : std_logic_vector(11 downto 0) := (others => '0');
  signal we_buf2_r   : std_logic                     := '0';

  -- redundant counter; keeps track of num of pixels written/read from sdram;
  signal rw_cntr : std_logic_vector(16 downto 0) := (others => '0');
  -- state of the FSM that implements the read or write steps;
  signal state              : std_logic_vector(3 downto 0) := IDLE_ST;
  signal intermediate_state : std_logic_vector(3 downto 0) := LUT_IDLE_ST; -- Etat pour l'application d'une LUT à une image

  -- address bus to sdram_controller;
  signal addr_i_r : std_logic_vector(24 downto 0) := (others => '0');
  signal dat_i_r  : std_logic_vector(31 downto 0);
  signal dat_o_r  : std_logic_vector(31 downto 0);
  signal we_i_r   : std_logic := '0';
  signal stb_i_r  : std_logic := '0';
  signal cyc_i_r  : std_logic := '0';
begin

  dat_o_r <= dat_o;
  addr_i  <= addr_i_r;
  dat_i   <= dat_i_r; -- should not be really necessary;
  stb_i   <= stb_i_r;
  cyc_i   <= cyc_i_r;
  we_i    <= we_i_r;

  -- writes into sdram: buffer 1 --> sdram;
  addr_buf1  <= addr_buf1_r; -- needed because I increment addr_buf1_r;
  din_buf1_r <= din_buf1;

  -- read backs: sdram --> buffer 2;
  addr_buf2 <= addr_buf2_r;
  dout_buf2 <= dout_buf2_r;
  we_buf2   <= we_buf2_r;

  led_done <= led_done_r;
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        state         <= IDLE_ST;
        led_done_r    <= '0';
        we_buf2_r     <= '0';
        pixel_start   <= '0';
        pixel_for_lut <= (others => '0');
      elsif (take_snapshot = '1' and state = IDLE_ST) then
        state       <= START_WRITE_ST;
        led_done_r  <= '0';
        we_buf2_r   <= '0';
        addr_buf1_r <= (others => '0');
      elsif (display_snapshot = '1' and state = IDLE_ST) then
        state       <= START_READ_ST;
        led_done_r  <= '0';
        we_buf2_r   <= '1';
        addr_buf2_r <= (others => '0');

      elsif (lut_read_mode = '1' and state = IDLE_ST) then
        state         <= LUT_READ_ST;
        done_lut      <= '0';
        led_done_r    <= '0';
        we_buf2_r     <= '0';
        lut_read_addr <= (others => '0');

      elsif (apply_lut_image = '1' and state = IDLE_ST) then
        state      <= LUT_APPLY_START_ST;
        led_done_r <= '0';
        we_buf2_r  <= '0';
      else
        case state is

            -- part 1: sequence of states related to writes;
            -- state START_WRITE_ST is visited once only for each frame;
          when START_WRITE_ST =>
            state       <= WRITE_ST;
            addr_i_r    <= (others => '0');
            rw_cntr     <= (others => '0');
            we_i_r      <= '1'; -- stays like that during writes;
            addr_buf1_r <= (others => '0');

            -- each pixel data writing into sdram goes tru the sequence of 3 states:
            -- WRITE_ST --> WAIT_WRITE_ACK_ST --> WRITE_WAIT_ST
          when WRITE_ST =>
            state   <= WAIT_WRITE_ACK_ST;
            stb_i_r <= '1';
            cyc_i_r <= '1';
            we_i_r  <= '1';
            -- now, this is a bit tricky: pick up data coming from buffer 1 here;
            -- data should be stable already, because I changed the address in the previous
            -- cycle inside state WRITE_WAIT_ST, but on falling edge of clk_i, from within
            -- a different process;
            --dat_i_r <= ("00000000000000000000" & "000000001111"); -- blue debug;
            dat_i_r <= ("00000000000000000000" & din_buf1_r); -- pass this to be written to sdram;
            -- increment address for buf1; very important to do this here instead of
            -- in WRITE_WAIT_ST state; otherwise, we get a pixel lag that will shift the image
            -- to the right;
            addr_buf1_r <= addr_buf1_r + 1;

          when WAIT_WRITE_ACK_ST =>
            if (ack_o = '1') then
              state   <= WRITE_WAIT_ST;
              stb_i_r <= '0';
              cyc_i_r <= '0';
            end if;

          when WRITE_WAIT_ST =>
            if (rw_cntr < NUM_PIXELS) then
              state    <= WRITE_ST;
              rw_cntr  <= rw_cntr + 1; -- keep track of how many times we write into sdram;
              addr_i_r <= addr_i_r + 2; -- increment address for sdram controller;
            else
              state <= DONE_ST;
            end if;
            -- part 2: states below related to read backs;
            -- state START_READ_ST is visited once only for each frame;
          when START_READ_ST =>
            addr_i_r    <= "0000000000000000000000000"; -- (others => '0');
            rw_cntr     <= (others => '0');
            we_i_r      <= '0'; -- stays like that during read backs;
            addr_buf2_r <= (others => '0');
            dout_buf2_r <= "110000000011"; -- Yellow;
            we_buf2_r   <= '1';
            state       <= READ_ST;

            -- each pixel data reading process goes tru the sequence of 3 states:
            -- READ_ST --> WAIT_READ_ACK_ST --> READ_WAIT_ST
            -- which means three clock periods of 25 MHz; note that sdram
            -- controller operates with clk_100 that is much faster;
          when READ_ST => -- tell sdram_controller we want to read from addr_i_r
            stb_i_r <= '1';
            cyc_i_r <= '1';
            we_i_r  <= '0';
            state   <= WAIT_READ_ACK_ST;

          when WAIT_READ_ACK_ST => -- wait for controller which should assert ack_o 
            -- here we "stall" in this state until ack_o is asserted;
            if (ack_o = '1') then
              stb_i_r <= '0';
              cyc_i_r <= '0';
              --dout_buf2_r <= "110000000011"; -- pink debug; 
              dout_buf2_r <= dat_o_r(11 downto 0); -- what comes from sdram_controller is sent to buffer 2;
              state       <= READ_WAIT_ST;
            end if;

          when READ_WAIT_ST => -- terminate or go for next pixel;
            if (rw_cntr < NUM_PIXELS) then
              -- rw_cntr keeps track of how many times we read from sdram; we could
              -- use addr_buf2_r instead; but keep it this way in case later we'll
              -- need to increment addr_buf2_r by 2 or 4;
              rw_cntr     <= rw_cntr + 1;
              addr_i_r    <= addr_i_r + 2; -- increment address for sdram controller;
              addr_buf2_r <= addr_buf2_r + 1; -- increment address for buf2;  
              state       <= READ_ST;
            else
              state <= DONE_ST;
            end if;

            -- part 3: states below related to LUT read mode;
          when LUT_READ_ST =>
            state         <= WAIT_LUT_READ_ACK_ST;
            stb_i_r       <= '1';
            cyc_i_r       <= '1';
            we_i_r        <= '0';
            addr_i_r      <= lut_read_addr; -- read from the address of the LUT
            rw_cntr       <= (others => '0');
            lut_read_mode <= '1';

          when WAIT_LUT_READ_ACK_ST =>
            if (ack_o = '1') then
              stb_i_r       <= '0';
              cyc_i_r       <= '0';
              lut_read_data <= dat_o_r(23 downto 0);
              state         <= DONE_ST;
              done_lut      <= '1';
            end if;

            -- Section pour l'application de la LUT à une image entière 
            -- En s'inspirant de la lecture d'une snapshot pour récupérer les pixels dans la SDRAM
            -- En s'inspirant de l'écriture d'une snapshot pour écrire les pixels dans la SDRAM
            -- On va utiliser une sous machine d'état avec intermediate_state et les états suivants : 
            -- LUT_APPLY_START_ST, LUT_APPLY_WRITE_ST, LUT_APPLY_WAIT_WRITE_ACK_ST, LUT_APPLY_WRITE_WAIT_ST
            -- On va utiliser
          when LUT_APPLY_START_ST =>

            intermediate_state <= LUT_APPLY_READ_ST;

            -- when arrived to this state, a whole frame was written or read and we should
            -- stay here and not repeat the process of writing or reading a frame
            -- unless the whole thing is reset, which places us again in IDLE_ST state;
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