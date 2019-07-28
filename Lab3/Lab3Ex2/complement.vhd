LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY complement is
PORT ( sel: in std_logic;
b_in: in signed(3 downto 0);
	b_out: out signed(3 downto 0));
end complement;

architecture behaviour of complement is
begin
process(sel, b_in)

variable v: signed(3 downto 0);
begin
v:=b_in;
if(sel='1') then
v(0):=not(v(0));
v(1):=not(v(1));
v(2):=not(v(2));
v(3):=not(v(3));

b_out<=v+"0001";
else
b_out<=b_in;
end if;
end process;
end behaviour;
