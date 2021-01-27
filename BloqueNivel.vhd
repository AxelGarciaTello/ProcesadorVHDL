
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BloqueNivel is
    Port(
        clr, clk : in  STD_LOGIC;
        NA       : out STD_LOGIC
    );
end BloqueNivel;

architecture Calcular of BloqueNivel is
signal NCLK, PCLK : STD_LOGIC;
begin

    Alto: process(clk, clr)
    begin
        if (clr='1') then
            PCLK <= '0';
        elsif (rising_edge(clk)) then
            PCLK <= NOT PCLK;
        end if;
    end process;
    
    Bajo: process(clk, clr)
    begin
        if (clr='1') then
            NCLK <= '0';
        elsif (falling_edge(clk)) then
            NCLK <= NOT NCLK;
        end if;
    end process;
    
    NA <= NCLK XOR PCLK;

end Calcular;
