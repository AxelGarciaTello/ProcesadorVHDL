
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MemoriaDato is
    generic (
        bDir : integer := 9;
        bDatos : integer := 16
    );
    Port(
        clk, WD : in  STD_LOGIC;
        dir     : in  STD_LOGIC_VECTOR( bDir-1 downto 0);
        dataIn  : in  STD_LOGIC_VECTOR( bDatos-1    downto 0);
        dataOut : out STD_LOGIC_VECTOR( bDatos-1    downto 0)
    );
end MemoriaDato;

architecture Administrar of MemoriaDato is
type arreglo is array (0 to (2**bDir)-1) of std_logic_vector(bDatos-1 downto 0);
signal memoria : arreglo;
begin

    process(clk, dir)
    begin
        if(rising_edge(clk)) then
            if (WD='1') then
                memoria(conv_integer(dir)) <= dataIn;
            end if;
        end if;
        dataOut <= memoria(conv_integer(dir));
    end process;

end Administrar;
