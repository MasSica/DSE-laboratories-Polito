LIBRARY ieee;
USE ieee.std_logic_1164.all;
 USE ieee.numeric_std.all;
 
ENTITY decoder IS
PORT ( m : IN signed(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END decoder;

ARCHITECTURE Behavior OF decoder IS
BEGIN

with m select

Display <= "0000001" when "0000", --0
	   "1001111" when "0001", --1
	   "0010010" when "0010", --2
	   "0000110" when "0011", --3
           "1001100" when "0100", --4
           "0100100" when "0101", --5
           "0100000" when "0110", --6
	   "0001111" when "0111", --7
       	   "0000000" when "1000", --8
	   "0000100" when "1001", --9
"0001000" when "1010", --10
"1100000" when "1011", --11
"0110001" when "1100", --12
"1000010" when "1101", --13
"1100000" when "1110", --14
"0111000" when others; --15	
END Behavior;
