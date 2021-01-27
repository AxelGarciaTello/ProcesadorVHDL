
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ExtensorDireccion is
    Port(
        num : in  STD_LOGIC_VECTOR(11 downto 0);
        sd  : out STD_LOGIC_VECTOR(15 downto 0)
    );
end ExtensorDireccion;

architecture Extender of ExtensorDireccion is

begin

    sd(11 downto  0) <= num;
    sd(15 downto 12) <= (others => '0');

end Extender;
