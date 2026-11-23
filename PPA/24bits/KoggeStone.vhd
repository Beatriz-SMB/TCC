-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity KoggeStone is
    Port ( 
        A_IN : in std_logic_vector(23 downto 0);
        B_IN : in std_logic_vector(23 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(23 downto 0);
        C_OUT : out std_logic
    );
end KoggeStone;

-- architecture
architecture behav of KoggeStone is

    -- pre processing: sinal por bit para G and P
    signal G0, P0 : std_logic_vector(23 downto 0);

    -- stage 1:
    signal G1, P1 : std_logic_vector(23 downto 0);

    -- stage 2:
    signal G2, P2 : std_logic_vector(23 downto 0);

    -- stage 3:
    signal G3, P3 : std_logic_vector(23 downto 0);

    -- stage 4:
    signal G4, P4 : std_logic_vector(23 downto 0);

    -- stage 5:
    signal G5, P5 : std_logic_vector(23 downto 0);

    -- post processing:
    signal C : std_logic_vector(23 downto 0);
    signal S : std_logic_vector(23 downto 0);

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

    P0(16) <= A_IN(16) xor B_IN(16);
    G0(16) <= A_IN(16) and B_IN(16);

    P0(17) <= A_IN(17) xor B_IN(17);
    G0(17) <= A_IN(17) and B_IN(17);

    P0(18) <= A_IN(18) xor B_IN(18);
    G0(18) <= A_IN(18) and B_IN(18);

    P0(19) <= A_IN(19) xor B_IN(19);
    G0(19) <= A_IN(19) and B_IN(19);

    P0(20) <= A_IN(20) xor B_IN(20);
    G0(20) <= A_IN(20) and B_IN(20);

    P0(21) <= A_IN(21) xor B_IN(21);
    G0(21) <= A_IN(21) and B_IN(21);

    P0(22) <= A_IN(22) xor B_IN(22);
    G0(22) <= A_IN(22) and B_IN(22);

    P0(23) <= A_IN(23) xor B_IN(23);
    G0(23) <= A_IN(23) and B_IN(23);

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

    P1(16) <= P0(16) and P0(15);
    G1(16) <= (P0(16) and G0(15)) or G0(16);

    P1(17) <= P0(17) and P0(16);
    G1(17) <= (P0(17) and G0(16)) or G0(17);

    P1(18) <= P0(18) and P0(17);
    G1(18) <= (P0(18) and G0(17)) or G0(18);

    P1(19) <= P0(19) and P0(18);
    G1(19) <= (P0(19) and G0(18)) or G0(19);

    P1(20) <= P0(20) and P0(19);
    G1(20) <= (P0(20) and G0(19)) or G0(20);

    P1(21) <= P0(21) and P0(20);
    G1(21) <= (P0(21) and G0(20)) or G0(21);

    P1(22) <= P0(22) and P0(21);
    G1(22) <= (P0(22) and G0(21)) or G0(22);

    P1(23) <= P0(23) and P0(22);
    G1(23) <= (P0(23) and G0(22)) or G0(23);

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

    P2(16) <= P1(16) and P1(14);
    G2(16) <= (P1(16) and G1(14)) or G1(16);

    P2(17) <= P1(17) and P1(15);
    G2(17) <= (P1(17) and G1(15)) or G1(17);

    P2(18) <= P1(18) and P1(16);
    G2(18) <= (P1(18) and G1(16)) or G1(18);

    P2(19) <= P1(19) and P1(17);
    G2(19) <= (P1(19) and G1(17)) or G1(19);

    P2(20) <= P1(20) and P1(18);
    G2(20) <= (P1(20) and G1(18)) or G1(20);

    P2(21) <= P1(21) and P1(19);
    G2(21) <= (P1(21) and G1(19)) or G1(21);

    P2(22) <= P1(22) and P1(20);
    G2(22) <= (P1(22) and G1(20)) or G1(22);

    P2(23) <= P1(23) and P1(21);
    G2(23) <= (P1(23) and G1(21)) or G1(23);

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

    P3(16) <= P2(16) and P2(12);
    G3(16) <= (P2(16) and G2(12)) or G2(16);

    P3(17) <= P2(17) and P2(13);
    G3(17) <= (P2(17) and G2(13)) or G2(17);

    P3(18) <= P2(18) and P2(14);
    G3(18) <= (P2(18) and G2(14)) or G2(18);

    P3(19) <= P2(19) and P2(15);
    G3(19) <= (P2(19) and G2(15)) or G2(19);

    P3(20) <= P2(20) and P2(16);
    G3(20) <= (P2(20) and G2(16)) or G2(20);

    P3(21) <= P2(21) and P2(17);
    G3(21) <= (P2(21) and G2(17)) or G2(21);

    P3(22) <= P2(22) and P2(18);
    G3(22) <= (P2(22) and G2(18)) or G2(22);

    P3(23) <= P2(23) and P2(19);
    G3(23) <= (P2(23) and G2(19)) or G2(23);

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
    
    P4(16) <= P3(16) and P3(8);
    G4(16) <= (P3(16) and G3(8)) or G3(16);

    P4(17) <= P3(17) and P3(9);
    G4(17) <= (P3(17) and G3(9)) or G3(17);

    P4(18) <= P3(18) and P3(10);
    G4(18) <= (P3(18) and G3(10)) or G3(18);

    P4(19) <= P3(19) and P3(11);
    G4(19) <= (P3(19) and G3(11)) or G3(19);

    P4(20) <= P3(20) and P3(12);
    G4(20) <= (P3(20) and G3(12)) or G3(20);

    P4(21) <= P3(21) and P3(13);
    G4(21) <= (P3(21) and G3(13)) or G3(21);

    P4(22) <= P3(22) and P3(14);
    G4(22) <= (P3(22) and G3(14)) or G3(22);

    P4(23) <= P3(23) and P3(15);
    G4(23) <= (P3(23) and G3(15)) or G3(23);

    -- stage 5:
    P5(0) <= P4(0);
    G5(0) <= G4(0);

    P5(1) <= P4(1);
    G5(1) <= G4(1);

    P5(2) <= P4(2);
    G5(2) <= G4(2);

    P5(3) <= P4(3);
    G5(3) <= G4(3);

    P5(4) <= P4(4);
    G5(4) <= G4(4);

    P5(5) <= P4(5);
    G5(5) <= G4(5);

    P5(6) <= P4(6);
    G5(6) <= G4(6);

    P5(7) <= P4(7);
    G5(7) <= G4(7);

    P5(8) <= P4(8);
    G5(8) <= G4(8);

    P5(9) <= P4(9);
    G5(9) <= G4(9);

    P5(10) <= P4(10);
    G5(10) <= G4(10);

    P5(11) <= P4(11);
    G5(11) <= G4(11);

    P5(12) <= P4(12);
    G5(12) <= G4(12);

    P5(13) <= P4(13);
    G5(13) <= G4(13);

    P5(14) <= P4(14);
    G5(14) <= G4(14);

    P5(15) <= P4(15);
    G5(15) <= G4(15);

    P5(16) <= P4(16);
    G5(16) <= G4(16);

    P5(17) <= P4(17);
    G5(17) <= G4(17);

    P5(18) <= P4(18);
    G5(18) <= G4(18);

    P5(19) <= P4(19);
    G5(19) <= G4(19);

    P5(20) <= P4(20);
    G5(20) <= G4(20);

    P5(21) <= P4(21);
    G5(21) <= G4(21);

    P5(22) <= P4(22);
    G5(22) <= G4(22);

    P5(23) <= P4(23);
    G5(23) <= G4(23);

    -- post processing:
    C(0) <= G5(0) or (C_IN and P5(0));
    C(1) <= G5(1) or (C(0) and P5(1));
    C(2) <= G5(2) or (C(1) and P5(2));
    C(3) <= G5(3) or (C(2) and P5(3));
    C(4) <= G5(4) or (C(3) and P5(4));
    C(5) <= G5(5) or (C(4) and P5(5));
    C(6) <= G5(6) or (C(5) and P5(6));
    C(7) <= G5(7) or (C(6) and P5(7));
    C(8) <= G5(8) or (C(7) and P5(8));
    C(9) <= G5(9) or (C(8) and P5(9));
    C(10) <= G5(10) or (C(9) and P5(10));
    C(11) <= G5(11) or (C(10) and P5(11));
    C(12) <= G5(12) or (C(11) and P5(12));
    C(13) <= G5(13) or (C(12) and P5(13));
    C(14) <= G5(14) or (C(13) and P5(14));
    C(15) <= G5(15) or (C(14) and P5(15));
    C(16) <= G5(16) or (C(15) and P5(16));
    C(17) <= G5(17) or (C(16) and P5(17));
    C(18) <= G5(18) or (C(17) and P5(18));
    C(19) <= G5(19) or (C(18) and P5(19));
    C(20) <= G5(20) or (C(19) and P5(20));
    C(21) <= G5(21) or (C(20) and P5(21));
    C(22) <= G5(22) or (C(21) and P5(22));
    C(23) <= G5(23) or (C(22) and P5(23));

    S(0) <= P0(0) xor C_IN;
    S(1) <= P0(1) xor C(0);
    S(2) <= P0(2) xor C(1);
    S(3) <= P0(3) xor C(2);
    S(4) <= P0(4) xor C(3);
    S(5) <= P0(5) xor C(4);
    S(6) <= P0(6) xor C(5);
    S(7) <= P0(7) xor C(6);
    S(8) <= P0(8) xor C(7);
    S(9) <= P0(9) xor C(8);
    S(10) <= P0(10) xor C(9);
    S(11) <= P0(11) xor C(10);
    S(12) <= P0(12) xor C(11);
    S(13) <= P0(13) xor C(12);
    S(14) <= P0(14) xor C(13);
    S(15) <= P0(15) xor C(14);
    S(16) <= P0(16) xor C(15);
    S(17) <= P0(17) xor C(16);
    S(18) <= P0(18) xor C(17);
    S(19) <= P0(19) xor C(18);
    S(20) <= P0(20) xor C(19);
    S(21) <= P0(21) xor C(20);
    S(22) <= P0(22) xor C(21);
    S(23) <= P0(23) xor C(22);

    SOMA_OUT <= S; 
    C_OUT <= C(23);

end behav;