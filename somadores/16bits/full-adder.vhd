-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity fullAdder is
    port(
			A       : in std_logic;
			B       : in std_logic;
			C_in    : in std_logic;
            Sum     : out std_logic;
            C_out   : out std_logic
    );
end fullAdder;

-- architecture
architecture behav of fullAdder is

begin
    Sum <= A xor B xor C_in;
    C_out <= (A and B) or (B and C_in) or (A and C_in);
end behav;