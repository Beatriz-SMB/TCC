-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity adder is
    Port ( 
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        Cin : in std_logic;
        Sum : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end adder;

-- architecture
architecture behav of adder is
    -- RCA --------------------
    component rca is
        Port ( 
            A_IN, B_IN : in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0); 
            C_OUT : out std_logic
        );
    end component;

    -- CLA --------------------
    component cla is
        Port ( 
            A_IN, B_IN : in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0); 
            C_OUT : out std_logic
        );
    end component;

    -- Carry Skip --------------------
    component carrySkip is
        Port ( 
            A_IN, B_IN : in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0); 
            C_OUT : out std_logic
        );
    end component;

    -- Carry Select --------------------
    component carrySelect is
        Port ( 
            A_IN, B_IN : in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0); 
            C_OUT : out std_logic
        );
    end component;

    -- Conditional --------------------
    component conditional is
        Port ( 
            A_IN, B_IN : in std_logic_vector(3 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(3 downto 0); 
            C_OUT : out std_logic
        );
    end component;

    -- intermediate signal declaration
    signal C0 : std_logic;

begin
    -- RCA --------------------
    x1: rca port map (
        A_IN => A(3 downto 0),
        B_IN => B(3 downto 0),
        C_IN => Cin,
        C_OUT => C0,
        SOMA_OUT => Sum(3 downto 0)
    );

    x2: rca port map (
        A_IN => A(7 downto 4),
        B_IN => B(7 downto 4),
        C_IN => C0,
        C_OUT => Cout,
        SOMA_OUT => Sum(7 downto 4)
    );

    -- CLA --------------------
    -- x1: cla port map (
    --     A_IN => A(3 downto 0),
    --     B_IN => B(3 downto 0),
    --     C_IN => Cin,
    --     C_OUT => C0,
    --     SOMA_OUT => Sum(3 downto 0)
    -- );

    -- x2: cla port map (
    --     A_IN => A(7 downto 4),
    --     B_IN => B(7 downto 4),
    --     C_IN => C0,
    --     C_OUT => Cout,
    --     SOMA_OUT => Sum(7 downto 4)
    -- );

    -- Carry Skip --------------------
    -- x1: carrySkip port map (
    --     A_IN => A(3 downto 0),
    --     B_IN => B(3 downto 0),
    --     C_IN => Cin,
    --     C_OUT => C0,
    --     SOMA_OUT => Sum(3 downto 0)
    -- );

    -- x2: carrySkip port map (
    --     A_IN => A(7 downto 4),
    --     B_IN => B(7 downto 4),
    --     C_IN => C0,
    --     C_OUT => Cout,
    --     SOMA_OUT => Sum(7 downto 4)
    -- );

    -- Carry Select --------------------
    -- x1: carrySelect port map (
    --     A_IN => A(3 downto 0),
    --     B_IN => B(3 downto 0),
    --     C_IN => Cin,
    --     C_OUT => C0,
    --     SOMA_OUT => Sum(3 downto 0)
    -- );

    -- x2: carrySelect port map (
    --     A_IN => A(7 downto 4),
    --     B_IN => B(7 downto 4),
    --     C_IN => C0,
    --     C_OUT => Cout,
    --     SOMA_OUT => Sum(7 downto 4)
    -- );

    -- Conditional --------------------
    -- x1: conditional port map (
    --     A_IN => A(3 downto 0),
    --     B_IN => B(3 downto 0),
    --     C_IN => Cin,
    --     C_OUT => C0,
    --     SOMA_OUT => Sum(3 downto 0)
    -- );

    -- x2: conditional port map (
    --     A_IN => A(7 downto 4),
    --     B_IN => B(7 downto 4),
    --     C_IN => C0,
    --     C_OUT => Cout,
    --     SOMA_OUT => Sum(7 downto 4)
    -- );
    
end behav;