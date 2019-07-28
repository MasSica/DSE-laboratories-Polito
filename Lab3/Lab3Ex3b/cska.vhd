LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity cska is
Port(a1, a2: in signed(15 downto 0);
c0: in std_logic;
s: out signed(15 downto 0);
c15: out std_logic;
c16: out std_logic
);
end cska;

Architecture behaviour of cska is

Component part is
Port(add1_p, add2_p: in signed(3 downto 0);
cin_p: in std_logic;
cout_p: out std_logic;
sum_p: out signed(3 downto 0);
c_ovf: out std_logic
);
end component;

signal carry: std_logic_vector(2 downto 0);
signal ovf_s: std_logic_vector(3 downto 0);

begin
part0: part Port map(a1(3 downto 0), a2(3 downto 0), c0, carry(0), s(3 downto 0), ovf_s(0));
part1: part Port map(a1(7 downto 4), a2(7 downto 4), carry(0), carry(1), s(7 downto 4), ovf_s(1));
part2: part Port map(a1(11 downto 8), a2(11 downto 8), carry(1), carry(2), s(11 downto 8), ovf_s(2));
part3: part Port map(a1(15 downto 12), a2(15 downto 12), carry(2), c16, s(15 downto 12), ovf_s(3));

c15 <= ovf_s(3);

end behaviour;
