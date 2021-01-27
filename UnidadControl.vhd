
library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.Componentes.ALL;

entity UnidadControl is
    Port(
        clr, clk, LF, OV, N, Z, C : in  STD_LOGIC;
        funCode                   : in  STD_LOGIC_VECTOR(3  downto 0);
        opCode                    : in  STD_LOGIC_VECTOR(4  downto 0);
        Microinstruccion          : out STD_LOGIC_VECTOR(19 downto 0)
    );
end UnidadControl;

architecture Controlar of UnidadControl is
    signal MicroR, Micro                                                                       : STD_LOGIC_VECTOR(19 downto 0);
    signal TipoR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI, NA, EQ, NE, LT, LE, GT, GE, SDOPC, SM : STD_LOGIC;
    signal Q                                                                                   : STD_LOGIC_VECTOR(3  downto 0);
    signal opCodeF                                                                             : STD_LOGIC_VECTOR(4  downto 0);
begin

    c1: MfunCode Port map(
        funCode => funCode,
        MicroR  => MicroR 
    );
    
    c2: MopCode Port map(
        opCode => opCodeF,
        Micro  => Micro
    );
    
    c3: DecodificadorInstruccion Port map(
        opCode => opCode,
        TipoR  => TipoR,
        BEQI   => BEQI,
        BNEQI  => BNEQI,
        BLTI   => BLTI,
        BLETI  => BLETI,
        BGTI   => BGTI,
        BGETI  => BGETI
    );
    
    c4: UCCentral Port map(
        clr   => clr,
        clk   => clk,
        TipoR => TipoR,
        BEQI  => BEQI,
        BNEQI => BNEQI,
        BLTI  => BLTI,
        BLETI => BLETI,
        BGTI  => BGTI,
        BGETI => BGETI,
        NA    => NA,
        EQ    => EQ,
        NE    => NE,
        LT    => LT,
        LE    => LE,
        GT    => GT,
        GE    => GE,
        SDOPC => SDOPC,
        SM    => SM
    );
    
    c5: BloqueNivel Port map(
        clr => clr,
        clk => clk,
        NA  => NA
    );
    
    c6: BloqueCondicion Port map(
        Q  => Q,
        EQ => EQ,
        NE => NE,
        LT => LT,
        LE => LE,
        GT => GT,
        GE => GE
    );
    
    c7: RegistroBanderas Port map(
        clr => clr,
        clk => clk,
        LF  => LF,
        OV  => OV,
        N   => N,
        Z   => Z,
        C   => C,
        Q   => Q
    );
    
    opCodeF <= opCode when (SDOPC = '1') else
               (OTHERS => '0');
               
    Microinstruccion <= MicroR when (SM = '0') else
                        Micro;

end Controlar;
