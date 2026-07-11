-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity LadnerFischer is
    Port ( 
        A_IN : in std_logic_vector(7 downto 0);
        B_IN : in std_logic_vector(7 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(7 downto 0);
        C_OUT : out std_logic
    );
end LadnerFischer;

-- architecture
architecture behav of LadnerFischer is

    -- pre processing: sinal por bit para G and P
    signal G, P : std_logic_vector(7 downto 0);

    -- stage 1: 
    signal G10, P10 : std_logic;
    signal G20, P20 : std_logic;
    signal G30, P30 : std_logic;
    signal G40, P40 : std_logic;
    signal G50, P50 : std_logic;
    signal G60, P60 : std_logic;
    signal G70, P70 : std_logic;

    signal G32, P32 : std_logic;
    signal G54, P54 : std_logic;
    signal G74, P74 : std_logic;
    signal G76, P76 : std_logic;

    -- post processing:
    signal C : std_logic_vector(7 downto 0);
    signal S : std_logic_vector(7 downto 0);

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

    -- stage 1:
    P32 <= P(3) and P(2);
    G32 <= (P(3) and G(2)) or G(3);

    P54 <= P(5) and P(4);
    G54 <= (P(5) and G(4)) or G(5);

    P76 <= P(7) and P(6);
    G76 <= (P(7) and G(6)) or G(7);

    -- stage 2:
    P74 <= P76 and P54;
    G74 <= (P76 and G54) or G76;

    -- stage 3:
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


    -- post processing:
    C(0) <= G(0) or (C_IN and P(0));
    C(1) <= G10 or (C(0) and P10);
    C(2) <= G20 or (C(1) and P20);
    C(3) <= G30 or (C(2) and P30);
    C(4) <= G40 or (C(3) and P40);
    C(5) <= G50 or (C(4) and P50);
    C(6) <= G60 or (C(5) and P60);
    C(7) <= G70 or (C(6) and P70);

    S(0) <= P(0) xor C_IN;
    S(1) <= P(1) xor C(0);
    S(2) <= P(2) xor C(1);
    S(3) <= P(3) xor C(2);
    S(4) <= P(4) xor C(3);
    S(5) <= P(5) xor C(4);
    S(6) <= P(6) xor C(5);
    S(7) <= P(7) xor C(6);

    SOMA_OUT <= S;
    C_OUT <= C(7);

end behav;