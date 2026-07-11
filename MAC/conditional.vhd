-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity conditional is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic
    );
end conditional;

-- architecture
architecture behav of conditional is
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

    -- Mux --------------------------
    component genericMux is
        generic ( n: positive := 1);
        Port ( 
            a, b : in std_logic_vector(n-1 downto 0); 
            s : in std_logic;
            mux_out : out std_logic_vector(n-1 downto 0)
        );
    end component;

    -- intermediate signal declaration
    signal C : std_logic_vector(6 downto 0);

    signal mux_Cout : std_logic_vector(3 downto 0);
    signal mux_Sum : std_logic_vector(3 downto 0);
    signal mux_entry : std_logic_vector(3 downto 0);

    signal s_A : std_logic_vector(3 downto 0);
    signal s_B : std_logic_vector(3 downto 0);

    signal zero : std_logic := '0';
	signal one  : std_logic := '1';
begin

    x1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN,
        C_out => C(0),
        Sum => SOMA_OUT(0)
    );

    -- C_in = 0
    x2_zero: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => zero,
        C_out => C(1),
        Sum => s_A(0)
    );

    -- C_in = 1
    x2_one: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => one,
        C_out => C(2),
        Sum => s_B(0)
    );

    mux1_sum: mux port map (
        A => s_A(0),
        B => s_B(0),
        S => C(0),
        MUX_OUT => SOMA_OUT(1)
    );

    mux1_Cout: mux port map (
        A => C(1),
        B => C(2),
        S => C(0),
        MUX_OUT => mux_Cout(0)
    );

    -- C_in = 0
    x3_zero: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => zero,
        C_out => C(3),
        Sum => s_A(1)
    );

    -- C_in = 1
    x3_one: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => one,
        C_out => C(4),
        Sum => s_B(1)
    );

    -- C_in = 0
    x4_zero: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => zero,
        C_out => C(5),
        Sum => s_A(2)
    );

    -- C_in = 1
    x4_one: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => one,
        C_out => C(6),
        Sum => s_B(2)
    );

    mux2_sum: mux port map (
        A => s_A(2),
        B => s_B(2),
        S => C(3),
        MUX_OUT => mux_Sum(0)
    );

    mux2_Cout: mux port map (
        A => C(5),
        B => C(6),
        S => C(3),
        MUX_OUT => mux_Cout(1)
    );

    mux3_sum: mux port map (
        A => s_A(2),
        B => s_B(2),
        S => C(4),
        MUX_OUT => mux_Sum(1)
    );

    mux3_Cout: mux port map (
        A => C(5),
        B => C(6),
        S => C(4),
        MUX_OUT => mux_Cout(2)
    );

    mux4_Cout: mux port map (
        A => mux_Cout(1),
        B => mux_Cout(2),
        S => mux_Cout(0),
        MUX_OUT => C_OUT
    );
    
    mux_entry(1 downto 0) <= mux_Sum(0) & s_A(1);
    mux_entry(3 downto 2) <= mux_Sum(1) & s_B(1);

    mux4_Sum: genericMux generic map(2) port map (
        a => mux_entry(1 downto 0),
        b => mux_entry(3 downto 2),
        s => mux_Cout(0),
        mux_out => SOMA_OUT(3 downto 2)
    );

end behav;