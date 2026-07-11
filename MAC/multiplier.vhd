-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity multiplier is
    Port ( 
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        S : out std_logic_vector(7 downto 0)
    );
end multiplier;

-- architecture
architecture behav of multiplier is
    
begin

    S <= std_logic_vector(unsigned(A) * unsigned(B));
    
end behav;