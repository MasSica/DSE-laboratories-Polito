LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ripple_tb IS
END ripple_tb;

ARCHITECTURE arch of ripple_tb is
signal A_add_tb: SIGNED(15 downto 0);	
signal B_add_tb: SIGNED(15 downto 0);
signal key1_tb, key0_tb: std_logic;
signal led_tb: std_logic;


COMPONENT ripple IS
PORT (SW:in SIGNED (31 downto 0); --A e B
	LEDR: out std_logic; --overflow
	KEY: in std_logic_vector(1 downto 0)); --reset and clock
END COMPONENT;

BEGIN
uut: ripple PORT MAP(
SW(31 downto 16) => A_add_tb,
SW(15 downto 0) => B_add_tb,
LEDR => led_tb,
KEY(0) => key0_tb,
KEY(1) => key1_tb

);

PROCESS
BEGIN
A_add_tb <= "0101101010100010";
B_add_tb <= "0010010101110010";
key0_tb <= '1';
key1_tb <= '0';
wait for 400 ns;
key1_tb <= '1';
wait for 400 ns;
key1_tb <= '0';
wait for 400 ns;
key1_tb <= '1';
wait for 400 ns;
key1_tb <= '0';
wait for 400 ns;
key1_tb <= '1';
wait;
END PROCESS;

END arch;


