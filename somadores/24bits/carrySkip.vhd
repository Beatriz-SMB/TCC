-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySkip is
    Port ( 
        A_IN : in std_logic_vector(23 downto 0);
        B_IN : in std_logic_vector(23 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(23 downto 0);
        C_OUT : out std_logic
    );
end carrySkip;

-- architecture
architecture behav of carrySkip is
    -- Full Adder --------------------
    component fullAdder is
        port ( 
            A, B, C_in : in std_logic;
            Sum, C_out : out std_logic
        );
    end component;

    -- Mux --------------------------
    component mux is
        port ( 
            A, B : in std_logic;
            S : in std_logic;
            MUX_OUT : out std_logic
        );
    end component;

    -- intermediate signal declaration
    signal C : std_logic_vector(23 downto 0);

    signal P, P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23: std_logic;

begin

    FA1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN,
        C_out => C(0),
        Sum => SOMA_OUT(0)
    );

    P0 <= A_IN(0) xor B_IN(0);

    FA2: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(0),
        C_out => C(1),
        Sum => SOMA_OUT(1)
    );

    P1 <= A_IN(1) xor B_IN(1);

    FA3: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(1),
        C_out => C(2),
        Sum => SOMA_OUT(2)
    );

    P2 <= A_IN(2) xor B_IN(2);

    FA4: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(2),
        C_out => C(3),
        Sum => SOMA_OUT(3)
    );

    P3 <= A_IN(3) xor B_IN(3);

    FA5: fullAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C_in => C(3),
        C_out => C(4), 
        Sum => SOMA_OUT(4)
    );

    P4 <= A_IN(4) xor B_IN(4);

    FA6: fullAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C_in => C(4),
        C_out => C(5),
        Sum => SOMA_OUT(5)
    );

    P5 <= A_IN(5) xor B_IN(5);

    FA7: fullAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C_in => C(5),
        C_out => C(6),
        Sum => SOMA_OUT(6)
    );

    P6 <= A_IN(6) xor B_IN(6);

    FA8: fullAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C_in => C(6),
        C_out => C(7),
        Sum => SOMA_OUT(7)
    );

    P7 <= A_IN(7) xor B_IN(7);

    FA9: fullAdder port map (
        A => A_IN(8),
        B => B_IN(8),
        C_in => C(7),
        C_out => C(8),
        Sum => SOMA_OUT(8)
    );

    P8 <= A_IN(8) xor B_IN(8);

    FA10: fullAdder port map (
        A => A_IN(9),
        B => B_IN(9),
        C_in => C(8),
        C_out => C(9),
        Sum => SOMA_OUT(9)
    );

    P9 <= A_IN(9) xor B_IN(9);

    FA11: fullAdder port map (
        A => A_IN(10),
        B => B_IN(10),
        C_in => C(9),
        C_out => C(10),
        Sum => SOMA_OUT(10)
    );

    P10 <= A_IN(10) xor B_IN(10);

    FA12: fullAdder port map (
        A => A_IN(11),
        B => B_IN(11),
        C_in => C(10),
        C_out => C(11),
        Sum => SOMA_OUT(11)
    );

    P11 <= A_IN(11) xor B_IN(11);

    FA13: fullAdder port map (
        A => A_IN(12),
        B => B_IN(12),
        C_in => C(11),
        C_out => C(12),
        Sum => SOMA_OUT(12)
    );

    P12 <= A_IN(12) xor B_IN(12);

    FA14: fullAdder port map (
        A => A_IN(13),
        B => B_IN(13),
        C_in => C(12),
        C_out => C(13),
        Sum => SOMA_OUT(13)
    );

    P13 <= A_IN(13) xor B_IN(13);

    FA15: fullAdder port map (
        A => A_IN(14),
        B => B_IN(14),
        C_in => C(13),
        C_out => C(14),
        Sum => SOMA_OUT(14)
    );

    P14 <= A_IN(14) xor B_IN(14);

    FA16: fullAdder port map (
        A => A_IN(15),
        B => B_IN(15),
        C_in => C(14),
        C_out => C(15),
        Sum => SOMA_OUT(15)
    );

    P15 <= A_IN(15) xor B_IN(15);

    FA17: fullAdder port map (
        A => A_IN(16),
        B => B_IN(16),
        C_in => C(15),
        C_out => C(16),
        Sum => SOMA_OUT(16)
    );

    P16 <= A_IN(16) xor B_IN(16);

    FA18: fullAdder port map (
        A => A_IN(17),
        B => B_IN(17),
        C_in => C(16),
        C_out => C(17),
        Sum => SOMA_OUT(17)
    );

    P17 <= A_IN(17) xor B_IN(17);

    FA19: fullAdder port map (
        A => A_IN(18),
        B => B_IN(18),
        C_in => C(17),
        C_out => C(18),
        Sum => SOMA_OUT(18)
    );

    P18 <= A_IN(18) xor B_IN(18);

    FA20: fullAdder port map (
        A => A_IN(19),
        B => B_IN(19),
        C_in => C(18),
        C_out => C(19),
        Sum => SOMA_OUT(19)
    );

    P19 <= A_IN(19) xor B_IN(19);

    FA21: fullAdder port map (
        A => A_IN(20),
        B => B_IN(20),
        C_in => C(19),
        C_out => C(20),
        Sum => SOMA_OUT(20)
    );

    P20 <= A_IN(20) xor B_IN(20);

    FA22: fullAdder port map (
        A => A_IN(21),
        B => B_IN(21),
        C_in => C(20),
        C_out => C(21),
        Sum => SOMA_OUT(21)
    );

    P21 <= A_IN(21) xor B_IN(21);

    FA23: fullAdder port map (
        A => A_IN(22),
        B => B_IN(22),
        C_in => C(21),
        C_out => C(22),
        Sum => SOMA_OUT(22)
    );

    P22 <= A_IN(22) xor B_IN(22);

    FA24: fullAdder port map (
        A => A_IN(23),
        B => B_IN(23),
        C_in => C(22),
        C_out => C(23),
        Sum => SOMA_OUT(23)
    );

    P23 <= A_IN(23) xor B_IN(23);

    P <= P0 and P1 and P2 and P3 and P4 and P5 and P6 and P7 and P8 and P9 and P10 and P11 and P12 and P13 and P14 and P15 and P16 and P17 and P18 and P19 and P20 and P21 and P22 and P23;

    m: mux port map (
        A => C(23),
        B => C_IN,
        S => P,
        MUX_OUT => C_OUT
    );
    
end behav;