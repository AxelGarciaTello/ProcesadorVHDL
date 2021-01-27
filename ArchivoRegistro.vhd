
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ArchivoRegistro is
    Port(
        wr, she, dir, clk, clr              : in  STD_LOGIC;
        writeReg, readReg1, readReg2, shamt : in  STD_LOGIC_VECTOR(3 downto 0);
        writeData                           : in  STD_LOGIC_VECTOR(15 downto 0);
        readData1, readData2                : out STD_LOGIC_VECTOR(15 downto 0)
    );
end ArchivoRegistro;

architecture Calcular of ArchivoRegistro is
    type banco is array (0 to 15) of std_logic_vector(15 downto 0);
    signal registros : banco;
begin

    process(clk, clr, readReg1, readReg2, dir, registros)
        variable aux  : bit_vector(15 downto 0);
        variable auxq : std_logic_vector(15 downto 0);
    begin
        
        if( clr = '1' ) then
            for i in 0 to 15 loop
                registros(i) <= (others => '0');
            end loop;
        elsif ( rising_edge(clk) ) then
            if( wr = '1' and she = '0' ) then
                registros(conv_integer(writeReg)) <= writeData;
            elsif ( wr = '1' and she = '1' ) then
                if ( dir= '0' ) then
                    auxq := registros(conv_integer(readReg1));
                    aux  := to_bitvector(auxq);
                    aux  := aux srl conv_integer(shamt);
                    auxq := to_stdlogicvector(aux);
                    registros(conv_integer(writeReg)) <= auxq;
                elsif ( dir = '1' ) then
                    auxq := registros(conv_integer(readReg1));
                    aux  := to_bitvector(auxq);
                    aux  := aux sll conv_integer(shamt);
                    auxq := to_stdlogicvector(aux);
                    registros(conv_integer(writeReg)) <= auxq;
                end if;
            end if;
        end if;
        readData1 <= registros(conv_integer(readReg1));
        readData2 <= registros(conv_integer(readReg2));
    end process;

end Calcular;
