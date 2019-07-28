LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY muxb IS
PORT ( sel: IN STD_LOGIC;
input: in signed(7 downto 0);
output : OUT signed(7 downto 0));
END muxb;

ARCHITECTURE Behaviour OF muxb IS
BEGIN

output <= "00000000" when sel='0' else 
	  input;
	
END behaviour;
