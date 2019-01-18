library ieee;
use ieee.std_logic_1164.all;

Entity controlador is
	Port(
	Clock, Resetn, start, Up, Down, Resumen, Stop_Reset, Play_Pause: in std_logic;
	FinUp, Fin3s, FinMen1, FIn, men9, may1: in std_logic;
	SelEnC, LdSeg, SelTemp, EnC, LdC, EnDe, LdD, NoContar, Wen, SetTiempo: out std_logic;
	Sel_Up_Down, EnA, En7s, En3s, LD3s, Counting, EnTiempo, Sel7s, finished: out std_logic;
	Seladd, selQ: out std_logic_vector(1 downTo 0);
	estado: out std_logic_vector(4 downTO 0)
	);
end controlador;

Architecture sol of controlador is
	type est is (T1, T2, T3, T4, T5, T6, T7 ,T8, T9 ,T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25);
	signal y: est;
	
begin
--transiciones
Process(Resetn, clock)
begin
	if Resetn = '0' then y<= T1;
	elsif clock'event and clock = '1' then
		case y is
			when T1 => y<= T2;
			when T2 => if FInUP = '1' then y<= T3; end if;
			when T3 => if Start = '1' then y<= T4; end if;
			when T4 => if start = '0' then y<= T5; end if;
			when T5 => if Up = '1' then y<= T6;
							elsif Down = '1' then y<=T7;
							elsif Resumen = '1' then y<= T8;
							elsif Stop_Reset = '1' then y<= T15;
							elsif Play_pause = '1' then y<= T12;
							else y<= T5; end if;
			when T6 => if Up = '0' then y<= T5; end if;
			when T7 => if Down = '0' then y<= T5; end if;
			when T8 => if Resumen = '0' then y<= T9; end if;
			when T9 => y<= T10;
			when T10 => y <= T11;
			when T11 => if Fin3s = '0' then y<= T11;
							elsif FinUp = '0' then y<= T9;
							else y<= T5; end if;
			when T12 => if Play_Pause = '0' then y<= T13; end if;
			when T13 => if Play_Pause = '1' then y<=T14; 
							elsif Stop_Reset = '1' then y<= T15;
							elsif Fin= '1' then y<= T25;
							else y<= T13; end if;
			when T14 => if Play_Pause = '0' then y<= T5; end if;
			when T15 => if Stop_Reset = '0' then y<= T16; end if;
			when T16 => y<= T17;
			when T17 => y<= T18;
			when T18 => y<= T19;
			when T19 => y<= T20;
			when T20 => y<= T21;
			when T21 => if FinMen1 = '0' then y<= T17;
							else y<= T22; end if;
			when T22 => y<= T23;
			when T23 => y<= T24;
			when T24 => y<= T5;
			when T25 => if Stop_Reset = '1' then y<= T15; end if;
		end case;
	end if;
end Process;

-- salidas
process(Resetn, clock, Up, Down, Fin3s, FinUp, FinMen1)
begin
SelEnC<= '0'; LdSeg<= '0'; SelTemp<= '0'; EnC<= '0'; LdC<= '0'; EnDe<= '0'; LdD<= '0'; NoContar<= '0'; Wen<= '0'; SetTiempo<= '0';
Sel_Up_Down<= '0'; EnA<= '0'; En7s<= '0'; En3s<= '0'; LD3s<= '0'; Counting<= '0';
Seladd<= "00"; selQ<= "00"; EnTiempo <= '0'; Sel7s <= '0';
estado <= "00000";

case y is 
	when T1 => estado <= "00001"; SelEnC <= '1'; LdSeg <= '1'; SelTemp <= '1'; EnC <= '1'; LdC <= '1'; EnDe <= '1'; LdD <= '1'; EnTiempo <= '1';
	when T2 => estado <= "00010";NoContar <= '1'; EnC <= '1'; Wen <= '1';
	when T3 => estado <= "00011";NoContar <= '1';
	when T4 => estado <= "00100";NoContar <= '1';
	when T5 => estado <= "00101";NoContar <= '1'; SetTiempo <= '1'; Sel7s <= '1'; En7s <= '1';
	when T6 => estado <= "00110";NoContar <= '1'; SetTiempo <= '1'; Sel7s <= '1'; En7s <= '1';
				if Up = '0' then 
					if men9 = '1' then EnTiempo <= '1'; end if;
				end if;
	when T7 => estado <= "00111";NoContar <= '1'; SetTiempo <= '1'; Sel_Up_Down <= '1';Sel7s <= '1'; En7s <= '1';
				if Down = '0' then 
					if may1 = '1' then EnTiempo <= '1'; end if;
				end if;
	when T8 => estado <= "01000";EnC <= '1'; LdC <= '1'; EnDe <= '1'; LdD<= '1'; NoContar <= '1';
	when T9 => estado <= "01001";NoContar <= '1';
	when T10 => estado <= "01010";EnA <= '1'; NoContar <= '1';
	When T11 => estado <= "01011";En7s <= '1'; En3s <= '1';
				if Fin3s = '1' then En3s <= '1'; Ld3s <= '1'; end if;
				if FinUp = '0' and Fin3s = '1' then EnC <= '1'; end if;
	when T12 => estado <= "01100";NoContar <= '1';
	when T13 => estado <= "01101";Counting <= '1';
	when T14 => estado <= "01110";NoContar <= '1'; 
	when T15 => estado <= "01111";NoContar <= '1'; 
	when T16 => estado <= "10000";SelEnC <= '1'; LdSeg <= '1'; EnC <= '1'; LdC <= '1'; EnDe <= '1'; LdD <= '1';
	when T17 => estado <= "10001";NoContar<= '1';SelAdd <= "10";
	when T18 => estado <= "10010";NoContar<= '1';SelAdd <= "10";
	when T19 => estado <= "10011";NoContar<= '1';SelAdd <= "01"; EnA <= '1';
	when T20 => estado <= "10100";NoContar<= '1';SelQ <= "10"; wen <= '1'; SelAdd <= "01";
	when T21 => estado <= "10101";NoContar<= '1';SelQ <= "10"; SelAdd <= "01";
					if FinMen1 <= '0' then EnDe <= '1'; end if;
	when T22 => estado <= "10110";NoContar<= '1';SelQ <= "01";
	when T23 => estado <= "10111";NoContar<= '1';SelQ <= "01"; Wen <= '1';
	when T24 => estado <= "11000";NoContar<= '1';SelQ <= "01"; EnTiempo <= '1';SelTemp <= '1';
	when T25 => finished <= '1'; NoContar<= '1'; estado <= "11001";
end case;
end process;
end sol;
				
