-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity top is
    port(
		A       : in std_logic_vector(3 downto 0);
        B       : in std_logic_vector(3 downto 0);
        Cin     : in std_logic;
        sum     : out std_logic_vector(3 downto 0);
        Cout    : out std_logic
    );
end top;

-- architecture
architecture behav of top is

    -- RCA --------------------
    component rca_4bit is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- CLA --------------------
    component clA_4bit is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;
    
    -- CarrySkip --------------------
    component carrySkip_4bit is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- CarrySelect --------------------
    component carrySelect_4bit is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- Conditional --------------------
    component conditional_4bit is
        Port ( 
            A_IN, B_IN: in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0);
            C_OUT : out std_logic
        );
    end component;

    begin

    -- RCA --------------------
    RippleCarry: rca_4bit port map (
        A_IN => A,
        B_IN => B,
        C_IN => Cin,
        C_OUT => Cout,
        SOMA_OUT => sum
    );

    -- CLA --------------------
    -- CarryLookAhead: clA_4bit port map (
    --     A_IN => A,
    --     B_IN => B,
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    -- CarrySkip --------------------
    -- CS: carrySkip_4bit port map (
    --     A_IN => A,
    --     B_IN => B,
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    -- CarrySelect --------------------
    -- CS: carrySelect_4bit port map (
    --     A_IN => A,
    --     B_IN => B,
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    -- Conditional --------------------
    -- C: conditional_4bit port map (
    --     A_IN => A,
    --     B_IN => B,
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

end behav;