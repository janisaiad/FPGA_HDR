--- Module permettant d'appliquer pour un pixel (donc une entrée RGB) la LUT inverse puis la lut normale
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity module_app_lut_per_pixel is
  port
  (
    clk   : in std_logic; -- Horloge
    reset : in std_logic; -- Reset
 
    --- In/out RGB
    pixel_in  : in std_logic_vector(31 downto 0); -- 8 bits par couleur
    pixel_out : out std_logic_vector(31 downto 0); -- 8 bits par couleur

    --- LUT
    LUT_INVERSE_OFFSET : in std_integer;  -- Offset de la LUT inverse
    LUT_NORMAL_OFFSET  : in std_integer;  -- Offset de la LUT normale

    --- Commandes et info
    pixel_start : in std_logic; -- Déclenche le traitement
    pixel_done  : out std_logic; -- Indique la fin du traitement

    --- Commandes de l'interpolation
    interpolation_start  : out std_logic; -- Déclenche l'interpolation
    interpolation_done   : in std_logic; -- Indique la fin de l'interpolation
    LUT_OFFSET           : out std_integer; -- Offset de la LUT à utiliser // Doit être out ??????????????????????
    pixel_to_interpolate : out std_logic_vector(31 downto 0); -- Pixel à interpoler
    pixel_interpolated   : in std_logic_vector(31 downto 0) -- Pixel interpolé
  );
end module_app_lut_per_pixel;

architecture behavior of module_app_lut_per_pixel is
  --- Définition des signaux
  signal pixel_out           : std_logic_vector(31 downto 0);
  signal pixel_done          : std_logic;
  signal interpolation_start : std_logic;
  signal intermediate_pixel  : std_logic_vector(31 downto 0);

  --- Application des LUTs
begin
  process (clk, reset)
  begin
    if reset = '1' then -- Reset
      pixel_out            <= (others => '0'); -- Reset des sorties
      pixel_done           <= '0'; -- Reset des sorties
      interpolation_start  <= '0'; -- Reset des sorties
      pixel_to_interpolate <= (others => '0'); -- Reset des sorties

    elsif rising_edge(clk) then -- Front montant de l'horloge
      if pixel_start = '1' then -- Traitement d'un pixel
        pixel_done <= '0';  -- Réinitialisation de la sortie

        --- Application de la LUT inverse
        pixel_to_interpolate <= pixel_in; -- Pixel à interpoler
        LUT_OFFSET           <= LUT_INVERSE_OFFSET; -- Offset de la LUT // Doit être out ??????????????????????
        interpolation_start  <= '1';
        wait until interpolation_done = '1';
        intermediate_pixel  <= pixel_interpolated;
        interpolation_start <= '0';

        --- Application de la LUT normale
        pixel_to_interpolate <= intermediate_pixel;
        LUT_OFFSET           <= LUT_NORMAL_OFFSET; -- Offset de la LUT // Doit être out ??????????????????????
        interpolation_start  <= '1';
        wait until interpolation_done = '1';
        pixel_out            <= pixel_interpolated;
        interpolation_start  <= '0';
        
        pixel_done <= '1';
      else
        pixel_done <= '0';
      end if;
    end if;
  end process;
end behavior;