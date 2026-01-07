-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity flipflopD is
	generic ( n: positive);
    port(
			D   : in std_logic_vector(n-1 downto 0);
			CLK, RESET : in std_logic;
			Q   : out std_logic_vector(n-1 downto 0)
    );
end flipflopD;

-- architecture
architecture behav of flipflopD is

begin

	process(CLK)
	begin
		if RESET = '1' then
			Q <= (others => '0');
		elsif rising_edge(CLK) then
			Q <= D;
		end if;
	end process;



end behav;