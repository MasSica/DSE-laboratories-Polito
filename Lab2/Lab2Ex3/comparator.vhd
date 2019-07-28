LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY comparator IS
PORT ( vC : IN UNSIGNED(3 DOWNTO 0);
zC : OUT STD_LOGIC);
END comparator;

ARCHITECTURE Behavior OF comparator IS
BEGIN
zC <= '1' when (vC>"1001")
else '0';
END Behavior;
