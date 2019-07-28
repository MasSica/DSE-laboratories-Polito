LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY diff IS
PORT ( a1 : IN UNSIGNED(5 DOWNTO 0); 
a2 : IN UNSIGNED(3 DOWNTO 0);
difference : OUT UNSIGNED(3 DOWNTO 0)
);
END diff;

ARCHITECTURE Behaviour OF diff IS

signal aux: unsigned(7 downto 0);

BEGIN
aux <= "00"&a1-a2*"1010";
difference <= aux(3 downto 0);

END Behaviour;
