-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity LadnerFischer is
    Port ( 
        A_IN : in std_logic_vector(15 downto 0);
        B_IN : in std_logic_vector(15 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(15 downto 0);
        C_OUT : out std_logic
    );
end LadnerFischer;

-- architecture
architecture behav of LadnerFischer is

    -- pre processing: sinal por bit para G and P
    signal G, P : std_logic_vector(15 downto 0);

    -- stage 1: 
    signal G10, P10 : std_logic;
    signal G20, P20 : std_logic;
    signal G30, P30 : std_logic;
    signal G40, P40 : std_logic;
    signal G50, P50 : std_logic;
    signal G60, P60 : std_logic;
    signal G70, P70 : std_logic;
    signal G80, P80 : std_logic;
    signal G90, P90 : std_logic;
    signal G100, P100 : std_logic;
    signal G110, P110 : std_logic;
    signal G120, P120 : std_logic;
    signal G130, P130 : std_logic;
    signal G140, P140 : std_logic;
    signal G150, P150 : std_logic;

    signal G32, P32 : std_logic;
    signal G54, P54 : std_logic;
    signal G74, P74 : std_logic;
    signal G76, P76 : std_logic;
    signal G98, P98 : std_logic;
    signal G1108, P1108 : std_logic;
    signal G1110, P1110 : std_logic;
    signal G1308, P1308 : std_logic;
    signal G1312, P1312 : std_logic;
    signal G1508, P1508 : std_logic;
    signal G1512, P1512 : std_logic;
    signal G1514, P1514 : std_logic;

    -- post processing:
    signal C : std_logic_vector(15 downto 0);
    signal S : std_logic_vector(15 downto 0);

begin
    -- pre processing:
    P(0) <= A_IN(0) xor B_IN(0);
    G(0) <= A_IN(0) and B_IN(0);

    P(1) <= A_IN(1) xor B_IN(1);
    G(1) <= A_IN(1) and B_IN(1);
    
    P(2) <= A_IN(2) xor B_IN(2);
    G(2) <= A_IN(2) and B_IN(2);

    P(3) <= A_IN(3) xor B_IN(3);
    G(3) <= A_IN(3) and B_IN(3);

    P(4) <= A_IN(4) xor B_IN(4);
    G(4) <= A_IN(4) and B_IN(4);

    P(5) <= A_IN(5) xor B_IN(5);
    G(5) <= A_IN(5) and B_IN(5);

    P(6) <= A_IN(6) xor B_IN(6);
    G(6) <= A_IN(6) and B_IN(6);

    P(7) <= A_IN(7) xor B_IN(7);
    G(7) <= A_IN(7) and B_IN(7);

    P(8) <= A_IN(8) xor B_IN(8);
    G(8) <= A_IN(8) and B_IN(8);

    P(9) <= A_IN(9) xor B_IN(9);
    G(9) <= A_IN(9) and B_IN(9);

    P(10) <= A_IN(10) xor B_IN(10);
    G(10) <= A_IN(10) and B_IN(10);

    P(11) <= A_IN(11) xor B_IN(11);
    G(11) <= A_IN(11) and B_IN(11);

    P(12) <= A_IN(12) xor B_IN(12);
    G(12) <= A_IN(12) and B_IN(12);

    P(13) <= A_IN(13) xor B_IN(13); 
    G(13) <= A_IN(13) and B_IN(13);

    P(14) <= A_IN(14) xor B_IN(14);
    G(14) <= A_IN(14) and B_IN(14);

    P(15) <= A_IN(15) xor B_IN(15);
    G(15) <= A_IN(15) and B_IN(15);

    -- stage 1:
    P32 <= P(3) and P(2);
    G32 <= (P(3) and G(2)) or G(3);

    P54 <= P(5) and P(4);
    G54 <= (P(5) and G(4)) or G(5);

    P76 <= P(7) and P(6);
    G76 <= (P(7) and G(6)) or G(7);

    P98 <= P(9) and P(8);
    G98 <= (P(9) and G(8)) or G(9);

    P1110 <= P(11) and P(10);
    G1110 <= (P(11) and G(10)) or G(11);

    P1312 <= P(13) and P(12);
    G1312 <= (P(13) and G(12)) or G(13);

    P1514 <= P(15) and P(14);
    G1514 <= (P(15) and G(14)) or G(15);

    -- stage 2:
    P74 <= P76 and P54;
    G74 <= (P76 and G54) or G76;

    P1108 <= P1110 and P98;
    G1108 <= (P1110 and G98) or G1110;

    P1512 <= P1514 and P1312;
    G1512 <= (P1514 and G1312) or G1514;

    -- stage 3:
    P1308 <= P1312 and P1108;
    G1308 <= (P1312 and G1108) or G1312;

    P1508 <= P1512 and P1108;
    G1508 <= (P1512 and G1108) or G1512;

    -- stage 4:
    P10 <= P(1) and P(0);
    G10 <= (P(1) and G(0)) or G(1);

    P20 <= P(2) and P10;
    G20 <= (P(2) and G10) or G(2);

    P30 <= P32 and P10;
    G30 <= (P32 and G10) or G32;

    P40 <= P(4) and P30;
    G40 <= (P(4) and G30) or G(4);

    P50 <= P54 and P30;
    G50 <= (P54 and G30) or G54;

    P60 <= P(6) and P50;
    G60 <= (P(6) and G50) or G(6);

    P70 <= P74 and P30;
    G70 <= (P74 and G30) or G74;

    P80 <= P(8) and P70;
    G80 <= (P(8) and G70) or G(8);

    P90 <= P(9) and P70;
    G90 <= (P(9) and G70) or G98;

    P100 <= P(10) and P90;
    G100 <= (P(10) and G90) or G(10);

    P110 <= P(11) and P70;
    G110 <= (P(11) and G70) or G1108;

    P120 <= P(12) and P110;
    G120 <= (P(12) and G110) or G(12);

    P130 <= P(13) and P70;
    G130 <= (P(13) and G70) or G1308;

    P140 <= P(14) and P130;
    G140 <= (P(14) and G130) or G(14);

    P150 <= P(15) and P70;
    G150 <= (P(15) and G70) or G1508;

    -- post processing:
    C(0) <= G(0) or (C_IN and P(0));
    C(1) <= G10 or (C(0) and P10);
    C(2) <= G20 or (C(1) and P20);
    C(3) <= G30 or (C(2) and P30);
    C(4) <= G40 or (C(3) and P40);
    C(5) <= G50 or (C(4) and P50);
    C(6) <= G60 or (C(5) and P60);
    C(7) <= G70 or (C(6) and P70);
    C(8) <= G80 or (C(7) and P80);
    C(9) <= G90 or (C(8) and P90);
    C(10) <= G100 or (C(9) and P100);
    C(11) <= G110 or (C(10) and P110);
    C(12) <= G120 or (C(11) and P120);
    C(13) <= G130 or (C(12) and P130);
    C(14) <= G140 or (C(13) and P140);
    C(15) <= G150 or (C(14) and P150);

    S(0) <= P(0) xor C_IN;
    S(1) <= P(1) xor C(0);
    S(2) <= P(2) xor C(1);
    S(3) <= P(3) xor C(2);
    S(4) <= P(4) xor C(3);
    S(5) <= P(5) xor C(4);
    S(6) <= P(6) xor C(5);
    S(7) <= P(7) xor C(6);
    S(8) <= P(8) xor C(7);
    S(9) <= P(9) xor C(8);
    S(10) <= P(10) xor C(9);
    S(11) <= P(11) xor C(10);
    S(12) <= P(12) xor C(11);
    S(13) <= P(13) xor C(12);
    S(14) <= P(14) xor C(13);
    S(15) <= P(15) xor C(14);

    SOMA_OUT <= S;
    C_OUT <= C(15);

end behav;