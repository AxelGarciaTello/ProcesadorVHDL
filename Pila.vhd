

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use ieee.numeric_std.all;


entity Pila is
    generic (
		bDatos : integer := 16;
		tPila  : integer := 3
	);
	Port(
		clr, clk, wpc, up, dw : in  STD_LOGIC;
		pcin                  : in  STD_LOGIC_VECTOR(bDatos-1 downto 0);
		pcout                 : out STD_LOGIC_VECTOR(bDatos-1 downto 0)
	);
end Pila;

architecture Contar of Pila is
    type pila is array (0 to (2**tPila)-1) of std_logic_vector(bDatos-1 downto 0);
begin

    process(clk, clr)
		variable aux : pila;
		variable sp  : integer range 0 to (2**tPila)-1;
	begin
		if (clr = '1') then
			for i in 0 to (2**tPila)-1 loop
				aux(i) := (others => '0');
			end loop;
		elsif (rising_edge(clk)) then
			if (wpc='0' and up='0' and dw='0') then
				aux(sp) := aux(sp) + 1;
			elsif (wpc='1' and up='0' and dw='0') then
				aux(sp) := pcin;
			elsif (wpc='1' and up='1' and dw='0') then
				sp := sp + 1;
				aux(sp) := pcin;
			elsif (wpc='0' and up='0' and dw='1') then
				sp := sp - 1;
				aux(sp) := aux(sp) + 1;
			end if;
		end if;
		pcout <= aux(sp);
	end process;

end Contar;
