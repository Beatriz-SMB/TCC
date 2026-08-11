-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity cla is
    Port ( 
        A_IN : in std_logic_vector(7 downto 0);
        B_IN : in std_logic_vector(7 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(7 downto 0);
        C_OUT : out std_logic
    );
end cla;

-- architecture
architecture behav of cla is
    -- Full Adder --------------------
    component fullAdder is
        Port ( 
            A, B, C_in : in std_logic;
            Sum, C_out : out std_logic
        );
    end component;

    -- Half Adder --------------------
    component halfAdder is
        Port ( 
            A, B : in std_logic;
            S, C : out std_logic
        );
    end component;

    -- intermediate signal declaration
    signal C0, C1, C2, C3, C4, C5, C6, C7: std_logic;   

    signal Cg1, Cg2, Cg3, Cg4, Cg5, Cg6, Cg7, Cg8 : std_logic;
    signal Cp1, Cp2, Cp3, Cp4, Cp5, Cp6, Cp7, Cp8 : std_logic;

begin

    HA1: halfAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C => Cg1,
        S => Cp1
    );

    FA1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN,
        C_out => open,
        Sum => SOMA_OUT(0)
    );

    C0 <= Cg1 or (Cp1 and C_IN); 

    HA2: halfAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C => Cg2,
        S => Cp2
    );

    FA2: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C0,
        C_out => open,
        Sum => SOMA_OUT(1)
    );

    C1 <= Cg2 OR (Cp2 and Cg1) or (Cp2 and Cp1 and C_IN);

    HA3: halfAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C => Cg3,
        S => Cp3
    );

    FA3: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C1,
        C_out => open,
        Sum => SOMA_OUT(2)
    );

    C2 <= Cg3 or (Cp3 and Cg2) or (Cp3 and Cp2 and Cg1) or (Cp3 and Cp2 and Cp1 and C_IN);

    HA4: halfAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C => Cg4,
        S => Cp4
    );

    FA4: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C2,
        C_out => open,
        Sum => SOMA_OUT(3)
    );

    C3 <= Cg4 or (Cp4 and Cg3) or (Cp4 and Cp3 and Cg2) or (Cp4 and Cp3 and Cp2 and Cg1) or (Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA5: halfAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C => Cg5,
        S => Cp5
    );

    FA5: fullAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C_in => C3,
        C_out => open,
        Sum => SOMA_OUT(4)
    );

    C4 <= Cg5 or (Cp5 and Cg4) or (Cp5 and Cp4 and Cg3) or (Cp5 and Cp4 and Cp3 and Cg2) or (Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);
 
    HA6: halfAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C => Cg6,
        S => Cp6
    );

    FA6: fullAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C_in => C4,
        C_out => open,
        Sum => SOMA_OUT(5)
    );

    C5 <= Cg6 or (Cp6 and Cg5) or (Cp6 and Cp5 and Cg4) or (Cp6 and Cp5 and Cp4 and Cg3) or (Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA7: halfAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C => Cg7,
        S => Cp7
    );

    FA7: fullAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C_in => C5,
        C_out => open,
        Sum => SOMA_OUT(6)
    );

    C6 <= Cg7 or (Cp7 and Cg6) or (Cp7 and Cp6 and Cg5) or (Cp7 and Cp6 and Cp5 and Cg4) or (Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA8: halfAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C => Cg8,
        S => Cp8
    );

    FA8: fullAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C_in => C6,
        C_out => open,
        Sum => SOMA_OUT(7)
    );

    C_OUT <= Cg8 or (Cp8 and Cg7) or (Cp8 and Cp7 and Cg6) or (Cp8 and Cp7 and Cp6 and Cg5) or (Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

end behav;