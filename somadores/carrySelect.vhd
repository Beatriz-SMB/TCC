-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySelect is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic
    );
end carrySelect;

-- architecture
architecture behav of carrySelect is
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
    signal C : std_logic_vector(7 downto 0);

    signal A0, A1, A2, A3, B0, B1, B2, B3 : std_logic;

    signal zero : std_logic := '0';
	signal one  : std_logic := '1';
begin
    -- C_in = 0
    x1_zero: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => zero,
        C_out => C(0),
        Sum => A0
    );

    -- C_in = 1
    x1_one: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => one,
        C_out => C(1),
        Sum => B0
    );

    m1: mux port map (
        A => A0,
        B => B0,
        S => C_IN,
        mux_out => SOMA_OUT(0)
    );

    -- C_in = 0
    x2_zero: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(0),
        C_out => C(2),
        Sum => A1
    );

    -- C_in = 1
    x2_one: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(1),
        C_out => C(3),
        Sum => B1
    );

    m2: mux port map (
        A => A1,
        B => B1,
        S => C_IN,
        mux_out => SOMA_OUT(1)
    );

    -- C_in = 0
    x3_zero: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(2),
        C_out => C(4),
        Sum => A2
    );

    -- C_in = 1
    x3_one: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(3),
        C_out => C(5),
        Sum => B2
    );

    m3: mux port map (
        A => A2,
        B => B2,
        S => C_IN,
        mux_out => SOMA_OUT(2)
    );

    -- C_in = 0
    x4_zero: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(4),
        C_out => C(6),
        Sum => A3
    );

    -- C_in = 1
    x4_one: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(5),
        C_out => C(7),
        Sum => B3
    );

    m4: mux port map (
        A => A3,
        B => B3,
        S => C_IN,
        mux_out => SOMA_OUT(3)
    );

    mux_Cout: mux port map (
        A => C(6),
        B => C(7),
        S => C_IN,
        mux_out => C_OUT
    );
    
end behav;