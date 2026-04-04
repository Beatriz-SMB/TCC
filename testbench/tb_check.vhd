library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_check is
end entity;

architecture sim of tb_check is

    signal a, b : std_logic_vector(3 downto 0);
    signal cin : std_logic;
    signal sum : std_logic_vector(3 downto 0);
    signal cout : std_logic;

    signal dado : std_logic_vector(8 downto 0);


    file gold_file : text open read_mode is "gold/golden_vectors.txt";
    file log_file : text open write_mode is "gold/sim_log.txt";

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
        variable L, L_log : line;
        variable v_dado : integer;

        variable v_A, v_B : integer;
        variable v_Cin    : integer;
        variable v_Sum    : integer;
        variable v_Cout   : integer;

        variable sum_out  : integer;
        variable cout_out : integer;

        variable error_count : integer := 0;
        variable total_count : integer := 0;
    begin
        -- Pula cabeçalho
        readline(gold_file, L);

        write(L_log, string'("LOG DE SIMULACAO - RCA"));
        writeline(log_file, L_log);


        write(L_log, string'("-------------------------------------"));
        writeline(log_file, L_log);


        while not endfile(gold_file) loop
            readline(gold_file, L);
            read(L, v_dado);
            read(L, v_A);
            read(L, v_B);
            read(L, v_Cin);
            read(L, v_Sum);
            read(L, v_Cout);

            -- aplica estímulos
            A   <= std_logic_vector(to_unsigned(v_A, 4));
            B   <= std_logic_vector(to_unsigned(v_B, 4));
            Cin <= std_logic'val(v_Cin);

            total_count := total_count + 1;
            wait for 1 ns;
            
            -- captura saídas
            sum_out  := to_integer(unsigned(Sum));
            cout_out := to_integer(unsigned(Cout));

           
        end loop;

        report "--------------------------------" severity note;
        report "TOTAL TESTES: " & integer'image(total_count) severity note;
        report "TOTAL ERROS:  " & integer'image(error_count) severity note;

        if error_count = 0 then
            report "RCA PASSOU EM TODOS OS TESTES ✅" severity note;
        else
            report "RCA FALHOU NOS TESTES ❌" severity failure;
        end if;

        wait;
    end process;

end architecture;
