# Simulação de Testbench no ModelSim

Este documento descreve o passo a passo para compilar e executar os testbenches no **ModelSim**, utilizando arquivos VHDL.

## Pré-requisitos

- ModelSim instalado e configurado no sistema
- Projeto organizado com a seguinte estrutura (exemplo):

```
TCC/
├── somadores/
│   └── *.vhd
└── testbench/
    └── tb_teste.vhd
```

## Passo a passo para rodar a simulação

### 1. Abrir o ModelSim
Abra o ModelSim e acesse o **Transcript** (terminal interno).

### 2. Navegar até a pasta do projeto
No Transcript, vá até o diretório onde está o projeto:

```tcl
cd "C:/Users/Beatriz/Desktop/TCC"
```

> Ajuste o caminho caso seu projeto esteja em outro local.

### 3. Compilar os arquivos VHDL do projeto
Compile todos os arquivos `.vhd` da pasta principal do projeto:

```tcl
vcom somadores/*.vhd
```

### 4. Compilar o testbench
Agora compile o arquivo de teste:

```tcl
vcom testbench/tb_teste.vhd
```

### 5. Iniciar a simulação
Inicie a simulação chamando a entidade do testbench:

```tcl
vsim -c work.tb_golden
```

> Certifique-se de que o nome da entidade do testbench está correto.

### 6. Rodar a simulação
Execute a simulação até o final:

```tcl
run -all
```

### 7. Finalizar a simulação
Após o término da simulação, finalize com:

```tcl
quit -sim
```

## Observações

- Se ocorrer erro de compilação, verifique a ordem dos arquivos e possíveis dependências.
- Para simulação com interface gráfica, remova a opção `-c` do comando `vsim`.
