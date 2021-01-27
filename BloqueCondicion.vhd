
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BloqueCondicion is
    Port(
        Q                      : in  STD_LOGIC_VECTOR(3 downto 0);
        EQ, NE, LT, LE, GT, GE : out STD_LOGIC
    );
end BloqueCondicion;

architecture Validar of BloqueCondicion is
signal Z,C : STD_LOGIC;
begin
    
    Z  <= Q(1);
    C  <= Q(0);
    EQ <= Z;
    NE <= NOT Z;
    LT <= NOT C;
    LE <= Z OR (NOT C);
    GT <= (NOT Z) AND C;
    GE <= C;

end Validar;
