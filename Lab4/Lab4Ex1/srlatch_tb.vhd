LIBRARY ieee;
USE ieee.std_logic_1164.all;

Entity srlatch_tb is
end srlatch_tb;

Architecture behaviour of srlatch_tb is

component srlatch IS
PORT ( Clk, R, S : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END component;

signal ck_tb, r_tb, s_tb, q_tb: std_logic;

begin
latch: srlatch port map(ck_tb, r_tb, s_tb, q_tb);

process
begin
r_tb <= '0';
s_tb <= '0';
wait for 35 ns;
s_tb <= '1';
wait for 22 ns;
s_tb <= '0';
wait for 14 ns;
r_tb <= '1';
wait;
end process;

process(ck_tb)
begin
if ck_tb='U' then
   ck_tb<='0' after 10 ns; 
else
   ck_tb<= not ck_tb after 10 ns;
end if;
end process;

end behaviour;
