LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY btd_tb IS
END btd_tb;

ARCHITECTURE arch of btd_tb is

signal v_tb: UNSIGNED(3 downto 0);
signal m_tb: UNSIGNED(3 downto 0);
signal z_tb: STD_LOGIC;

COMPONENT btd IS
PORT ( v : IN UNSIGNED(3 DOWNTO 0);
m : OUT UNSIGNED(3 DOWNTO 0);
z : OUT STD_LOGIC);
END COMPONENT;

BEGIN
uut: btd PORT MAP(v_tb, m_tb, z_tb);

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

