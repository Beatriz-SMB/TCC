library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity bin2bcd is
    Port ( binario_entrada :   in  STD_LOGIC_VECTOR(7 downto 0); 
           bcd_saida :     out STD_LOGIC_VECTOR(11 downto 0));
end bin2bcd;

architecture behavior of bin2bcd is
    signal contador :  integer range 0 to 8 := 0;

begin
    process( binario_entrada)
        variable bcd : STD_LOGIC_VECTOR(11 downto 0);
        variable binario : STD_LOGIC_VECTOR(7 downto 0);
    begin

        binario := binario_entrada;
        bcd := (others => '0');

        -- Iteração 1
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';

        -- Iteração 2
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';

        -- Iteração 3
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';

        -- Iteração 4
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';

        -- Iteração 5
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';

        -- Iteração 6
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';

        -- Iteração 7
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';

        -- Iteração 8
        if bcd(3 downto 0) >= "0101" then
            bcd(3 downto 0) := bcd(3 downto 0) + "0011";
        end if;
        if bcd(7 downto 4) >= "0101" then
            bcd(7 downto 4) := bcd(7 downto 4) + "0011";
        end if;
        if bcd(11 downto 8) >= "0101" then
            bcd(11 downto 8) := bcd(11 downto 8) + "0011";
        end if;
        bcd := bcd(10 downto 0) & binario(7);
        binario := binario(6 downto 0) & '0';


        bcd_saida <= bcd;
    end process;
end behavior;