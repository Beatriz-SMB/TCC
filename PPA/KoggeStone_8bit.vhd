-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity KoggeStone_8bit is
    Port ( 
        A_IN : in std_logic_vector(7 downto 0);
        B_IN : in std_logic_vector(7 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(7 downto 0);
        C_OUT : out std_logic
    );
end KoggeStone_8bit;

-- architecture
architecture behav of KoggeStone_8bit is

    -- stage 0: sinal por bit para G and P
    signal G0, P0 : std_logic_vector(7 downto 0);

    -- stage 1:
    signal G1, P1 : std_logic_vector(7 downto 0);

    -- stage 2:
    signal G2, P2 : std_logic_vector(7 downto 0);

    -- stage 3:
    signal G3, P3 : std_logic_vector(7 downto 0);

    -- stage 4:
    signal C : std_logic_vector(7 downto 0);
    signal S : std_logic_vector(7 downto 0);

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

    P0(4) <= A_IN(4) xor B_IN(4);
    G0(4) <= A_IN(4) and B_IN(4);

    P0(5) <= A_IN(5) xor B_IN(5);
    G0(5) <= A_IN(5) and B_IN(5);

    P0(6) <= A_IN(6) xor B_IN(6);
    G0(6) <= A_IN(6) and B_IN(6);

    P0(7) <= A_IN(7) xor B_IN(7);
    G0(7) <= A_IN(7) and B_IN(7);

    -- stage 1:

    P1(0) <= P0(0);
    G1(0) <= G0(0);

    P1(1) <= P0(1) and P0(0);
    G1(1) <= (P0(1) and G0(0)) or G0(1);

    P1(2) <= P0(2) and P0(1);
    G1(2) <= (P0(2) and G0(1)) or G0(2);

    P1(3) <= P0(3) and P0(2);
    G1(3) <= (P0(3) and G0(2)) or G0(3);

    P1(4) <= P0(4) and P0(3);
    G1(4) <= (P0(4) and G0(3)) or G0(4);

    P1(5) <= P0(5) and P0(4);
    G1(5) <= (P0(5) and G0(4)) or G0(5);

    P1(6) <= P0(6) and P0(5);
    G1(6) <= (P0(6) and G0(5)) or G0(6);

    P1(7) <= P0(7) and P0(6);
    G1(7) <= (P0(7) and G0(6)) or G0(7);


    -- stage 2:
    P2(0) <= P1(0);
    G2(0) <= G1(0);

    P2(1) <= P1(1);
    G2(1) <= G1(1);

    P2(2) <= P1(2) and P1(0);
    G2(2) <= (P1(2) and G1(0)) or G1(2);

    P2(3) <= P1(3) and P1(1);
    G2(3) <= (P1(3) and G1(1)) or G1(3);

    P2(4) <= P1(4) and P1(2);
    G2(4) <= (P1(4) and G1(2)) or G1(4);

    P2(5) <= P1(5) and P1(3);
    G2(5) <= (P1(5) and G1(3)) or G1(5);

    P2(6) <= P1(6) and P1(4);
    G2(6) <= (P1(6) and G1(4)) or G1(6);

    P2(7) <= P1(7) and P1(5);
    G2(7) <= (P1(7) and G1(5)) or G1(7);


    -- stage 3:
    P3(0) <= P2(0);
    G3(0) <= G2(0);

    P3(1) <= P2(1);
    G3(1) <= G2(1);

    P3(2) <= P2(2);
    G3(2) <= G2(2);

    P3(3) <= P2(3);
    G3(3) <= G2(3);

    P3(4) <= P2(4) and P2(0);
    G3(4) <= (P2(4) and G2(0)) or G2(4);

    P3(5) <= P2(5) and P2(1);
    G3(5) <= (P2(5) and G2(1)) or G2(5);

    P3(6) <= P2(6) and P2(2);
    G3(6) <= (P2(6) and G2(2)) or G2(6);

    P3(7) <= P2(7) and P2(3);
    G3(7) <= (P2(7) and G2(3)) or G2(7);


    -- stage 4:
    C(0) <= G3(0) or (C_IN and P3(0));
    C(1) <= G3(1) or (C(0) and P3(1));
    C(2) <= G3(2) or (C(1) and P3(2));
    C(3) <= G3(3) or (C(2) and P3(3));
    C(4) <= G3(4) or (C(3) and P3(4));
    C(5) <= G3(5) or (C(4) and P3(5));
    C(6) <= G3(6) or (C(5) and P3(6));
    C(7) <= G3(7) or (C(6) and P3(7));

    S(0) <= P0(0) xor C_IN;
    S(1) <= P0(1) xor C(0);
    S(2) <= P0(2) xor C(1);
    S(3) <= P0(3) xor C(2);
    S(4) <= P0(4) xor C(3);
    S(5) <= P0(5) xor C(4);
    S(6) <= P0(6) xor C(5);
    S(7) <= P0(7) xor C(6);

    SOMA_OUT <= S; 
    C_OUT <= C(7);

end behav;