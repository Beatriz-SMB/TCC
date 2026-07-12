-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity KoggeStone is
    Port ( 
        A_IN : in std_logic_vector(15 downto 0);
        B_IN : in std_logic_vector(15 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(15 downto 0);
        C_OUT : out std_logic
    );
end KoggeStone;

-- architecture
architecture behav of KoggeStone is

    -- pre processing: sinal por bit para G and P
    signal G0, P0 : std_logic_vector(15 downto 0);

    -- stage 1:
    signal G1, P1 : std_logic_vector(15 downto 0);

    -- stage 2:
    signal G2, P2 : std_logic_vector(15 downto 0);

    -- stage 3:
    signal G3, P3 : std_logic_vector(15 downto 0);

    -- stage 4:
    signal G4, P4 : std_logic_vector(15 downto 0);

    -- post processing:
    signal C : std_logic_vector(15 downto 0);
    signal S : std_logic_vector(15 downto 0);

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

    P0(4) <= A_IN(4) xor B_IN(4);
    G0(4) <= A_IN(4) and B_IN(4);

    P0(5) <= A_IN(5) xor B_IN(5);
    G0(5) <= A_IN(5) and B_IN(5);

    P0(6) <= A_IN(6) xor B_IN(6);
    G0(6) <= A_IN(6) and B_IN(6);

    P0(7) <= A_IN(7) xor B_IN(7);
    G0(7) <= A_IN(7) and B_IN(7);

    P0(8) <= A_IN(8) xor B_IN(8);
    G0(8) <= A_IN(8) and B_IN(8);

    P0(9) <= A_IN(9) xor B_IN(9);
    G0(9) <= A_IN(9) and B_IN(9);

    P0(10) <= A_IN(10) xor B_IN(10);
    G0(10) <= A_IN(10) and B_IN(10);

    P0(11) <= A_IN(11) xor B_IN(11);
    G0(11) <= A_IN(11) and B_IN(11);

    P0(12) <= A_IN(12) xor B_IN(12);
    G0(12) <= A_IN(12) and B_IN(12);

    P0(13) <= A_IN(13) xor B_IN(13);
    G0(13) <= A_IN(13) and B_IN(13);

    P0(14) <= A_IN(14) xor B_IN(14);
    G0(14) <= A_IN(14) and B_IN(14);

    P0(15) <= A_IN(15) xor B_IN(15);
    G0(15) <= A_IN(15) and B_IN(15);

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

    P1(8) <= P0(8) and P0(7);
    G1(8) <= (P0(8) and G0(7)) or G0(8);

    P1(9) <= P0(9) and P0(8);
    G1(9) <= (P0(9) and G0(8)) or G0(9);

    P1(10) <= P0(10) and P0(9);
    G1(10) <= (P0(10) and G0(9)) or G0(10);

    P1(11) <= P0(11) and P0(10);
    G1(11) <= (P0(11) and G0(10)) or G0(11);

    P1(12) <= P0(12) and P0(11);
    G1(12) <= (P0(12) and G0(11)) or G0(12);

    P1(13) <= P0(13) and P0(12);
    G1(13) <= (P0(13) and G0(12)) or G0(13);

    P1(14) <= P0(14) and P0(13);
    G1(14) <= (P0(14) and G0(13)) or G0(14);

    P1(15) <= P0(15) and P0(14);
    G1(15) <= (P0(15) and G0(14)) or G0(15);

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

    P2(8) <= P1(8) and P1(6);
    G2(8) <= (P1(8) and G1(6)) or G1(8);

    P2(9) <= P1(9) and P1(7);
    G2(9) <= (P1(9) and G1(7)) or G1(9);

    P2(10) <= P1(10) and P1(8);
    G2(10) <= (P1(10) and G1(8)) or G1(10);

    P2(11) <= P1(11) and P1(9);
    G2(11) <= (P1(11) and G1(9)) or G1(11);

    P2(12) <= P1(12) and P1(10);
    G2(12) <= (P1(12) and G1(10)) or G1(12);

    P2(13) <= P1(13) and P1(11);
    G2(13) <= (P1(13) and G1(11)) or G1(13);

    P2(14) <= P1(14) and P1(12);
    G2(14) <= (P1(14) and G1(12)) or G1(14);

    P2(15) <= P1(15) and P1(13);
    G2(15) <= (P1(15) and G1(13)) or G1(15);

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

    P3(8) <= P2(8) and P2(4);
    G3(8) <= (P2(8) and G2(4)) or G2(8);

    P3(9) <= P2(9) and P2(5);
    G3(9) <= (P2(9) and G2(5)) or G2(9);

    P3(10) <= P2(10) and P2(6);
    G3(10) <= (P2(10) and G2(6)) or G2(10);

    P3(11) <= P2(11) and P2(7);
    G3(11) <= (P2(11) and G2(7)) or G2(11);

    P3(12) <= P2(12) and P2(8);
    G3(12) <= (P2(12) and G2(8)) or G2(12);

    P3(13) <= P2(13) and P2(9);
    G3(13) <= (P2(13) and G2(9)) or G2(13);

    P3(14) <= P2(14) and P2(10);
    G3(14) <= (P2(14) and G2(10)) or G2(14);

    P3(15) <= P2(15) and P2(11);
    G3(15) <= (P2(15) and G2(11)) or G2(15);

    -- stage 4:
    P4(0) <= P3(0);
    G4(0) <= G3(0);

    P4(1) <= P3(1);
    G4(1) <= G3(1);

    P4(2) <= P3(2);
    G4(2) <= G3(2);

    P4(3) <= P3(3);
    G4(3) <= G3(3);

    P4(4) <= P3(4);
    G4(4) <= G3(4);

    P4(5) <= P3(5);
    G4(5) <= G3(5);

    P4(6) <= P3(6);
    G4(6) <= G3(6);

    P4(7) <= P3(7);
    G4(7) <= G3(7);

    P4(8) <= P3(8) and P3(0);
    G4(8) <= (P3(8) and G3(0)) or G3(8);

    P4(9) <= P3(9) and P3(1);
    G4(9) <= (P3(9) and G3(1)) or G3(9);

    P4(10) <= P3(10) and P3(2);
    G4(10) <= (P3(10) and G3(2)) or G3(10);

    P4(11) <= P3(11) and P3(3);
    G4(11) <= (P3(11) and G3(3)) or G3(11);

    P4(12) <= P3(12) and P3(4);
    G4(12) <= (P3(12) and G3(4)) or G3(12);

    P4(13) <= P3(13) and P3(5);
    G4(13) <= (P3(13) and G3(5)) or G3(13);

    P4(14) <= P3(14) and P3(6);
    G4(14) <= (P3(14) and G3(6)) or G3(14);

    P4(15) <= P3(15) and P3(7);
    G4(15) <= (P3(15) and G3(7)) or G3(15);

    -- post processing:
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