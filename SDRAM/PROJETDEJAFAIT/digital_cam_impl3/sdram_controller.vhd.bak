-- this entity is an SDRAM controller for the 64Mbyte SDRAM chips 
-- (there are two of them, U15 and U13) on DE2-115 board;
-- datasheet of these SDRAM chips is VERY important, as I refer to it
-- in some comments, and you can find its pdf in the Terasic's CD
-- that comes with the board;
-- the datasheet is for part number: IS45S16320B; you can download it from here:
-- http://www.issi.com/WW/pdf/42S16320B-86400B.pdf
-- Notes:
-- 1) this code is a direct translation from Verlig to VHDL; original Verilog is here:
--    http://whoyouvotefor.info/altera_sdram.shtml
-- 2) this coding style is not good; and it should be cleaned up;
--    for instance, we should not have if statements with missing else branches
--    or signals left unassigned in ALL possible situations captured by
--    partial if or case statements;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;


entity sdram_controller is
  Port (
    clk_i: in  STD_LOGIC; -- clk_100
    dram_clk_i: in  STD_LOGIC; -- clk_100_3ns
    rst_i: in  STD_LOGIC;
    dll_locked: in  STD_LOGIC;
    -- all ddr signals
    dram_addr: out  STD_LOGIC_vector(12 downto 0);
    dram_bank: out  STD_LOGIC_vector(1 downto 0);
    dram_cas_n: out  STD_LOGIC;
    dram_cke: out  STD_LOGIC;
    dram_clk: out  STD_LOGIC;
    dram_cs_n: out  STD_LOGIC;
    dram_dq: inout  STD_LOGIC_vector(15 downto 0);
    dram_ldqm: out  STD_LOGIC;
    dram_udqm: out  STD_LOGIC;
    dram_ras_n: out  STD_LOGIC;
    dram_we_n: out  STD_LOGIC;
    -- wishbone bus
    addr_i: in  STD_LOGIC_vector(24 downto 0); 
    dat_i: in  STD_LOGIC_vector(31 downto 0);
    dat_o: out  STD_LOGIC_vector(31 downto 0);
    we_i: in  STD_LOGIC;
    ack_o: out  STD_LOGIC;
    stb_i: in  STD_LOGIC;
    cyc_i: in  STD_LOGIC
  );
end sdram_controller;


