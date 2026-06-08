-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity KoggeStone_4bit is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic
    );
end KoggeStone_4bit;

-- architecture
architecture behav of KoggeStone_4bit is

    -- stage 0: sinal por bit para G and P
    signal G0, P0 : std_logic_vector(3 downto 0);

    -- stage 1: 
    signal G1, P1 : std_logic_vector(3 downto 0);

    -- stage 2:
    signal C : std_logic_vector(3 downto 0);

    -- stage 3:
    signal S : std_logic_vector(3 downto 0);

begin
    -- stage 0:
    P0(0) <= A_IN(0) xor B_IN(0);
    G0(0) <= A_IN(0) and B_IN(0);

    P0(1) <= A_IN(1) xor B_IN(1);
    G0(1) <= A_IN(1) and B_IN(1);
    
    P0(2) <= A_IN(2) xor B_IN(2);
    G0(2) <= A_IN(2) and B_IN(2);

    P0(3) <= A_IN(3) xor B_IN(3);
    G0(3) <= A_IN(3) and B_IN(3);

    -- stage 1:

    P1(0) <= P0(0);
    G1(0) <= G0(0);

    P1(1) <= P0(1) and P0(0);
    G1(1) <= (P0(1) and G0(0)) or G0(1);

    P1(2) <= P0(2) and P0(1);
    G1(2) <= (P0(2) and G0(1)) or G0(2);

    P1(3) <= P0(3) and P0(2);
    G1(3) <= (P0(3) and G0(2)) or G0(3);

    -- stage 2:
    C(0) <= G1(0) or (C_IN and P1(0));
    C(1) <= G1(1) or (C(0) and P1(1));
    C(2) <= G1(2) or (C(1) and P1(2));
    C(3) <= G1(3) or (C(2) and P1(3));

    -- stage 3:
    S(0) <= P1(0) xor C_IN;
    S(1) <= P1(1) xor C(0);
    S(2) <= P1(2) xor C(1);
    S(3) <= P1(3) xor C(2);  
    
    SOMA_OUT <= S; 
    C_OUT <= C(3);

end behav;