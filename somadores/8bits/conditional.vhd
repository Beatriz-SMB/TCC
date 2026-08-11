-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity conditional is
    Port ( 
        A_IN : in std_logic_vector(7 downto 0);
        B_IN : in std_logic_vector(7 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(7 downto 0);
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
    signal C1 : std_logic;
    signal C2 : std_logic_vector(1 downto 0);
    signal C3 : std_logic_vector(1 downto 0);
    signal C4 : std_logic_vector(1 downto 0);
    signal C5 : std_logic_vector(1 downto 0);
    signal C6 : std_logic_vector(1 downto 0);
    signal C7 : std_logic_vector(1 downto 0);
    signal C8 : std_logic_vector(1 downto 0);

    signal mux_Cout : std_logic_vector(10 downto 1);
    signal mux_Sum : std_logic_vector(12 downto 2);
    signal mux_entry : std_logic_vector(15 downto 0);

    signal s_A : std_logic_vector(7 downto 1);
    signal s_B : std_logic_vector(7 downto 1);

    signal zero : std_logic := '0';
	signal one  : std_logic := '1';
begin

    FA1: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => C_IN,
        C_out => C1,
        Sum => SOMA_OUT(0)
    );

    -- C_in = 0
    FA2_zero: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => zero,
        C_out => C2(0),
        Sum => s_A(1)
    );

    -- C_in = 1
    FA2_one: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => one,
        C_out => C2(1),
        Sum => s_B(1)
    );

    mux1_sum: mux port map (
        A => s_A(1),
        B => s_B(1),
        S => C1,
        MUX_OUT => SOMA_OUT(1)
    );

    mux1_Cout: mux port map (
        A => C2(0),
        B => C2(1),
        S => C1,
        MUX_OUT => mux_Cout(1)
    );

    -- C_in = 0
    FA3_zero: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => zero,
        C_out => C3(0),
        Sum => s_A(2)
    );

    -- C_in = 1
    FA3_one: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => one,
        C_out => C3(1),
        Sum => s_B(2)
    );

    -- C_in = 0
    FA4_zero: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => zero,
        C_out => C4(0),
        Sum => s_A(3)
    );

    -- C_in = 1
    FA4_one: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => one,
        C_out => C4(1),
        Sum => s_B(3)
    );

    mux2_sum: mux port map (
        A => s_A(3),
        B => s_B(3),
        S => C3(1),
        MUX_OUT => mux_Sum(2)
    );

    mux2_Cout: mux port map (
        A => C4(0),
        B => C4(1),
        S => C3(1),
        MUX_OUT => mux_Cout(2)
    );

    mux3_sum: mux port map (
        A => s_A(3),
        B => s_B(3),
        S => C3(0),
        MUX_OUT => mux_Sum(3)
    );

    mux3_Cout: mux port map (
        A => C4(0),
        B => C4(1),
        S => C3(0),
        MUX_OUT => mux_Cout(3)
    );
    
    mux_entry(1 downto 0) <= mux_Sum(3) & s_A(2);
    mux_entry(3 downto 2) <= mux_Sum(2) & s_B(2);

    mux4_Sum: genericMux generic map(2) port map (
        a => mux_entry(1 downto 0),
        b => mux_entry(3 downto 2),
        s => mux_Cout(1),
        mux_out => SOMA_OUT(3 downto 2)
    );

    mux4_Cout: mux port map (
        A => mux_Cout(3),
        B => mux_Cout(2),
        S => mux_Cout(1),
        MUX_OUT => mux_Cout(4)
    );

    -- C_in = 0
    FA5_zero: fullAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C_in => zero,
        C_out => C5(0),
        Sum => s_A(4)
    );

    -- C_in = 1
    FA5_one: fullAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C_in => one,
        C_out => C5(1),
        Sum => s_B(4)
    );

    -- C_in = 0
    FA6_zero: fullAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C_in => zero,
        C_out => C6(0),
        Sum => s_A(5)
    );

    -- C_in = 1
    FA6_one: fullAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C_in => one,
        C_out => C6(1),
        Sum => s_B(5)
    );

    mux5_sum: mux port map (
        A => s_A(5),
        B => s_B(5),
        S => C5(1),
        MUX_OUT => mux_Sum(5)
    );

    mux5_Cout: mux port map (
        A => C6(0),
        B => C6(1),
        S => C5(1),
        MUX_OUT => mux_Cout(5)
    );

    mux6_sum: mux port map (
        A => s_A(5),
        B => s_B(5),
        S => C5(0),
        MUX_OUT => mux_Sum(6)
    );

    mux6_Cout: mux port map (
        A => C6(0),
        B => C6(1),
        S => C5(0),
        MUX_OUT => mux_Cout(6)
    );

    -- C_in = 0
    FA7_zero: fullAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C_in => zero,
        C_out => C7(0),
        Sum => s_A(6)
    );

    -- C_in = 1
    FA7_one: fullAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C_in => one,
        C_out => C7(1),
        Sum => s_B(6)
    );

    -- C_in = 0
    FA8_zero: fullAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C_in => zero,
        C_out => C8(0),
        Sum => s_A(7)
    );

    -- C_in = 1
    FA8_one: fullAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C_in => one,
        C_out => C8(1),
        Sum => s_B(7)
    );

    mux7_sum: mux port map (
        A => s_A(7),
        B => s_B(7),
        S => C7(1),
        MUX_OUT => mux_Sum(7)
    );

    mux7_Cout: mux port map (
        A => C8(0),
        B => C8(1),
        S => C7(1),
        MUX_OUT => mux_Cout(7)
    );

    mux8_sum: mux port map (
        A => s_A(7),
        B => s_B(7),
        S => C7(0),
        MUX_OUT => mux_Sum(8)
    );

    mux8_Cout: mux port map (
        A => C8(0),
        B => C8(1),
        S => C7(0),
        MUX_OUT => mux_Cout(8)
    );

    mux_entry(5 downto 4) <= mux_Sum(8) & s_A(6);
    mux_entry(7 downto 6) <= mux_Sum(7) & s_B(6);

    mux9_Sum: genericMux generic map(2) port map (
        a => mux_entry(5 downto 4),
        b => mux_entry(7 downto 6),
        s => mux_Cout(6),
        mux_out => mux_Sum(10 downto 9) 
    );

    mux9_Cout: mux port map (
        A => mux_Cout(8),
        B => mux_Cout(7),
        S => mux_Cout(6),
        MUX_OUT => mux_Cout(9)
    );

    mux10_Sum: genericMux generic map(2) port map (
        a => mux_entry(5 downto 4),
        b => mux_entry(7 downto 6),
        s => mux_Cout(5),
        mux_out => mux_Sum(12 downto 11)
    );

    mux10_Cout: mux port map (
        A => mux_Cout(8),
        B => mux_Cout(7),
        S => mux_Cout(5),
        MUX_OUT => mux_Cout(10)
    );

    mux_entry(11 downto 8) <= mux_Sum(10 downto 9) & (mux_Sum(6) & s_A(4));
    mux_entry(15 downto 12) <= mux_Sum(12 downto 11) & (mux_Sum(5) & S_B(4));

    mux11_Sum: genericMux generic map(4) port map (
        a => mux_entry(11 downto 8),
        b => mux_entry(15 downto 12),
        s => mux_Cout(4),
        mux_out => SOMA_OUT(7 downto 4)
    );

    mux11_Cout: mux port map (
        A => mux_Cout(9),
        B => mux_Cout(10),
        S => mux_Cout(4),
        MUX_OUT => C_OUT
    );

end behav;