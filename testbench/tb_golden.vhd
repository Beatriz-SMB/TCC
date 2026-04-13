library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;


entity tb_golden is
end entity;

architecture sim of tb_golden is

    component toplevel is
    port (
        A       : in std_logic_vector(3 downto 0);
        B       : in std_logic_vector(3 downto 0);
        Cin     : in std_logic_vector(0 downto 0);
        Result  : out std_logic_vector(3 downto 0);
        Cout    : out std_logic
    );
    end component;

    signal a, b : std_logic_vector(3 downto 0);
    signal cin : std_logic_vector(0 downto 0);
    signal result : std_logic_vector(3 downto 0);
    signal cout : std_logic;

    signal dado : std_logic_vector(8 downto 0);

    file gold_file : text open write_mode is "resultado.txt";

begin

    -- Device Under Test : DUT
    dut_inst : entity work.toplevel
        port map (
            A   => a,
            B   => b,
            Cin => cin,
            Result => result,
            Cout => cout
        );

    process
        variable L : line;
    begin
        -- Cabeçalho
        write(L, string'("# Cin  A  B  Cout  Sum"));
        writeline(gold_file, L);

        for i in 0 to 511 loop
            dado <= std_logic_vector(to_unsigned(i, 9));
          
            wait for 1 ns;
            a <= dado(7 downto 4);
            b <= dado(3 downto 0);
            cin <= dado(8 downto 8);
            wait for 1 ns;

            write(L, i);
            write(L, string'(" "));
            write(L, to_integer(unsigned(cin)));

            write(L, string'(" "));
            write(L, to_integer(unsigned(a)));

            write(L, string'(" "));
            write(L, to_integer(unsigned(b)));

            write(L, string'(" "));
            write(L, to_integer(unsigned'(0 => cout)));

            write(L, string'(" "));
            write(L, to_integer(unsigned(result)));

            writeline(gold_file, L);
        end loop;

        report "RESULTADO GERADO COM SUCESSO" severity note;
        wait;
    end process;

end architecture;