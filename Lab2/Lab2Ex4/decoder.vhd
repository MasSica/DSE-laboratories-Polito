LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY decoder IS
PORT ( m : IN UNSIGNED(3 DOWNTO 0);
bi : in std_logic;
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END decoder;

ARCHITECTURE Behavior OF decoder IS
BEGIN

Display <= "1111111" when (m="0000" and  bi='0') else --turn off entire display, for decoder 1 (tens) when input < 10
	   "0000001" when (m="0000" and  bi='1') else --0, has to be displayed for decoder 0 (units)
	   "1001111" when m="0001" else --1
	   "0010010" when m="0010" else --2
	   "0000110" when m="0011" else --3
           "1001100" when m="0100" else --4
           "0100100" when m="0101" else --5
           "0100000" when m="0110" else --6
	   "0001111" when m="0111" else --7
       	   "0000000" when m="1000" else --8
	   "0000100"; --9

END Behavior;
