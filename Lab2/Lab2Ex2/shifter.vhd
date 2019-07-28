LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shifter IS
PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0);
sel: IN STD_LOGIC_VECTOR(2 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END shifter;

ARCHITECTURE Behavior OF shifter IS
BEGIN
with sel select
 
output <= input(11 downto 0) & input(14 downto 12)    when "001",
          input(8 downto 0)  & input(14 downto 9)     when "010",
          input(5 downto 0)  & input(14 downto 6)     when "011",
          input(2 downto 0)  & input(14 downto 3)     when "100",
          input when others;

END Behavior;
