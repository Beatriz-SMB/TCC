library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity isa is
    port(
        OP: in std_logic_vector(4 downto 0);
        clk, rst: in std_logic;
        wrPC, wrIR, wrReg, rdMem, wrMem, muxAMem, muxPC, muxAReg, opULA: out std_logic;
		muxDReg: out std_logic_vector(1 downto 0)
    );
end isa;

architecture behav of isa is

    type estado is (RESET, BUSCA, DECODIFICA, LE_MEM, ESCREVE_REG_LDA, ESCREVE_REG_LDAi, LE_REG_STA, ESCREVE_MEM, LE_REG_OP, ULA_EXECUTA, ESCREVE_REG_OP, ESCREVE_PC);
    signal EA: estado; -- Estado Atual
    signal PE: estado; -- Próximo Estado

begin
    srincrono : process(clk, OP, rst, PE)
    begin
        if(rst = '1') then
            EA <= reset;
        elsif (rising_edge(clk)) then
            EA <= PE;
        end if;
    end process;

    combinaciona : process(EA, OP)
    begin
        wrPC <= '0';
        wrIR <= '0';
        wrReg <= '0';
        rdMem <= '0';
        wrMem <= '0';
        muxAMem <= '0';
        muxPC <= '0';
        muxAReg <= '0';
        muxDReg <= "00";
        opULA <= '0';
        case(EA) is
            when RESET => 
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '0';
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";
                opULA <= '0';
               
                PE <= BUSCA;
            when BUSCA =>
                wrPC <= '1';
                wrIR <= '1';
                -- wrReg <= '0'; --precisa?
                rdMem <= '1';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";
                -- opULA <= '0'; --precisa?

                PE <= DECODIFICA;
            when DECODIFICA =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '0'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";
                opULA <= '0';
                if(OP = "00001") then
                    PE <= LE_MEM;
                elsif(OP = "00010") then 
                    PE <= ESCREVE_REG_LDAi;
                elsif(OP = "00011") then 
                    PE <= LE_REG_STA;
                elsif((OP = "00100") or (OP = "00101") or (OP = "00110") or (OP = "00111") or (OP = "01000")) then 
                    PE <= LE_REG_OP;
                elsif((OP = "01001") or (OP = "01010") or (OP = "01011") or (OP = "01100") or (OP = "01101")) then 
                    PE <= ESCREVE_PC;
                end if;
            when LE_MEM =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '0';
                rdMem <= '1';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '0';
                muxDReg <= "01";
                opULA <= '0'; 
              
                PE <= ESCREVE_REG_LDA;
      
            when ESCREVE_REG_LDA =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '1'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '0';
                muxDReg <= "01";
                opULA <= '0'; 
                
                PE <= BUSCA;

            when ESCREVE_REG_LDAi =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '1'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '0';
                muxDReg <= "00";
                opULA <= '0';
                
                PE <= BUSCA;

            when LE_REG_STA =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '0'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '0';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";
                opULA <= '0';
                
                PE <= ESCREVE_MEM;
            
            when ESCREVE_MEM =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '0'; 
                rdMem <= '0';
                wrMem <= '1';
                muxAMem <= '0';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";
                opULA <= '0';
                
                PE <= BUSCA;

            when LE_REG_OP =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '0'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";
                opULA <= '0';
                
                PE <= ULA_EXECUTA;

            when ULA_EXECUTA =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '0'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";

                if(OP = "00101") then
                    opULA <= '1';
                else 
                    opULA <= '0';
                end if;
                
                PE <= ULA_EXECUTA;

            when ESCREVE_REG_OP =>
                wrPC <= '0';
                wrIR <= '0';
                wrReg <= '1'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '1';
                muxAReg <= '1';
                muxDReg <= "10";
                opULA <= '0';
                
                PE <= ULA_EXECUTA;
            
            when ESCREVE_PC =>
                wrPC <= '1';
                wrIR <= '0';
                wrReg <= '0'; 
                rdMem <= '0';
                wrMem <= '0';
                muxAMem <= '1';
                muxPC <= '0';
                muxAReg <= '1';
                muxDReg <= "10";
                opULA <= '0';
        end case;
    end process;
end behav;