LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sevensegm IS
PORT (SW: in std_logic_vector(2 downto 0);
HEX0: out std_logic_vector(0 to 6)
);
END sevensegm;

ARCHITECTURE behaviour of sevensegm IS
BEGIN
with SW select
HEX0 <= "1001000" when "000", --H
	"0110000" when "001", --E
	"1110001" when "010", --L
	"0000001" when "011", --O
	"1111111" when others; --off
END behaviour;
