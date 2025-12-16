-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySkip is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic
    );
end carrySkip;

-- architecture
architecture behav of carrySkip is
    -- Full Adder --------------------
    component fullAdder is
        Port ( 
            A, B, C_in : in std_logic;
            Sum, C_out : out std_logic
        );
    end component;

    -- Mux --------------------------
    component mux is
        Port ( 
            A, B, S : in std_logic;
            mux_out : out std_logic
        );
    end component;

    -- intermediate signal declaration
    signal C0, C1, C2, C3: std_logic;
    signal S0, S1, S2, S3 : std_logic;
    signal P, P0, P1, P2, P3 : std_logic;

begin

    x1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN,
        C_out => C0,
        Sum => S0
    );

    P0 <= A_IN(0) xor B_IN(0);

    x2: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C0,
        C_out => C1,
        Sum => S1
    );

    P1 <= A_IN(1) xor B_IN(1);

    x3: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C1,
        C_out => C2,
        Sum => S2
    );

    P2 <= A_IN(2) xor B_IN(2);

    x4_zero: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C2,
        C_out => C3,
        Sum => S3
    );

    P3 <= A_IN(3) xor B_IN(3);

    P <= P0 and P1 and P2 and P3;

    m: mux port map (
        A => C_IN,
        B => C3,
        S => P,
        mux_out => C_OUT
    );
    
end behav;