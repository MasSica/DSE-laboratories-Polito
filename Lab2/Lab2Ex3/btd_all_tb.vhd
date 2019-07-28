LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY btd_all_tb IS
END btd_all_tb;

ARCHITECTURE arch of btd_all_tb is

signal v_tb: UNSIGNED(3 downto 0);
signal hex_0, hex_1: STD_LOGIC_VECTOR(0 to 6);

COMPONENT btd_all IS
PORT ( SW : IN UNSIGNED(3 DOWNTO 0);
HEX0, HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6));
END COMPONENT;

BEGIN
uut: btd_all PORT MAP(v_tb, hex_0, hex_1);

PROCESS
BEGIN
v_tb <= "1101";
wait for 400 ns;
v_tb <= "0100";
wait for 400 ns;
v_tb <= "1010";
wait;
END PROCESS;

END arch;
