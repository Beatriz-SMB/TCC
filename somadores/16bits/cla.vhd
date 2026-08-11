-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity cla is
    Port ( 
        A_IN : in std_logic_vector(15 downto 0);
        B_IN : in std_logic_vector(15 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(15 downto 0);
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
    signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14 : std_logic;   

    signal Cg1, Cg2, Cg3, Cg4, Cg5, Cg6, Cg7, Cg8, Cg9, Cg10, Cg11, Cg12, Cg13, Cg14, Cg15, Cg16 : std_logic;
    signal Cp1, Cp2, Cp3, Cp4, Cp5, Cp6, Cp7, Cp8, Cp9, Cp10, Cp11, Cp12, Cp13, Cp14, Cp15, Cp16 : std_logic;

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

    C7 <= Cg8 or (Cp8 and Cg7) or (Cp8 and Cp7 and Cg6) or (Cp8 and Cp7 and Cp6 and Cg5) or (Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA9: halfAdder port map (
        A => A_IN(8),
        B => B_IN(8),
        C => Cg9,
        S => Cp9
    );

    FA9: fullAdder port map (
        A => A_IN(8),
        B => B_IN(8),
        C_in => C7,
        C_out => open,
        Sum => SOMA_OUT(8)
    );

    C8 <= Cg9 or (Cp9 and Cg8) or (Cp9 and Cp8 and Cg7) or (Cp9 and Cp8 and Cp7 and Cg6) or (Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA10: halfAdder port map (
        A => A_IN(9),
        B => B_IN(9),
        C => Cg10,
        S => Cp10
    );

    FA10: fullAdder port map (
        A => A_IN(9),
        B => B_IN(9),
        C_in => C8,
        C_out => open,
        Sum => SOMA_OUT(9)
    );

    C9 <= Cg10 or (Cp10 and Cg9) or (Cp10 and Cp9 and Cg8) or (Cp10 and Cp9 and Cp8 and Cg7) or (Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA11: halfAdder port map (
        A => A_IN(10),
        B => B_IN(10),
        C => Cg11,
        S => Cp11
    );

    FA11: fullAdder port map (
        A => A_IN(10),
        B => B_IN(10),
        C_in => C9,
        C_out => open,
        Sum => SOMA_OUT(10)
    );

    C10 <= Cg11 or (Cp11 and Cg10) or (Cp11 and Cp10 and Cg9) or (Cp11 and Cp10 and Cp9 and Cg8) or (Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA12: halfAdder port map (
        A => A_IN(11),
        B => B_IN(11),
        C => Cg12,
        S => Cp12
    );

    FA12: fullAdder port map (
        A => A_IN(11),
        B => B_IN(11),
        C_in => C10,
        C_out => open,
        Sum => SOMA_OUT(11)
    );

    C11 <= Cg12 or (Cp12 and Cg11) or (Cp12 and Cp11 and Cg10) or (Cp12 and Cp11 and Cp10 and Cg9) or (Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA13: halfAdder port map (
        A => A_IN(12),
        B => B_IN(12),
        C => Cg13,
        S => Cp13
    );

    FA13: fullAdder port map (
        A => A_IN(12),
        B => B_IN(12),
        C_in => C11,
        C_out => open,
        Sum => SOMA_OUT(12)
    );

    C12 <= Cg13 or (Cp13 and Cg12) or (Cp13 and Cp12 and Cg11) or (Cp13 and Cp12 and Cp11 and Cg10) or (Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA14: halfAdder port map (
        A => A_IN(13),
        B => B_IN(13),
        C => Cg14,
        S => Cp14
    );

    FA14: fullAdder port map (
        A => A_IN(13),
        B => B_IN(13),
        C_in => C12,
        C_out => open,
        Sum => SOMA_OUT(13)
    );

    C13 <= Cg14 or (Cp14 and Cg13) or (Cp14 and Cp13 and Cg12) or (Cp14 and Cp13 and Cp12 and Cg11) or (Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA15: halfAdder port map (
        A => A_IN(14),
        B => B_IN(14),
        C => Cg15,
        S => Cp15
    );

    FA15: fullAdder port map (
        A => A_IN(14),
        B => B_IN(14),
        C_in => C13,
        C_out => open,
        Sum => SOMA_OUT(14)
    );

    C14 <= Cg15 or (Cp15 and Cg14) or (Cp15 and Cp14 and Cg13) or (Cp15 and Cp14 and Cp13 and Cg12) or (Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA16: halfAdder port map (
        A => A_IN(15),
        B => B_IN(15),
        C => Cg16,
        S => Cp16
    );

    FA16: fullAdder port map (
        A => A_IN(15),
        B => B_IN(15),
        C_in => C14,
        C_out => open,
        Sum => SOMA_OUT(15)
    );

    C_OUT <= Cg16 or (Cp16 and Cg15) or (Cp16 and Cp15 and Cg14) or (Cp16 and Cp15 and Cp14 and Cg13) or (Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);
end behav;