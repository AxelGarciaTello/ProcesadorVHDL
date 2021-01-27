
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    port(
        a, b, selA, selB, Cin : in std_logic;
        Co, res : out std_logic;
        op : in std_logic_vector(1 downto 0)
    );
end ALU;

architecture Calcular of ALU is
signal auxA    : std_logic;
signal auxB    : std_logic;
signal auxAnd  : std_logic;
signal auxOr   : std_logic;
signal auxXor  : std_logic;
signal auxSuma : std_logic;
begin

    auxA <= a xor selA;
    auxB <= b xor selB;
    
    auxAnd <= auxA and auxB;
    auxOr  <= auxA or  auxB;
    auxXor <= auxA xor auxB;
    
    auxSuma <= auxA xor auxB xor Cin;
    Co <= (auxA and Cin) or (auxB and Cin) or (auxA and auxB);
    
    res <= auxAnd when op = "00" else
           auxOr  when op = "01" else
           auxXor when op = "10" else
           auxSuma;

end Calcular;
