library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity module_lecture_lut is
  port
  (
    clk        : in std_logic; -- Horloge
    rst        : in std_logic; -- Reset
    rgb_in     : in std_logic_vector(17 downto 0); -- Couleur RGB en entrée
    lut_out    : out std_logic_vector(23 downto 0); -- Couleur RGB en sortie
    LUT_SIZE   : in integer; -- Taille de la LUT
    LUT_OFFSET : in integer; -- Offset de la LUT

    -- Signals for module_sdram_rw
    addr_lut : out std_logic_vector(24 downto 0); -- Address to read in the LUT
    data_lut : in std_logic_vector(31 downto 0); -- Data read from the LUT    
    lut_read : out std_logic; -- Signal to ask for a read
    done_lut : in std_logic -- Signal to know if the read is done
  );
end module_lecture_lut;

architecture behavior of module_lecture_lut is
  signal addr_lut_int : std_logic_vector(24 downto 0); -- Address to read in the LUT
  signal data_lut_int : std_logic_vector(31 downto 0); -- Data read from the LUT
  signal lut_read     : std_logic; -- Signal to ask for a read

  --- Séparation des composantes RGB
  signal r : std_logic_vector(5 downto 0);   -- Composante rouge
  signal g : std_logic_vector(5 downto 0);  -- Composante verte
  signal b : std_logic_vector(5 downto 0); -- Composante bleue

  --- Largeur de la LUT définie comme 2 exposant LUT_SIZE
  constant LUT_WIDTH : integer := 2 ** LUT_SIZE; 

begin
  --- Récupération des composantes en entrée
  r <= rgb_in(17 downto 12);  -- Récupération des composantes RGB
  g <= rgb_in(11 downto 6); -- Récupération des composantes RGB
  b <= rgb_in(5 downto 0); -- Récupération des composantes RGB
 
  process (clk, rst)
  begin
    if rst = '1' then -- Reset
      addr_lut_int <= (others => '0'); -- Reset de l'adresse de la LUT
      lut_read_int <= '0'; -- Reset de la demande de lecture de la LUT
    elsif rising_edge(clk) then -- Lecture de la LUT

      -- Détermination de l'adresse de la LUT
      -- La LUT est une LUT 3D de LUT_WIDTHxLUT_WIDTHxLUT_WIDTH associant à la couleur RGB en entrée une couleur RGB en sortie
      -- Dans la LUT la première dimension correspond à la composante rouge, la deuxième à la composante verte et la troisième à la composante bleue
      -- La LUT a été applatie sur une seule dimension pour simplifier l'adressage
      -- D'où le calcul de l'adresse suivant en ajoutant à la fin l'offset de la LUT
      addr_lut <= std_logic_vector(unsigned(r) * LUT_WIDTH * LUT_WIDTH + unsigned(g) * LUT_WIDTH + unsigned(b) + LUT_OFFSET);

      -- Lecture de la LUT
      -- On demande la lecture de la LUT au controleur mémoire
      lut_read     <= '1'; -- On demande la lecture de la LUT au controleur mémoire 
      addr_lut_int <= addr_lut; -- On envoie l'adresse de la LUT au controleur mémoire pour qu'il la lise et la renvoie

      -- On récupère la valeur de la LUT en attendant qu'elle ait changé
      wait until done_lut = '1'; -- On attend que la lecture de la LUT soit terminée
      lut_out  <= data_lut(23 downto 0); -- On récupère la valeur de la LUT en sortie
      lut_read <= '0'; -- On arrête la lecture de la LUT
    end if;
  end process;
end behavior;