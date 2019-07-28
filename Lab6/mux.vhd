LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux IS
PORT ( in7: IN STD_LOGIC;
ovf: IN std_logic;
shift_out:in signed (7 downto 0);
output : OUT signed(7 downto 0));
END mux;

ARCHITECTURE Behaviour OF mux IS
BEGIN

output <= "01111111" when ovf='1' and in7='0' else 
	  "10000000" when ovf='1' and in7='1' else 
	  shift_out;
	
END behaviour;
