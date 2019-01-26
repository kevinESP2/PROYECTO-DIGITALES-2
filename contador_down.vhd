library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador_down is
	generic(n: integer := 4);
	port(
		Resetn, clock, En, Ld: in std_logic;
		Ent: in std_logic_vector(n-1 downTo 0);
		Q: Buffer std_logic_vector(n-1 downTo 0));
End contador_down;

Architecture comp of contador_down is

Begin
	Process(Resetn, clock)
	begin
		if Resetn = '0' then Q <= (others => '0');
		elsif clock'event and clock = '1' then
			if En = '1' then
				if Ld = '1' then Q <= Ent;
				else Q <= Q-'1';
				end if;
			end if;
		end if;
	end Process;
end comp;