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

    file gold_file : text open read_mode is "resultado.txt";
    file log_file : text open write_mode is "conditional.txt";

begin

    dut_inst : entity work.top
        port map (
            A => a,
            B => b,
            Cin => cin,
            sum => sum,
            Cout => cout
        );

    process
        variable L, L_Log : line;
        -- file output
        variable file_index : integer;
        variable file_cin, file_a, file_b, file_cout, file_sum : integer;

        variable cin_out, a_out, b_out, sum_out, cout_out : integer;
	    variable error_count : integer := 0;
	    variable total_count : integer := 0;

    begin
        -- Pula cabeçalho
        readline(gold_file, L);

        write(L_Log, string'("LOG DE SIMULACAO - TB_CHECK"));
        writeline(log_file, L_Log);

        write(L_Log, string'("Formato: status | dado | cin + a + b = sum"));
        writeline(log_file, L_Log);

        write(L_Log, string'("-------------------------------------"));
        writeline(log_file, L_Log);



        while not endfile(gold_file) loop
            readline(gold_file, L);
            read(L, file_index);
            read(L, file_cin);
            read(L, file_a);
            read(L, file_b);
            read(L, file_cout);
            read(L, file_sum);

            -- dado <= std_logic_vector(to_unsigned(v_dado, 9));
            -- cin <= '1' when v_cin = 1 else '0';

            -- Stimulates the inputs of the adder
            cin <= std_logic(to_unsigned(file_cin, 1)(0));
            a <= std_logic_vector(to_unsigned(file_a, 4));
            b <= std_logic_vector(to_unsigned(file_b, 4));
	        total_count := total_count + 1;
            wait for 1 ns;
            
            cin_out := to_integer(unsigned'(0 => cin));
            a_out := to_integer(unsigned(a));
            b_out := to_integer(unsigned(b));
            sum_out := to_integer(unsigned(sum));
            cout_out := to_integer(unsigned'(0 => cout));

            if not (sum_out = to_integer(unsigned(std_logic_vector(to_unsigned(file_sum, 4)))) and
    		cin_out = to_integer(unsigned(std_logic_vector(to_unsigned(file_cin, 1)))) and
    		a_out = to_integer(unsigned(std_logic_vector(to_unsigned(file_a, 4)))) and
    		b_out = to_integer(unsigned(std_logic_vector(to_unsigned(file_b, 4)))) and
            cout_out = to_integer(unsigned(std_logic_vector(to_unsigned(file_cout, 1))))
			) then
    			error_count := error_count + 1;

                write(L_Log, string'("ERRO | indice="));
                write(L_Log, file_index);
                write(L_Log, string'(" | esperado=("));
                write(L_Log, file_cout); write(L_Log, string'(" , "));
                write(L_Log, file_sum); write(L_Log, string'(") obtido=("));
                write(L_Log, cin_out); write(L_Log, string'(" , "));
                write(L_Log, a_out); write(L_Log, string'(" , "));
                write(L_Log, b_out); write(L_Log, string'(" , "));
                write(L_Log, cout_out); write(L_Log, string'(" , "));
                write(L_Log, sum_out); write(L_Log, string'(")"));

                writeline(log_file, L_Log);
            end if;
        end loop;

        report "----------------------------------------" severity note;
	    report "TOTAL DE VETORES TESTADOS: " & integer'image(total_count) severity note;
	    report "TOTAL DE ERROS ENCONTRADOS: " & integer'image(error_count) severity note;


        write(L_Log, string'("------------------------------"));
        writeline(log_file, L_Log);

        write(L_Log, string'("TOTAL DE VETORES TESTADOS: "));
        write(L_Log, total_count);
        writeline(log_file, L_Log);

        write(L_Log, string'("TOTAL DE ERROS ENCONTRADOS: "));
        write(L_Log, error_count);
        writeline(log_file, L_Log);

	if error_count = 0 then
   		write(L_Log, string'("Projeto PASSOU no teste"));
        writeline(log_file, L_Log);

        report "RESULTADO FINAL: PROJETO DO ALUNO PASSOU NO TESTE"
        	severity failure;

	else
    	write(L_Log, string'("Projeto FALHOU no teste"));
        writeline(log_file, L_Log);
        report "RESULTADO FINAL: PROJETO DO ALUNO FALHOU NO TESTE"
        severity failure;

	end if;

        wait;
    end process;

end architecture;