
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MfunCode is
    Port(
        funCode : in  STD_LOGIC_VECTOR(3  downto 0);
        MicroR  : out STD_LOGIC_VECTOR(19 downto 0)
    );
end MfunCode;

architecture Mostrar of MfunCode is
type arreglo is array (0 to (2**4)-1) of std_logic_vector(19 downto 0);

constant ADD   : std_logic_vector(19 downto 0) := "00000100010000110011";
constant SUB   : std_logic_vector(19 downto 0) := "00000100010001110011";
constant IAND  : std_logic_vector(19 downto 0) := "00000100010000000011";
constant IOR   : std_logic_vector(19 downto 0) := "00000100010000010011";
constant IXOR  : std_logic_vector(19 downto 0) := "00000100010000100011";
constant INAND : std_logic_vector(19 downto 0) := "00000100010011010011";
constant INOR  : std_logic_vector(19 downto 0) := "00000100010011000011";
constant IXNOR : std_logic_vector(19 downto 0) := "00000100010001100011";
constant INOT  : std_logic_vector(19 downto 0) := "00000100010011010011";
constant ISLL  : std_logic_vector(19 downto 0) := "00000001110000000000";
constant ISRL  : std_logic_vector(19 downto 0) := "00000001010000000000";

constant memoria : arreglo :=(
    ADD,
    SUB,
    IAND,
    IOR,
    IXOR,
    INAND,
    INOR,
    IXNOR,
    INOT,
    ISLL,
    ISRL,
    OTHERS =>(OTHERS=>'0')
);
begin

    MicroR <= memoria(conv_integer(funCode));

end Mostrar;
