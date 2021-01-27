
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UnidadAritmeticaLogica is
    generic( X : INTEGER := 16);
    Port(
        a, b : in std_logic_vector(X-1 downto 0);
        ALUOP: in std_logic_vector(3 downto 0);
        s : inout std_logic_vector(X-1 downto 0);
        n, c, z, ov : out std_logic
    );
end UnidadAritmeticaLogica;

architecture Calcular of UnidadAritmeticaLogica is
component ALU is
    port(
        a, b, selA, selB, Cin : in std_logic;
        Co, res : out std_logic;
        op : in std_logic_vector(1 downto 0)
    );
end component;
signal acarreo : std_logic_vector(X downto 0);
signal auxC, auxOV : std_logic;
begin

    acarreo(0) <= ALUOP(2);
    ciclo: for i in 0 to X-1 generate
        u1: ALU
        Port map(
            a => a(i),
            b => b(i),
            selA => ALUOP(3),
            selB => ALUOP(2),
            op(0) => ALUOP(0),
            op(1) => ALUOP(1),
            Cin => acarreo(i),
            Co => acarreo(i+1),
            res => s(i)
        );
    end generate;
    
    n <= s(X-1);
    auxC <= acarreo(X);
    z <= '1' when s="0000" else
         '0';
    auxOV <= acarreo(X) xor acarreo(x-1);
    
    c <= auxC when (ALUOP(0)='1' and ALUOP(1)='1') else
         '0';
    ov <= auxOV when (ALUOP(0)='1' and ALUOP(1)='1') else
          '0';

end Calcular;
