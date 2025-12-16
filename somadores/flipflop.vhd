-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity flipflopD is
    port(
			D   : in std_logic;
			clk : in std_logic;
			Q   : out std_logic
    );
end flipflopD;

-- architecture
architecture behav of flipflopD is

begin

	process(clk)
	begin
		if rising_edge(clk) then
			Q <= D;
		end if;
	end process;



end behav;