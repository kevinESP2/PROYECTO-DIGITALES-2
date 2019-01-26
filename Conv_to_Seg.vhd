library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Conv_to_Seg is 
	port( ent: in std_logic_vector(3 downTo 0);
			sal: out std_logic_vector(9 downTo 0));	
end Conv_to_Seg;

architecture comp of Conv_to_Seg is 
	signal intx4, intx8, intx16, intx32, sum: std_logic_vector(9 downto 0);
	begin 
		intx4(5 downTo 2) <= ent;
		intx4(1 downTo 0) <= "00";
		intx4(9 downTo 6) <= "0000";
		intx8(2 downTo 0) <= "000";
		intx8(6 downTo 3) <= ent;
		intx8(9 downTo 7) <= "000";
		intx16(3 downTo 0) <= "0000";
		intx16(7 downTo 4) <= ent;
		intx16(9 downTO 8) <= "00";
		intx32(4 downTo 0) <= "00000";
		intx32(8 downTo 5) <= ent;
		intx32(9) <= '0';
		sal <= intx4 + intx8 + intx16 + intx32;
   end comp;		
		