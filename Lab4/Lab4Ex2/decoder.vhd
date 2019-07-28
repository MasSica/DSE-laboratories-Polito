LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
 
ENTITY decoder IS
PORT ( m : IN std_logic_vector(0 TO 3);
bi : in std_logic;
Display : OUT STD_LOGIC_VECTOR(0 TO 6);
bi_out: out std_logic
);
END decoder;

ARCHITECTURE Behavior OF decoder IS
signal tmp: std_logic_vector(0 to 6);

BEGIN

tmp <= "1111111" when (m="0000" and  bi='0') else --turn off entire display when previous decoder is off
	   "0000001" when (m="0000" and  bi='1') else --0, has to be displayed if previous decoder is on
	   "1001111" when m="1000" else --1
	   "0010010" when m="0100" else --2
	   "0000110" when m="1100" else --3
           "1001100" when m="0010" else --4
           "0100100" when m="1010" else --5
           "0100000" when m="0110" else --6
	   "0001111" when m="1110" else --7
       	   "0000000" when m="0001" else --8
	   "0000100" when m="1001" else --9
  	   "0001000" when m="0101" else --10
	   "1100000" when m="1101" else --11
	   "0110001" when m="0011" else --12
	   "1000010" when m="1011" else --13
	   "0110000" when m="0111" else --14
	   "0111000"; --15	

Display <= tmp;

bi_out <= '0' when tmp ="1111111" else
	  '1';

END Behavior;