architecture my_behavioral of sdram_controller is

  -- row width 13
  -- column width 10
  -- bank width 2
  -- user address is specified as {bank,row,column}

  -- now, look at page 24 of datasheet of SDRAM chips;
  -- we see address[2:0] is the Burst Length (BL), which we'll set here as 2; so, address[2:0] must be "001"
  -- also, address[3] is Burst Type; we set it to Sequential; so, address[3] must be '0';
  -- also, address[6:4] is CAS Latency, which we set to 3 here; so, address[6:4] must be "011";
  -- MODE_REGISTER is defined as: BA1 BA0 A12 A11 A10 A9 A8 A7 A6 A5 A4 A3 A2 A1 A0
  -- with BA1 BA0 A12 A11 A10 being reserved;
  -- so we use A2 A1 A0 = "001" to BL=2; A3 = '0'; A6 A5 A4 = "011" to CAS=3
  -- Note: I am defining MODE_REGISTER with just 13 bits instead of 15 bits; discard BA1 BA0;
  constant MODE_REGISTER : std_logic_vector(12 downto 0) := "0000000110001";
    
  constant INIT_IDLE          : std_logic_vector(2 downto 0) := "000";
  constant INIT_WAIT_200us    : std_logic_vector(2 downto 0) := "001";
  constant INIT_INIT_PRE      : std_logic_vector(2 downto 0) := "010";
  constant INIT_WAIT_PRE      : std_logic_vector(2 downto 0) := "011";
  constant INIT_MODE_REG      : std_logic_vector(2 downto 0) := "100";
  constant INIT_WAIT_MODE_REG : std_logic_vector(2 downto 0) := "101";
  constant INIT_DONE_ST       : std_logic_vector(2 downto 0) := "110";

  constant IDLE_ST         : std_logic_vector(3 downto 0) := "0000";
  constant REFRESH_ST      : std_logic_vector(3 downto 0) := "0001";
  constant REFRESH_WAIT_ST : std_logic_vector(3 downto 0) := "0010";
  constant ACT_ST          : std_logic_vector(3 downto 0) := "0011";
  constant WAIT_ACT_ST     : std_logic_vector(3 downto 0) := "0100";
  constant WRITE0_ST       : std_logic_vector(3 downto 0) := "0101";
  constant WRITE1_ST       : std_logic_vector(3 downto 0) := "0110";
  constant WRITE_PRE_ST    : std_logic_vector(3 downto 0) := "0111";
  constant READ0_ST        : std_logic_vector(3 downto 0) := "1000";
  constant READ1_ST        : std_logic_vector(3 downto 0) := "1001";
  constant READ2_ST        : std_logic_vector(3 downto 0) := "1010";
  constant READ3_ST        : std_logic_vector(3 downto 0) := "1011";
  constant READ4_ST        : std_logic_vector(3 downto 0) := "1100";
  constant READ_PRE_ST     : std_logic_vector(3 downto 0) := "1101";
  constant PRE_ST          : std_logic_vector(3 downto 0) := "1110";
  constant WAIT_PRE_ST     : std_logic_vector(3 downto 0) := "1111";


  -- if 100 MHz, then, period is T_CLK = 10 ns 
  -- 7 cycles == time to wait after refresh 70ns
  -- also time to wait between two ACT commands; I'll make it 100ns though;
  constant TRC_CNTR_VALUE : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(10, 4));
  -- need 8192=2^13 refreshes for every 64_000_000 ns 
  -- (every 64ms, see page 7 of datasheet of ISSI SDRAM chips on DE2-115)
  -- so the # of cycles between refreshes is 64000000 / 8192 / 10 = 781.25; I'll make 780 though;
  constant RFSH_INT_CNTR_VALUE : std_logic_vector(24 downto 0) := std_logic_vector(to_unsigned(780, 25));
  -- ras to cas delay 20 ns; that's about 2 T_CLK
  -- will also be used for tRP and tRSC
  constant TRCD_CNTR_VALUE : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(2, 3));
  -- TODO: datasheet of SDRAM chips (page 20) says that 
  -- A 100us delay is required prior to issuing any command other than a COMMAND INHIBIT or a NOP.
  -- 20000 cycles to make up 200 us instead of 100 us
  constant WAIT_200us_CNTR_VALUE : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(20000, 16)); 



  signal address_r: std_logic_vector(24 downto 0); 

  signal dram_addr_r: std_logic_vector(12 downto 0); 
  signal dram_bank_r: std_logic_vector(1 downto 0);
  signal dram_dq_r: std_logic_vector(15 downto 0); 
  signal dram_cas_n_r: std_logic;
  signal dram_ras_n_r: std_logic;
  signal dram_we_n_r: std_logic;


  signal dat_o_r: std_logic_vector(31 downto 0) := (others => '0');
  signal ack_o_r: std_logic := '0';
  signal dat_i_r: std_logic_vector(31 downto 0);
  signal we_i_r: std_logic := '0';
  signal stb_i_r: std_logic;
  signal oe_r: std_logic := '0';

  signal current_state: std_logic_vector(3 downto 0) := IDLE_ST;
  signal next_state: std_logic_vector(3 downto 0) := IDLE_ST;
  signal current_init_state: std_logic_vector(2 downto 0) := INIT_IDLE;
  signal next_init_state: std_logic_vector(2 downto 0) := INIT_IDLE;
    
    
  signal init_done: std_logic := '0';
  signal init_pre_cntr: std_logic_vector(3 downto 0) := (others => '0');
  signal trc_cntr: std_logic_vector(3 downto 0) := (others => '0');
  signal rfsh_int_cntr: std_logic_vector(24 downto 0) := (others => '0');      
  signal trcd_cntr: std_logic_vector(2 downto 0) := (others => '0');
  signal wait_200us_cntr: std_logic_vector(15 downto 0) := (others => '0');
  signal do_refresh: std_logic;


