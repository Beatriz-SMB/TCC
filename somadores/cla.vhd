-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity CLA is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic_vector(0 downto 0);
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic_vector(0 downto 0)
    );
end CLA;

-- architecture
architecture behav of CLA is
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
    signal C0, C1, C2: std_logic;   

    signal Cg1, Cg2, Cg3, Cg4, Cp1, Cp2, Cp3, Cp4 : std_logic;

begin

    y1: halfAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C => Cg1,
        S => Cp1
    );

    x1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN(0),
        C_out => open,
        Sum => SOMA_OUT(0)
    );

    C0 <= Cg1 or (Cp1 and C_IN(0)); 

    y2: halfAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C => Cg2,
        S => Cp2
    );

    x2: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C0,
        C_out => open,
        Sum => SOMA_OUT(1)
    );

    C1 <= Cg2 OR (Cp2 and Cg1) or (Cp2 and Cp1 and C_IN(0));

    y3: halfAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C => Cg3,
        S => Cp3
    );

    x3: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C1,
        C_out => open,
        Sum => SOMA_OUT(2)
    );

    C2 <= Cg3 or (Cp3 and Cg2) or (Cp3 and Cp2 and Cg1) or (Cp3 and Cp2 and Cp1 and C_IN(0));

    y4: halfAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C => Cg4,
        S => Cp4
    );

    x4: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C2,
        C_out => open,
        Sum => SOMA_OUT(3)
    );

    C_OUT(0) <= Cg4 or (Cp4 and Cg3) or (Cp4 and Cp3 and Cg2) or (Cp4 and Cp3 and Cp2 and Cg1) or (Cp4 and Cp3 and Cp2 and Cp1 and C_IN(0));
    
end behav;