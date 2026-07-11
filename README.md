# Passo a Passo: Desenvolvimento do Testbench

Este documento descreve o desenvolvimento de um testbench em VHDL dividido em dois arquivos:

- **`tb_golden.vhd`** – gera as respostas esperadas e as salva em um arquivo de referência.
- **`tb_check.vhd`** – lê o arquivo gerado pelo `tb_golden` e valida o dispositivo sob teste (DUT).

---

## `tb_golden.vhd`

### 1. Declaração do Componente

O primeiro passo é declarar o componente que representa o circuito correto — ou seja, aquele do qual temos certeza que gera as saídas esperadas. É ele quem servirá de referência para a geração dos vetores de teste:

```vhdl
component toplevel is
    port (
        A       : in std_logic_vector(3 downto 0);
        B       : in std_logic_vector(3 downto 0);
        Cin     : in std_logic_vector(0 downto 0);
        Result  : out std_logic_vector(3 downto 0);
        Cout    : out std_logic
    );
end component;
```

### 2. Declaração dos Sinais

Em seguida, são declarados os sinais internos que serão conectados ao componente, além de um sinal auxiliar `dado` de 9 bits que será usado para varrer todas as combinações de entrada:

```vhdl
signal a, b : std_logic_vector(3 downto 0);
signal cin  : std_logic_vector(0 downto 0);
signal result : std_logic_vector(3 downto 0);
signal cout : std_logic;

signal dado : std_logic_vector(8 downto 0);
```

> O sinal `dado` de 9 bits é conveniente pois a entrada total do circuito é composta por: 4 bits de `A` + 4 bits de `B` + 1 bit de `Cin` = **9 bits**, totalizando **512 combinações possíveis**.

### 3. Abertura do Arquivo de Saída

O arquivo `resultado.txt` é aberto em modo de escrita para armazenar os vetores de teste e os resultados esperados:

```vhdl
file gold_file : text open write_mode is "resultado.txt";
```

### 4. Instanciação do Componente (Port Map)

Os sinais internos são mapeados aos pinos do componente `toplevel`:

```vhdl
dut_inst : entity work.toplevel
    port map (
        A      => a,
        B      => b,
        Cin    => cin,
        Result => result,
        Cout   => cout
    );
```

### 5. Início do Process e Variável de Escrita

O processo principal é iniciado. Dentro dele, declara-se a variável `L` do tipo `line`, necessária para a escrita formatada no arquivo:

```vhdl
variable L : line;
```

### 6. Escrita do Cabeçalho

Antes de iniciar o loop, é escrito um cabeçalho no arquivo para facilitar a leitura posterior dos dados:

```vhdl
write(L, string'("# Cin  A  B  Cout  Sum"));
writeline(gold_file, L);
```

### 7. Loop de Varredura

Um loop de `0` a `511` é utilizado para iterar sobre todas as combinações possíveis de entrada:

```vhdl
for i in 0 to 511 loop
```

### 8. Atribuição dos Valores às Entradas

A cada iteração, o valor de `i` é convertido para `std_logic_vector` e distribuído entre os sinais de entrada do DUT:

```vhdl
dado <= std_logic_vector(to_unsigned(i, 9));

wait for 1 ns;
a   <= dado(7 downto 4);
b   <= dado(3 downto 0);
cin <= dado(8 downto 8);
wait for 1 ns;
```

> #### Por que usar `wait for 1 ns`?
>
> Em VHDL, a atribuição de sinais (`<=`) não é imediata — ela ocorre após um **delta cycle** (ciclo de simulação interno). O primeiro `wait for 1 ns` garante que `dado` seja atualizado antes de ser usado para atribuir `a`, `b` e `cin`. O segundo `wait for 1 ns` garante que o circuito (`toplevel`) tenha tempo de propagar os sinais e calcular `result` e `cout` antes de os valores serem lidos e gravados no arquivo.

