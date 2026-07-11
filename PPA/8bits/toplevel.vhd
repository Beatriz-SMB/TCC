-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity toplevel is
    port(
		A       : in std_logic_vector(7 downto 0);
        B       : in std_logic_vector(7 downto 0);
        Cin     : in std_logic_vector(0 downto 0);
        Result  : out std_logic_vector(7 downto 0);
        Cout    : out std_logic
    );
end toplevel;

-- architecture
architecture behav of toplevel is
    signal temp : std_logic_vector(8 downto 0);
    begin
        temp <= std_logic_vector(resize(unsigned(Cin), 9) + resize(unsigned(A), 9) + resize(unsigned(B), 9));

        Result <= temp(7 downto 0);
        Cout <= temp(8);

end behav;