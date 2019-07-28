LIBRARY ieee;
USE ieee.std_logic_1164.all; USE ieee.numeric_std.all;

ENTITY overflow IS
PORT( c_in, c_out: in std_logic;
	flag: out std_logic);
end overflow;

ARCHITECTURE behaviour of overflow is
begin
flag <= c_in xor c_out;
end behaviour;