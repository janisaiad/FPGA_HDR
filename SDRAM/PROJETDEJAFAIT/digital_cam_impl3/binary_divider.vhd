-- cristinel ababei
-- here are several binary divider implementations; 
-- "collected" from out there :-)

-------------------------------------------------------------------------------
-- version 1: simply convert std_logic_vector to unsigned; divide
-- directly, and then, convert backk to std_logic_vector; 
-- Note: this is the most straightforward (i.e., the lazy man's) solution;
-- but we have no control of its internal structure; 
-- also, note that it's a combinational circuit; does not use a clk signal;
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binary_divider_ver1 is
  generic (size: natural := 8);
  port ( 
    A: in std_logic_vector(size-1 downto 0);
    B: in std_logic_vector(size-1 downto 0);
    Q: out std_logic_vector(size-1 downto 0); -- quotient
    R: out std_logic_vector(size-1 downto 0)  -- remainder
  );
end entity;

architecture direct_behavioral of binary_divider_ver1 is 
  signal Auns, Buns, Quns, Runs: unsigned(size-1 downto 0);
begin 

  -- convert inputs to unsigned;
  Auns <= unsigned(A);
  Buns <= unsigned(B);

  -- do the division;
  Quns <= Auns/Buns;
  Runs <= Auns rem Buns; 

  -- convert result back to std_logic_vector;
  Q <= std_logic_vector(Quns);
  R <= std_logic_vector(Runs);  

end direct_behavioral;


-------------------------------------------------------------------------------
-- version 2: division circuit from page 145 of this excellent textbook:
-- Pong P. Chu, FPGA Prototyping by VHDL Examples: Xilinx Spartan-3 Version, Wiley, 2008.
-------------------------------------------------------------------------------

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity div_pong_chu is
--    generic(
--       W: integer:=8;
--       CBIT: integer:=4   -- CBIT=log2(W)+1
--    );
--    port(
--        clk, reset: in std_logic;
--        start: in std_logic;
--        dvsr, dvnd: in std_logic_vector(W-1 downto 0);
--        ready, done_tick: out std_logic;
--        quo, rmd: out std_logic_vector(W-1 downto 0)
--    );
--end div_pong_chu;
--
--architecture arch of div_pong_chu is
--   type state_type is (idle,op,last,done);
--   signal state_reg, state_next: state_type;
--   signal rh_reg, rh_next: unsigned(W-1 downto 0);
--   signal rl_reg, rl_next: std_logic_vector(W-1 downto 0);
--   signal rh_tmp: unsigned(W-1 downto 0);
--   signal d_reg, d_next: unsigned(W-1 downto 0);
--   signal n_reg, n_next: unsigned(CBIT-1 downto 0);
--   signal q_bit: std_logic;
--begin
--   -- fsmd state and data registers
--   process(clk,reset)
--   begin
--      if reset='1' then
--         state_reg <= idle;
--         rh_reg <= (others=>'0');
--         rl_reg <= (others=>'0');
--         d_reg <= (others=>'0');
--         n_reg <= (others=>'0');
--      elsif (clk'event and clk='1') then
--         state_reg <= state_next;
--         rh_reg <= rh_next;
--         rl_reg <= rl_next;
--         d_reg <= d_next;
--         n_reg <= n_next;
--      end if;
--   end process;
--
--   -- fsmd next-state logic and data path logic
--   process(state_reg,n_reg,rh_reg,rl_reg,d_reg,
--           start,dvsr,dvnd,q_bit,rh_tmp,n_next)
--   begin
--      ready <='0';
--      done_tick <= '0';
--      state_next <= state_reg;
--      rh_next <= rh_reg;
--      rl_next <= rl_reg;
--      d_next <= d_reg;
--      n_next <= n_reg;
--      case state_reg is
--         when idle =>
--            ready <= '1';
--            if start='1' then
--               rh_next <= (others=>'0');
--               rl_next <= dvnd;                  -- dividend
--               d_next <= unsigned(dvsr);         -- divisor
--               n_next <= to_unsigned(W+1, CBIT); -- index
--               state_next <= op;
--            end if;
--         when op =>
--            -- shift rh and rl left
--            rl_next <= rl_reg(W-2 downto 0) & q_bit;
--            rh_next <= rh_tmp(W-2 downto 0) & rl_reg(W-1);
--            --decrease index
--            n_next <= n_reg - 1;
--            if (n_next=1) then
--               state_next <= last;
--            end if;
--         when last =>  -- last iteration
--            rl_next <= rl_reg(W-2 downto 0) & q_bit;
--            rh_next <= rh_tmp;
--            state_next <= done;
--         when done =>
--            state_next <= idle;
--            done_tick <= '1';
--      end case;
--   end process;
--
--   -- compare and subtract
--   process(rh_reg, d_reg)
--   begin
--      if rh_reg >= d_reg then
--         rh_tmp <= rh_reg - d_reg;
--         q_bit <= '1';
--      else
--         rh_tmp <= rh_reg;
--         q_bit <= '0';
--      end if;
--   end process;
--
--   -- output
--   quo <= rl_reg;
--   rmd <= std_logic_vector(rh_reg);
--end arch;


-------------------------------------------------------------------------------
-- version 3: SRT binary divider from this textbook:
-- http://www.arithmetic-circuits.org/guide2fpga/vhdl_codes.htm
-------------------------------------------------------------------------------

--LIBRARY IEEE;
--USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_ARITH.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--ENTITY srt_divider IS
--  GENERIC(n: NATURAL:= 24; p: NATURAL:= 27);
--PORT(
--  x: IN STD_LOGIC_VECTOR(n DOWNTO 0);
--  y: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
--  clk, reset, start:IN STD_LOGIC;
--  quotient: OUT STD_LOGIC_VECTOR(0 TO p);
--  remainder: OUT STD_LOGIC_VECTOR(n DOWNTO 0);
--  done: OUT STD_LOGIC
--);
--END srt_divider;
--
--ARCHITECTURE circuit OF srt_divider IS
--  SIGNAL r, next_r, long_y, two_r: STD_LOGIC_VECTOR(n DOWNTO 0);
--  SIGNAL plus1, minus1, load, update: STD_LOGIC;
--  SIGNAL operation: STD_LOGIC_VECTOR(1 DOWNTO 0);
--  SIGNAL q, qm: STD_LOGIC_VECTOR(0 TO p);
--  
--  SUBTYPE index IS NATURAL RANGE 0 TO p-1;
--  SIGNAL count: index;
--  TYPE state IS RANGE 0 TO 3;
--  SIGNAL current_state: state;
--  
--BEGIN
--  long_y <= '0'&y;
--  two_r <= r(n-1 DOWNTO 0)&'0';
--  plus1 <= NOT(r(n)) AND (r(n-1) OR r(n-2));
--  minus1 <= r(n) AND (NOT(r(n-1)) OR NOT(r(n-2)));
--  operation <= plus1 & minus1;
--  WITH operation SELECT next_r <= two_r - long_y WHEN "10", two_r + long_y WHEN "01", two_r WHEN OTHERS;
--
--  remainder_register: PROCESS(clk)
--  BEGIN
--    IF clk'EVENT AND clk = '1' THEN
--      IF load = '1' THEN r <= x;
--      ELSIF update = '1' THEN r <= next_r;
--      END IF;  
--    END IF;
--  END PROCESS;
--  remainder <= r;
--
--  q_register: PROCESS(clk)
--  BEGIN
--    IF clk'EVENT AND clk = '1' THEN
--      IF load = '1' THEN q <= (OTHERS => '0');
--      ELSIF update = '1' THEN 
--      
--        IF plus1 = '1' THEN q(0 TO p-1) <= q(1 TO p); q(p) <= '1';
--        ELSIF minus1 = '1' THEN q(0 TO p-1) <= qm(1 TO p); q(p) <= '1';
--        ELSE q(0 TO p-1) <= q(1 TO p); q(p) <= '0'; 
--        END IF;
--         
--      END IF;  
--    END IF;
--  END PROCESS;
--
--  qm_register: PROCESS(clk)
--  BEGIN
--    IF clk'EVENT AND clk = '1' THEN
--      IF load = '1' THEN qm(0 TO p-1) <= (OTHERS => '0'); qm(p) <= '1';
--      ELSIF update = '1' THEN 
--      
--        IF plus1 = '1' THEN qm(0 TO p-1) <= q(1 TO p); qm(p) <= '0';
--        ELSIF minus1 = '1' THEN qm(0 TO p-1) <= qm(1 TO p); qm(p) <= '0';
--        ELSE qm(0 TO p-1) <= qm(1 TO p); qm(p) <= '1'; 
--        END IF;
--            
--      END IF;  
--    END IF;
--  END PROCESS;
--
--  quotient <= q;
--
--  counter: PROCESS(clk)
--  BEGIN
--    IF clk'EVENT and clk = '1' THEN
--      IF load = '1' THEN count <= 0; 
--      ELSIF update = '1' THEN count <= (count+1) MOD p;
--      END IF;
--    END IF;
--  END PROCESS;
--
--  next_state: PROCESS(clk)
--  BEGIN
--    IF reset = '1' THEN current_state <= 0;
--    ELSIF clk'EVENT AND clk = '1' THEN
--      CASE current_state IS
--        WHEN 0 => IF start = '0' THEN current_state <= 1; END IF;
--        WHEN 1 => IF start = '1' THEN current_state <= 2; END IF;
--        WHEN 2 => current_state <= 3;
--        WHEN 3 => IF count = p-1 THEN current_state <= 0; END IF;
--      END CASE;
--    END IF;
--  END PROCESS;
--
--  output_function: PROCESS(clk, current_state)
--  BEGIN
--    CASE current_state IS
--      WHEN 0 TO 1 => load <= '0'; update <= '0'; done <= '1';
--      WHEN 2 => load <= '1'; update <= '0'; done <= '0';
--      WHEN 3 => load <= '0'; update <= '1'; done <= '0';
--    END CASE;
--  END PROCESS;
--    
--END circuit;


-------------------------------------------------------------------------------
-- version 4: division circuit from page 245 of this textbook:
-- Jr. Charles H. Roth and Lizy K. John, Digital Systems Design Using VHDL, CL Engineering, 2 edition, 2007.
-- http://users.ece.utexas.edu/~roth/book/CH4_Slides.pdf
-- Note: this code here is actually as it's listed on the above slides
-- rather than how it's listed in the actual book;
-- Note: to use, we need to actually compile and use BITLIB as discussed on the
-- utexas website above...
-------------------------------------------------------------------------------

--library BITLIB;
--use BITLIB.bit_pack.all;
--
--entity sdiv is
--  port(
--    Clk,St: in bit;
--    Dbus: in bit_vector(15 downto 0);
--    Quotient: out bit_vector(15 downto 0);
--    V, Rdy: out bit
--  );
--end sdiv;
--
--architecture Signdiv of Sdiv is
--constant zero_vector: bit_vector(31 downto 0):=(others=>'0');
--signal State: integer range 0 to 6;
--signal Count : integer range 0 to 15;
--signal Sign,C,NC: bit;
--signal Divisor,Sum,Compout: bit_vector(15 downto 0);
--signal Dividend: bit_vector(31 downto 0);
--alias Q: bit_vector(15 downto 0) is Dividend(15 downto 0);
--alias Acc: bit_vector(15 downto 0) is Dividend(31 downto 16);
--begin -- concurrent statements
--compout <= divisor when divisor(15) = '1' -- 1's complementer
--else not divisor;
--Addvec(Acc,compout,not divisor(15),Sum,C,16); -- 16-bit adder
--Quotient <= Q;
--Rdy <= '1' when State=0 else '0';
--process
--begin
--wait until Clk = '1'; -- wait for rising edge of clock
--case State is
--when 0=>
--if St = '1' then
--Acc <= Dbus; -- load upper dividend
--Sign <= Dbus(15);
--State <= 1;
--V <= '0'; -- initialize overflow
--Count <= 0; -- initialize counter
--end if;
--when 1=>
--Q <= Dbus; -- load lower dividend
--State <= 2;
--when 2=>
--Divisor <= Dbus;
--if Sign ='1'then -- two's complement Dividend if necessary
--addvec(not Dividend,zero_vector,'1',Dividend,NC,32);
--
--end if;
--State <= 3;
--when 3=>
--Dividend <= Dividend(30 downto 0) & '0'; -- left shift
--Count <= Count+1;
--State <= 4;
--when 4 =>
--if C ='1' then -- C
--v <= '1';
--State <= 0;
--else -- C'
--Dividend <= Dividend(30 downto 0) & '0'; -- left shift
--Count <= Count+1;
--State <= 5;
--end if;
--when 5 =>
--if C = '1' then -- C
--ACC <= Sum; -- subtract
--Q(0)<= '1';
--else
--Dividend <= Dividend(30 downto 0) & '0'; -- left shift
--if Count = 15 then -- KC'
--count<= 0; State <= 6;
--else Count <= Count+1;
--end if;
--end if;
--when 6=>
--if C = '1' then -- C
--Acc <= Sum; -- subtract
--Q(0) <= '1';
--else if (Sign xor Divisor(15))='1' then -- C'Qneg
--addvec(not Dividend,zero_vector,'1',Dividend,NC,32);
--end if; -- 2's complement Dividend
--state <= 0;
--end if;
--end case;
--end process;
--end signdiv;
