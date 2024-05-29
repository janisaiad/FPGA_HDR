library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Address_Generator is
  Port ( 
    rst_i : in std_logic;
    CLK25 : in STD_LOGIC;  -- horloge de 25 MHz et signal d'activation respectivement
    enable : in STD_LOGIC;
    vsync : in STD_LOGIC;
    address : out STD_LOGIC_VECTOR (16 downto 0) -- adresse genere
  );  
end Address_Generator;


architecture Behavioral of Address_Generator is

  signal val: STD_LOGIC_VECTOR(address'range) := (others => '0'); -- signal intermidiaire
  
begin

  address <= val; -- adresse genere

  process(CLK25)
  begin
    if rising_edge(CLK25) then
    
      if (rst_i = '1') then
        val <= (others => '0'); 
      else 
        if (enable='1') then      -- si enable = 0 on arrete la generation d'adresses
          if (val < 320*240) then -- si l'espace memoire est balay completement        
            val <= val + 1 ;
          end if;
        end if;
        if vsync = '0' then 
           val <= (others => '0');
        end if;        
      end if;
      
    end if;  
  end process;
    
end Behavioral;
