-- read buffer 2 content, which stores taken snapshot (if display
-- snapshot button has been pressed), and apply Sobel filter for edge
-- detection; write back into buffer 2 the B&W image;
-- Note: this is the design entity in this whole project that is 
-- the trickyist; read comments thorughout to get an idea about 
-- different aspects;
-- Note: be aware of some hard coded numbers related to 320x240 here;
-- you need to change those for other screen sizes;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
 

entity do_edge_detection is
  Port ( 
    -- controls;
    rst_i : in  STD_LOGIC;
    clk_i : in  STD_LOGIC; -- 25 MHz
    enable_sobel_filter : in  STD_LOGIC; -- start new edge detection;
    led_sobel_done : out  STD_LOGIC; -- done this frame;
    -- connections from frame buffer 2 from where we 
    -- need to read image data (i.e., gray image) and to which
    -- we must apply Sobel filter; we need here to generate "read" addresses;
    rdaddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    din_buf2 : IN std_logic_vector(11 downto 0);
    -- connections to frame buffer 2 for which we need to
    -- generate "write" addresses and pass pixel data after Sobe edge detection processing;
    wraddr_buf2 : OUT STD_LOGIC_VECTOR (16 downto 0);
    dout_buf2 : OUT std_logic_vector(11 downto 0);
    we_buf2 : OUT std_logic
  );
end do_edge_detection;


architecture my_behavioral of do_edge_detection is


  COMPONENT edge_sobel_wrapper
    generic (
      DATA_WIDTH : integer := 8 );
    Port ( 
      clk : in STD_LOGIC;
      fsync_in : in STD_LOGIC;
      rsync_in : in STD_LOGIC;
      pdata_in : in STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0);
      fsync_out : out STD_LOGIC;
      rsync_out : out STD_LOGIC;
      pdata_out : out STD_LOGIC_VECTOR (DATA_WIDTH-1 downto 0) );
  end COMPONENT;

  constant START_SOBEL_FILTER_ST : std_logic_vector(2 downto 0) := "000";
  constant GET_PIXEL_DATA_ST     : std_logic_vector(2 downto 0) := "001";
  constant STALL_1_CYCLE_ST      : std_logic_vector(2 downto 0) := "010";
  constant STALL_2_CYCLE_ST      : std_logic_vector(2 downto 0) := "011";  
  constant SEND_PIXEL_DATA_ST    : std_logic_vector(2 downto 0) := "100";
  constant DONE_ST               : std_logic_vector(2 downto 0) := "101";
  constant IDLE_ST               : std_logic_vector(2 downto 0) := "110";


  -- we need to read 320x240 = 76800 locations; 
  constant NUM_PIXELS : std_logic_vector(16 downto 0) := std_logic_vector(to_unsigned(76799, 17));   
  -- signal that edge detection for whole frame is done;
  signal led_done_r: std_logic := '0';

  -- coming from buffer 2, regular pixel data;
  signal rdaddr_buf2_r : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
  signal din_buf2_r : std_logic_vector(7 downto 0);
  -- going to buffer 2, B&W pixelsdata;
  signal wraddr_buf2_r : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
  signal dout_buf2_r : std_logic_vector(7 downto 0) := (others => '0');
  signal we_buf2_r : std_logic := '0'; 

  -- counter of pixels while reading from buf2;
  signal rd_cntr: std_logic_vector(16 downto 0) := (others => '0');
  -- counter of pixels while writing back into buf2; 
  -- we need this second counter because we must start writing back pixel 
  -- id 0 right after we just fetched and processed pixel id 1 from second
  -- row (that is pixel number 321 for our case of 320x240 frame);
  -- 0   1     2   3   ... 318 319
  -- 320 {321} 322 323 ...
  signal wr_cntr: std_logic_vector(16 downto 0) := (others => '0'); 
  -- state of the FSM that implements the read or write steps;
  signal state: std_logic_vector(2 downto 0) := IDLE_ST;

  -- Note: in current implementation, I actually do not use the delayed
  -- sync signals becaue I use the Sobel filter only once on the taken
  -- and displayed and grayed image; however, when applying Sobel filter in
  -- video mode, we'll use them; 
  -- also, because we use it once only and not in video mode - where we
  -- have the hsync and vsync signals generated - we need to generate
  -- "dummy" hsync and vsync signals, which are used inside edge_sobel_wrapper;
  signal hsync_dummy: std_logic;
  signal vsync_dummy: std_logic;
  signal hsync_delayed: std_logic;
  signal vsync_delayed: std_logic;
  signal ColsCounter : std_logic_vector(8 downto 0) := "000000000";
  signal clk_div2: std_logic; 
  
  
