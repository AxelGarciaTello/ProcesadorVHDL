
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MopCode is
    Port(
        opCode : in  STD_LOGIC_VECTOR(4  downto 0);
        Micro  : out STD_LOGIC_VECTOR(19 downto 0)
    );
end MopCode;

architecture Mostrar of MopCode is
type arreglo is array (0 to (2**5)-1) of std_logic_vector(19 downto 0);

constant VERIF : std_logic_vector(19 downto 0) := "00001000000001110001";
constant LI    : std_logic_vector(19 downto 0) := "00000000010000000000";
constant LWI   : std_logic_vector(19 downto 0) := "00000100010000001000";
constant LW    : std_logic_vector(19 downto 0) := "00000110010100110001";
constant SWI   : std_logic_vector(19 downto 0) := "00001000000000001100";
constant SW    : std_logic_vector(19 downto 0) := "00001010000100110101";
constant ADDI  : std_logic_vector(19 downto 0) := "00000100010100110011";
constant SUBI  : std_logic_vector(19 downto 0) := "00000100010101110011";
constant ANDI  : std_logic_vector(19 downto 0) := "00000100010100000011";
constant ORI   : std_logic_vector(19 downto 0) := "00000100010100010011";
constant XORI  : std_logic_vector(19 downto 0) := "00000100010100100011";
constant NANDI : std_logic_vector(19 downto 0) := "00000100010111010011";
constant NORI  : std_logic_vector(19 downto 0) := "00000100010111000011";
constant XNORI : std_logic_vector(19 downto 0) := "00000100010101100011";
constant BEQI  : std_logic_vector(19 downto 0) := "10010000001100110011";
constant BNEI  : std_logic_vector(19 downto 0) := "10010000001100110011";
constant BLTI  : std_logic_vector(19 downto 0) := "10010000001100110011";
constant BLETI : std_logic_vector(19 downto 0) := "10010000001100110011";
constant BGTI  : std_logic_vector(19 downto 0) := "10010000001100110011";
constant BGETI : std_logic_vector(19 downto 0) := "10010000001100110011";
constant B     : std_logic_vector(19 downto 0) := "00010000000000000000";
constant CALL  : std_logic_vector(19 downto 0) := "01010000000000000000";
constant RET   : std_logic_vector(19 downto 0) := "00100000000000000000";
constant NOP   : std_logic_vector(19 downto 0) := "00000000000000000000";

constant memoria : arreglo :=(
    VERIF,
    LI,
    LWI,
    SWI,
    SW,
    ADDI,
    SUBI,
    ANDI,
    ORI,
    XORI,
    NANDI,
    NORI,
    XNORI,
    BEQI,
    BNEI,
    BLTI,
    BLETI,
    BGTI,
    BGETI,
    B,
    CALL,
    RET,
    NOP,
    LW,
    OTHERS =>(OTHERS=>'0')
);
begin

    Micro <= memoria(conv_integer(opCode));

end Mostrar;
