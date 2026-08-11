-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity rca is
    Port ( 
        A_IN : in std_logic_vector(7 downto 0);
        B_IN : in std_logic_vector(7 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(7 downto 0);
        C_OUT : out std_logic
    );
end rca;

-- architecture
architecture behav of rca is
    -- Full Adder --------------------
    component fullAdder is
        Port ( 
            A, B, C_in : in std_logic;
            Sum, C_out : out std_logic
        );
    end component;

    -- intermediate signal declaration
    signal C0, C1, C2, C3, C4, C5, C6: std_logic;

begin
    FA1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN,
        C_out => C0,
        Sum => SOMA_OUT(0)
    );

    FA2: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C0,
        C_out => C1,
        Sum => SOMA_OUT(1)
    );

    FA3: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C1,
        C_out => C2,
        Sum => SOMA_OUT(2)
    );

    FA4: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C2,
        C_out => C3,
        Sum => SOMA_OUT(3)
    );

    FA5: fullAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C_in => C3,
        C_out => C4,
        Sum => SOMA_OUT(4)
    );

    FA6: fullAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C_in => C4,
        C_out => C5,
        Sum => SOMA_OUT(5)
    );

    FA7: fullAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C_in => C5,
        C_out => C6,
        Sum => SOMA_OUT(6)
    );

    FA8: fullAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C_in => C6,
        C_out => C_OUT,
        Sum => SOMA_OUT(7)
    );
    
end behav;