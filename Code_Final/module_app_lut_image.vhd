--- Module d'application de la lut à chaque pixel de l'image stockée dans la SDRAM
--- Chaque pixel est modifiée et sauvegardée dans la SDRAM pour pouvoir être affichée plus tard

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity module_app_lut_image is

  port
  (
    clk   : in std_logic; -- Horloge
    reset : in std_logic; -- Reset

    -- Commandes application de la LUT à l'image
    start_lut_image  : in std_logic; -- Début de l'application de la LUT
    lut_image_done   : out std_logic; -- Fin de l'application de la LUT
    NB_PIXELS        : in integer; -- Nombre de pixels dans l'image
    start_image_addr : in std_logic_vector(24 downto 0); -- Adresse de début de l'image
    final_image_addr : in std_logic_vector(24 downto 0); -- Adresse de fin de l'image

    -- Read/write pixels from/to SDRAM
    write_mode : out std_logic; -- Mode écriture
    read_mode  : out std_logic; -- Mode lecture
    address    : out std_logic_vector(24 downto 0); 
    read_data  : in std_logic_vector(31 downto 0); -- Pixel lu de la SDRAM
    write_data : out std_logic_vector(31 downto 0); -- Pixel à écrire dans la SDRAM
    rw_done    : in std_logic; -- Fin de la lecture/écriture

    -- Commandes pour la LUT
    start_pixel_lut : out std_logic;
    pixel_todo      : out std_logic_vector(31 downto 0);
    pixel_did       : in std_logic_vector(31 downto 0);
    pixel_lut_done  : in std_logic
  );

end module_app_lut_image;


architecture rtl of module_app_lut_image is
  -- Déclaration des signaux internes
  signal lut_image_done   : std_logic; -- Fin de l'application de la LUT
  signal write_mode       : std_logic; -- Mode écriture
  signal read_mode        : std_logic; -- Mode lecture
  signal write_data       : std_logic_vector(31 downto 0); -- Pixel à écrire dans la SDRAM
  signal address          : std_logic_vector(24 downto 0); -- Adresse de lecture/écriture
  signal read_data        : std_logic_vector(31 downto 0); -- Pixel lu de la SDRAM
  signal start_pixel_lut  : std_logic;
  signal pixel_lut_done   : std_logic;
  signal start_lut_image  : std_logic;
  signal NB_PIXELS        : integer;
  signal start_image_addr : std_logic_vector(24 downto 0);
  signal final_image_addr : std_logic_vector(24 downto 0);
  signal pixel_todo       : std_logic_vector(31 downto 0);
  signal pixel_did        : std_logic_vector(31 downto 0);

  -- Machine d'états
  signal cntr          : integer                      := 0;
  signal START_LUT_ST  : std_logic_vector(3 downto 0) := "0000"; -- Début de l'application de la LUT
  signal WAIT_READ_ST  : std_logic_vector(3 downto 0) := "0001"; -- Attente de la lecture du pixel
  signal LUT_ST        : std_logic_vector(3 downto 0) := "0010"; -- Application de la LUT
  signal WAIT_LUT_ST   : std_logic_vector(3 downto 0) := "0011"; -- Attente de la fin de l'application de la LUT
  signal WRITE_ST      : std_logic_vector(3 downto 0) := "0100"; -- Ecriture du pixel modifié
  signal WAIT_WRITE_ST : std_logic_vector(3 downto 0) := "0101"; -- Attente de la fin de l'écriture du pixel
  signal DONE_ST       : std_logic_vector(3 downto 0) := "0110"; -- Fin de l'application de la LUT
  signal IDLE_ST       : std_logic_vector(3 downto 0) := "0111"; -- Etat d'attente

  signal state : std_logic_vector(3 downto 0) := IDLE_ST;

begin
  --- On va appliquer la LUT à chaque pixel de l'image stockée dans la SDRAM
  --- On va lire chaque pixel, appliquer la LUT et écrire le pixel modifié dans la SDRAM
  --- On va répéter cette opération pour chaque pixel de l'image

  -- Machine d'états
  process (clk, reset)
    if rising_edge (clk) then
      if (reset = '1') then
        cntr            <= 0;
        lut_image_done  <= '0';
        write_mode      <= '0';
        read_mode       <= '0';
        address         <= (others => '0');
        write_data      <= (others => '0');
        start_pixel_lut <= '0';

      elsif (start_lut_image = '1' and state = IDLE_ST) then
        state           <= START_LUT_ST;
        lut_image_done  <= '0';
        write_mode      <= '0';
        read_mode       <= '0';
        address         <= (others => '0');
        write_data      <= (others => '0');
        start_pixel_lut <= '0';
      else
        case state is
          when START_LUT_ST =>
            if (cntr < NB_PIXELS) then
              address<= start_image_addr + to_slv(cntr, 24); --- A REVOIR FORTEMENT
              read_mode    <= '1';
              state        <= WAIT_READ_ST;
            else
              state <= DONE_ST;
            end if;

          when WAIT_READ_ST =>
            if (rw_done = '1') then
              pixel_todo      <= read_data;
              start_pixel_lut <= '1';
              read_mode       <= '0';
              state           <= LUT_ST;
            end if;

          when LUT_ST =>
            if (pixel_lut_done = '1') then
              write_data <= pixel_did;
              address   <= final_image_addr + to_slv(cntr, 24); --- A REVOIR FORTEMENT
              write_mode <= '1';
              state      <= WAIT_WRITE_ST;
            end if;

          when WAIT_WRITE_ST =>
            if (rw_done = '1') then
              cntr  <= cntr + 1;
              state <= START_LUT_ST;
            end if;

          when DONE_ST =>
            lut_image_done <= '1';
            state          <= IDLE_ST;

          when others =>
            state <= IDLE_ST;

        end if;
      end if;
    end architecture;