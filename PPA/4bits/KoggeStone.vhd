-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity KoggeStone is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic
    );
end KoggeStone;

-- architecture
architecture behav of KoggeStone is

    -- pre processing: sinal por bit para G and P
    signal G0, P0 : std_logic_vector(3 downto 0);

    -- stage 1: 
    signal G1, P1 : std_logic_vector(3 downto 0);

    -- stage 2:
    signal G2, P2 : std_logic_vector(3 downto 0);

    -- post processing:
    signal C : std_logic_vector(3 downto 0);
    signal S : std_logic_vector(3 downto 0);

begin
    -- pre processing:
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
    P2(0) <= P1(0);
    G2(0) <= G1(0);

    P2(1) <= P1(1);
    G2(1) <= G1(1);

    P2(2) <= P1(2) and P1(0);
    G2(2) <= (P1(2) and G1(0)) or G1(2);

    P2(3) <= P1(3) and P1(1);
    G2(3) <= (P1(3) and G1(1)) or G1(3);

    -- post processing:
    C(0) <= G2(0) or (C_IN and P2(0));
    C(1) <= G2(1) or (C(0) and P2(1));
    C(2) <= G2(2) or (C(1) and P2(2));
    C(3) <= G2(3) or (C(2) and P2(3));

    S(0) <= P0(0) xor C_IN;
    S(1) <= P0(1) xor C(0);
    S(2) <= P0(2) xor C(1);
    S(3) <= P0(3) xor C(2);  
    
    SOMA_OUT <= S; 
    C_OUT <= C(3);

end behav;