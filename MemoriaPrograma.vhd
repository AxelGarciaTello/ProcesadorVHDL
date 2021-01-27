
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity MemoriaPrograma is
    generic (
        bDir   : integer := 9;
        bDatos : integer := 25
    );
    Port(
        PC   : in  STD_LOGIC_VECTOR( bDir-1   downto 0);
        Inst : out STD_LOGIC_VECTOR( bDatos-1 downto 0)
    );
end MemoriaPrograma;

architecture mostrar of MemoriaPrograma is
type arreglo is array (0 to (2**bDir)-1) of std_logic_vector(bDatos-1 downto 0);
constant OPR    : std_logic_vector(4 downto 0) := "00000";
constant LI     : std_logic_vector(4 downto 0) := "00001";
constant LWI    : std_logic_vector(4 downto 0) := "00010";
constant LW     : std_logic_vector(4 downto 0) := "10111";
constant SWI    : std_logic_vector(4 downto 0) := "00011";
constant SW     : std_logic_vector(4 downto 0) := "00100";
constant ADDI   : std_logic_vector(4 downto 0) := "00101";
constant SUBI   : std_logic_vector(4 downto 0) := "00110";
constant ANDI   : std_logic_vector(4 downto 0) := "00111";
constant ORI    : std_logic_vector(4 downto 0) := "01000";
constant XORI   : std_logic_vector(4 downto 0) := "01001";
constant NANDI  : std_logic_vector(4 downto 0) := "01010";
constant NORI   : std_logic_vector(4 downto 0) := "01011";
constant XNORI  : std_logic_vector(4 downto 0) := "01100";
constant BEQI   : std_logic_vector(4 downto 0) := "01101";
constant BNEI   : std_logic_vector(4 downto 0) := "01110";
constant BLTI   : std_logic_vector(4 downto 0) := "01111";
constant BLETI  : std_logic_vector(4 downto 0) := "10000";
constant BGTI   : std_logic_vector(4 downto 0) := "10001";
constant BGETI  : std_logic_vector(4 downto 0) := "10010";
constant B      : std_logic_vector(4 downto 0) := "10011";
constant CALL   : std_logic_vector(4 downto 0) := "10100";
constant RET    : std_logic_vector(4 downto 0) := "10101";
constant NOP    : std_logic_vector(4 downto 0) := "10110";

constant ADD    : std_logic_vector(3 downto 0) := "0000";
constant SUB    : std_logic_vector(3 downto 0) := "0001";
constant OPAND  : std_logic_vector(3 downto 0) := "0010";
constant OPOR   : std_logic_vector(3 downto 0) := "0011";
constant OPXOR  : std_logic_vector(3 downto 0) := "0100";
constant OPNAND : std_logic_vector(3 downto 0) := "0101";
constant OPNOR  : std_logic_vector(3 downto 0) := "0110";
constant OPXNOR : std_logic_vector(3 downto 0) := "0111";
constant OPNOT  : std_logic_vector(3 downto 0) := "1000";
constant OPSLL  : std_logic_vector(3 downto 0) := "1001";
constant OPSRL  : std_logic_vector(3 downto 0) := "1010";

constant R0     : std_logic_vector(3 downto 0) := "0000";
constant R1     : std_logic_vector(3 downto 0) := "0001";
constant R2     : std_logic_vector(3 downto 0) := "0010";
constant R3     : std_logic_vector(3 downto 0) := "0011";
constant R4     : std_logic_vector(3 downto 0) := "0100";
constant R5     : std_logic_vector(3 downto 0) := "0101";
constant R6     : std_logic_vector(3 downto 0) := "0110";
constant R7     : std_logic_vector(3 downto 0) := "0111";
constant R8     : std_logic_vector(3 downto 0) := "1000";
constant R9     : std_logic_vector(3 downto 0) := "1001";
constant R10    : std_logic_vector(3 downto 0) := "1010";
constant R11    : std_logic_vector(3 downto 0) := "1011";
constant R12    : std_logic_vector(3 downto 0) := "1100";
constant R13    : std_logic_vector(3 downto 0) := "1101";
constant R14    : std_logic_vector(3 downto 0) := "1110";
constant R15    : std_logic_vector(3 downto 0) := "1111";

constant SU     : std_logic_vector(3 downto 0) := "0000";

constant memoria : arreglo :=(
    LI   & R0 & "0000" & "0000" & "0110" & "0100",
    LI   & R1 & "0000" & "0000" & "0000" & "0000",
    LI   & R2 & "0000" & "0000" & "0011" & "0010", 
    SUBI & R0 & R0     & "0000" & "0000" & "0010",
    SW   & R0 & R1     & "0000" & "0000" & "0000",
    ADDI & R1 & R1     & "0000" & "0000" & "0001",
    BLETI& R2 & R1     & "1111" & "1111" & "1101",
    NOP  & SU & SU     & SU     & SU     & SU,
    B    & SU & "0000" & "0000" & "0000" & "0111",
    OTHERS =>(OTHERS=>'0')
);
begin

    Inst <= memoria(conv_integer(PC));

end mostrar;
