
library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.ComponentesProcesado.ALL;

entity ProcesadorESCOM is
    Port(
        Rclr, clk : in  STD_LOGIC;
        PCs, readData1s, readData2s, ResALU, BusSR : out STD_LOGIC_VECTOR(15 downto 0);
        Instruccion : out STD_LOGIC_VECTOR(24 downto 0)
    );
end ProcesadorESCOM;

architecture Procesar of ProcesadorESCOM is
    signal wpc, up, dw, wr, she, dir, SR2, SWD, n, c, z, ov, SOP1, SOP2, SEXT, WD, SDMD, SR, SDMP, LF, clr  : STD_LOGIC;
    signal pcin, pcout, writeData, readData1, readData2, ss, sd, a, b, s, dataIn, dataOut, retorno, extensor : STD_LOGIC_VECTOR(15 downto 0);
    signal PC, dirM : STD_LOGIC_VECTOR(8 downto 0);
    signal Inst : STD_LOGIC_VECTOR(24 downto 0);
    signal writeReg, readReg1, readReg2, shamt, ALUOP, funCode : STD_LOGIC_VECTOR(3 downto 0);
    signal num : STD_LOGIC_VECTOR(11 downto 0);
    signal opCode : STD_LOGIC_VECTOR(4 downto 0);
    signal Microinstruccion : STD_LOGIC_VECTOR(19 downto 0);
begin

    process(clk)
    begin
        if(FALLING_EDGE(clk)) then
            clr <= Rclr;
        end if;
    end process;

    c1: Pila Port map(
        clr   => clr,
        clk   => clk,
        wpc   => wpc,
        up    => up,
        dw    => dw,
        pcin  => pcin,
        pcout => pcout
    );
    
    c2: MemoriaPrograma Port map(
        PC   => PC,
        Inst => Inst
    );
    
    c3: ArchivoRegistro Port map(
        wr        => wr,
        she       => she,
        dir       => dir,
        clr       => clr,
        clk       => clk,
        writeReg  => writeReg,
        readReg1  => readReg1,
        readReg2  => readReg2,
        shamt     => shamt,
        writeData => writeData,
        readData1 => readData1,
        readData2 => readData2
    );
    
    c4: ExtensorSigno Port map(
        num => num,
        ss  => ss
    );
    
    c5: ExtensorDireccion Port map(
        num => num,
        sd  => sd
    );
    
    c6: UnidadAritmeticaLogica Port map(
        a     => a,
        b     => b,
        ALUOP => ALUOP,
        s     => s,
        n     => n,
        c     => c,
        z     => z,
        ov    => ov
    );
    
    c7: MemoriaDato Port map(
        clk     => clk,
        WD      => WD,
        dir     => dirM,
        dataIn  => dataIn,
        dataOut => dataOut
    );
    
    c8: UnidadControl Port map(
        clr              => clr,
        clk              => clk,
        LF               => LF,
        OV               => ov,
        N                => n,
        Z                => z,
        C                => c,
        funCode          => funCode,
        opCode           => opCode,
        Microinstruccion => Microinstruccion
    );
    
    retorno <= dataOut when (SR='0') else
               s;
    
    PC <= pcout(8 downto 0);
    
    ReadReg1  <= Inst(15 downto 12);
    ReadReg2  <= Inst(11 downto  8) when (SR2='0') else
                 Inst(19 downto 16);
    writeReg  <= Inst(19 downto 16);
    shamt     <= Inst(7 downto 4);
    writeData <= Inst(15 downto 0) when (SWD='0') else
                 retorno;
    num       <= Inst(11 downto 0);
    
    extensor <= ss when (SEXT='0') else
                sd;
    
    a <= readData1 when (SOP1='0') else
         pcout;
    b <= readData2 when (SOP2='0') else
         extensor;
         
    dirM   <= s(8 downto 0)     when (SDMD='0') else
              Inst(8 downto 0);
    dataIn <= readData2;
    
    
    pcin <= Inst(15 downto 0) when (SDMP='0') else
            retorno;
            
    LF      <= Microinstruccion(0);
    funCode <= Inst(3  downto  0);
    opCode  <= Inst(24 downto 20);
    SDMP    <= Microinstruccion(19);
    up      <= Microinstruccion(18);
    dw      <= Microinstruccion(17);
    wpc     <= Microinstruccion(16);
    SR2     <= Microinstruccion(15);
    SWD     <= Microinstruccion(14);
    SEXT    <= Microinstruccion(13);
    she     <= Microinstruccion(12);
    dir     <= Microinstruccion(11);
    wr      <= Microinstruccion(10);
    SOP1    <= Microinstruccion(9);
    SOP2    <= Microinstruccion(8);
    ALUOP   <= Microinstruccion(7 downto 4);
    SDMD    <= Microinstruccion(3);
    WD      <= Microinstruccion(2);
    SR      <= Microinstruccion(1);
            
    PCs         <= pcout;
    Instruccion <= Inst;
    readData1s  <= readData1;
    readData2s  <= readData2;
    ResALU      <= s;
    BusSR       <= retorno;

end Procesar;
