-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity mux is
    generic ( n: positive := 1);
    port(
            A, B    : in std_logic_vector(n-1 downto 0);
            S       : in std_logic;    
            mux_out : out std_logic_vector(n-1 downto 0)
    );
end mux;

-- architecture
architecture behav of mux is

begin
    with S select
        mux_out <= A when '0',
                   B when others;
end behav;