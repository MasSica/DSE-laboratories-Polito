library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hello_tb is
end hello_tb;

architecture behavior of hello_tb is

signal KEY0_tb: std_logic;
signal clock_50_tb: std_logic;
signal hex0_tb: std_logic_vector(0 to 6);
signal hex1_tb: std_logic_vector(0 to 6);
signal hex2_tb: std_logic_vector(0 to 6);
signal hex3_tb: std_logic_vector(0 to 6);
signal hex4_tb: std_logic_vector(0 to 6);
signal hex5_tb: std_logic_vector(0 to 6);

component hello_fsm is
port( KEY: in std_logic_vector(0 downto 0);
CLOCK_50: in std_logic;
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5: out std_logic_vector (0 to 6));
end component;

BEGIN

uut: hello_fsm PORT MAP(

key(0) => key0_tb,

clock_50 => clock_50_tb,

hex0=> hex0_tb,
hex1=> hex1_tb,
hex2=> hex2_tb,
hex3=> hex3_tb,
hex4=> hex4_tb,
hex5=> hex5_tb
);

PROCESS(CLOCK_50_tb)
BEGIN
if CLOCK_50_tb='U' then
   CLOCK_50_tb<='0' after 10 ns; 
else
   CLOCK_50_tb<= not CLOCK_50_tb after 10 ns;
end if;
end process;


process
begin
KEY0_tb<='0';
wait for 25 ns;
KEY0_tb<='1';
wait for 2 us;
KEY0_tb<='0';
wait for 25 ns;
key0_tb<='1';
wait;

end process;
end behavior;

