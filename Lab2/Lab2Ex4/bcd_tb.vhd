LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity bcd_tb is
end bcd_tb;

Architecture behaviour of bcd_tb is

component bcd is
Port(
SW: in unsigned(5 downto 0);
HEX0, HEX1: out std_logic_vector(0 to 6)
);
end component;

signal v_tb: unsigned(5 downto 0);
signal hex0_tb, hex1_tb: std_logic_vector(0 to 6);

Begin
dut: bcd Port map(v_tb, hex0_tb, hex1_tb);

Process
Begin
v_tb <= "110011";
wait for 100 ns;
v_tb <= "011011";
wait for 100 ns;
v_tb <= "101000";
wait for 100 ns;
v_tb <= "001001";
wait;
End process;

end behaviour;
