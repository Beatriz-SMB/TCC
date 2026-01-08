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
            A, B : in std_logic; 
            S : in std_logic;
            MUX_OUT : out std_logic
        );
    end component;

    -- intermediate signal declaration
    signal C : std_logic_vector(7 downto 0);

    signal s_A : std_logic_vector(3 downto 0);
    signal s_B : std_logic_vector(3 downto 0);

    signal zero : std_logic := '0';
	signal one  : std_logic := '1';
begin
    -- C_in = 0
    x1_zero: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => zero,
        C_out => C(0),
        Sum => s_A(0)
    );

    -- C_in = 1
    x1_one: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => one,
        C_out => C(1),
        Sum => s_B(0)
    );

    m1: mux port map (
        A => s_A(0),
        B => s_B(0),
        S => C_IN,
        MUX_OUT => SOMA_OUT(0)
    );

    -- C_in = 0
    x2_zero: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(0),
        C_out => C(2),
        Sum => s_A(1)
    );

    -- C_in = 1
    x2_one: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(1),
        C_out => C(3),
        Sum => s_B(1)
    );

    m2: mux port map (
        A => s_A(1),
        B => s_B(1),
        S => C_IN,
        MUX_OUT => SOMA_OUT(1)
    );

    -- C_in = 0
    x3_zero: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(2),
        C_out => C(4),
        Sum => s_A(2)
    );

    -- C_in = 1
    x3_one: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(3),
        C_out => C(5),
        Sum => s_B(2)
    );

    m3: mux port map (
        A => s_A(2),
        B => s_B(2),
        S => C_IN,
        MUX_OUT => SOMA_OUT(2)
    );

    -- C_in = 0
    x4_zero: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(4),
        C_out => C(6),
        Sum => s_A(3)
    );

    -- C_in = 1
    x4_one: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(5),
        C_out => C(7),
        Sum => s_B(3)
    );

    m4: mux port map (
        A => s_A(3),
        B => s_B(3),
        S => C_IN,
        MUX_OUT => SOMA_OUT(3)
    );

    mux_Cout: mux port map (
        A => C(6),
        B => C(7),
        S => C_IN,
        MUX_OUT => C_OUT
    );
    
end behav;