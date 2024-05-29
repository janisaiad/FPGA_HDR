-- FILEPATH: /C:/Users/thoma/Documents/MODAL/CustomsVHD/lut_read.vhd

-- This VHDL code represents a module called "lut_read" that reads data from a look-up table (LUT) using an Avalon-MM interface.
-- The module has the following ports:
--   - clk: input clock signal
--   - start: input signal to initiate the read operation
--   - done: output signal indicating the completion of the read operation
--   - lut_address: input signal representing the address of the data to be read from the LUT
--   - lut_data: output signal containing the data read from the LUT

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lut_read is
    port (
        clk         : in std_logic;
        start       : in std_logic;
        done        : out std_logic;
        lut_address : in std_logic_vector(31 downto 0);
        lut_data    : out std_logic_vector(31 downto 0)
    );
end entity;

-- FILEPATH: /C:/Users/thoma/Documents/MODAL/CustomsVHD/lut_read.vhd

-- This is the behavioral architecture of the "lut_read" module.
-- It implements a state machine that controls the reading of data from a look-up table (LUT).
-- The module interfaces with an Avalon-MM interface to communicate with the external memory.

architecture Behavioral of lut_read is
    signal state : integer range 0 to 2 := 0;  -- State variable to track the current state of the state machine
    signal read_req, read_ack : std_logic := '0';  -- Signals for read request and read acknowledge
    signal read_data : std_logic_vector(31 downto 0);  -- Signal to store the read data from the LUT

begin
    process (clk)
    begin
        if rising_edge(clk) then
            case state is
                when 0 =>
                    if start = '1' then
                        read_req <= '1';  -- Send read request to the Avalon-MM interface
                        state <= 1;  -- Transition to the next state
                    end if;
                when 1 =>
                    if read_ack = '1' then
                        read_data <= lut_data;  -- Store the read data from the LUT
                        read_req <= '0';  -- Clear the read request signal
                        state <= 2;  -- Transition to the next state
                    end if;
                when 2 =>
                    done <= '1';  -- Set the "done" signal to indicate that the reading process is complete
                    if start = '0' then
                        state <= 0;  -- Transition back to the initial state
                    end if;
                when others =>
                    state <= 0;  -- Default case, transition to the initial state
            end case;
        end if;
    end process;

    -- FILEPATH: /C:/Users/thoma/Documents/MODAL/CustomsVHD/lut_read.vhd

    -- This code snippet represents the instantiation of an Avalon-MM interface.
    -- The Avalon-MM interface is a widely used industry-standard interface protocol
    -- that provides a standardized way for communication between different IP cores
    -- in a system-on-chip (SoC) design.

    -- The Avalon-MM interface is instantiated using the entity "avalon_mm" from the
    -- "work" library. It has the following port connections:

    -- - clk: This is the clock signal used for synchronization of the interface.
    -- - read: This signal is used to initiate a read operation.
    -- - readdata: This signal carries the data read from the interface.
    -- - readdata_valid: This signal indicates the validity of the read data.
    -- - address: This signal specifies the address of the data to be read.

    -- The instantiation of the Avalon-MM interface allows the module to communicate
    -- with other modules or IP cores in the system using the Avalon-MM protocol.
    -- Avalon-MM interface
    avalon_mm : entity work.avalon_mm
    port map (
        clk => clk,
        read => read_req,
        readdata => read_data,
        readdata_valid => read_ack,
        address => lut_address
    );
end Behavioral;