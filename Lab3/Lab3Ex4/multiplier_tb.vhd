LIBRARY ieee;
USE ieee.std_logic_1164.all;

Entity multiplier_tb is
end multiplier_tb;

Architecture behaviour of multiplier_tb is

component multiplier is
PORT (sw : in std_logic_vector(7 downto 0);
p: out std_logic_vector (7 downto 0)
);
end component;

signal sw_tb: std_logic_vector(7 downto 0);
signal  p_tb: std_logic_vector(7 downto 0);

begin
uut:multiplier PORT MAP (sw_tb,p_tb);

process
begin
sw_tb<="10101011";
wait for 100ns ;
sw_tb<= "11110001";
wait for 100ns ;
sw_tb<= "10100000";
wait;
end process;
end behaviour;

