-- Include library files
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.CustomsVHD.custom_functions.all; -- Include the custom_functions package
use work.CustomsVHD.inverse_tonemappers.all; -- Include the inverse_tonemappers package
use work.apply_luts_pkg.all;
use work.vga_image_pkg.all;

-- Declare the entity of the module
entity apply_and_display_lut is
    port (
        clk       : in std_logic; -- System clock
        rst       : in std_logic; -- Reset signal
        switch_inv: in std_logic_vector(1 downto 0); -- Switches for inverse LUTs
        switch    : in std_logic_vector(1 downto 0); -- Switches for LUTs
        sdram_address : inout std_logic_vector(31 downto 0); -- SDRAM address
        sdram_data    : inout std_logic_vector(31 downto 0); -- SDRAM data
        sdram_read    : out std_logic; -- SDRAM read control
        sdram_write   : out std_logic -- SDRAM write control
    );
end entity apply_and_display_lut;

-- Define the architecture of the module
architecture Behavioral of apply_and_display_lut is
    -- Declare internal signals
    signal lut_inv_address : std_logic_vector(31 downto 0);
    signal lut_address     : std_logic_vector(31 downto 0);

    -- Instantiate the apply_luts module
    component apply_luts is
        port (
            clk : in std_logic;
            rst : in std_logic;
            input : in std_logic_vector(7 downto 0);
            output : out std_logic_vector(7 downto 0);
            sdram_address : inout std_logic_vector(31 downto 0);
            sdram_data : inout std_logic_vector(31 downto 0);
            sdram_read, sdram_write : out std_logic;
            lut_inv_address : in std_logic_vector(31 downto 0);
            lut_address : in std_logic_vector(31 downto 0)
        );
    end component;

begin
    -- Instantiate the apply_luts module
    lut : apply_luts
        port map (
            clk => clk,
            rst => rst,
            input => sdram_data(7 downto 0),
            output => sdram_data(7 downto 0),
            sdram_address => sdram_address,
            sdram_data => sdram_data,
            sdram_read => sdram_read,
            sdram_write => sdram_write,
            lut_inv_address => lut_inv_address,
            lut_address => lut_address
        );

    -- Select the LUT and inverse LUT based on the switch input
    process (clk, rst)
    begin
        if rst = '1' then
            -- Reset
            sdram_address <= (others => '0');
            sdram_data    <= (others => '0');
            sdram_read    <= '0';
            sdram_write   <= '0';
        elsif rising_edge(clk) then
            -- Select the inverse LUT based on switch_inv
            case switch_inv is
                when "00" => lut_inv_address <= "00000001"; -- Address of the first inverse LUT
                when "01" => lut_inv_address <= "00000010"; -- Address of the second inverse LUT
                when "10" => lut_inv_address <= "00000011"; -- Address of the third inverse LUT
                when "11" => lut_inv_address <= "00000100"; -- Address of the fourth inverse LUT
                when others => lut_inv_address <= (others => '0');
            end case;

            -- Select the LUT based on switch
            case switch is
                when "00" => lut_address <= "00000001"; -- Address of the first LUT
                when "01" => lut_address <= "00000010"; -- Address of the second LUT
                when "10" => lut_address <= "00000011"; -- Address of the third LUT
                when "11" => lut_address <= "00000100"; -- Address of the fourth LUT
                when others => lut_address <= (others => '0');
            end case;
        end if;
    end process;

end architecture Behavioral;