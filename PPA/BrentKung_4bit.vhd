-- library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- entity
entity BrentKung_4bit is
    Port ( 
        A_IN : in std_logic_vector(3 downto 0);
        B_IN : in std_logic_vector(3 downto 0);
        C_IN : in std_logic;
        SOMA_OUT : out std_logic_vector(3 downto 0);
        C_OUT : out std_logic
    );
end BrentKung_4bit;

-- architecture
architecture behav of BrentKung_4bit is

    -- stage 0: sinal por bit para G and P
    signal G, P : std_logic_vector(3 downto 0);

    -- stage 1: (combina os vizinhos) 
    signal G10, P10 : std_logic;
    signal G20, P20 : std_logic;
    signal G30, P30 : std_logic;
    signal G32, P32 : std_logic;

    -- stage 2:
    signal C : std_logic_vector(3 downto 0);

    -- stage 3:
    signal S : std_logic_vector(3 downto 0);

begin
    -- stage 0:
    P(0) <= A_IN(0) xor B_IN(0);
    G(0) <= A_IN(0) and B_IN(0);

    P(1) <= A_IN(1) xor B_IN(1);
    G(1) <= A_IN(1) and B_IN(1);
    
    P(2) <= A_IN(2) xor B_IN(2);
    G(2) <= A_IN(2) and B_IN(2);

    P(3) <= A_IN(3) xor B_IN(3);
    G(3) <= A_IN(3) and B_IN(3);

    -- stage 1:
    P10 <= P(1) and P(0);
    G10 <= (P(1) and G(0)) or G(1);

    P32 <= P(3) and P(2);
    G32 <= (P(3) and G(2)) or G(3);

    P20 <= P(2) and P10;
    G20 <= (P(2) and G(1)) or G10;

    P30 <= P32 and P10;
    G30 <= (P32 and G10) or G32;

    
    -- stage 3:

    C(0) <= G(0) or (C_IN and P(0));
    C(1) <= G10 or (C(0) and P10);
    C(2) <= G20 or (C(1) and P20);
    C(3) <= G30 or (C(2) and P30);
    
    S(0) <= P(0) xor C_IN;
    S(1) <= P(1) xor C(0);
    S(2) <= P(2) xor C(1);
    S(3) <= P(3) xor C(2);

    SOMA_OUT <= S;
    C_OUT <= C(3);
 
end behav;