library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity matriceSDRAM is
  port
  (
    clk : in std_logic;
    rst : in std_logic;
    led : out std_logic_vector(7 downto 0)
  );
end matriceSDRAM;

architecture Behavioral of matriceSDRAM is
  -- Définir les signaux pour connecter au contrôleur SDRAM
  signal addr_i : std_logic_vector(22 downto 0);
  signal dat_i  : std_logic_vector(15 downto 0);
  signal we_i   : std_logic;
  signal stb_i  : std_logic;
  signal cyc_i  : std_logic;
  signal dat_o  : std_logic_vector(15 downto 0);
  signal ack_o  : std_logic;
  signal err_o  : std_logic;

  -- Définir les signaux pour la machine à états finis
  type state_type is (idle, read, write);
  signal state      : state_type;
  signal x, y, z, a : integer range 0 to 127;
  signal data       : std_logic_vector(15 downto 0);
  signal data_ready : std_logic;
  signal write_done : std_logic; -- Ajouté
begin
  -- Instancier le contrôleur SDRAM
  SDRAM_Controller : entity work.sdram_controller
    port map
    (
      clk    => clk, -- Horloge du système
      rst    => rst, -- Reset du système
      addr_i => addr_i, -- Adresse d'entrée. C'est l'adresse où les données seront lues ou écrites.
      dat_i  => dat_i, -- Données d'entrée. Ce sont les données qui seront écrites dans la SDRAM.
      we_i   => we_i, -- Signal d'écriture d'entrée. Quand ce signal est '1', une opération d'écriture est effectuée. Quand il est '0', une opération de lecture est effectuée.
      stb_i  => stb_i, -- Signal de stabilité d'entrée. Ce signal indique quand les données d'entrée sont stables et prêtes à être lues ou écrites.
      cyc_i  => cyc_i, -- Signal de cycle d'entrée. Ce signal indique quand un nouveau cycle de lecture ou d'écriture doit commencer.
      dat_o  => dat_o, -- Données de sortie. Ce sont les données qui ont été lues de la SDRAM.
      ack_o  => ack_o, -- Signal d'acquittement de sortie. Ce signal indique quand une opération de lecture ou d'écriture a été effectuée avec succès.
      err_o  => err_o -- Signal d'erreur de sortie. Ce signal indique quand une erreur s'est produite lors d'une opération de lecture ou d'écriture.
    );

  -- Machine à états finis pour lire et écrire un élément de la matrice
  process (clk, rst)
  begin
    if rst = '1' then
      state      <= idle;
      data_ready <= '0';
      write_done <= '0'; -- Ajouté
    elsif rising_edge(clk) then
      case state is
        when idle =>
          data_ready <= '0';
          write_done <= '0'; -- Ajouté
        when read =>
          -- Calculer l'adresse à partir des coordonnées de la matrice
          addr_i <= std_logic_vector(to_unsigned(x * 128 * 128 + y * 128 + z, addr_i'length));
          -- Configurer le contrôleur pour une opération de lecture
          we_i  <= '0';
          stb_i <= '1';
          cyc_i <= '1';
          if ack_o = '1' then -- Si l'acknowledgement est reçu
            -- Lire les données
            data       <= dat_o((a * 8 + 7) downto (a * 8));
            data_ready <= '1';
            -- Retourner à l'état idle
            state <= idle;
          end if;
        when write =>
          -- Calculer l'adresse à partir des coordonnées de la matrice
          addr_i <= std_logic_vector(to_unsigned(x * 128 * 128 + y * 128 + z, addr_i'length));
          -- Configurer le contrôleur pour une opération d'écriture
          dat_i((a * 8 + 7) downto (a * 8)) <= data;
          we_i                              <= '1';
          stb_i                             <= '1';
          cyc_i                             <= '1';
          if ack_o = '1' then -- Si l'acknowledgement est reçu
            -- Indiquer que l'écriture est terminée
            write_done <= '1'; -- Ajouté
            -- Retourner à l'état idle
            state <= idle;
          end if;
      end case;
    end if;
  end process;

  -- Fonction pour déclencher la lecture d'un élément de la matrice
  procedure read_matrix_element(x_in : integer; y_in : integer; z_in : integer; a_in : integer) is
  begin
    -- Vérifier que la FSM est idle
    if state = idle then
      -- Définir les coordonnées de la matrice
      x <= x_in;
      y <= y_in;
      z <= z_in;
      a <= a_in;
      -- Déclencher la lecture
      state <= read;
    end if;
  end procedure read_matrix_element;

  -- Fonction pour déclencher l'écriture d'un élément dans la matrice
  procedure write_matrix_element(x_in : integer; y_in : integer; z_in : integer; a_in : integer; data_in : std_logic_vector(15 downto 0)) is
  begin
    -- Vérifier que la FSM est idle
    if state = idle then
      -- Définir les coordonnées de la matrice et les données à écrire
      x    <= x_in;
      y    <= y_in;
      z    <= z_in;
      a    <= a_in;
      data <= data_in;
      -- Déclencher l'écriture
      state <= write;
    end if;
  end procedure write_matrix_element;
end Behavioral;