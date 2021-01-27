
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UCCentral is
    Port(
        clr, clk, TipoR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI, NA, EQ, NE, LT, LE, GT, GE : in  STD_LOGIC;
        SDOPC, SM                                                                          : out STD_LOGIC
    );
end UCCentral;

architecture Controlar of UCCentral is
    type estados is (e0);
    signal edo_act, edo_sig : estados; 
begin

    process(edo_act, TipoR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI, NA, EQ, NE, LT, LE, GT, GE)
    begin
        SDOPC <= '1';
        SM <= '1';
        case edo_act is
            when e0 =>
                if(TipoR = '1') then
                    SM <= '0';
                elsif (NA = '1') then
                    if (BEQI = '1' or BNEQI = '1' or BLTI = '1' or BLETI = '1' or BGTI = '1' or BGETI = '1') then
                        SDOPC <= '0';
                    end if;
                else
                    if ((BEQI = '1'  and EQ = '0') or 
                        (BNEQI = '1' and NE = '0') or 
                        (BLTI = '1'  and LT = '0') or 
                        (BLETI = '1' and LE = '0') or 
                        (BGTI = '1'  and GT = '0') or 
                        (BGETI = '1' and GE = '0')) then
                        SDOPC <= '0';
                    end if;
                end if;
                edo_sig <= e0;
        end case;
    end process;
    
    process(clk, clr)
    begin
        if(clr = '1') then
            edo_act <= e0;
        elsif (rising_edge(clk)) then
            edo_act <= edo_sig;
        end if;
    end process;

end Controlar;
