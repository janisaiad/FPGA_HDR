library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity module_interpolation is
  port
  (
    clk     : in std_logic; -- Horloge
    rst     : in std_logic;  -- Reset
    rgb_in  : in std_logic_vector(23 downto 0); -- La couleur d'entrée sur 24 bits (8 bits par composante) 
    rgb_out : out std_logic_vector(23 downto 0); -- La couleur de sortie sur 24 bits (8 bits par composante)

    -- Lecture LUT
    rgb_in_lut  : in std_logic_vector(17 downto 0); -- L'indice de la LUT sur 18 bits
    rgb_out_lut : out std_logic_vector(23 downto 0); -- La couleur de la LUT sur 24 bits (8 bits par composante) qui correspond à l'indice de la LUT et qui sera utilisée pour l'interpolation
    LUT_SIZE    : in integer;

    -- Indicateur que la LUT a bien été lue
    done_lut : in std_logic ; -- Indicateur que la LUT a bien été lue

    -- Indicateur que l'interpolation a bien été effectuée
    done_interpolation : out std_logic; -- Indicateur que l'interpolation a bien été effectuée

    -- Indicateur de demande d'interpolation
    start_interpolation : in std_logic -- Indicateur de demande d'interpolation
  );
end entity module_interpolation;

architecture behavior of module_interpolation is
  --- Définition de la largeur de la LUT comme 2**LUT_SIZE
  constant LUT_WIDTH : integer := 2 ** LUT_SIZE;

  --- Définition du type couleur
  type color is record
    r, g, b : std_logic_vector(7 downto 0); -- Define a color as a record of three std_logic_vectors
  end record;

  --- Définition de r, g, b comme des entiers
  signal r, g, b : integer;

  --- Définition des couleurs utilisées lors de l'interpolation
  signal x1, x, y1, y, z1, z         : integer; -- The indices for the LUT
  signal i1, i2, i3, i4, i5, i6, i7, i8 : std_logic_vector(17 downto 0); -- the colors as indices
  signal f1, f2, f3, f4, f5, f6, f7, f8 : color; -- The 8 corner values for the interpolation

  --- Définition de la couleur de sortie
  signal lut_value_r, lut_value_g, lut_value_b : integer; -- The interpolated color values

  --- Définition de l'indicateur de fin d'interpolation
  signal done_interpolation : std_logic; -- The done flag

