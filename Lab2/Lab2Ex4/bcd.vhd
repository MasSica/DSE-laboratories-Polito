LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity bcd is
Port(
SW: in unsigned(5 downto 0);
HEX0, HEX1: out std_logic_vector(0 to 6)
);
End bcd;

Architecture behaviour of bcd is

component comparator is
PORT ( vC : IN UNSIGNED(5 DOWNTO 0);
zC : OUT UNSIGNED(3 downto 0));
end component;

component diff is
PORT ( a1 : IN UNSIGNED(5 DOWNTO 0); 
a2 : IN UNSIGNED(3 DOWNTO 0);
difference : OUT UNSIGNED(3 DOWNTO 0)
);
end component;

component decoder is
PORT ( m : IN UNSIGNED(3 DOWNTO 0);
bi : in std_logic;
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
end component;

signal comp_out: unsigned(3 downto 0);
signal diff_out: unsigned(3 downto 0);

Begin
comp0: comparator Port map(SW, comp_out);
diff0: diff Port map(SW, comp_out, diff_out);
dec0: decoder Port map(diff_out, '1', HEX0);
dec1: decoder Port map(comp_out, '0', HEX1);
  
end behaviour;
