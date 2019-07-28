LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity cska_tb is
end cska_tb;

Architecture behavior of cska_tb is

Component cska_top is
PORT (SW:in SIGNED (31 downto 0); --A e B
LEDR: out std_logic; --overflow
KEY: in std_logic_vector(1 downto 0)); --reset and clock
end component;

signal a1_tb, a2_tb: signed(15 downto 0);
signal key1_tb, key0_tb: std_logic;
signal led_tb: std_logic;

Begin
cska0: cska_top Port map(
SW(31 downto 16) => a1_tb,
SW(15 downto 0) => a2_tb,
LEDR => led_tb,
KEY(0) => key0_tb,
KEY(1) => key1_tb
);

Process
begin
a1_tb <= "0101101010100010";
a2_tb <= "0010010101110010";
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
end process;

end behavior;
