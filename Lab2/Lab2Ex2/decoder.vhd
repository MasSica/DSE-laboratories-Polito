LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder IS

PORT ( C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));

END decoder;

ARCHITECTURE Behavior OF decoder IS
BEGIN

with C select

Display <= "1001000" when "000", --H
	   "0110000" when "001", --E
	   "1110001" when "010", --L
	   "0000001" when "011", --O
           "0110001" when "100", --C
           "0011000" when "101", --P
           "0111000" when "110", --F
	   "1111111" when others; --off

END Behavior;

