-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity halfAdder is
    port(
			A       : in std_logic;
			B       : in std_logic;
			C       : out std_logic;
            S       : out std_logic
    );
end halfAdder;

architecture behav of halfAdder is

begin
    S <= A xor B;
    C <= A and B;
end behav;