### 9. Escrita dos Resultados no Arquivo

Após aguardar a estabilização dos sinais, o índice e os valores de cada sinal são escritos na linha atual:

```vhdl
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
```

### 10. Gravação da Linha no Arquivo

Após compor todos os campos da linha, ela é gravada no arquivo com `writeline`:

```vhdl
writeline(gold_file, L);
```

### 11. Encerramento do Loop

```vhdl
end loop;
```

### 12. Mensagem de Conclusão

Ao final do processo, uma mensagem é exibida no simulador indicando que o arquivo foi gerado com sucesso:

```vhdl
report "RESULTADO GERADO COM SUCESSO" severity note;
```

### 13. Finalização do Process e da Arquitetura

O `wait` sem condição suspende o processo indefinidamente, evitando que o loop se repita. Em seguida, o processo e a arquitetura são encerrados:

```vhdl
wait;
end process;

end architecture;
```

---

## `tb_check.vhd`

### 1. Declaração dos Sinais

Assim como no `tb_golden`, são declarados os sinais que serão conectados ao DUT. Note que aqui `cin` é do tipo `std_logic` (e não `std_logic_vector`), refletindo a interface do dispositivo a ser testado:

```vhdl
signal a, b : std_logic_vector(3 downto 0);
signal cin  : std_logic;
signal sum  : std_logic_vector(3 downto 0);
signal cout : std_logic;

signal dado : std_logic_vector(8 downto 0);
```

### 2. Abertura dos Arquivos

Dois arquivos são declarados: um para **leitura** do arquivo gerado pelo `tb_golden`, e outro para **escrita** do log de validação:

```vhdl
file gold_file : text open read_mode is "resultado.txt";
file log_file  : text open write_mode is "rca.txt";
```

### 3. Instanciação do DUT

Aqui é instanciado o dispositivo que de fato queremos testar — o somador RCA:

```vhdl
-- Device Under Test : DUT
dut_rca : entity work.top
    port map (
        A    => a,
        B    => b,
        Cin  => cin,
        sum  => sum,
        Cout => cout
    );
```

### 4. Início do Process e Declaração das Variáveis

O processo é iniciado e as variáveis necessárias são declaradas: `L` e `L_Log` para leitura e escrita de linhas, variáveis para armazenar os valores lidos do arquivo, variáveis para armazenar as saídas do DUT, e contadores de erros e vetores testados:

```vhdl
variable L, L_Log : line;

variable file_index : integer;
variable file_cin, file_a, file_b, file_cout, file_sum : integer;

variable cin_out, a_out, b_out, sum_out, cout_out : integer;
variable error_count : integer := 0;
variable total_count : integer := 0;
```

### 5. Pular o Cabeçalho

A primeira linha do `resultado.txt` é o cabeçalho gerado pelo `tb_golden`. Ela é lida e descartada antes de iniciar o loop:

```vhdl
readline(gold_file, L);
```

### 6. Escrita do Cabeçalho do Log

As primeiras linhas do arquivo de log são escritas com informações sobre o formato dos dados:

```vhdl
write(L_Log, string'("LOG DE SIMULACAO - TB_CHECK"));
writeline(log_file, L_Log);

write(L_Log, string'("Formato: status | dado | cin + a + b = sum"));
writeline(log_file, L_Log);

write(L_Log, string'("-------------------------------------"));
writeline(log_file, L_Log);
```

### 7. Loop de Leitura e Validação

Um loop `while` percorre o arquivo de resultados linha a linha até o fim:

```vhdl
while not endfile(gold_file) loop
```

### 8. Leitura dos Valores do Arquivo

Cada linha é lida e seus campos são atribuídos às variáveis correspondentes:

```vhdl
readline(gold_file, L);
read(L, file_index);
read(L, file_cin);
read(L, file_a);
read(L, file_b);
read(L, file_cout);
read(L, file_sum);
```

