-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySkip is
    Port ( 
        A_IN        : in std_logic_vector(3 downto 0);
        B_IN        : in std_logic_vector(3 downto 0);
        C_IN        : in std_logic_vector(0 downto 0);
        SOMA_OUT    : out std_logic_vector(3 downto 0);
        C_OUT       : out std_logic_vector(0 downto 0)
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
        generic ( n: positive := 1);
        port ( 
            A, B : in std_logic_vector(n-1 downto 0);
            S : in std_logic;
            mux_out : out std_logic_vector(n-1 downto 0)
        );
    end component;

    -- intermediate signal declaration
    signal C : std_logic_vector(3 downto 0);

    signal P, P0, P1, P2, P3 : std_logic;

begin

    x1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN(0),
        C_out => C(0),
        Sum => SOMA_OUT(0)
    );

    P0 <= A_IN(0) xor B_IN(0);

    x2: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(0),
        C_out => C(1),
        Sum => SOMA_OUT(1)
    );

    P1 <= A_IN(1) xor B_IN(1);

    x3: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(1),
        C_out => C(2),
        Sum => SOMA_OUT(2)
    );

    P2 <= A_IN(2) xor B_IN(2);

    x4_zero: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(2),
        C_out => C(3),
        Sum => SOMA_OUT(3)
    );

    P3 <= A_IN(3) xor B_IN(3);

    P <= P0 and P1 and P2 and P3;

    m: mux generic map(1) port map (
        A => C(3 downto 3),
        B => C_IN,
        S => P,
        mux_out => C_OUT
    );
    
end behav;