begin
  process (clk) -- The process that performs the interpolation
  begin
    if rising_edge(clk and start_interpolation = '1') then

      done_interpolation <= '0'; -- Reset the done_interpolation flag

      -- Convert color components to integer
      r <= to_integer(unsigned(rgb_in(7 downto 0))) / (2 ** (8 - LUT_SIZE)); -- Convert the input to an integer // LUT_SIZE = 6 => 2**2 = 4 // 
      g <= to_integer(unsigned(rgb_in(15 downto 8))) / (2 ** (8 - LUT_SIZE)); -- Convert the input to an integer
      b <= to_integer(unsigned(rgb_in(23 downto 16))) / (2 ** (8 - LUT_SIZE));  -- Convert the input to an integer

      -- Convert the inputs to integer indices
      x <= r;
      x1 <= x + 1;
      y <= g;
      y1 <= y + 1;
      z <= b;
      z1 <= z + 1; 

      -- Get the 8 colors associated with the indices as std_logic_vectors
      i1 <= std_logic_vector(to_unsigned(x, 6) & to_unsigned(y, 6) & to_unsigned(z, 6)); 
      i2 <= std_logic_vector(to_unsigned(x1, 6) & to_unsigned(y, 6) & to_unsigned(z, 6));
      i3 <= std_logic_vector(to_unsigned(x, 6) & to_unsigned(y1, 6) & to_unsigned(z, 6));
      i4 <= std_logic_vector(to_unsigned(x1, 6) & to_unsigned(y1, 6) & to_unsigned(z, 6));
      i5 <= std_logic_vector(to_unsigned(x, 6) & to_unsigned(y, 6) & to_unsigned(z1, 6));
      i6 <= std_logic_vector(to_unsigned(x1, 6) & to_unsigned(y, 6) & to_unsigned(z1, 6));
      i7 <= std_logic_vector(to_unsigned(x, 6) & to_unsigned(y1, 6) & to_unsigned(z1, 6));
      i8 <= std_logic_vector(to_unsigned(x1, 6) & to_unsigned(y1, 6) & to_unsigned(z1, 6));

      -- Get the value of the LUT at the 8 colors
      -- On va utiliser le module_lecture_lut pour lire la LUT
      -- Ce module prend en entrée un indice de 18 bits et renvoie la couleur correspondante sur 24 bits
      -- On va donc lire la LUT pour les 8 couleurs et les stocker dans les variables f1, f2, f3, f4, f5, f6, f7, f8
      -- Chaque lecture attendra que le module ait lu la LUT via done_lut
      rgb_in_lut <= i1;
      wait until done_lut = '1'; -- Wait until the LUT has been read // everything below will be evaluated in the next clock cycle
      f1.r <= rgb_out_lut(7 downto 0);
      f1.g <= rgb_out_lut(15 downto 8);
      f1.b <= rgb_out_lut(23 downto 16);

      rgb_in_lut <= i2;
      wait until done_lut = '1'; -- Wait until the LUT has been read // everything below will be evaluated in the next clock cycle
      f2.r <= rgb_out_lut(7 downto 0); -- Get the red component of the output
      f2.g <= rgb_out_lut(15 downto 8); -- Get the green component of the output
      f2.b <= rgb_out_lut(23 downto 16); -- Get the blue component of the output

      rgb_in_lut <= i3;
      wait until done_lut = '1'; -- Wait until the LUT has been read // everything below will be evaluated in the next clock cycle
      f3.r <= rgb_out_lut(7 downto 0);
      f3.g <= rgb_out_lut(15 downto 8);
      f3.b <= rgb_out_lut(23 downto 16);

      rgb_in_lut <= i4;
      wait until done_lut = '1'; -- Wait until the LUT has been read // everything below will be evaluated in the next clock cycle
      f4.r <= rgb_out_lut(7 downto 0); -- Get the red component of the output
      f4.g <= rgb_out_lut(15 downto 8); -- Get the  green component of the output
      f4.b <= rgb_out_lut(23 downto 16); -- Get the blue component of the output

      rgb_in_lut <= i5;
      wait until done_lut = '1'; -- Wait until the LUT has been read // everything below will be evaluated in the next clock cycle
      f5.r <= rgb_out_lut(7 downto 0);
      f5.g <= rgb_out_lut(15 downto 8);
      f5.b <= rgb_out_lut(23 downto 16);

      rgb_in_lut <= i6; 
      wait until done_lut = '1'; -- Wait until the LUT has been read // everything below will be evaluated in the next clock cycle
      f6.r <= rgb_out_lut(7 downto 0);
      f6.g <= rgb_out_lut(15 downto 8);
      f6.b <= rgb_out_lut(23 downto 16);

      rgb_in_lut <= i7;
      wait until done_lut = '1';
      f7.r <= rgb_out_lut(7 downto 0);
      f7.g <= rgb_out_lut(15 downto 8);
      f7.b <= rgb_out_lut(23 downto 16);

      rgb_in_lut <= i8;
      wait until done_lut = '1';
      f8.r <= rgb_out_lut(7 downto 0);
      f8.g <= rgb_out_lut(15 downto 8);
      f8.b <= rgb_out_lut(23 downto 16);

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

      -- Convert the output to a std_logic_vector
      rgb_out <= std_logic_vector(to_unsigned(lut_value_r, 8) & to_unsigned(lut_value_g, 8) & to_unsigned(lut_value_b, 8)); -- Convert the output to a std_logic_vector

      done_interpolation <= '1'; -- Set the done_interpolation flag
    end if;
  end process;

end architecture behavior;