### 9. Estímulo das Entradas do DUT

Os valores lidos são convertidos e aplicados às entradas do DUT. O `wait for 1 ns` garante que o circuito propague os sinais antes da leitura das saídas:

```vhdl
cin <= std_logic(to_unsigned(file_cin, 1)(0));
a   <= std_logic_vector(to_unsigned(file_a, 4));
b   <= std_logic_vector(to_unsigned(file_b, 4));
total_count := total_count + 1;
wait for 1 ns;
```

### 10. Leitura das Saídas do DUT

Após a propagação, os valores de saída do DUT são capturados em variáveis inteiras para facilitar a comparação:

```vhdl
cin_out  := to_integer(unsigned'(0 => cin));
a_out    := to_integer(unsigned(a));
b_out    := to_integer(unsigned(b));
sum_out  := to_integer(unsigned(sum));
cout_out := to_integer(unsigned'(0 => cout));
```

### 11. Validação e Registro de Erros

Os valores obtidos são comparados com os valores esperados. Caso haja divergência, o contador de erros é incrementado e o erro é registrado no arquivo de log com o índice da linha, o valor esperado e o valor obtido:

```vhdl
if not (sum_out  = to_integer(unsigned(std_logic_vector(to_unsigned(file_sum,  4)))) and
        cin_out  = to_integer(unsigned(std_logic_vector(to_unsigned(file_cin,  1)))) and
        a_out    = to_integer(unsigned(std_logic_vector(to_unsigned(file_a,    4)))) and
        b_out    = to_integer(unsigned(std_logic_vector(to_unsigned(file_b,    4)))) and
        cout_out = to_integer(unsigned(std_logic_vector(to_unsigned(file_cout, 1))))
       ) then
    error_count := error_count + 1;

    write(L_Log, string'("ERRO | indice="));
    write(L_Log, file_index);
    write(L_Log, string'(" | esperado=("));
    write(L_Log, file_cout); write(L_Log, string'(" , "));
    write(L_Log, file_sum);  write(L_Log, string'(") obtido=("));
    write(L_Log, cin_out);   write(L_Log, string'(" , "));
    write(L_Log, a_out);     write(L_Log, string'(" , "));
    write(L_Log, b_out);     write(L_Log, string'(" , "));
    write(L_Log, cout_out);  write(L_Log, string'(" , "));
    write(L_Log, sum_out);   write(L_Log, string'(")"));

    writeline(log_file, L_Log);
end if;

end loop;
```

### 12. Relatório de Resultados

Ao final do loop, os totais de vetores testados e erros encontrados são exibidos no simulador e gravados no arquivo de log:

```vhdl
report "----------------------------------------" severity note;
report "TOTAL DE VETORES TESTADOS: "  & integer'image(total_count) severity note;
report "TOTAL DE ERROS ENCONTRADOS: " & integer'image(error_count) severity note;
```

```vhdl
write(L_Log, string'("------------------------------"));
writeline(log_file, L_Log);

write(L_Log, string'("TOTAL DE VETORES TESTADOS: "));
write(L_Log, total_count);
writeline(log_file, L_Log);

write(L_Log, string'("TOTAL DE ERROS ENCONTRADOS: "));
write(L_Log, error_count);
writeline(log_file, L_Log);
```

### 13. Resultado Final

Por fim, é verificado se houve algum erro. O resultado (aprovado ou reprovado) é registrado no log e reportado no simulador com `severity failure`, o que encerra a simulação:

```vhdl
if error_count = 0 then
    write(L_Log, string'("Projeto PASSOU no teste"));
    writeline(log_file, L_Log);
    report "RESULTADO FINAL: PROJETO PASSOU NO TESTE" severity failure;
else
    write(L_Log, string'("Projeto FALHOU no teste"));
    writeline(log_file, L_Log);
    report "RESULTADO FINAL: PROJETO FALHOU NO TESTE" severity failure;
end if;
```
