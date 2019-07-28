LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity adder is
  Port(add1, add2: in signed(3 downto 0);
    sum: out signed(3 downto 0);
    cin: in std_logic;
    cout: out std_logic;
    c_ovf: out std_logic
  );
end adder;

Architecture behaviour of adder is

signal carry: std_logic_vector(2 downto 0);

Component full_add is
PORT (a,b,c_in: in std_logic;
	c_out,s: out std_logic);
end component;

begin
fa1: full_add PORT MAP (add1(0), add2(0), cin, carry(0), sum(0) );
fa2: full_add PORT MAP (add1(1), add2(1), carry(0), carry(1), sum(1) );
fa3: full_add PORT MAP (add1(2), add2(2), carry(1), carry(2), sum(2) );
fa4: full_add PORT MAP (add1(3), add2(3), carry(2), cout, sum(3) );
c_ovf <= carry(2);
  
end behaviour;