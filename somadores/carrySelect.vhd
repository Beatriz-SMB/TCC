-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySelect is
    Port ( 
        A_IN        : in std_logic_vector(3 downto 0);
        B_IN        : in std_logic_vector(3 downto 0);
        C_IN        : in std_logic_vector(0 downto 0);
        SOMA_OUT    : out std_logic_vector(3 downto 0);
        C_OUT       : out std_logic_vector(0 downto 0)
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
        generic ( n: positive := 1);
        Port ( 
            A, B : in std_logic_vector(n-1 downto 0); 
            S : in std_logic;
            mux_out : out std_logic_vector(n-1 downto 0)
        );
    end component;

    -- intermediate signal declaration
    signal C : std_logic_vector(7 downto 0);

    signal A0, A1, A2, A3, B0, B1, B2, B3 : std_logic;
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

    m1: mux generic map(1) port map (
        A => s_A(0 downto 0),
        B => s_B(0 downto 0),
        S => C_IN(0),
        mux_out => SOMA_OUT(0 downto 0)
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

    m2: mux generic map(1) port map (
        A => s_A(1 downto 1),
        B => s_B(1 downto 1),
        S => C_IN(0),
        mux_out => SOMA_OUT(1 downto 1)
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

    m3: mux generic map(1) port map (
        A => s_A(2 downto 2),
        B => s_B(2 downto 2),
        S => C_IN(0),
        mux_out => SOMA_OUT(2 downto 2)
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

    m4: mux generic map(1) port map (
        A => s_A(3 downto 3),
        B => s_B(3 downto 3),
        S => C_IN(0),
        mux_out => SOMA_OUT(3 downto 3)
    );

    mux_Cout: mux generic map(1) port map (
        A => C(6 downto 6),
        B => C(7 downto 7),
        S => C_IN(0),
        mux_out => C_OUT(0 downto 0)
    );
    
end behav;