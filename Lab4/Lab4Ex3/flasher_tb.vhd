library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity flasher_tb is
end flasher_tb;

Architecture behaviour of flasher_tb is

component flasher is
port(SW: in std_logic;
CLOCK_50: in std_logic;
hex0: out std_logic_vector(0 to 6));
end component;

signal cl_tb: std_logic;
signal ck_tb: std_logic;
signal hex0_tb: std_logic_vector(0 to 6);

Begin
flash0: flasher Port map(cl_tb, ck_tb, hex0_tb);

process
begin
cl_tb <= '1';
wait for 10 ns;
cl_tb <= '0';
wait;
end process;

PROCESS(ck_tb)
BEGIN
if ck_tb='U' then
   ck_tb<='0' after 1 ns; 
else
   ck_tb<= not ck_tb after 1 ns;
end if;
end process;

end behaviour;