begin

  dram_addr <= dram_addr_r;
  dram_bank <= dram_bank_r;
  dram_cas_n <= dram_cas_n_r;
  dram_ras_n <= dram_ras_n_r;
  dram_we_n <= dram_we_n_r;
  dram_dq <= dram_dq_r when oe_r = '1' else (others => 'Z');    

  dat_o <= dat_o_r;
  ack_o <= ack_o_r;
    
  dram_cke <= '1'; -- dll_locked
  dram_cs_n <= not dll_locked; -- chip select is always on in normal op
  dram_clk <= dram_clk_i;
  dram_ldqm <= '0'; -- don't do byte masking
  dram_udqm <= '0'; -- don't do byte masking
    
    
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (stb_i_r = '1' and current_state = ACT_ST) then
        stb_i_r <= '0';
      elsif (stb_i = '1' and cyc_i = '1') then
        address_r <= addr_i;
        dat_i_r <= dat_i;
        we_i_r <= we_i; -- pick whatever value we_i has;
        stb_i_r <= stb_i;
      end if;
    end if;
  end process;

    
  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        wait_200us_cntr <= (others => '0');
      elsif (current_init_state = INIT_IDLE) then
        wait_200us_cntr <= WAIT_200us_CNTR_VALUE;
      else 
        wait_200us_cntr <= wait_200us_cntr - 1;
      end if;
    end if;
  end process;
    

  -- control the interval between refreshes
  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        rfsh_int_cntr <= (others => '0'); -- immediately initiate new refresh on reset
      elsif (current_state = REFRESH_WAIT_ST) then
        do_refresh <= '0';
        rfsh_int_cntr <= RFSH_INT_CNTR_VALUE;
      elsif (rfsh_int_cntr = "0000000000000000000000000") then
        do_refresh <= '1';
      else 
        rfsh_int_cntr <= rfsh_int_cntr - 1; 
      end if;
    end if;
  end process;  
    

  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        trc_cntr <= "0000";
      elsif (current_state = PRE_ST or current_state = REFRESH_ST) then
        trc_cntr <= TRC_CNTR_VALUE;
      else 
        trc_cntr <= trc_cntr - 1; 
      end if;
    end if;  
  end process; 
    

  -- counter to control the activate
  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        trcd_cntr <= "000";
      elsif (current_state = ACT_ST or current_init_state = INIT_INIT_PRE 
        or current_init_state = INIT_MODE_REG) then
        trcd_cntr <= TRCD_CNTR_VALUE;
      else 
        trcd_cntr <= trcd_cntr - 1;
      end if;
    end if;
  end process;


  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        init_pre_cntr <= "0000";
      elsif (current_init_state = INIT_INIT_PRE) then
        init_pre_cntr <= init_pre_cntr + 1;
      end if;
    end if;
  end process;


  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (current_init_state = INIT_DONE_ST) then
        init_done <= '1';
      end if;
    end if;
  end process;


  -- state change
  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        current_init_state <= INIT_IDLE;
      else      
        current_init_state <= next_init_state;
      end if;
    end if;
  end process;


  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        current_state <= IDLE_ST;
      else 
        current_state <= next_state;
      end if;
    end if;
  end process;
   

  -- initialization is fairly easy on this chip: wait 200us then issue
  -- 8 precharges before setting the mode register
  process (current_init_state)
  begin
    case current_init_state is  
      when INIT_IDLE =>
        if (init_done = '0') then 
          next_init_state <= INIT_WAIT_200us;
        else 
          next_init_state <= INIT_IDLE;
        end if;
        
      when INIT_WAIT_200us =>
        if (wait_200us_cntr = "0000000000000000") then 
          next_init_state <= INIT_INIT_PRE;
        else 
          next_init_state <= INIT_WAIT_200us;
        end if;
        
      when INIT_INIT_PRE =>
        next_init_state <= INIT_WAIT_PRE;

      when INIT_WAIT_PRE =>
        if (trcd_cntr = "000") then -- this is tRP
          if (init_pre_cntr = "1000") then
            next_init_state <= INIT_MODE_REG;
          else
            next_init_state <= INIT_INIT_PRE;
          end if;
        else 
          next_init_state <= INIT_WAIT_PRE;
        end if;

      when INIT_MODE_REG =>
        next_init_state <= INIT_WAIT_MODE_REG;
        
      when INIT_WAIT_MODE_REG =>
        if (trcd_cntr = "000") then -- tRSC
          next_init_state <= INIT_DONE_ST;
        else 
          next_init_state <= INIT_WAIT_MODE_REG;
        end if;
      
      when INIT_DONE_ST =>
        next_init_state <= INIT_IDLE;

      when others =>
        next_init_state <= INIT_IDLE;      
    end case;
  end process;

   
  -- this is the main controller logic:
  process (current_state)
  begin
    case current_state is  
      when IDLE_ST =>
        if (init_done = '0') then
          next_state <= IDLE_ST;
        elsif (do_refresh = '1') then 
          next_state <= REFRESH_ST;
        elsif (stb_i_r = '1') then 
          next_state <= ACT_ST;
        else   
          next_state <= IDLE_ST;
        end if;
        
      when REFRESH_ST => 
        next_state <= REFRESH_WAIT_ST;

      when REFRESH_WAIT_ST =>
        if (trc_cntr = "0000") then 
          next_state <= IDLE_ST;
        else 
          next_state <= REFRESH_WAIT_ST;
        end if;
        
      when ACT_ST => 
        next_state <= WAIT_ACT_ST;
        
      when WAIT_ACT_ST =>
        if (trcd_cntr = "000") then
          if (we_i_r = '1') then 
            next_state <= WRITE0_ST;
          else  
            next_state <= READ0_ST;
          end if;
        else
          next_state <= WAIT_ACT_ST;
        end if;
        
      when WRITE0_ST => 
        next_state <= WRITE1_ST;

      when WRITE1_ST =>
        next_state <= WRITE_PRE_ST;
        
      when WRITE_PRE_ST =>
        next_state <= PRE_ST;
        
      when READ0_ST =>  
        next_state <= READ1_ST;

      when READ1_ST => 
        next_state <= READ2_ST;
        
      when READ2_ST => 
        next_state <= READ3_ST;

      when READ3_ST =>
        next_state <= READ4_ST;

      when READ4_ST =>  
        next_state <= READ_PRE_ST;

      when READ_PRE_ST => 
        next_state <= PRE_ST;
        
      when PRE_ST => 
        next_state <= WAIT_PRE_ST;
        
      when WAIT_PRE_ST =>
        -- if the next command was not another row activate in the same bank
        -- we could wait tRCD only; for simplicity but at the detriment of
        -- efficiency we always wait tRC
        if (trc_cntr = "0000") then 
          next_state <= IDLE_ST;
        else 
          next_state <= WAIT_PRE_ST;
        end if;

      when others => 
        next_state <= IDLE_ST;        
    end case;
  end process;
   

  -- ack_o signal
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (current_state = READ_PRE_ST or current_state = WRITE_PRE_ST) then
        ack_o_r <= '1';
      elsif (current_state = WAIT_PRE_ST) then
        ack_o_r <= '0';
      end if;
    end if;
  end process;
   
   
  -- data
  process (clk_i, rst_i)
  begin
    if rising_edge (clk_i) then
      if (rst_i = '1') then
        dat_o_r <= (others => '0'); 
        dram_dq_r <= (others => '0');
        oe_r <= '0';
      elsif (current_state = WRITE0_ST) then
        dram_dq_r <= dat_i_r(31 downto 16);
        oe_r <= '1';
      elsif (current_state = WRITE1_ST) then
        dram_dq_r <= dat_i_r(15 downto 0);
        oe_r <= '1';
      elsif (current_state = READ4_ST) then
        -- we should actually be reading this on READ3, but
        -- because of delay the data comes a cycle later...
        dat_o_r(31 downto 16) <= dram_dq;
        dram_dq_r <= (others => 'Z');
        oe_r <= '0';
      elsif (current_state = READ_PRE_ST) then
        dat_o_r(15 downto 0) <= dram_dq; 
        dram_dq_r <= (others => 'Z');
        oe_r <= '0';
      else 
        dram_dq_r <= (others => 'Z');
        oe_r <= '0';
      end if;
    end if;
  end process;


  -- address
  process (clk_i)
  begin
    if rising_edge (clk_i) then
      if (current_init_state = INIT_MODE_REG) then
        dram_addr_r <= MODE_REGISTER;
      elsif (current_init_state = INIT_INIT_PRE) then
        -- from page 6 of datasheet of SDRAM chips on DE2-115 board: 
        -- A10 is sampled during a PRECHARGE command to
        -- determine if all banks are to be precharged (A10 HIGH) 
        -- or bank selected by BA0, BA1 (LOW).
        dram_addr_r <= "0010000000000"; -- A[10] = '1' to precharge all
      elsif (current_state = ACT_ST) then
        dram_addr_r <= address_r(22 downto 10);
        dram_bank_r <= address_r(24 downto 23);
      elsif (current_state = WRITE0_ST or current_state = READ0_ST) then
        -- enter column with bit A10 set to 1 indicating auto precharge;
        dram_addr_r <= "001" & address_r(9 downto 0);
        dram_bank_r <= address_r(24 downto 23);
      else 
        dram_addr_r <= (others => '0');
        dram_bank_r <= "00";
      end if;
    end if;
  end process;


  -- commands
  process (clk_i)
  begin
    if rising_edge (clk_i) then     
      if (current_init_state = INIT_INIT_PRE 
        or current_init_state = INIT_MODE_REG 
        or current_state = REFRESH_ST 
        or current_state = ACT_ST) then
        dram_ras_n_r <= '0';
      else 
        dram_ras_n_r <= '1';
      end if;
      
      if (current_state = READ0_ST 
        or current_state = WRITE0_ST 
        or current_state = REFRESH_ST 
        or current_init_state = INIT_MODE_REG) then
        dram_cas_n_r <= '0';
      else 
        dram_cas_n_r <= '1';
      end if;
       
      if (current_init_state = INIT_INIT_PRE 
        or current_state = WRITE0_ST 
        or current_init_state = INIT_MODE_REG) then
        dram_we_n_r <= '0';
      else
        dram_we_n_r <= '1';
      end if;
    end if;
  end process;
  
  
end my_behavioral;
