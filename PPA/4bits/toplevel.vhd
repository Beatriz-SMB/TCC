-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity toplevel is
    port(
		A       : in std_logic_vector(3 downto 0);
        B       : in std_logic_vector(3 downto 0);
        Cin     : in std_logic_vector(0 downto 0);
        Result  : out std_logic_vector(3 downto 0);
        Cout    : out std_logic
    );
end toplevel;

-- architecture
architecture behav of toplevel is
    signal temp : std_logic_vector(4 downto 0);
    begin
        temp <= std_logic_vector(resize(unsigned(Cin), 5) + resize(unsigned(A), 5) + resize(unsigned(B), 5));

        Result <= temp(3 downto 0);
        Cout <= temp(4);

end behav;