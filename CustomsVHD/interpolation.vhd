-- Import the necessary libraries
library ieee;
use ieee.std_logic_1164.all;  -- Standard logic data types
use ieee.numeric_std.all;     -- Numeric operations for std_logic_vector

-- Define the LUT3D entity
entity LUT3D is
  generic
  (
    ADDR_WIDTH : integer := 3  -- The width of the address for the LUT
  );
  port
  (
    clk                                   : in std_logic;  -- Clock signal
    x, y, z                               : in std_logic_vector(ADDR_WIDTH - 1 downto 0);  -- Input color components
    lut_value_r, lut_value_g, lut_value_b : out std_logic_vector(7 downto 0)  -- Output interpolated color components
  );
end entity;

-- Define the architecture for the LUT3D entity
architecture Behavioral of LUT3D is
  constant LUT_SIZE : integer := 2 ** ADDR_WIDTH;  -- The size of the LUT
  type color is record
    r, g, b : std_logic_vector(7 downto 0);  -- Define a color as a record of three std_logic_vectors
  end record;
  type lut_array is array (0 to LUT_SIZE - 1, 0 to LUT_SIZE - 1, 0 to LUT_SIZE - 1) of color;  -- Define the LUT as a 3D array of colors
  signal lut                            : lut_array;  -- The LUT signal
  signal x1, x2, y1, y2, z1, z2         : integer;  -- The indices for the LUT
  signal f1, f2, f3, f4, f5, f6, f7, f8 : color;  -- The 8 corner values for the interpolation
begin
  process (clk)  -- The process that performs the interpolation
  begin
    if rising_edge(clk) then  -- At each rising edge of the clock
      -- Convert color components to integer
      r <= to_integer(unsigned(color_r(7 downto 0))) / (2 ** (8 - ADDR_WIDTH));
      g <= to_integer(unsigned(color_g(7 downto 0))) / (2 ** (8 - ADDR_WIDTH));
      b <= to_integer(unsigned(color_b(7 downto 0))) / (2 ** (8 - ADDR_WIDTH));

      -- Convert the inputs to integer indices
      x1 <= r;
      x2 <= x1 + 1;
      y1 <= g;
      y2 <= y1 + 1;
      z1 <= b;
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

      -- Perform trilinear interpolation for each color component
      lut_value_r <= f1.r +
        (x - x1) * (f2.r - f1.r) +
        (y - y1) * (f3.r - f1.r) +
        (z - z1) * (f5.r - f1.r) +
        (x - x1) * (y - y1) * (f4.r - f1.r) +
        (x - x1) * (z - z1) * (f6.r - f1.r) +
        (y - y1) * (z - z1) * (f7.r - f1.r) +
        (x - x1) * (y - y1) * (z - z1) * (f8.r - f1.r);

      lut_value_g <= f1.g +
        (x - x1) * (f2.g - f1.g) +
        (y - y1) * (f3.g - f1.g) +
        (z - z1) * (f5.g - f1.g) +
        (x - x1) * (y - y1) * (f4.g - f1.g) +
        (x - x1) * (z - z1) * (f6.g - f1.g) +
        (y - y1) * (z - z1) * (f7.g - f1.g) +
        (x - x1) * (y - y1) * (z - z1) * (f8.g - f1.g);

      lut_value_b <= f1.b +
        (x - x1) * (f2.b - f1.b) +
        (y - y1) * (f3.b - f1.b) +
        (z - z1) * (f5.b - f1.b) +
        (x - x1) * (y - y1) * (f4.b - f1.b) +
        (x - x1) * (z - z1) * (f6.b - f1.b) +
        (y - y1) * (z - z1) * (f7.b - f1.b) +
        (x - x1) * (y - y1) * (z - z1) * (f8.b - f1.b);
    end if;
  end process;
end architecture;