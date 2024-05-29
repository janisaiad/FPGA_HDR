-- read buffer 2 content, which stores taken snapshot (if display
-- snapshot button has been pressed), and apply black-and-white filter;
-- write back into buffer 2 the B&W image;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;


entity do_black_white is
  Port ( 
    -- controls;
    rst_i : in  STD_LOGIC;
    clk_i : in  STD_LOGIC; -- 25 MHz
    enable_filter : in  STD_LOGIC;
    led_done : out  STD_LOGIC;
    -- connections from frame buffer 2 from where we 
    -- need to read image data (e.g., taken snapshot) and to which
    -- we must apply B&W filter; we need here to generate "read" addresses;
    rdaddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    din_buf2 : IN std_logic_vector(11 downto 0);
    -- connections to frame buffer 2 for which we need to
    -- generate "write" addresses and pass pixel data after B&W processing;
    wraddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    dout_buf2 : OUT std_logic_vector(11 downto 0);
    we_buf2 : OUT std_logic
  );
end do_black_white;


architecture my_behavioral of do_black_white is


  component binary_divider_ver1
  generic (size: natural := 8);
  port ( 
    A: in std_logic_vector(size-1 downto 0);
    B: in std_logic_vector(size-1 downto 0);
    Q: out std_logic_vector(size-1 downto 0);
    R: out std_logic_vector(size-1 downto 0)
  );
  end component;
  

  constant START_BLACKWHITE_ST  : std_logic_vector(2 downto 0) := "000";
  constant GET_PIXEL_DATA_ST    : std_logic_vector(2 downto 0) := "001";
  constant WAIT_ACK_DIVISION_ST : std_logic_vector(2 downto 0) := "010";
  constant SEND_PIXEL_DATA_ST   : std_logic_vector(2 downto 0) := "011";
  constant DONE_ST              : std_logic_vector(2 downto 0) := "100";
  constant IDLE_ST              : std_logic_vector(2 downto 0) := "101";

  -- used for "average method" that does (R + G + B) / 3
  constant CONSTANT_THREE : std_logic_vector(7 downto 0) := "00000011"; 
  
  -- we need to read 320x240 = 76800 locations; 
  constant NUM_PIXELS : std_logic_vector(16 downto 0) := std_logic_vector(to_unsigned(76799, 17)); 
  
  -- signal that B&W filter is done;
  signal led_done_r: std_logic := '0';

  -- coming from buffer 2, regular pixel data;
  signal rdaddr_buf2_r : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
  signal din_buf2_r : std_logic_vector(11 downto 0);
  -- going to buffer 2, B&W pixelsdata;
  signal wraddr_buf2_r : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
  signal dout_buf2_r : std_logic_vector(11 downto 0) := (others => '0');
  signal we_buf2_r : std_logic := '0'; 

  -- counter of pixels;
  signal rw_cntr: std_logic_vector(16 downto 0) := (others => '0');
  -- state of the FSM that implements the read or write steps;
  signal state: std_logic_vector(2 downto 0) := IDLE_ST;

  signal red, green, blue : STD_LOGIC_VECTOR(7 downto 0);
  signal red_grey, green_grey, blue_grey : STD_LOGIC_VECTOR(7 downto 0);
  signal r_plus_g_plus_b : STD_LOGIC_VECTOR(7 downto 0);
  signal remainder_not_used : STD_LOGIC_VECTOR(7 downto 0);
  --signal pixel_processing_done : STD_LOGIC; -- use if a divider tha ttakes more than one cycle is used;
  
