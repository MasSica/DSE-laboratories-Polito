library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_path_tb is
end data_path_tb;

architecture behavior of data_path_tb is

signal x_tb: signed(7 downto 0);
signal clock_tb: std_logic;
signal clear_tb: std_logic;
signal sel_tb: std_logic_vector(2 downto 0);
signal mux_s_tb: std_logic;
signal y_tb: signed(7 downto 0);

component data_path is
port( x: in signed (7 downto 0);
clock: in std_logic;
clear: in std_logic;
sel: in std_logic_vector (2 downto 0);
mux_s: in std_logic;
y: out signed(7 downto 0));
end component;


BEGIN

uut: data_path PORT MAP(
x_tb,clock_tb,clear_tb,sel_tb,mux_s_tb,y_tb 
);

PROCESS(CLOCK_tb)
BEGIN
if CLOCK_tb='U' then
   CLOCK_tb<='0' after 10 ns; 
else
   CLOCK_tb<= not CLOCK_tb after 10 ns;
end if;
end process;

process
begin
mux_s_tb <= '1';
clear_tb<='0';
wait for 5 ns;
clear_tb<='1';
sel_tb <= "101";
x_tb <= "01000000";
wait for 15 ns;
sel_tb <= "110";
x_tb <= "01001000";
wait for 15 ns;
sel_tb <= "011";
x_tb <= "01001000";
wait for 15 ns;
sel_tb <= "000";
x_tb <= "01000010";
wait;
end process;

end behavior;

