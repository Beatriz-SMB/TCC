-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity main is
    port(
		a_in       : in std_logic_vector(7 downto 0);
        b_in       : in std_logic_vector(7 downto 0);
        c_in     : in std_logic;
        sum_out     : out std_logic_vector(7 downto 0);
        clk     : in std_logic; 
        reset   : in std_logic;
        c_out    : out std_logic
    );
end main;

-- architecture
architecture behav of main is

    -- FlipFlop D --------------------
    component flipflopD is
        Port ( 
            D   : in std_logic;
			CLK, RESET : in std_logic;
			Q   : out std_logic
        );
    end component;

    -- Generic FlipFlop D --------------------
    component genericFlipflopD is
        generic ( n: positive);
        Port ( 
            d   : in std_logic_vector(n-1 downto 0);
			clk, reset : in std_logic;
			q   : out std_logic_vector(n-1 downto 0)
        );
    end component;

    -- RCA --------------------
    component rca_8bit is
        Port ( 
            A, B: in std_logic_vector(7 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(7 downto 0);
            Cout : out std_logic
        );
    end component;

    -- CLA --------------------
    component cla_8bit is
        Port ( 
            A, B: in std_logic_vector(7 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(7 downto 0);
            Cout : out std_logic
        );
    end component;
    
    -- CarrySkip --------------------
    component carrySkip_8bit is
        Port ( 
            A, B: in std_logic_vector(7 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(7 downto 0);
            Cout : out std_logic
        );
    end component;

    -- CarrySelect --------------------
    component carrySelect_8bit is
        Port ( 
            A, B: in std_logic_vector(7 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(7 downto 0);
            Cout : out std_logic
        );
    end component;

    -- Conditional --------------------
    component conditional_8bit is
        Port ( 
            A, B: in std_logic_vector(7 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(7 downto 0);
            Cout : out std_logic
        );
    end component;

    signal s_cin : std_logic;
    signal s_cout : std_logic;

    signal s_sum : std_logic_vector(7 downto 0);
    signal s_A, s_B : std_logic_vector(7 downto 0);


    begin

    -- RCA --------------------
    -- flipflopDA : genericFlipflopD generic map(8) port map (
    --     d => a_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(8) port map (
    --     d => b_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => c_in,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => c_out
	-- );

    -- flipflopDsum : genericFlipflopD generic map(8) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum_out
	-- );

    -- RippleCarry: rca_8bit port map (
    --     A => s_A,
    --     B => s_B,
    --     Cin => s_cin,
    --     Cout => s_cout,
    --     Sum => s_sum
    -- );

    -- CLA --------------------
    -- flipflopDA : genericFlipflopD generic map(8) port map (
    --     d => a_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(8) port map (
    --     d => b_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => c_in,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => c_out
	-- );

    -- flipflopDsum : genericFlipflopD generic map(8) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum_out
	-- );

    -- CarryLookAhead: cla_8bit port map (
    --     A => s_A,
    --     B => s_B,
    --     Cin => s_cin,
    --     Cout => s_cout,
    --     Sum => s_sum
    -- );

    -- CarrySkip --------------------
    -- flipflopDA : genericFlipflopD generic map(8) port map (
    --     d => a_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(8) port map (
    --     d => b_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => c_in,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => c_out
	-- );

    -- flipflopDsum : genericFlipflopD generic map(8) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum_out
	-- );

    -- CS: carrySkip_8bit port map (
    --     A => s_A,
    --     B => s_B,
    --     Cin => s_cin,
    --     Cout => s_cout,
    --     Sum => s_sum
    -- );

    -- CarrySelect --------------------
    -- flipflopDA : genericFlipflopD generic map(8) port map (
    --     d => a_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(8) port map (
    --     d => b_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => c_in,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => c_out
	-- );

    -- flipflopDsum : genericFlipflopD generic map(8) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum_out
	-- );

    -- CS: carrySelect_8bit port map (
    --     A => s_A,
    --     B => s_B,
    --     Cin => s_cin,
    --     Cout => s_cout,
    --     Sum => s_sum
    -- );

    -- Conditional --------------------
    -- flipflopDA : genericFlipflopD generic map(8) port map (
    --     d => a_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(8) port map (
    --     d => b_in,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => c_in,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => c_out
	-- );

    -- flipflopDsum : genericFlipflopD generic map(8) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum_out
	-- );

    -- C: conditional_8bit port map (
    --     A => s_A,
    --     B => s_B,
    --     Cin => s_cin,
    --     Cout => s_cout,
    --     Sum => s_sum
    -- );

end behav;