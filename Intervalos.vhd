library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Intervalos is 
	port( ent: in std_logic_vector(9 downTo 0);
			int1: out std_logic_vector(9 downTo 0);
			int2: out std_logic_vector(9 downTo 0);
			int3: out std_logic_vector(9 downTo 0);
			int4: out std_logic_vector(9 downTo 0);
			int5: out std_logic_vector(9 downTo 0);
			int6: out std_logic_vector(9 downTo 0);
			int7: out std_logic_vector(9 downTo 0);
			int8: out std_logic_vector(9 downTo 0);
			int9: out std_logic_vector(9 downTo 0)
			);	
end Intervalos;

architecture comp of Intervalos is 
	signal div: std_logic_vector(9 downto 0);
	begin 
	with ent select
	div <= "0000000110" when "0000111100",
			 "0000001100" when "0001111000",
			 "0000010010" when "0010110100",
			 "0000011000" when "0011110000",
			 "0000011110" when "0100101100",
			 "0000100100" when "0101101000",
			 "0000101010" when "0110100100",
			 "0000110000" when "0111100000",
			 "0000110110" when "1000011100",
			 "0000000000" when others;
	
	int1 <= div;
	int2 <= div + div;
	int3 <= div + div + div;
	int4 <= div + div + div + div;
	int5 <= div + div + div + div + div;
	int6 <= div + div + div + div + div + div;
	int7 <= div + div + div + div + div + div + div;
	int8 <= div + div + div + div + div + div + div + div;
	int9 <= div + div + div + div + div + div + div + div + div;
end comp;		
		