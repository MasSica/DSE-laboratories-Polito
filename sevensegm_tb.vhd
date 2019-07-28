LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sevensegm_tb IS
END sevensegm_tb;

ARCHITECTURE behaviour of sevensegm_tb is
signal sw_tb: std_logic_vector(2 downto 0);
signal hex0_tb: std_logic_vector(0 to 6);

COMPONENT sevensegm
PORT (SW: in std_logic_vector(2 downto 0);
HEX0: out std_logic_vector(0 to 6)
);
END COMPONENT;

BEGIN
uut: sevensegm PORT MAP(
SW => sw_tb,
HEX0 => hex0_tb
);

PROCESS
BEGIN
sw_tb <= "000";
wait for 100 ns;
sw_tb <= "001";
wait for 100 ns;
sw_tb <= "010";
wait for 100 ns;
sw_tb <= "011";
wait for 100 ns;
sw_tb <= "101";
wait;
END PROCESS;
END behaviour;
