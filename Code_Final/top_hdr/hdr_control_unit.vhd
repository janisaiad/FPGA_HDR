library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdr_control_unit is port(
	clock					:	in		std_logic;
	reset					:	in		std_logic;
	LUT_NORMAL_OFFSET				:	out		integer; -- Offset de la LUT normale
	LUT_INVERSE_OFFSET				:	out		integer; -- Offset de la LUT inverse
  choice_lut_vector				:	in		std_logic_vector(3 downto 0) -- Vecteur de choix de LUT
);
end hdr_control_unit;



architecture rtl of hdr_control_unit is
    
    signal lut_offset_normal : integer;
    signal lut_offset_inverse : integer;
begin
  process (clock)
begin
    if rising_edge(clock) then

      -- Gestion des différentes LUT avec les choice_lut_vectoritchs
      -- En fonction du choice_lut_vectoritch on va modifier le LUT_OFFSET avec l'adresse des LUT choisies

      -- Choix de la LUT normale
      if (choice_lut_vector(1 downto 0) = "00") then
        lut_offset_normal <= 256; -- Reinhard Normal
      elsif (choice_lut_vector(1 downto 0) = "01") then
        lut_offset_normal <= 768; -- Uncharted2filmic Normal
      elsif (choice_lut_vector(1 downto 0) = "10") then
        lut_offset_normal <= 1280; -- BakingLabACES Normal
      elsif (choice_lut_vector(1 downto 0) = "11") then
        lut_offset_normal <= 1792; -- NarkowiczACES Normal
      else
        lut_offset_normal <= 0; -- Reinhard Normal par défaut
      end if;

      -- Choix de la LUT inverse
      if (choice_lut_vector(3 downto 2) = "00") then
        lut_offset_inverse <= 0; -- Reinhard Inverse
      elsif (choice_lut_vector(3 downto 2) = "01") then
        lut_offset_inverse <= 512; -- Uncharted2filmic Inverse
      elsif (choice_lut_vector(3 downto 2) = "10") then
        lut_offset_inverse <= 1024; -- BakingLabACES Inverse
      elsif (choice_lut_vector(3 downto 2) = "11") then
        lut_offset_inverse <= 1536; -- NarkowiczACES Inverse
      else
        lut_offset_inverse <= 0; -- Reinhard Inverse par défaut
      end if;

    end if;
    LUT_NORMAL_OFFSET <= lut_offset_normal;
    LUT_INVERSE_OFFSET <= lut_offset_inverse;
  end process;

end rtl;