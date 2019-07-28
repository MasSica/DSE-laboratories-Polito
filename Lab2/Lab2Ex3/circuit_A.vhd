LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY circuit_A IS
PORT ( vA : IN UNSIGNED(2 DOWNTO 0);
Display_A : OUT UNSIGNED(2 DOWNTO 0)
);
END circuit_A;

ARCHITECTURE Behaviour OF circuit_A IS
BEGIN

Display_A<=vA-"010";

END Behaviour;
