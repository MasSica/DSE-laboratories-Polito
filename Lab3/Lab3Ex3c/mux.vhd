LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY mux is
PORT (sum0,sum1: in signed(5 downto 0);
        sel: in std_logic;
	c_out: out std_logic;
	c_ovf:out std_logic;
        sum_out: out signed(3 downto 0)
);
end mux;

architecture behavior of mux is 

begin

with sel select

sum_out <= sum0(3 downto 0)  when '0',
           sum1(3 downto 0)  when others;
	   
with sel select

c_ovf   <= sum0(4) when '0',
           sum1(4) when others;

with sel select

c_out   <= sum0(5) when '0',
           sum1(5) when others;

end behavior;
