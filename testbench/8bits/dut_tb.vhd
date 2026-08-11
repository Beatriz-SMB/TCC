library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity dut_tb is
end entity;

architecture sim of dut_tb is

    ------------------------------------------------------------------
    -- Sinais
    ------------------------------------------------------------------
    signal dado : std_logic_vector(16 downto 0);

    -- Saídas do DUT correto
    signal A_ref : std_logic_vector(7 downto 0);
    signal B_ref : std_logic_vector(7 downto 0);
    signal Cin_ref : std_logic_vector(0 downto 0);
    signal Result_ref : std_logic_vector(7 downto 0);
    signal Cout_ref : std_logic;

    -- Saídas do DUT sob teste
    signal A_test, B_test: std_logic_vector(7 downto 0);
    signal Cin_test, Cout_test : std_logic;
    signal Sum_test: std_logic_vector(7 downto 0);

begin
    ------------------------------------------------------------------
    -- Instância do DUT correto (golden model)
    ------------------------------------------------------------------
    dut_ref  : entity work.toplevel
        port map (
            A       => A_ref,
            B       => B_ref,
            Cin     => Cin_ref,
            Result  => Result_ref,
            Cout    => Cout_ref
        );

    ------------------------------------------------------------------
    -- Instância do DUT sob teste
    ------------------------------------------------------------------
    dut_test : entity work.top
        port map (
            A       => A_test,
            B       => B_test,
            Cin     => Cin_test,
            sum     => Sum_test,
            Cout    => Cout_test
        );

    ------------------------------------------------------------------
    -- Processo de estímulos e verificação
    ------------------------------------------------------------------
    check : process
        variable i : integer;
    begin
        -- Teste exaustivo: todos os valores de entrada
        for i in 0 to 131071 loop
            dado <= std_logic_vector(to_unsigned(i, 17));

            wait for 1 ns;
            A_ref <= dado(15 downto 8);
            B_ref <= dado(7 downto 0);
            Cin_ref <= dado(16 downto 16);

            A_test <= dado(15 downto 8);
            B_test <= dado(7 downto 0);
            Cin_test <= dado(16);
            wait for 1 ns;

            -- Verificações
            assert A_test = A_ref
                report "ERRO A | dado=" & integer'image(i)
                severity failure;

            assert B_test = B_ref
                report "ERRO B | dado=" & integer'image(i)
                severity failure;

            -- assert Cin_test = Cin_ref
            --     report "ERRO Cin | dado=" & integer'image(i)
            --     severity failure;

            assert Cout_test = Cout_ref
                report "ERRO Cout | dado=" & integer'image(i)
                severity failure;

            assert Sum_test = Result_ref
                report "ERRO Sum | dado=" & integer'image(i)
                severity failure;
        end loop;

        ------------------------------------------------------------------
        -- Fim do teste
        ------------------------------------------------------------------
        report "============================================" severity note;
        report "TESTE FINALIZADO COM SUCESSO (PASS)" severity note;
        report "============================================" severity note;

        wait;
    end process;

end architecture;