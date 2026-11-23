-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity cla is
    Port ( 
        A_IN : in std_logic_vector(23 downto 0);
        B_IN : in std_logic_vector(23 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(23 downto 0);
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
    signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22: std_logic;   

    signal Cg1, Cg2, Cg3, Cg4, Cg5, Cg6, Cg7, Cg8, Cg9, Cg10, Cg11, Cg12, Cg13, Cg14, Cg15, Cg16, Cg17, Cg18, Cg19, Cg20, Cg21, Cg22, Cg23, Cg24 : std_logic;
    signal Cp1, Cp2, Cp3, Cp4, Cp5, Cp6, Cp7, Cp8, Cp9, Cp10, Cp11, Cp12, Cp13, Cp14, Cp15, Cp16, Cp17, Cp18, Cp19, Cp20, Cp21, Cp22, Cp23, Cp24 : std_logic;

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

    C15 <= Cg16 or (Cp16 and Cg15) or (Cp16 and Cp15 and Cg14) or (Cp16 and Cp15 and Cp14 and Cg13) or (Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA17: halfAdder port map (
        A => A_IN(16),
        B => B_IN(16),
        C => Cg17,
        S => Cp17
    );

    FA17: fullAdder port map (
        A => A_IN(16),
        B => B_IN(16),
        C_in => C15,
        C_out => open,
        Sum => SOMA_OUT(16)
    );

    C16 <= Cg17 or (Cp17 and Cg16) or (Cp17 and Cp16 and Cg15) or (Cp17 and Cp16 and Cp15 and Cg14) or (Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA18: halfAdder port map (
        A => A_IN(17),
        B => B_IN(17),
        C => Cg18,
        S => Cp18
    );

    FA18: fullAdder port map (
        A => A_IN(17),
        B => B_IN(17),
        C_in => C16,
        C_out => open,
        Sum => SOMA_OUT(17)
    );

    C17 <= Cg18 or (Cp18 and Cg17) or (Cp18 and Cp17 and Cg16) or (Cp18 and Cp17 and Cp16 and Cg15) or (Cp18 and Cp17 and Cp16 and Cp15 and Cg14) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA19: halfAdder port map (
        A => A_IN(18),
        B => B_IN(18),
        C => Cg19,
        S => Cp19
    );

    FA19: fullAdder port map (
        A => A_IN(18),
        B => B_IN(18),
        C_in => C17,
        C_out => open,
        Sum => SOMA_OUT(18)
    );

    C18 <= Cg19 or (Cp19 and Cg18) or (Cp19 and Cp18 and Cg17) or (Cp19 and Cp18 and Cp17 and Cg16) or (Cp19 and Cp18 and Cp17 and Cp16 and Cg15) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cg14) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA20: halfAdder port map (
        A => A_IN(19),
        B => B_IN(19),
        C => Cg20,
        S => Cp20
    );

    FA20: fullAdder port map (
        A => A_IN(19),
        B => B_IN(19),
        C_in => C18,
        C_out => open,
        Sum => SOMA_OUT(19)
    );

    C19 <= Cg20 or (Cp20 and Cg19) or (Cp20 and Cp19 and Cg18) or (Cp20 and Cp19 and Cp18 and Cg17) or (Cp20 and Cp19 and Cp18 and Cp17 and Cg16) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cg15) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cg14) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA21: halfAdder port map (
        A => A_IN(20),
        B => B_IN(20),
        C => Cg21,
        S => Cp21
    );

    FA21: fullAdder port map (
        A => A_IN(20),
        B => B_IN(20),
        C_in => C19,
        C_out => open,
        Sum => SOMA_OUT(20)
    );

    C20 <= Cg21 or (Cp21 and Cg20) or (Cp21 and Cp20 and Cg19) or (Cp21 and Cp20 and Cp19 and Cg18) or (Cp21 and Cp20 and Cp19 and Cp18 and Cg17) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cg16) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cg15) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cg14) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA22: halfAdder port map (
        A => A_IN(21),
        B => B_IN(21),
        C => Cg22,
        S => Cp22
    );

    FA22: fullAdder port map (
        A => A_IN(21),
        B => B_IN(21),
        C_in => C20,
        C_out => open,
        Sum => SOMA_OUT(21)
    );

    C21 <= Cg22 or (Cp22 and Cg21) or (Cp22 and Cp21 and Cg20) or (Cp22 and Cp21 and Cp20 and Cg19) or (Cp22 and Cp21 and Cp20 and Cp19 and Cg18) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cg17) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cg16) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cg15) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cg14) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA23: halfAdder port map (
        A => A_IN(22),
        B => B_IN(22),
        C => Cg23,
        S => Cp23
    );

    FA23: fullAdder port map (
        A => A_IN(22),
        B => B_IN(22),
        C_in => C21,
        C_out => open,
        Sum => SOMA_OUT(22)
    );

    C22 <= Cg23 or (Cp23 and Cg22) or (Cp23 and Cp22 and Cg21) or (Cp23 and Cp22 and Cp21 and Cg20) or (Cp23 and Cp22 and Cp21 and Cp20 and Cg19) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cg18) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cg17) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cg16) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cg15) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cg14) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

    HA24: halfAdder port map (
        A => A_IN(23),
        B => B_IN(23),
        C => Cg24,
        S => Cp24
    );

    FA24: fullAdder port map (
        A => A_IN(23),
        B => B_IN(23),
        C_in => C22,
        C_out => open,
        Sum => SOMA_OUT(23)
    );

    C_OUT <= Cg24 or (Cp24 and Cg23) or (Cp24 and Cp23 and Cg22) or (Cp24 and Cp23 and Cp22 and Cg21) or (Cp24 and Cp23 and Cp22 and Cp21 and Cg20) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cg19) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cg18) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cg17) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cg16) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cg15) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cg14) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cg13) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cg12) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cg11) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cg10) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cg9) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cg8) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cg7) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cg6) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cg5) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cg4) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cg3) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cg2) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cg1) or (Cp24 and Cp23 and Cp22 and Cp21 and Cp20 and Cp19 and Cp18 and Cp17 and Cp16 and Cp15 and Cp14 and Cp13 and Cp12 and Cp11 and Cp10 and Cp9 and Cp8 and Cp7 and Cp6 and Cp5 and Cp4 and Cp3 and Cp2 and Cp1 and C_IN);

end behav;
    