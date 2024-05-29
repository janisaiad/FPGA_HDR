library ieee;
use ieee.std_logic_1164.all;

entity TestSDRAM is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        led : out std_logic_vector(7 downto 0)
    );
end TestSDRAM;

architecture Behavioral of TestSDRAM is
    -- Définir les signaux pour connecter au contrôleur SDRAM
    signal addr_i : std_logic_vector(22 downto 0);
    signal dat_i : std_logic_vector(15 downto 0);
    signal we_i : std_logic;
    signal stb_i : std_logic;
    signal cyc_i : std_logic;
    signal dat_o : std_logic_vector(15 downto 0);
    signal ack_o : std_logic;
    signal err_o : std_logic;
begin
    -- Instancier le contrôleur SDRAM
    SDRAM_Controller: entity work.sdram_controller
    port map (
        clk => clk,
        rst => rst,
        addr_i => addr_i,
        dat_i => dat_i,
        we_i => we_i,
        stb_i => stb_i,
        cyc_i => cyc_i,
        dat_o => dat_o,
        ack_o => ack_o,
        err_o => err_o
    );

    -- Test process
    process(clk, rst)
    begin
        if rst = '1' then
            addr_i <= (others => '0');
            dat_i <= (others => '0');
            we_i <= '0';
            stb_i <= '0';
            cyc_i <= '0';
            led <= (others => '0');
        elsif rising_edge(clk) then
            -- Écrire des données dans la SDRAM
            addr_i <= "0000000000000000000000";  -- Adresse 0
            dat_i <= "0000000000000001";  -- Données à écrire
            we_i <= '1';  -- Écrire
            stb_i <= '1';
            cyc_i <= '1';
            -- Lire les données de la SDRAM
            addr_i <= "0000000000000000000000";  -- Adresse 0
            we_i <= '0';  -- Lire
            stb_i <= '1';
            cyc_i <= '1';
            -- Vérifier les données lues
            if dat_o = "0000000000000001" then  -- Si les données lues sont correctes
                led <= "00000001";  -- Allumer la première LED
            else  -- Si les données lues sont incorrectes
                led <= "10000000";  -- Allumer la dernière LED
            end if;
        end if;
    end process;
end Behavioral;