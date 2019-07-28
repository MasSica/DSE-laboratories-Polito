LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY filter_tb is
end filter_tb;

architecture behavior of filter_tb is 

component filter is
PORT ( start: in std_logic;
clock: in std_logic;
data_in: in signed(7 downto 0);
data_out: out signed(7 downto 0);
done: out std_logic
);
END component;

signal start_tb: std_logic;
signal clock_tb: std_logic;
signal data_in_tb: signed(7 downto 0);
signal data_out_tb: signed(7 downto 0);
signal done_tb: std_logic;

begin 

uut : filter PORT MAP(start_tb,clock_tb,data_in_tb,data_out_tb,done_tb);

PROCESS(CLOCK_tb)
BEGIN
if CLOCK_tb='U' then
   CLOCK_tb<='0' after 1 ns; 
else
   CLOCK_tb<= not CLOCK_tb after 1 ns;
end if;
end process;

process
begin
start_tb<='0';
wait for 2 ns;
start_tb <= '1';
wait for 2 ns;

for i in 0 to 256 loop
data_in_tb<="00000101";
wait for 2 ns;
data_in_tb<="00001101";
wait for 2 ns;
data_in_tb<="00100100";
wait for 2 ns;
data_in_tb<="00000111";
wait for 2 ns;

--try overflow conditions
data_in_tb<="01000101";
wait for 2 ns;
data_in_tb<="11100100";
wait for 2 ns;
data_in_tb<="11000101";
wait for 2 ns;
end loop;

end process;
end behavior;




