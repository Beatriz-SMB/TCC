library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity tb_test is
end entity;

architecture sim of tb_test is
   
    -- Saídas do DUT correto
    signal A_ref : std_logic_vector(15 downto 0);
    signal B_ref : std_logic_vector(15 downto 0);
    signal Cin_ref : std_logic_vector(0 downto 0);
    signal Result_ref : std_logic_vector(15 downto 0);
    signal Cout_ref : std_logic;

    -- Saídas do DUT sob teste
    signal A_test, B_test: std_logic_vector(15 downto 0);
    signal Cin_test, Cout_test : std_logic;
    signal Sum_test: std_logic_vector(15 downto 0);

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
    begin
        ---------------------------------------------------------------
        -- Caso 1: Adicao Basica (1 + 1)
        ---------------------------------------------------------------
        A_ref   <= std_logic_vector(to_unsigned(1, 16));
        B_ref   <= std_logic_vector(to_unsigned(1, 16));
        Cin_ref <= (others => '0');

        wait for 1 ns;

        A_test <= std_logic_vector(to_unsigned(1, 16));
        B_test <= std_logic_vector(to_unsigned(1, 16));
        Cin_test <= '0';

        wait for 1 ns;
        -- Verificações
        report "Adicao Basica" severity note;
        assert Cout_test = Cout_ref
            report "ERRO Cout | esperado=" & std_logic'image(Cout_ref) & " obtido=" & std_logic'image(Cout_test)
            severity failure;

        assert Sum_test = Result_ref
            report "ERRO Sum | esperado=" & integer'image(to_integer(unsigned(Result_ref))) & " obtido=" & integer'image(to_integer(unsigned(Sum_test)))
            severity failure;

        ---------------------------------------------------------------
        -- Caso 2: Tratamento de Overflow (65535 + 1)
        ---------------------------------------------------------------
        A_ref   <= std_logic_vector(to_unsigned(65535, 16));
        B_ref   <= std_logic_vector(to_unsigned(1, 16));
        Cin_ref <= (others => '0');

        wait for 1 ns;

        A_test <= std_logic_vector(to_unsigned(65535, 16));
        B_test <= std_logic_vector(to_unsigned(1, 16));
        Cin_test <= '0';

        wait for 1 ns;
        -- Verificações
        report "Tratamento de Overflow" severity note;
        assert Cout_test = Cout_ref
            report "ERRO Cout | esperado=" & std_logic'image(Cout_ref) & " obtido=" & std_logic'image(Cout_test)
            severity failure;

        assert Sum_test = Result_ref
            report "ERRO Sum | esperado=" & integer'image(to_integer(unsigned(Result_ref))) & " obtido=" & integer'image(to_integer(unsigned(Sum_test)))
            severity failure;

        ---------------------------------------------------------------
        -- Caso 3: Propagacao de Carry (32768 + 32768)
        ---------------------------------------------------------------
        A_ref   <= std_logic_vector(to_unsigned(32768, 16));
        B_ref   <= std_logic_vector(to_unsigned(32768, 16));
        Cin_ref <= (others => '0');

        wait for 1 ns;

        A_test <= std_logic_vector(to_unsigned(32768, 16));
        B_test <= std_logic_vector(to_unsigned(32768, 16));
        Cin_test <= '0';

        wait for 1 ns;
        -- Verificações
        report "Propagacao de Carry" severity note;
        assert Cout_test = Cout_ref
            report "ERRO Cout | esperado=" & std_logic'image(Cout_ref) & " obtido=" & std_logic'image(Cout_test)
            severity failure;

        assert Sum_test = Result_ref
            report "ERRO Sum | esperado=" & integer'image(to_integer(unsigned(Result_ref))) & " obtido=" & integer'image(to_integer(unsigned(Sum_test)))
            severity failure;

        ---------------------------------------------------------------
        -- Caso 4: Adicao com Zero (0 + 0)
        ---------------------------------------------------------------
        A_ref   <= std_logic_vector(to_unsigned(0, 16));
        B_ref   <= std_logic_vector(to_unsigned(0, 16));
        Cin_ref <= (others => '0');

        wait for 1 ns;

        A_test <= std_logic_vector(to_unsigned(0, 16));
        B_test <= std_logic_vector(to_unsigned(0, 16));
        Cin_test <= '0';

        wait for 1 ns;
        -- Verificações
        report "Adicao com Zero" severity note;
        assert Cout_test = Cout_ref
            report "ERRO Cout | esperado=" & std_logic'image(Cout_ref) & " obtido=" & std_logic'image(Cout_test)
            severity failure;

        assert Sum_test = Result_ref
            report "ERRO Sum | esperado=" & integer'image(to_integer(unsigned(Result_ref))) & " obtido=" & integer'image(to_integer(unsigned(Sum_test)))
            severity failure;

        ---------------------------------------------------------------
        -- Caso 5: Valores Aleatorios (10 + 20)
        ---------------------------------------------------------------

        ---------------------------------------------------------------
        -- Caso 6: Efeito do Carry-in (15 + 1 + Cin)
        ---------------------------------------------------------------
        A_ref   <= std_logic_vector(to_unsigned(15, 16));
        B_ref   <= std_logic_vector(to_unsigned(1, 16));
        Cin_ref <= (others => '1');

        wait for 1 ns;

        A_test <= std_logic_vector(to_unsigned(15, 16));
        B_test <= std_logic_vector(to_unsigned(1, 16));
        Cin_test <= '1';

        wait for 1 ns;
        -- Verificações
        report "Efeito do Carry-in" severity note;
        assert Cout_test = Cout_ref
            report "ERRO Cout | esperado=" & std_logic'image(Cout_ref) & " obtido=" & std_logic'image(Cout_test)
            severity failure;

        assert Sum_test = Result_ref
            report "ERRO Sum | esperado=" & integer'image(to_integer(unsigned(Result_ref))) & " obtido=" & integer'image(to_integer(unsigned(Sum_test)))
            severity failure;

        ------------------------------------------------------------------
        -- Fim do teste
        ------------------------------------------------------------------
        report "============================================" severity note;
        report "TODOS OS TESTES EXECUTADOS" severity note;
        report "============================================" severity note;

        wait;
    end process;

end architecture;