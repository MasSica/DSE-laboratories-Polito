LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ripple_tb IS
END ripple_tb;

ARCHITECTURE arch of ripple_tb is
signal A_add_tb: SIGNED(3 downto 0);	
signal B_add_tb: SIGNED(3 downto 0);
signal key1_tb, key0_tb: std_logic;
signal hex0_tb, hex1_tb, hex2_tb: std_logic_vector(0 to 6);
signal led_tb: std_logic;

COMPONENT ripple IS
PORT (SW:in SIGNED (7 downto 0); --A e B
	LEDR: out std_logic; --overflow
	HEX0, HEX1, HEX2: out std_logic_vector(0 to 6);
	KEY: in std_logic_vector(1 downto 0)); --reset and clock
END COMPONENT;

BEGIN
uut: ripple PORT MAP(
SW(7 downto 4) => B_add_tb,
SW(3 downto 0) => A_add_tb,
LEDR => led_tb,
HEX0 => hex0_tb,
HEX1 => hex1_tb,
HEX2 => hex2_tb,
KEY(0) => key0_tb,
KEY(1) => key1_tb
);

PROCESS
BEGIN
A_add_tb <= "0101";
B_add_tb <= "1010";
key0_tb <= '1';
key1_tb <= '0';
wait for 100 ns;
key1_tb <= '1';
wait for 100 ns;
key1_tb <= '0';
wait for 100 ns;
key1_tb <= '1';
wait for 100 ns;
key1_tb <= '0';
wait for 100 ns;
key1_tb <= '1';
wait for 100 ns;
A_add_tb <= "1101";
B_add_tb <= "1110";
key1_tb <= '0';
wait for 100 ns;
key1_tb <= '1';
wait for 100 ns;
key1_tb <= '0';
wait for 100 ns;
key1_tb <= '1';
wait for 100 ns;
key1_tb <= '0';
wait for 100 ns;
key1_tb <= '1';
wait for 100 ns;
key1_tb <= '0';
wait;
END PROCESS;

END arch;


