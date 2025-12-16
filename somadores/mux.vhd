-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity mux is
    port(
			A, B, S     : in std_logic;
            mux_out     : out std_logic
    );
end mux;

-- architecture
architecture behav of mux is

begin
    with S select
        mux_out <= A when '0',
                   B when others;
end behav;