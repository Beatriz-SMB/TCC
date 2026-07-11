-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity main is
    port(
		A       : in std_logic_vector(3 downto 0);
        B       : in std_logic_vector(3 downto 0);
        Cin     : in std_logic;
        sum     : out std_logic_vector(3 downto 0);
        clk     : in std_logic; 
        reset   : in std_logic;
        Cout    : out std_logic
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

    -- KoggeStone --------------------
    component KoggeStone is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- Brent Kung --------------------
    component BrentKung is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;
    
    -- Sklansky --------------------
    component Sklansky is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- Ladner Fischer --------------------
    component LadnerFischer is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    signal s_cin : std_logic;
    signal s_cout : std_logic;

    signal s_sum : std_logic_vector(3 downto 0);
    signal s_A, s_B : std_logic_vector(3 downto 0);


    begin

    -- Kogge Stone --------------------
    flipflopDA : genericFlipflopD generic map(4) port map (
        d => A,
        clk => clk,
        reset => reset,
        q => s_A
	);

    flipflopDB : genericFlipflopD generic map(4) port map (
        d => B,
        clk => clk,
        reset => reset,
        q => s_B
	);
	 
	flipflopDcin : flipflopD port map (
        D => Cin,
        CLK => clk,
        RESET => reset,
        Q => s_cin
	);

    flipflopDcout : flipflopD port map (
        D => s_cout,
        CLK => clk,
        RESET => reset,
        Q => Cout
	);

    flipflopDsum : genericFlipflopD generic map(4) port map (
        d => s_sum,
        clk => clk,
        reset => reset,
        q => sum
	);

    KS: KoggeStone port map (
        A_IN => s_A,
        B_IN => s_B,
        C_IN => s_cin,
        C_OUT => s_cout,
        SOMA_OUT => s_sum
    );

    -- Brent Kung --------------------
    -- flipflopDA : genericFlipflopD generic map(4) port map (
    --     d => A,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(4) port map (
    --     d => B,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => Cin,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => Cout
	-- );

    -- flipflopDsum : genericFlipflopD generic map(4) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum
	-- );

    -- BK: BrentKung port map (
    --     A_IN => s_A,
    --     B_IN => s_B,
    --     C_IN => s_cin,
    --     C_OUT => s_cout,
    --     SOMA_OUT => s_sum
    -- );

    -- Sklansky --------------------
    -- flipflopDA : genericFlipflopD generic map(4) port map (
    --     d => A,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(4) port map (
    --     d => B,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => Cin,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => Cout
	-- );

    -- flipflopDsum : genericFlipflopD generic map(4) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum
	-- );

    -- S: Sklansky port map (
    --     A_IN => s_A,
    --     B_IN => s_B,
    --     C_IN => s_cin,
    --     C_OUT => s_cout,
    --     SOMA_OUT => s_sum
    -- );

    -- Ladner Fischer --------------------
    -- flipflopDA : genericFlipflopD generic map(4) port map (
    --     d => A,
    --     clk => clk,
    --     reset => reset,
    --     q => s_A
	-- );

    -- flipflopDB : genericFlipflopD generic map(4) port map (
    --     d => B,
    --     clk => clk,
    --     reset => reset,
    --     q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD port map (
    --     D => Cin,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => Cout
	-- );

    -- flipflopDsum : genericFlipflopD generic map(4) port map (
    --     d => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     q => sum
	-- );

    -- LF: LadnerFischer port map (
    --     A_IN => s_A,
    --     B_IN => s_B,
    --     C_IN => s_cin,
    --     C_OUT => s_cout,
    --     SOMA_OUT => s_sum
    -- );

end behav;