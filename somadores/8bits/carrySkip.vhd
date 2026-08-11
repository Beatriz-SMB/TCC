-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySkip is
    Port ( 
        A_IN : in std_logic_vector(7 downto 0);
        B_IN : in std_logic_vector(7 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(7 downto 0);
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
    signal C : std_logic_vector(7 downto 0);

    signal P, P0, P1, P2, P3, P4, P5, P6, P7 : std_logic;

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

    P <= P0 and P1 and P2 and P3 and P4 and P5 and P6 and P7;

    m: mux port map (
        A => C(7),
        B => C_IN,
        S => P,
        MUX_OUT => C_OUT
    );
    
end behav;