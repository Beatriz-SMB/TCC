-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity genericMux is
    generic ( n: positive := 1);
    port(
            a, b    : in std_logic_vector(n-1 downto 0);
            s       : in std_logic;    
            mux_out : out std_logic_vector(n-1 downto 0)
    );
end genericMux;

-- architecture
architecture behav of genericMux is

begin
    with s select
        mux_out <= a when '0',
                   b when others;
end behav;