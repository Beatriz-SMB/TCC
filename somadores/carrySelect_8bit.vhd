-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity carrySelect_8bit is
    Port ( 
        A : in std_logic_vector(7 downto 0);
        B : in std_logic_vector(7 downto 0);
        Cin : in std_logic;
        Sum : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end carrySelect_8bit;

-- architecture
architecture behav of carrySelect_8bit is
    -- Full Adder --------------------
    component carrySelect_4bit is
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
    x1: carrySelect_4bit port map (
        A_IN => A(3 downto 0),
        B_IN => B(3 downto 0),
        C_IN => Cin,
        C_OUT => C0,
        SOMA_OUT => Sum(3 downto 0)
    );

    x2: carrySelect_4bit port map (
        A_IN => A(7 downto 4),
        B_IN => B(7 downto 4),
        C_IN => C0,
        C_OUT => Cout,
        SOMA_OUT => Sum(7 downto 4)
    );
    
end behav;