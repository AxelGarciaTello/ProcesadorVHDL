
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ExtensorSigno is
    Port(
        num : in  STD_LOGIC_VECTOR(11 downto 0);
        ss  : out STD_LOGIC_VECTOR(15 downto 0)
    );
end ExtensorSigno;

architecture Extender of ExtensorSigno is

begin

    ss(11 downto 0) <= num;
    et1: for i in 12 to 15 generate
        ss(i) <= num(11);
    end generate;

end Extender;
