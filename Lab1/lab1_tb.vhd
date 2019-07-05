LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab1_tb IS
END lab1_tb;
ARCHITECTURE mytest OF lab1_tb IS
SIGNAL in_tb: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL out_tb: STD_LOGIC_VECTOR(9 DOWNTO 0);
COMPONENT lab1
  PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0));
END COMPONENT;
BEGIN
uut: lab1 PORT MAP (
SW => in_tb,
LEDR => out_tb
);
PROCESS
BEGIN
in_tb <= "1111111111";
wait for 25 ns;
in_tb <= "1010101010";
wait;
END PROCESS;
END mytest;
