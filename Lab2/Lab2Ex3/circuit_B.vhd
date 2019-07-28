LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY circuit_B IS
PORT ( zB : IN STD_LOGIC;
Display_B : OUT STD_LOGIC_VECTOR(0 TO 6));
END circuit_B;

ARCHITECTURE Behavior OF circuit_B IS

BEGIN

with zB select
Display_B <= "1001111" when '1', --display 1
	     "1111111" when others; --off

END Behavior;
