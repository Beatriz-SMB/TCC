-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity main is
    port(
		A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        sum : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end main;

-- architecture
architecture behav of main is

    -- RCA --------------------
    component RCA is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- CLA --------------------
    component CLA is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;
    
    -- CarrySkip --------------------
    component carrySkip is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

     -- CarrySelect --------------------
    component carrySelect is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;
begin
    -- RippleCarry: RCA port map (
    --     A_IN => A(3 downto 0),
    --     B_IN => B(3 downto 0),
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    -- CarryLookAhead: CLA port map (
    --     A_IN => A(3 downto 0),
    --     B_IN => B(3 downto 0),
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    CS: carrySkip port map (
        A_IN => A,
        B_IN => B,
        C_IN => Cin,
        C_OUT => Cout,
        SOMA_OUT => sum
    );

    -- CS: carrySelect port map (
    --     A_IN => A(3 downto 0),
    --     B_IN => B(3 downto 0),
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );
end behav;