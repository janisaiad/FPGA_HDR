library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sdram_controller_tb is
end sdram_controller_tb;

architecture behavior of sdram_controller_tb is
  -- Déclaration des signaux de test
  signal clk         : std_logic                     := '0';
  signal rst         : std_logic                     := '0';
  signal stb_i       : std_logic                     := '0';
  signal cyc_i       : std_logic                     := '0';
  signal addr_i      : std_logic_vector(15 downto 0) := (others => '0');
  signal dat_i       : std_logic_vector(15 downto 0) := (others => '0');
  signal we_i        : std_logic                     := '0';
  signal led_success : std_logic                     := '0'; -- LED pour les tests réussis
  signal led_failure : std_logic                     := '0'; -- LED pour les tests échoués
  -- Déclaration du contrôleur SDRAM
  component sdram_controller is
    port
    (
      clk    : in std_logic;
      rst    : in std_logic;
      stb_i  : in std_logic;
      cyc_i  : in std_logic;
      addr_i : in std_logic_vector(15 downto 0);
      dat_i  : in std_logic_vector(15 downto 0);
      we_i   : in std_logic;
      -- autres ports...
    );
  end component;
begin
  -- Instanciation du contrôleur SDRAM
  uut : sdram_controller port map
  (
    clk    => clk,
    rst    => rst,
    stb_i  => stb_i,
    cyc_i  => cyc_i,
    addr_i => addr_i,
    dat_i  => dat_i,
    we_i   => we_i,
    -- autres ports...
  );
  -- Génération du signal d'horloge
  clk_process : process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;
  -- Génération des signaux de test
  stimulus_process : process
  begin
    -- Reset du contrôleur
    rst <= '1';
    wait for 20 ns;
    rst <= '0';
    wait for 20 ns;

    -- Envoi d'une commande d'écriture
    stb_i  <= '1';
    cyc_i  <= '1';
    addr_i <= "0000000000000001";
    dat_i  <= "0000000000000010";
    we_i   <= '0';
    wait for 20 ns;

    -- Envoi d'une commande de lecture
    stb_i  <= '1';
    cyc_i  <= '1';
    addr_i <= "0000000000000001";
    we_i   <= '1';
    wait for 20 ns;

    -- Vérification de la réponse
    if (dat_o = "0000000000000010") then
      led_success <= '1';
    else
      led_failure <= '1';
    end if;

    -- Envoi d'une deuxième commande d'écriture
    stb_i  <= '1';
    cyc_i  <= '1';
    addr_i <= "0000000000000010";
    dat_i  <= "0000000000000011";
    we_i   <= '0';
    wait for 20 ns;

    -- Envoi d'une deuxième commande de lecture
    stb_i  <= '1';
    cyc_i  <= '1';
    addr_i <= "0000000000000010";
    we_i   <= '1';
    wait for 20 ns;

    -- Vérification de la réponse
    if (dat_o = "0000000000000011") then
      led_success <= '1';
    else
      led_failure <= '1';
    end if;

    -- autres tests...
    wait;
  end process;
end behavior;