LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT ( sel: IN STD_LOGIC_VECTOR(1 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END mux;

ARCHITECTURE Behaviour OF mux IS
BEGIN
with sel select
output <= "000001010010011" when "00", --HELLO
	  "100001101101011" when "01", --CEPPPO
	  "100001010010011" when "10", --CELLO
	  "110001101101011" when "11", --FEPPO
          "111111111111111" when others; --off
	
END behaviour;
