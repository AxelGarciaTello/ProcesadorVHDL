
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package ComponentesProcesado is

    component Pila is
        Port(
            clr, clk, wpc, up, dw : in  STD_LOGIC;
            pcin                  : in  STD_LOGIC_VECTOR(15 downto 0);
            pcout                 : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component MemoriaPrograma is
        Port(
            PC   : in  STD_LOGIC_VECTOR( 8  downto 0);
            Inst : out STD_LOGIC_VECTOR( 24 downto 0)
        );
    end component;
    
    component ArchivoRegistro is
        Port(
            wr, she, dir, clk, clr              : in  STD_LOGIC;
            writeReg, readReg1, readReg2, shamt : in  STD_LOGIC_VECTOR(3 downto 0);
            writeData                           : in  STD_LOGIC_VECTOR(15 downto 0);
            readData1, readData2                : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
    component UnidadAritmeticaLogica is
        Port(
            a, b : in std_logic_vector(15 downto 0);
            ALUOP: in std_logic_vector(3  downto 0);
            s : inout std_logic_vector(15 downto 0);
            n, c, z, ov : out std_logic
        );
    end component;
    
    component MemoriaDato is
        Port(
            clk, WD : in  STD_LOGIC;
            dir     : in  STD_LOGIC_VECTOR( 8  downto 0);
            dataIn  : in  STD_LOGIC_VECTOR( 15 downto 0);
            dataOut : out STD_LOGIC_VECTOR( 15 downto 0)
        );
    end component;
    
    component UnidadControl is
        Port(
            clr, clk, LF, OV, N, Z, C : in  STD_LOGIC;
            funCode                   : in  STD_LOGIC_VECTOR(3  downto 0);
            opCode                    : in  STD_LOGIC_VECTOR(4  downto 0);
            Microinstruccion          : out STD_LOGIC_VECTOR(19 downto 0)
        );
    end component;
    
    component ExtensorSigno is
        Port(
            num : in  STD_LOGIC_VECTOR(11 downto 0);
            ss  : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component ExtensorDireccion is
        Port(
            num : in  STD_LOGIC_VECTOR(11 downto 0);
            sd  : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

end package;
