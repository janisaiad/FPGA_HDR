library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LUT3D is
    generic (
        ADDR_WIDTH : integer := 3
    );
    port (
        clk : in std_logic;
        x, y, z : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        lut_value : out std_logic_vector(7 downto 0)
    );
end entity;

architecture Behavioral of LUT3D is
    constant LUT_SIZE : integer := 2**ADDR_WIDTH;
    type lut_array is array (0 to LUT_SIZE-1, 0 to LUT_SIZE-1, 0 to LUT_SIZE-1) of std_logic_vector(7 downto 0);
    signal lut : lut_array;
    signal x1, x2, y1, y2, z1, z2 : integer;
    signal f1, f2, f3, f4, f5, f6, f7, f8 : std_logic_vector(7 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Convert the inputs to integer indices
            x1 <= to_integer(unsigned(x(ADDR_WIDTH-1 downto 0)));
            x2 <= x1 + 1;
            y1 <= to_integer(unsigned(y(ADDR_WIDTH-1 downto 0)));
            y2 <= y1 + 1;
            z1 <= to_integer(unsigned(z(ADDR_WIDTH-1 downto 0)));
            z2 <= z1 + 1;

            -- Get the 8 corner values from the LUT
            f1 <= lut(x1, y1, z1);
            f2 <= lut(x2, y1, z1);
            f3 <= lut(x1, y2, z1);
            f4 <= lut(x2, y2, z1);
            f5 <= lut(x1, y1, z2);
            f6 <= lut(x2, y1, z2);
            f7 <= lut(x1, y2, z2);
            f8 <= lut(x2, y2, z2);

            -- Perform trilinear interpolation
            lut_value <= f1 + 
                         (x - x1) * (f2 - f1) + 
                         (y - y1) * (f3 - f1) + 
                         (z - z1) * (f5 - f1) + 
                         (x - x1) * (y - y1) * (f4 - f1) + 
                         (x - x1) * (z - z1) * (f6 - f1) + 
                         (y - y1) * (z - z1) * (f7 - f1) + 
                         (x - x1) * (y - y1) * (z - z1) * (f8 - f1);
        end if;
    end process;
end architecture;