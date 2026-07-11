-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity toplevel is
    port(
		A_IN       : in std_logic_vector(3 downto 0);
        B_IN       : in std_logic_vector(3 downto 0);
        CLK        : in std_logic;
        RESET      : in std_logic;
        RESULT     : out std_logic_vector(7 downto 0)
    );
end toplevel;

-- architecture
architecture behav of toplevel is

    -- FlipFlop D --------------------
    component FlipflopD is
        generic ( n: positive);
        Port ( 
            d   : in std_logic_vector(n-1 downto 0);
			clk, reset : in std_logic;
			q   : out std_logic_vector(n-1 downto 0)
        );
    end component;

    -- Multiplier --------------------
    component multiplier is
        Port ( 
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            S : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Adder --------------------
    component adder is
        Port ( 
            A, B: in std_logic_vector(7 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(7 downto 0);
            Cout : out std_logic
        );
    end component;

    -- Accumulator --------------------
    component accumulator is
        Port ( 
            D   : in std_logic_vector(7 downto 0);
			CLK, RESET : in std_logic;
			Q   : out std_logic_vector(7 downto 0)
        );
    end component;

    signal signal_A, signal_B : std_logic_vector(3 downto 0);

    signal product : std_logic_vector(7 downto 0);
    signal sum : std_logic_vector(7 downto 0);
    signal carry : std_logic;
    signal acc : std_logic_vector(7 downto 0);

    begin
    flipflopDA : flipflopD generic map(4) port map (
        d => A_IN,
        clk => CLK,
        reset => RESET,
        q => signal_A
	);

    flipflopDB : flipflopD generic map(4) port map (
        d => B_IN,
        clk => CLK,
        reset => RESET,
        q => signal_B
	);

    m: multiplier port map (
        A => signal_A,
        B => signal_B,
        S => product
    );

    a: adder port map (
        A => product,
        B => acc,
        Cin => '0',
        Cout => carry,
        Sum => sum
    );

    ac: accumulator port map (
        D => sum,
        CLK => CLK,
        RESET => RESET,
        Q => acc 
    );

    RESULT <= acc;

end behav;



-- -- library declaration
-- library IEEE;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;

-- -- entity
-- entity toplevel is
--     port(
-- 		A_IN       : in std_logic_vector(3 downto 0);
--         B_IN       : in std_logic_vector(3 downto 0);
--         CLK        : in std_logic;
--         RESET      : in std_logic;
--         RESULT     : out std_logic_vector(7 downto 0)
--     );
-- end toplevel;

-- -- architecture
-- architecture behav of toplevel is

--     -- Multiplier --------------------
--     component multiplier is
--         Port ( 
--             A : in std_logic_vector(3 downto 0);
--             B : in std_logic_vector(3 downto 0);
--             S : out std_logic_vector(7 downto 0)
--         );
--     end component;

--     -- Adder --------------------
--     component adder is
--         Port ( 
--             A, B: in std_logic_vector(7 downto 0);
--             Cin : in std_logic;
--             Sum : out std_logic_vector(7 downto 0);
--             Cout : out std_logic
--         );
--     end component;

--     -- Accumulator --------------------
--     component accumulator is
--         Port ( 
--             D   : in std_logic_vector(7 downto 0);
-- 			CLK, RESET : in std_logic;
-- 			Q   : out std_logic_vector(7 downto 0)
--         );
--     end component;

--     signal product : std_logic_vector(7 downto 0);
--     signal sum : std_logic_vector(7 downto 0);
--     signal carry : std_logic;
--     signal acc : std_logic_vector(7 downto 0);

--     begin

--     m: multiplier port map (
--         A => A_IN,
--         B => B_IN,
--         S => product
--     );

--     a: adder port map (
--         A => product,
--         B => acc,
--         Cin => '0',
--         Cout => carry,
--         Sum => sum
--     );

--     ac: accumulator port map (
--         D => sum,
--         CLK => CLK,
--         RESET => RESET,
--         Q => acc 
--     );

--     RESULT <= acc;

-- end behav;