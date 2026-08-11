-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySelect is
    Port ( 
        A_IN : in std_logic_vector(15 downto 0);
        B_IN : in std_logic_vector(15 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(15 downto 0);
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
    signal C : std_logic_vector(31 downto 0);

    signal s_A : std_logic_vector(15 downto 0);
    signal s_B : std_logic_vector(15 downto 0);

    signal zero : std_logic := '0';
	signal one  : std_logic := '1';
begin
    -- C_in = 0
    FA1_zero: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => zero,
        C_out => C(0),
        Sum => s_A(0)
    );

    -- C_in = 1
    FA1_one: fullAdder port map (
        A => A_IN(0),
        B => B_IN(0),
        C_in => one,
        C_out => C(1),
        Sum => s_B(0)
    );

    M1: mux port map (
        A => s_A(0),
        B => s_B(0),
        S => C_IN,
        MUX_OUT => SOMA_OUT(0)
    );

    -- C_in = 0
    FA2_zero: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(0),
        C_out => C(2),
        Sum => s_A(1)
    );

    -- C_in = 1
    FA2_one: fullAdder port map (
        A => A_IN(1),
        B => B_IN(1),
        C_in => C(1),
        C_out => C(3),
        Sum => s_B(1)
    );

    M2: mux port map (
        A => s_A(1),
        B => s_B(1),
        S => C_IN,
        MUX_OUT => SOMA_OUT(1)
    );

    -- C_in = 0
    FA3_zero: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(2),
        C_out => C(4),
        Sum => s_A(2)
    );

    -- C_in = 1
    FA3_one: fullAdder port map (
        A => A_IN(2),
        B => B_IN(2),
        C_in => C(3),
        C_out => C(5),
        Sum => s_B(2)
    );

    M3: mux port map (
        A => s_A(2),
        B => s_B(2),
        S => C_IN,
        MUX_OUT => SOMA_OUT(2)
    );

    -- C_in = 0
    FA4_zero: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(4),
        C_out => C(6),
        Sum => s_A(3)
    );

    -- C_in = 1
    FA4_one: fullAdder port map (
        A => A_IN(3),
        B => B_IN(3),
        C_in => C(5),
        C_out => C(7),
        Sum => s_B(3)
    );

    M4: mux port map (
        A => s_A(3),
        B => s_B(3),
        S => C_IN,
        MUX_OUT => SOMA_OUT(3)
    );

    -- C_in = 0
    FA5_zero: fullAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C_in => C(6),
        C_out => C(8),
        Sum => s_A(4)
    );

    -- C_in = 1
    FA5_one: fullAdder port map (
        A => A_IN(4),
        B => B_IN(4),
        C_in => C(7),
        C_out => C(9),
        Sum => s_B(4)
    );

    M5: mux port map (
        A => s_A(4),
        B => s_B(4),
        S => C_IN,
        MUX_OUT => SOMA_OUT(4)
    );

    -- C_in = 0
    FA6_zero: fullAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C_in => C(8),
        C_out => C(10),
        Sum => s_A(5)
    );

    -- C_in = 1
    FA6_one: fullAdder port map (
        A => A_IN(5),
        B => B_IN(5),
        C_in => C(9),
        C_out => C(11),
        Sum => s_B(5)
    );

    M6: mux port map (
        A => s_A(5),
        B => s_B(5),
        S => C_IN,
        MUX_OUT => SOMA_OUT(5)
    );

    -- C_in = 0
    FA7_zero: fullAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C_in => C(10),
        C_out => C(12),
        Sum => s_A(6)
    );

    -- C_in = 1
    FA7_one: fullAdder port map (
        A => A_IN(6),
        B => B_IN(6),
        C_in => C(11),
        C_out => C(13),
        Sum => s_B(6)
    );

    M7: mux port map (
        A => s_A(6),
        B => s_B(6),
        S => C_IN,
        MUX_OUT => SOMA_OUT(6)
    );

    -- C_in = 0
    FA8_zero: fullAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C_in => C(12),
        C_out => C(14),
        Sum => s_A(7)
    );

    -- C_in = 1
    FA8_one: fullAdder port map (
        A => A_IN(7),
        B => B_IN(7),
        C_in => C(13),
        C_out => C(15),
        Sum => s_B(7)
    );

    M8: mux port map (
        A => s_A(7),
        B => s_B(7),
        S => C_IN,
        MUX_OUT => SOMA_OUT(7)
    );

    -- C_in = 0
    FA9_zero: fullAdder port map (
        A => A_IN(8),
        B => B_IN(8),
        C_in => C(14),
        C_out => C(16),
        Sum => s_A(8)
    );

    -- C_in = 1
    FA9_one: fullAdder port map (
        A => A_IN(8),
        B => B_IN(8),
        C_in => C(15),
        C_out => C(17),
        Sum => s_B(8)
    );

    M9: mux port map (
        A => s_A(8),
        B => s_B(8),
        S => C_IN,
        MUX_OUT => SOMA_OUT(8)
    );

    -- C_in = 0
    FA10_zero: fullAdder port map (
        A => A_IN(9),
        B => B_IN(9),
        C_in => C(16),
        C_out => C(18),
        Sum => s_A(9)
    );

    -- C_in = 1
    FA10_one: fullAdder port map (
        A => A_IN(9),
        B => B_IN(9),
        C_in => C(17),
        C_out => C(19),
        Sum => s_B(9)
    );

    M10: mux port map (
        A => s_A(9),
        B => s_B(9),
        S => C_IN,
        MUX_OUT => SOMA_OUT(9)
    );

    -- C_in = 0
    FA11_zero: fullAdder port map (
        A => A_IN(10),
        B => B_IN(10),
        C_in => C(18),
        C_out => C(20),
        Sum => s_A(10)
    );

    -- C_in = 1
    FA11_one: fullAdder port map (
        A => A_IN(10),
        B => B_IN(10),
        C_in => C(19),
        C_out => C(21),
        Sum => s_B(10)
    );

    M11: mux port map (
        A => s_A(10),
        B => s_B(10),
        S => C_IN,
        MUX_OUT => SOMA_OUT(10)
    );

    -- C_in = 0
    FA12_zero: fullAdder port map (
        A => A_IN(11),
        B => B_IN(11),
        C_in => C(20),
        C_out => C(22),
        Sum => s_A(11)
    );

    -- C_in = 1
    FA12_one: fullAdder port map (
        A => A_IN(11),
        B => B_IN(11),
        C_in => C(21),
        C_out => C(23),
        Sum => s_B(11)
    );

    M12: mux port map (
        A => s_A(11),
        B => s_B(11),
        S => C_IN,
        MUX_OUT => SOMA_OUT(11)
    );

    -- C_in = 0
    FA13_zero: fullAdder port map (
        A => A_IN(12),
        B => B_IN(12),
        C_in => C(22),
        C_out => C(24),
        Sum => s_A(12)
    );

    -- C_in = 1
    FA13_one: fullAdder port map (
        A => A_IN(12),
        B => B_IN(12),
        C_in => C(23),
        C_out => C(25),
        Sum => s_B(12)
    );

    M13: mux port map (
        A => s_A(12),
        B => s_B(12),
        S => C_IN,
        MUX_OUT => SOMA_OUT(12)
    );   
    
    -- C_in = 0
    FA14_zero: fullAdder port map (
        A => A_IN(13),
        B => B_IN(13),
        C_in => C(24),
        C_out => C(26),
        Sum => s_A(13)
    );

    -- C_in = 1
    FA14_one: fullAdder port map (
        A => A_IN(13),
        B => B_IN(13),
        C_in => C(25),
        C_out => C(27),
        Sum => s_B(13)
    );

    M14: mux port map (
        A => s_A(13),
        B => s_B(13),
        S => C_IN,
        MUX_OUT => SOMA_OUT(13)
    );  

    -- C_in = 0
    FA15_zero: fullAdder port map (
        A => A_IN(14),
        B => B_IN(14),
        C_in => C(26),
        C_out => C(28),
        Sum => s_A(14)
    );

    -- C_in = 1
    FA15_one: fullAdder port map (
        A => A_IN(14),
        B => B_IN(14),
        C_in => C(27),
        C_out => C(29),
        Sum => s_B(14)
    );

    M15: mux port map (
        A => s_A(14),
        B => s_B(14),
        S => C_IN,
        MUX_OUT => SOMA_OUT(14)
    ); 

    -- C_in = 0
    FA16_zero: fullAdder port map (
        A => A_IN(15),
        B => B_IN(15),
        C_in => C(28),
        C_out => C(30),
        Sum => s_A(15)
    );

    -- C_in = 1
    FA16_one: fullAdder port map (
        A => A_IN(15),
        B => B_IN(15),
        C_in => C(29),
        C_out => C(31),
        Sum => s_B(15)
    );

    M16: mux port map (
        A => s_A(15),
        B => s_B(15),
        S => C_IN,
        MUX_OUT => SOMA_OUT(15)
    ); 

    -- Mux for the final carry out
    mux_Cout: mux port map (
        A => C(30),
        B => C(31),
        S => C_IN,
        MUX_OUT => C_OUT
    );
    
end behav;