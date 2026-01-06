-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity RCA is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic
    );
end RCA;

-- architecture
architecture behav of RCA is
    -- Full Adder --------------------
    component fullAdder is
        Port ( 
            A, B, C_in : in std_logic;
            Sum, C_out : out std_logic
        );
    end component;

    -- intermediate signal declaration
    signal C0, C1, C2: std_logic;

begin
    x1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN,
        C_out => C0,
        Sum => SOMA_OUT(0)
    );

    x2: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C0,
        C_out => C1,
        Sum => SOMA_OUT(1)
    );

    x3: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C1,
        C_out => C2,
        Sum => SOMA_OUT(2)
    );

    x4: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C2,
        C_out => C_OUT,
        Sum => SOMA_OUT(3)
    );
    
end behav;