-- this entity delays vsync (frame) and hsync (rows) signals that
-- are used for VGA driving; vsync is delayed with 320 + 2
-- and hsync is delayed with 2; this effectively accounts for
-- the latency that we need to wait from the moment we start reading
-- pixels of a frame till the time Sobel filter is applied and gives
-- the first computed pixel of the edge detected image;
--  _______
-- | O O O | O O O ... O O
-- | O X A | A A A ... A O <--- there are WIDTH = 320 pixels in a row/line
-- | O B C | ...
--  ------- 
--          <--- 3x3 window that handles periphery pixels by using 
-- "dummy" pixels "O" that are not part of the image itself of 320x240;
-- we delay sync signals with the number of WIDTH + 2, which is the time
-- when data of pixel "C" in the above sketch arrived to the cache pipe
-- and can thus be used for the processing of first useful pixel of the image, "X";

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SyncSignalsDelayer is
  generic (
    ROW_BITS : integer := 8 
  );
  port(
    clk       : in std_logic;
    fsync_in  : in std_logic;
    rsync_in  : in std_logic;
    fsync_out : out std_logic;
    rsync_out : out std_logic 
  );
end SyncSignalsDelayer;


architecture Behavioral of SyncSignalsDelayer is
  
  COMPONENT Counter is
    generic (n : POSITIVE);
    Port ( 
      clk    : in STD_LOGIC;
      en     : in STD_LOGIC;
      reset  : in STD_LOGIC; -- Active Low
      output : out STD_LOGIC_VECTOR(n-1 downto 0)
    );
  end COMPONENT;

  signal rowsDelayCounterRising, rowsDelayCounterFalling : std_logic_vector(ROW_BITS -1 downto 0);
  signal rsync2, rsync1, fsync_temp : std_logic;
 
 
begin


  -- Step 2
  RowsCounterComp : Counter generic map(ROW_BITS) -- counts on rising edges of clk;
    port map(clk=>rsync2, en=>fsync_in, reset=>fsync_in, output=>rowsDelayCounterRising);
   
  rsync_out <= rsync2;
  fsync_out <= fsync_temp;
    
  -- Step 1
  p1 : process(clk)
  begin
    if (clk'event and clk='1') then
      -- Step 1 - delay of two clock cycles
      rsync2 <= rsync1;
      rsync1 <= rsync_in;
    end if;
  end process p1;

  -- Steps 3 and 5
  p2 : process(rowsDelayCounterRising, rowsDelayCounterFalling)
  begin
    -- rows2 = 2
    if rowsDelayCounterRising = "00000010" then
      fsync_temp <= '1';
    elsif rowsDelayCounterFalling = "00000000" then
      fsync_temp <= '0';
    end if;
  end process p2;

  -- Step 4
  p3 : process(rsync2)
  begin
    if rsync2'event and rsync2 = '0' then
      if fsync_temp = '1' then
        -- 239
        if rowsDelayCounterFalling < "11101111" then
          rowsDelayCounterFalling <= rowsDelayCounterFalling +1;
        else
          rowsDelayCounterFalling <= "00000000";
        end if;
      else
        rowsDelayCounterFalling <= "00000000";
      end if;
    end if;
  end process p3;

end Behavioral;
