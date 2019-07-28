LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity part is
Port(add1_p, add2_p: in signed(3 downto 0);
cin_p: in std_logic;
cout_p: out std_logic;
sum_p: out signed(3 downto 0);
c_ovf: out std_logic
);
end part;

Architecture behav of part is

Component adder is
Port(add1, add2: in signed(3 downto 0); 
sum: out signed(3 downto 0); 
cin: in std_logic;
cout: out std_logic_vector(3 downto 0)
);
end component;

Component propagate_all is
Port (add1, add2: in signed(3 downto 0);
carry:in std_logic_vector(3 downto 0);
prop: out std_logic
);
end component;

Component mux is
PORT (cin_prev, cin_next: in std_logic;
sel: in std_logic;
cout: out std_logic
);
end component;

signal carry: std_logic_vector(3 downto 0);
signal p: std_logic;

begin
adder0: adder Port map(add1_p, add2_p, sum_p, cin_p, carry);
prop0: propagate_all Port map(add1_p, add2_p, carry, p);
mux0: mux Port map(cin_p, carry(3), p, cout_p);

c_ovf <= carry(2);

end behav;
