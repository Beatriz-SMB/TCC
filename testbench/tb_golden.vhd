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
        Cin     : in std_logic;
        sum     : out std_logic_vector(3 downto 0);
        Cout    : out std_logic
    );
    end component;

    signal a, b : std_logic_vector(3 downto 0);
    signal cin : std_logic;
    signal sum : std_logic_vector(3 downto 0);
    signal cout : std_logic;

    signal dado : std_logic_vector(8 downto 0);

    file gold_file : text open write_mode is "golden_vectors.txt";

begin

    dut_inst : entity work.toplevel
        port map (
            A   => a,
            B   => b,
            Cin => cin,
            sum => sum,
            Cout => cout
        );

    process
        variable L : line;
    begin
        -- Cabeçalho
        write(L, string'("# Cin + A + B = Cout & Sum"));
        writeline(gold_file, L);

        for i in 0 to 511 loop
            dado <= std_logic_vector(to_unsigned(i, 9));
          
            wait for 1 ns;
            a <= dado(7 downto 4);
            b <= dado(3 downto 0);
            cin <= dado(8);
            wait for 1 ns;

            write(L, i);
            write(L, string'(" "));
            write(L, std_logic'image(cin)(2));
            write(L, string'(" "));
            write(L, string'("+"));
            write(L, string'(" "));
            write(L, to_integer(unsigned(a)));
            write(L, string'(" "));
            write(L, string'("+"));
            write(L, string'(" "));
            write(L, to_integer(unsigned(b)));
            write(L, string'(" "));
            write(L, string'("="));
            write(L, string'(" "));
            write(L, to_integer(unsigned(cout & sum)));

            writeline(gold_file, L);
        end loop;

        report "GOLDEN FILE GERADO COM SUCESSO" severity note;
        wait;
    end process;

end architecture;