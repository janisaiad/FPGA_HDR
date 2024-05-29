-- Include library files
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Declare the entity of the module
entity apply_luts is
    generic (
        LUT_SIZE : positive := 64
    );
    port (
        clk : in std_logic; -- System clock
        rst : in std_logic; -- Reset signal
        input : in std_logic_vector(7 downto 0);
        output : out std_logic_vector(7 downto 0);
        sdram_address : inout std_logic_vector(31 downto 0);  -- SDRAM address
        sdram_data : inout std_logic_vector(31 downto 0);  -- SDRAM data
        sdram_read, sdram_write : out std_logic;  -- SDRAM read and write signals
        lut_inv_address : in std_logic_vector(31 downto 0);  -- Inverse LUT address
        lut_address : in std_logic_vector(31 downto 0)  -- LUT address
    );
end entity apply_luts;

-- Define the architecture of the module
architecture rtl of apply_luts is
    -- Declare internal signals
    signal lut_output : std_logic_vector(7 downto 0);
    signal lut_value : std_logic_vector(7 downto 0);
    signal interpolated_value : std_logic_vector(7 downto 0);

begin
    -- Read the corresponding LUT value
    lut_value <= lut_read(unsigned(lut_address), LUT_SIZE);

    -- Interpolate the LUT value
    interpolated_value <= interpolate(lut_value);

    -- Assign the interpolated value to the output
    output <= interpolated_value;

    -- Read from SDRAM
    process (clk, rst)
    begin
        if rst = '1' then
            -- Reset
            sdram_address <= (others => '0');
            sdram_read    <= '0';
            sdram_write   <= '0';
        elsif rising_edge(clk) then
            -- Read the LUT value from the SDRAM
            sdram_address <= lut_address;
            sdram_read <= '1';
        end if;
    end process;

end architecture rtl;