library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity module_sdram_to_ram is
  generic
  (
    IMAGE_WIDTH      : positive                      := 640; -- Width of the image in pixels
    IMAGE_HEIGHT     : positive                      := 480 -- Height of the image in pixels
    NB_PIXELS        : positive                      := 3 * IMAGE_WIDTH * IMAGE_HEIGHT; -- Number of pixels in the image multiplied by 3 (RGB)
    start_image_addr : std_logic_vector(23 downto 0) := x"000000" -- Start address of the image in SDRAM
    final_image_addr : std_logic_vector(23 downto 0) := x"000000" -- Final address of the image in RAM
  );
  port
  (
    -- RAM Ports
    ram_dout : out std_logic_vector; -- Data output to RAM
    ram_addr : out std_logic_vector; -- Address output to RAM
    ram_done : out std_logic; -- Done signal to RAM
    wren     : in std_logic; -- Write enable signal RAM

    -- SDRAM Ports
    sdram_din       : in std_logic_vector; -- Data input from SDRAM
    sdram_addr      : in std_logic_vector; -- Address input from SDRAM
    sdram_done      : in std_logic; -- Done signal from SDRAM
    read_mode_SDRAM : out std_logic; -- Read mode signal to SDRAM

    -- Other Ports
    clk           : in std_logic; -- Clock signal
    reset         : in std_logic; -- Reset signal
    do_transfer   : in std_logic; -- Transfer signal
    done_transfer : out std_logic -- Done signal of the transfer
  );
end entity module_sdram_to_ram;

architecture rtl of module_sdram_to_ram is
  -- Internal signals
  signal row_counter : unsigned(IMAGE_HEIGHT - 1 downto 0);
  signal col_counter : unsigned(IMAGE_WIDTH - 1 downto 0);

  -- Read/Write
  signal address_SDRAM : std_logic_vector(23 downto 0);
  signal address_RAM   : std_logic_vector(23 downto 0);
  signal pixel         : std_logic_vector(31 downto 0);

  -- State machine
  signal cntr_SDRAM          : integer                      := 0;
  signal cntr_RAM            : integer                      := 0;
  signal state               : state_type                   := IDLE;
  signal START_TRANSFER_ST   : std_logic_vector(3 downto 0) := "0000";
  signal READ_SDRAM_ST       : std_logic_vector(3 downto 0) := "0001";
  signal WAIT_READ_SRAM_ST   : std_logic_vector(3 downto 0) := "0010";
  signal WRITE_RAM_R_ST      : std_logic_vector(3 downto 0) := "0011";
  signal WAIT_WRITE_R_RAM_ST : std_logic_vector(3 downto 0) := "0100";
  signal WRITE_RAM_G_ST      : std_logic_vector(3 downto 0) := "0101";
  signal WAIT_WRITE_G_RAM_ST : std_logic_vector(3 downto 0) := "0110";
  signal WRITE_RAM_B_ST      : std_logic_vector(3 downto 0) := "0111";
  signal WAIT_WRITE_B_RAM_ST : std_logic_vector(3 downto 0) := "1000";
  signal DONE_ST             : std_logic_vector(3 downto 0) := "1001";
  signal IDLE_ST             : std_logic_vector(3 downto 0) := "1010";

  signal state : std_logic_vector(3 downto 0) := IDLE_ST;

begin
  process (clk, reset)
    -- L'idée est d'utiliser une machine d'état pour lire chaque pixel avant de l'écrire dans la RAM
  begin
    if rising_edge(clk) then
      if reset = '1' then
        -- Reset state and counters
        state         <= IDLE;
        row_counter   <= (others => '0');
        col_counter   <= (others => '0');
        ram_done      <= '0';
        ram_addr      <= (others => '0');
        ram_dout      <= (others => '0');
        done_transfer <= '0';
      else
        case state is
          when IDLE =>
            if do_transfer = '1' then
              state         <= START_TRANSFER_ST;
              row_counter   <= (others => '0');
              col_counter   <= (others => '0');
              ram_done      <= '0';
              ram_addr      <= (others => '0');
              ram_dout      <= (others => '0');
              done_transfer <= '0';
            end if;

          when START_TRANSFER_ST =
            if (cntr < NB_PIXELS) then
              state <= READ_SDRAM_ST;
            else
              state <= DONE_ST;
            end if;

          when READ_SDRAM_ST =>
            address_SDRAM   <= start_image_addr + to_slv(cntr_SDRAM, 24);
            read_mode_SDRAM <= '1';
            state           <= WAIT_READ_SRAM_ST;

          when WAIT_READ_SRAM_ST =>
            if sdram_done = '1' then
              state           <= WRITE_RAM_R_ST;
              read_mode_SDRAM <= '0';
              pixel           <= sdram_din;
              cntr_SDRAM      <= cntr_SDRAM + 1;
            end if;

          when WRITE_RAM_R_ST =>
            address_RAM <= final_image_addr + to_slv(cntr_RAM, 24);
            ram_addr    <= address_RAM;
            wren        <= '1';
            ram_dout    <= pixel(7 downto 0);
            state       <= WAIT_WRITE_RAM_R_ST;

          when WAIT_WRITE_RAM_R_ST =>
            if ram_done = '1' then
              state    <= WRITE_RAM_G_ST;
              wren     <= '0';
              cntr_RAM <= cntr_RAM + 1;
            end if;

          when WRITE_RAM_G_ST =>
            address_RAM <= final_image_addr + to_slv(cntr_RAM, 24);
            ram_addr    <= address_RAM;
            wren        <= '1';
            ram_dout    <= pixel(15 downto 8);
            state       <= WAIT_WRITE_G_RAM_ST;

          when WAIT_WRITE_G_RAM_ST =>
            if ram_done = '1' then
              state    <= WRITE_RAM_B_ST;
              wren     <= '0';
              cntr_RAM <= cntr_RAM + 1;
            end if;

          when WRITE_RAM_B_ST =>
            address_RAM <= final_image_addr + to_slv(cntr_RAM, 24);
            ram_addr    <= address_RAM;
            wren        <= '1';
            ram_dout    <= pixel(23 downto 16);
            state       <= WAIT_WRITE_B_RAM_ST;

          when WAIT_WRITE_B_RAM_ST =>
            if ram_done = '1' then
              state    <= READ_SDRAM_ST;
              wren     <= '0';
              cntr_RAM <= cntr_RAM + 1;
            end if;

          when DONE_ST =>
            done_transfer <= '1';

            --- Reset state and counters
            cntr_RAM   <= 0;
            cntr_SDRAM <= 0;
            state      <= IDLE_ST;

          when others =>
            state <= IDLE_ST;

        end if;
      end case;
    end if;
  end if;
end process;
end architecture rtl;