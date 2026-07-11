-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity accumulator is
    port(
			D           : in std_logic_vector(7 downto 0);
			CLK, RESET  : in std_logic;
			Q           : out std_logic_vector(7 downto 0)
    );
end accumulator;

-- architecture
architecture behav of accumulator is

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