begin

  led_done <= led_done_r;  
  -- reads from buffer 2;
  rdaddr_buf2 <= rdaddr_buf2_r;
  din_buf2_r <= din_buf2;
  -- writes into buffer 2; 
  we_buf2 <= we_buf2_r; 
  wraddr_buf2 <= wraddr_buf2_r;
  dout_buf2 <= dout_buf2_r;

  
  -- black and white processing of pixel data;
  -- actually, here, we convert a color image to grayscale;
  -- the "average method" simply averages the values: (R + G + B) / 3
  -- Note: we need to make sure this has time to finish within one period of
  -- the clock of 25 MHz;
  -- Note: ideally, here, we should do scaling from (0000, 1111) to (00000000, 11111111)
  -- and then only do averaging;
  red   <= "0000" & din_buf2_r(11 downto 8);
  green <= "0000" & din_buf2_r(7 downto 4);
  blue  <= "0000" & din_buf2_r(3 downto 0);
  r_plus_g_plus_b <= (red + green + blue); 
  Inst_binary_divider: binary_divider_ver1 PORT MAP( 
    A => r_plus_g_plus_b,
    B => CONSTANT_THREE, 
    Q => red_grey, -- quotient of (red + green + blue)/3
    R => remainder_not_used
  );   
  green_grey <= red_grey;
  blue_grey <= red_grey;
  dout_buf2_r <= red_grey(3 downto 0) & green_grey(3 downto 0) & blue_grey(3 downto 0);
 
  
  -- bring pixel by pixel and process it;
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        state <= IDLE_ST;
        led_done_r <= '0';
        we_buf2_r <= '0';
        --pixel_processing_done <= '0';
      elsif (enable_filter = '1' and state = IDLE_ST) then
        state <= START_BLACKWHITE_ST; -- GET_PIXEL_DATA_ST; --START_BLACKWHITE_ST;
        rw_cntr <= (others => '0');
        we_buf2_r <= '1';
        led_done_r <= '0';
        --pixel_processing_done <= '0';
        rdaddr_buf2_r <= (others => '0');
        wraddr_buf2_r <= (others => '0');      
        
      else
        case state is
        
          -- state START_BLACKWHITE_ST is visited once only for each frame/image;
          when START_BLACKWHITE_ST =>
            state <= GET_PIXEL_DATA_ST;
            rw_cntr <= (others => '0');
            we_buf2_r <= '1'; -- stays like that during writes;
            rdaddr_buf2_r <= (others => '0');
            wraddr_buf2_r <= (others => '0');
            --pixel_processing_done <= '0';
            
          -- each pixel goes thru these two states: GET_PIXEL_DATA_ST, SEND_PIXEL_DATA_ST
          -- get the new pixel data for B&W processing;
          when GET_PIXEL_DATA_ST =>
              state <= SEND_PIXEL_DATA_ST;        
              rdaddr_buf2_r <= rdaddr_buf2_r + 1; -- increment rd address for buf2;
              wraddr_buf2_r <= wraddr_buf2_r + 1; -- increment wr address for buf2; 
              
          -- Note: next state is not currently used; we would use it if we used a 
          -- divider that is not combinational, and would take multiple clock cycles;
          when WAIT_ACK_DIVISION_ST =>          
            -- if the logic responsible with converting the pixel data into 
            -- black and white is done move on; else "stall" in this state;
            --if (pixel_processing_done = '1') then
            state <= SEND_PIXEL_DATA_ST;
            wraddr_buf2_r <= wraddr_buf2_r + 1; -- increment wr address for buf2;
            --else 
            --  state <= WAIT_ACK_DIVISION_ST; -- wait here still;
            --end if;
           
          -- send back to buffer 2 the B&W pixel; 
          when SEND_PIXEL_DATA_ST =>
            if (rw_cntr < NUM_PIXELS) then
              state <= GET_PIXEL_DATA_ST; -- go to bring new pixel;
              rw_cntr <= rw_cntr + 1; -- keep track of how many pixels we processed;
              --pixel_processing_done <= '0';  
            else 
              state <= DONE_ST;
            end if;             
              
              
          -- when arrived to this state, a whole frame was processed and we should
          -- stay here and not repeat the process unless the whole thing is reset,
          -- which places us again in IDLE_ST state;
          when DONE_ST =>
            state <= DONE_ST; -- this ways we read or write all pixels only once;
            led_done_r <= '1'; -- notify user it's success; will be used for self reset too at top_level;
            we_buf2_r <= '0';
                
          when others => 
            state <= IDLE_ST;
            led_done_r <= '0';
            we_buf2_r <= '0';
           
        end case;
      end if;
    end if;
  end process;


end my_behavioral;
