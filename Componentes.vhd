
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Componentes is

    component MfunCode is
        Port(
            funCode : in  STD_LOGIC_VECTOR(3  downto 0);
            MicroR  : out STD_LOGIC_VECTOR(19 downto 0)
        );
    end component;
    
    component MopCode is
        Port(
            opCode : in  STD_LOGIC_VECTOR(4  downto 0);
            Micro  : out STD_LOGIC_VECTOR(19 downto 0)
        );
    end component;
    
    component DecodificadorInstruccion is
        Port(
            opCode                                       : in  STD_LOGIC_VECTOR(4 downto 0);
            TipoR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI : out STD_LOGIC
        );
    end component;
    
    component UCCentral is
        Port(
            clr, clk, TipoR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI, NA, EQ, NE, LT, LE, GT, GE : in  STD_LOGIC;
            SDOPC, SM                                                                          : out STD_LOGIC
        );
    end component;
    
    component BloqueNivel is
        Port(
            clr, clk : in  STD_LOGIC;
            NA       : out STD_LOGIC
        );
    end component;
    
    component BloqueCondicion is
        Port(
            Q                      : in  STD_LOGIC_VECTOR(3 downto 0);
            EQ, NE, LT, LE, GT, GE : out STD_LOGIC
        );
    end component;
    
    component RegistroBanderas is
        Port(
            clr, clk, LF : in  STD_LOGIC;
            OV, N, Z, C  : in  STD_LOGIC;
            Q            : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
end package;
