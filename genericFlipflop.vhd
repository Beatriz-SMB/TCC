-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity genericFlipflopD is
	generic ( n: positive);
    port(
			d   : in std_logic_vector(n-1 downto 0);
			clk, reset : in std_logic;
			q   : out std_logic_vector(n-1 downto 0)
    );
end genericFlipflopD;

-- architecture
architecture behav of genericFlipflopD is

begin

	process(clk)
	begin
		if reset = '1' then
			q <= (others => '0');
		elsif rising_edge(clk) then
			q <= d;
		end if;
	end process;



end behav;