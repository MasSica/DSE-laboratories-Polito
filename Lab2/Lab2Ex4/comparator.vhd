LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY comparator IS
PORT ( vC : IN UNSIGNED(5 DOWNTO 0);
zC : OUT UNSIGNED(3 downto 0));
END comparator;

ARCHITECTURE Behavior OF comparator IS
BEGIN

zC <= "0110" when (vC>="111100") else 			-->=60
"0101" when ((vC>="110010") and (vC<"111100")) else 	--between 50 and 60
"0100" when (vC>="101000") and (vC<"110010") else 	--between 40 and 50
"0011" when (vC>="011110") and (vC<"101000") else 	--between 30 and 40
"0010" when (vC>="010100") and (vC<"011110") else 	--between 20 and 30
"0001" when (vC>="001010") and (vC<"010100") else 	--between 10 and 20
"0000"; 						--<10

END Behavior;
