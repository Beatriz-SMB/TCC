-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity top is
    port(
		A       : in std_logic_vector(7 downto 0);
        B       : in std_logic_vector(7 downto 0);
        Cin     : in std_logic;
        sum     : out std_logic_vector(7 downto 0);
        Cout    : out std_logic
    );
end top;

-- architecture
architecture behav of top is

    -- KoggeStone --------------------
    component KoggeStone is
        Port ( 
            A_IN, B_IN: in std_logic_vector(7 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(7 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- BrentKung --------------------
    component BrentKung is
        Port ( 
            A_IN, B_IN: in std_logic_vector(7 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(7 downto 0);
            C_OUT : out std_logic
        );
    end component;
    
    -- Sklansky --------------------
    component Sklansky is
        Port ( 
            A_IN, B_IN: in std_logic_vector(7 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(7 downto 0);
            C_OUT : out std_logic
        );
    end component;

    -- LadnerFischer --------------------
    component LadnerFischer is
        Port ( 
            A_IN, B_IN: in std_logic_vector(7 downto 0);
            C_IN : in std_logic;
            SOMA_OUT : out std_logic_vector(7 downto 0);
            C_OUT : out std_logic
        );
    end component;

    begin

    -- KoggeStone --------------------
    -- KoggeStoneAdder: KoggeStone port map (
    --     A_IN => A,
    --     B_IN => B,
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    -- BrentKung --------------------
    -- BrentKungAdder: BrentKung port map (
    --     A_IN => A,
    --     B_IN => B,
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    -- Sklansky --------------------
    -- S: Sklansky port map (
    --     A_IN => A,
    --     B_IN => B,
    --     C_IN => Cin,
    --     C_OUT => Cout,
    --     SOMA_OUT => sum
    -- );

    -- LadnerFischer --------------------
    LF: LadnerFischer port map (
        A_IN => A,
        B_IN => B,
        C_IN => Cin,
        C_OUT => Cout,
        SOMA_OUT => sum
    );

end behav;