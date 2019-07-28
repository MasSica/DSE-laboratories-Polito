LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY twos IS
PORT ( input: in signed(7 downto 0);
sel: IN std_logic;
ovf: IN std_logic;
output : OUT signed(7 downto 0));
END twos;

ARCHITECTURE Behaviour OF twos IS
signal tmp : signed (7 downto 0);

BEGIN 

tmp<= not(input) +1 when sel = '1' and ovf ='0' else 
      not(input) when sel ='1' and ovf='1'else
      input ;

output <= tmp;
	
END behaviour;
