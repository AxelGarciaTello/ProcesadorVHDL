
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistroBanderas is
    Port(
        clr, clk, LF : in  STD_LOGIC;
        OV, N, Z, C  : in  STD_LOGIC;
        Q            : out STD_LOGIC_VECTOR(3 downto 0)
    );
end RegistroBanderas;

architecture Registrar of RegistroBanderas is
signal banderas : STD_LOGIC_VECTOR(3 downto 0);
begin

    process(clr, clk, banderas)
    begin
        if (clr='1') then
            banderas <= (OTHERS => '0');
        elsif (falling_edge(clk)) then
            if (LF='1') then
                banderas(0) <= C;
                banderas(1) <= Z;
                banderas(2) <= N;
                banderas(3) <= OV;
            end if;
        end if;
        Q <= banderas;
    end process;

end Registrar;
