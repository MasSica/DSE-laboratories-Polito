LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity propagate is
Port(a, b, c: in std_logic;
	p: out std_logic
);
End propagate;

Architecture behav of propagate is

Begin
p <= (a or b or c) and (not(a and b and c));
end behav;
