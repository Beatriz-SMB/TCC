library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity controlador_7segmentos is
    Port (
        clock, reset        :   in std_logic;
        unidade             :   in std_logic_vector(3 downto 0);
        dezena              :   in std_logic_vector(3 downto 0);
        centena             :   in std_logic_vector(3 downto 0);
        milhar              :   in std_logic_vector(3 downto 0);
        controle_digito     :   out std_logic_vector(3 downto 0);
        digito_bcd          :   out std_logic_vector(6 downto 0) 
    );
end controlador_7segmentos;

architecture Behavioral of controlador_7segmentos is

    type estado is (U, D, C, M);    -- U - unidade, D - dezena, C - centena, M - milhar 
    signal estado_atual, proximo_estado : estado;
    
    constant ZERO  : std_logic_vector(6 downto 0) := "0000001"; 
    constant UM   : std_logic_vector(6 downto 0) := "1001111";
    constant DOIS   : std_logic_vector(6 downto 0) := "0010010";
    constant TRES : std_logic_vector(6 downto 0) := "0000110"; 
    constant QUATRO  : std_logic_vector(6 downto 0) := "1001100";
    constant CINCO  : std_logic_vector(6 downto 0) := "0100100"; 
    constant SEIS   : std_logic_vector(6 downto 0) := "0100000"; 
    constant SETE : std_logic_vector(6 downto 0) := "0001111"; 
    constant OITO : std_logic_vector(6 downto 0) := "0000000"; 
    constant NOVE  : std_logic_vector(6 downto 0) := "0000100"; 

    signal digito : std_logic_vector(3 downto 0) := "0000";
    signal clk_div : std_logic := '0';

begin

    process(clock)
    variable contador : integer := 0;
    begin
        if rising_edge(clock) then
            if contador = 50000 then 
                clk_div <= not clk_div;
                contador := 0;
            else 
                contador := contador + 1;
            end if;
        end if;
    end process;

    process(clk_div)
    begin
        if rising_edge(clk_div) then
            estado_atual <= proximo_estado;
        end if;
    end process;

    process(estado_atual)
    begin
        case estado_atual is
            when U =>
                digito <= unidade;
                controle_digito <= "1110";
                proximo_estado <= D;
            when D =>
                digito <= dezena;
                controle_digito <= "1101";
                proximo_estado <= C;
            when C =>
                digito <= centena;
                controle_digito <= "1011";
                proximo_estado <= M;
            when M =>
                digito <= milhar;
                controle_digito <= "0111";
                proximo_estado <= U;
            when others =>
                digito <= "0000";
                controle_digito <= "1111";
                proximo_estado <= U;
        end case;
    end process;

    process(digito)
    begin
        case digito is
            when "0000" => 
                digito_bcd <= ZERO;  -- 0
            when "0001" => 
                digito_bcd <= UM;   -- 1
            when "0010" => 
                digito_bcd <= DOIS;   -- 2
            when "0011" => 
                digito_bcd <= TRES; -- 3
            when "0100" => 
                digito_bcd <= QUATRO;  -- 4
            when "0101" => 
                digito_bcd <= CINCO;  -- 5
            when "0110" => 
                digito_bcd <= SEIS;   -- 6
            when "0111" => 
                digito_bcd <= SETE; -- 7
            when "1000" => 
                digito_bcd <= OITO; -- 8
            when "1001" => 
                digito_bcd <= NOVE;  -- 9
            when others => 
                digito_bcd <= "1111111"; 
        end case;
    end process;
end Behavioral;