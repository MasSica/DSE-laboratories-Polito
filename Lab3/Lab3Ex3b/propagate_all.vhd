LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity propagate_all is
Port (add1, add2: in signed(3 downto 0);
carry:in std_logic_vector(3 downto 0);
prop: out std_logic
);
end propagate_all;

Architecture behav of propagate_all is

signal prop_s: std_logic_vector(3 downto 0);

Component propagate is
Port(a, b, c: in std_logic;
	p: out std_logic
);
End component;

Begin
p0: propagate Port map(add1(0), add2(0), carry(0), prop_s(0));
p1: propagate Port map(add1(1), add2(1), carry(1), prop_s(1));
p2: propagate Port map(add1(2), add2(2), carry(2), prop_s(2));
p3: propagate Port map(add1(3), add2(3), carry(3), prop_s(3));

prop <= prop_s(0) and prop_s(1) and prop_s(2) and prop_s(3);

end behav;
