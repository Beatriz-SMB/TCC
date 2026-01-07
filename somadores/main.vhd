-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity main is
    port(
		A       : in std_logic_vector(3 downto 0);
        B       : in std_logic_vector(3 downto 0);
        Cin     : in std_logic_vector(0 downto 0);
        sum     : out std_logic_vector(3 downto 0);
        clk     : in std_logic; 
        reset   : in std_logic;
        Cout    : out std_logic_vector(0 downto 0)
    );
end main;

-- architecture
architecture behav of main is

    -- FlipFlop D --------------------
    component flipflopD is
        generic ( n: positive);
        Port ( 
            D   : in std_logic_vector(n-1 downto 0);
			CLK, RESET : in std_logic;
			Q   : out std_logic_vector(n-1 downto 0)
        );
    end component;

    -- RCA --------------------
    component RCA is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic_vector(0 downto 0);
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic_vector(0 downto 0)
        );
    end component;

    -- CLA --------------------
    component CLA is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic_vector(0 downto 0);
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic_vector(0 downto 0)
        );
    end component;
    
    -- CarrySkip --------------------
    component carrySkip is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic_vector(0 downto 0);
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic_vector(0 downto 0)
        );
    end component;

     -- CarrySelect --------------------
    component carrySelect is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic_vector(0 downto 0);
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic_vector(0 downto 0)
        );
    end component;

    signal s_cin : std_logic_vector(0 downto 0);
    signal s_cout : std_logic_vector(0 downto 0);

    signal s_sum : std_logic_vector(3 downto 0);
    signal s_A, s_B : std_logic_vector(3 downto 0);


    begin

    -- RCA --------------------
    -- flipflopDA : flipflopD generic map(4) port map (
    --     D => A,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_A
	-- );

    -- flipflopDB : flipflopD generic map(4) port map (
    --     D => B,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD generic map(1) port map (
    --     D => Cin,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD generic map(1) port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => Cout
	-- );

    -- flipflopDsum : flipflopD generic map(4) port map (
    --     D => s_sum,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => sum
	-- );

    -- RippleCarry: RCA port map (
    --     A_IN => s_A,
    --     B_IN => s_B,
    --     C_IN => s_cin,
    --     C_OUT => s_cout,
    --     SOMA_OUT => s_sum
    -- );

    -- CLA --------------------
    -- flipflopDA : flipflopD generic map(4) port map (
    --     D => A,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_A
	-- );

    -- flipflopDB : flipflopD generic map(4) port map (
    --     D => B,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD generic map(1) port map (
    --     D => Cin,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD generic map(1) port map (
    --     D => s_cout,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => Cout
	-- );

    -- flipflopDsum : flipflopD generic map(4) port map (
    --     D => s_sum,
    --     CLK => clk,
    --     RESET => reset,
    --     Q => sum
	-- );

    -- CarryLookAhead: CLA port map (
    --     A_IN => s_A,
    --     B_IN => s_B,
    --     C_IN => s_cin,
    --     C_OUT => s_cout,
    --     SOMA_OUT => s_sum
    -- );

    -- CarrySkip --------------------
    -- flipflopDA : flipflopD generic map(4) port map (
    --     D => A,
    --     clk => clk,
    --     reset => reset,
    --     Q => s_A
	-- );

    -- flipflopDB : flipflopD generic map(4) port map (
    --     D => B,
    --     clk => clk,
    --     reset => reset,
    --     Q => s_B
	-- );
	 
	-- flipflopDcin : flipflopD generic map(1) port map (
    --     D => Cin,
    --     clk => clk,
    --     reset => reset,
    --     Q => s_cin
	-- );

    -- flipflopDcout : flipflopD generic map(1) port map (
    --     D => s_cout,
    --     clk => clk,
    --     reset => reset,
    --     Q => Cout
	-- );

    -- flipflopDsum : flipflopD generic map(4) port map (
    --     D => s_sum,
    --     clk => clk,
    --     reset => reset,
    --     Q => sum
	-- );

    -- CS: carrySkip port map (
    --     A_IN => s_A,
    --     B_IN => s_B,
    --     C_IN => s_cin,
    --     C_OUT => s_cout,
    --     SOMA_OUT => s_sum
    -- );

    -- CarrySelect --------------------
    flipflopDA : flipflopD generic map(4) port map (
        D => A,
        clk => clk,
        reset => reset,
        Q => s_A
	);

    flipflopDB : flipflopD generic map(4) port map (
        D => B,
        clk => clk,
        reset => reset,
        Q => s_B
	);
	 
	flipflopDcin : flipflopD generic map(1) port map (
        D => Cin,
        clk => clk,
        reset => reset,
        Q => s_cin
	);

    flipflopDcout : flipflopD generic map(1) port map (
        D => s_cout,
        clk => clk,
        reset => reset,
        Q => Cout
	);

    flipflopDsum : flipflopD generic map(4) port map (
        D => s_sum,
        clk => clk,
        reset => reset,
        Q => sum
	);

    CS: carrySelect port map (
        A_IN => s_A,
        B_IN => s_B,
        C_IN => s_cin,
        C_OUT => s_cout,
        SOMA_OUT => s_sum
    );
end behav;