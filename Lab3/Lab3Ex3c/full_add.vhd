LIBRARY ieee;
USE ieee.std_logic_1164.all; USE ieee.numeric_std.all;
ENTITY full_add is
PORT (a,b,c_in: in std_logic;
	c_out,s: out std_logic);
end full_add;

architecture behaviour of full_add is
BEGIN
s <= a xor b xor c_in;
c_out <= (a and b) or (c_in and  (a xor b));
end behaviour;