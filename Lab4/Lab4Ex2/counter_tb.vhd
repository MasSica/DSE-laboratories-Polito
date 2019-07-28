LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY counter_tb IS
END counter_tb;

ARCHITECTURE arch of counter_tb is
signal enable_tb: std_logic;	
signal clock_tb: std_logic;
signal clear_tb: std_logic;
signal hex0_tb, hex1_tb, hex2_tb, hex3_tb: std_logic_vector(0 to 6);

component counter_display is
port( SW: in std_logic_vector(1 downto 0);
KEY0: in std_logic;
HEX0,HEX1,HEX2,HEX3: out std_logic_vector(0 to 6)
);
end component;

BEGIN
uut: counter_display PORT MAP(SW(1) => enable_tb, 
SW(0) => clear_tb, 
KEY0 => clock_tb, 
HEX0 => hex0_tb, 
HEX1 => hex1_tb, 
HEX2 => hex2_tb, 
HEX3 => hex3_tb);

Process
Begin
enable_tb <= '0';
clear_tb <= '1';
wait for 3 ns;
clear_tb <= '0';
enable_tb <= '1';
wait;
End process;

PROCESS(clock_tb)
BEGIN
if clock_tb='U' then
	clock_tb<='0' after 1 ns;
else
	clock_tb<= not clock_tb after 1 ns;
end if;
end process;

END arch;

