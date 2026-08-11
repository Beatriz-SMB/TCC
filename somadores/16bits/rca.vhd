-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity rca is
    Port ( 
        A_IN : in std_logic_vector(15 downto 0);
        B_IN : in std_logic_vector(15 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(15 downto 0);
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
    signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15: std_logic;

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
        C_out => C7,
        Sum => SOMA_OUT(7)
    );
    
    FA9: fullAdder port map (
        A => A_IN(8),
        B => B_IN(8),
        C_in => C7,
        C_out => C8,
        Sum => SOMA_OUT(8)
    );

    FA10: fullAdder port map (
        A => A_IN(9),
        B => B_IN(9),
        C_in => C8,
        C_out => C9,
        Sum => SOMA_OUT(9)
    );

    FA11: fullAdder port map (
        A => A_IN(10),
        B => B_IN(10),
        C_in => C9,
        C_out => C10,
        Sum => SOMA_OUT(10)
    );

    FA12: fullAdder port map (
        A => A_IN(11),
        B => B_IN(11),
        C_in => C10,
        C_out => C11,
        Sum => SOMA_OUT(11)
    );

    FA13: fullAdder port map (
        A => A_IN(12),
        B => B_IN(12),
        C_in => C11,
        C_out => C12,
        Sum => SOMA_OUT(12)
    );

    FA14: fullAdder port map (
        A => A_IN(13),
        B => B_IN(13),
        C_in => C12,
        C_out => C13,
        Sum => SOMA_OUT(13)
    );

    FA15: fullAdder port map (
        A => A_IN(14),
        B => B_IN(14),
        C_in => C13,
        C_out => C14,
        Sum => SOMA_OUT(14)
    );

    FA16: fullAdder port map (
        A => A_IN(15),
        B => B_IN(15),
        C_in => C14,
        C_out => C_OUT,
        Sum => SOMA_OUT(15)
    );
    
end behav;