LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT (
z: in std_logic_vector(3 downto 0);
m: out std_logic_vector(5 downto 0)
);
END mux;

ARCHITECTURE behaviour of mux IS

BEGIN
m <= "111100" when z = "0110" else
"110010" when z = "0101" else
"101000" when z = "0100" else
"011110" when z = "0011" else
"010100" when z = "0010" else
"001010" when z = "0001" else 
"000000";

END behaviour;