begin


  led_sobel_done <= led_done_r;
  
  -- reads from buffer 2;
  rdaddr_buf2 <= rdaddr_buf2_r;
  -- Note: we work for now with gray images; so, just take the 4 bits corresponsing to
  -- the B channel and use them (concatenate with zeros or itself to "make up"
  -- 8 bits that the Sobel filter consumes for each processed pixel); 
  -- they contain the same info as bits 7:4 or 11:8 in gray images;
  din_buf2_r <= (din_buf2(3 downto 0) & "0000"); -- equivalent of shifting to right by 4 bits; to achieve scaling;
  
  -- writes into buffer 2;
  we_buf2 <= we_buf2_r; 
  wraddr_buf2 <= wraddr_buf2_r;
  -- we write back to buf2 a total of 12 bits (RGB444) that we must "put together" from
  -- the 8 bits that the Sobel filter produces for each pixel;
  dout_buf2 <= (dout_buf2_r(7 downto 4) & dout_buf2_r(7 downto 4) & dout_buf2_r(7 downto 4));

  
  -- Sobel filter; we "drive" it with the "dummy" sync signals;
  -- the idea is to have hsync go down for a clock cycle between rows;
  -- that is an extra cycle during which we do not process a pixel;
  -- it's just for edge_sobel_wrapper to work correctly;
  Inst_edge_sobel_wrapper: edge_sobel_wrapper PORT MAP (  
    clk => clk_div2,
    fsync_in => vsync_dummy,
    rsync_in => hsync_dummy,
    pdata_in => din_buf2_r,
    fsync_out => vsync_delayed,
    rsync_out => hsync_delayed,
    pdata_out => dout_buf2_r
  ); 
  -- divide clock by 2 and supply it as actual clock to edge_sobel_wrapper;
  -- Note: we need it because we take 2 clk_i cycles for processing of a pixel;
  -- edge_sobel_wrapper needs its own "clock" for each pixel, which is half
  -- the frequency of clk_i;
  divide_clk_by_2_proc : process(clk_i, rst_i)
  begin
    if rst_i = '1' then
      clk_div2 <= '0';
    elsif rising_edge(clk_i) then
      clk_div2 <= not clk_div2;
    end if;
  end process;
   
  
  -- bring pixel by pixel and process it;
  -- Note: processing of each pixel takes two clock cycles of clk_i;
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        state <= IDLE_ST;
        led_done_r <= '0';
        rd_cntr <= (others => '0');
        wr_cntr <= (others => '0');
        we_buf2_r <= '0';
        rdaddr_buf2_r <= (others => '0');
        wraddr_buf2_r <= (others => '0');
        vsync_dummy <= '0';
        hsync_dummy <= '0';
        ColsCounter <= "000000000";
        
      elsif (enable_sobel_filter = '1' and state = IDLE_ST) then
        state <= START_SOBEL_FILTER_ST;
        led_done_r <= '0';
        rd_cntr <= (others => '0');
        wr_cntr <= (others => '0');
        we_buf2_r <= '1'; -- do not enable writing into buf2 until W+2 pixels have been processed;
        rdaddr_buf2_r <= (others => '0');
        wraddr_buf2_r <= (others => '0');
        vsync_dummy <= '1';
        hsync_dummy <= '0';
        ColsCounter <= "000000000";
        
      else
        case state is
        
          -- state START_BLACKWHITE_ST is visited once only for each frame/image;
          when START_SOBEL_FILTER_ST =>
            state <= GET_PIXEL_DATA_ST;
            led_done_r <= '0';
            rd_cntr <= (others => '0');
            wr_cntr <= (others => '0');
            we_buf2_r <= '1'; -- stays like that during writes;
            rdaddr_buf2_r <= (others => '0');
            wraddr_buf2_r <= (others => '0');
            vsync_dummy <= '1';
            hsync_dummy <= '0';
            ColsCounter <= "000000000";
            
          -- each pixel goes thru these two states: GET_PIXEL_DATA_ST, SEND_PIXEL_DATA_ST
          when GET_PIXEL_DATA_ST =>
              state <= SEND_PIXEL_DATA_ST;
              rdaddr_buf2_r <= rdaddr_buf2_r + 1; -- increment rd address for buf2;
              -- increment wr address for buf2 only after W+2 pixels have been processed;
              if (rd_cntr > 323) then -- 320; 323
                wraddr_buf2_r <= wraddr_buf2_r + 1;
                wr_cntr <= wr_cntr + 1;
              else 
                wraddr_buf2_r <= (others => '0');
                wr_cntr <= (others => '0');
              end if;
           
          -- send back to buf2 the processed pixel; 
          when SEND_PIXEL_DATA_ST =>
            -- tricky aspect: use wr_cntr here so that we continue to write into 
            -- buf2 W+2 more pixels that we delayed at the begining;
            if (wr_cntr < NUM_PIXELS) then 
              rd_cntr <= rd_cntr + 1; -- keep track of how many pixels we processed; 
              if ColsCounter < 319 then 
                ColsCounter  <= ColsCounter +1;
                hsync_dummy <= '1';
                state <= GET_PIXEL_DATA_ST; -- go to bring new pixel;
              else
                ColsCounter  <= "000000000";
                hsync_dummy <= '0';
                state <= STALL_1_CYCLE_ST; 
              end if;
            else 
              state <= DONE_ST;
            end if;         
              
          -- at the end of each row of fetched pixels we "insert" a stall
          -- during which we make hsync '0'; we need this trick for the
          -- edge_sobel_wrapper entity to work correctly; 2 cclk_i cycles
          -- form one clkdiv2 cycle;
          when STALL_1_CYCLE_ST =>          
            state <= STALL_2_CYCLE_ST;
          when STALL_2_CYCLE_ST =>          
            state <= GET_PIXEL_DATA_ST;
            hsync_dummy <= '1';
            
          
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
