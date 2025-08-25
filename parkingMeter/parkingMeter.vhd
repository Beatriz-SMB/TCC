library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity parkingMeter is
    port(
        twentyFiveCents, fiftyCents, oneHundredCents, confirm: in std_logic;
        clk, rst: in std_logic;
        overflowed: out std_logic;
        -- anodos: out std_logic_vector(3 downto 0);
		-- display: out std_logic_vector(7 downto 0);
        amount : out std_logic_vector(7 downto 0)
    );
end parkingMeter;

architecture behav of parkingMeter is

    type estado is (RESET, E0, E25, E50, E75, E100, E125, E150, E175, E200);
    signal EA: estado; -- Estado Atual
    signal PE: estado; -- Próximo Estado

    signal entry : std_logic_vector(1 downto 0);

begin
    srincrono : process(clk, twentyFiveCents, fiftyCents, oneHundredCents, confirm)
    begin
        if(rst = '1') then
            EA <= RESET;
        elsif (confirm = '1') then
            if (twentyFiveCents = '1') then
                entry <= "00"; -- 25 cents
            elsif (fiftyCents = '1') then
                entry <= "01"; -- 50 cents
            elsif (oneHundredCents = '1') then
                entry <= "10"; -- 100 cents
            end if;
            EA <= PE;
        end if;
    end process;

    combinacional : process(EA)
    begin
        case(EA) is
            when RESET => 
                PE <= E0;
            when E0 =>
                amount <= "00000000";
                if (entry = "00") then
                    PE <= E25;
                elsif (entry = "01") then
                    PE <= E50;
                elsif (entry = "10") then
                    PE <= E100;
                end if;
            when E25 =>
                amount <= "00011001";
                if (entry = "00") then
                    PE <= E50;
                elsif (entry = "01") then
                    PE <= E75;
                elsif (entry = "10") then
                    PE <= E125;
                end if;
            when E50 =>
                amount <= "00110010";
                if (entry = "00") then
                    PE <= E75;
                elsif (entry = "01") then
                    PE <= E100;
                elsif (entry = "10") then
                    PE <= E150;
                end if;
            when E75 =>
                amount <= "01001011";
                if (entry = "00") then
                    PE <= E100;
                elsif (entry = "01") then
                    PE <= E125;
                elsif (entry = "10") then
                    PE <= E175;
                end if;
            when E100 =>
                amount <= "01100100";
                if (entry = "00") then
                    PE <= E125;
                elsif (entry = "01") then
                    PE <= E150;
                elsif (entry = "10") then
                    PE <= E200;
                end if;
            when E125 =>
                amount <= "01111101";
                if (entry = "00") then
                    PE <= E150;
                elsif (entry = "01") then
                    PE <= E175;
                elsif (entry = "10") then
                    PE <= E200;
                end if;
            when E150 =>
                amount <= "10010110";
                if (entry = "00") then
                    PE <= E175;
                elsif (entry = "01" or entry = "10") then
                    PE <= E200;
                end if;
            when E175 =>
                amount <= "10101111";
                if (entry = "00" or entry = "01" or entry = "10") then
                    PE <= E200;
                end if;
            when E200 =>
                amount <= "11001000";
                overflowed <= '1';
            when others =>
                PE <= RESET;
        end case;
    end process;
end behav;