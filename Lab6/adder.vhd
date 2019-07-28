LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity adder is
  Port(add1, add2: in signed(7 downto 0); 
    sum: out signed(7 downto 0); 
    cin: in std_logic;
    covf: out std_logic
  );
end adder;

Architecture behaviour of adder is

signal carry: std_logic_vector(7 downto 0); 

Component full_add is
PORT (a,b,c_in: in std_logic;
	c_out,s: out std_logic);
end component;

begin
fa1: full_add PORT MAP (add1(0), add2(0), cin, carry(0), sum(0) );
fa2: full_add PORT MAP (add1(1), add2(1), carry(0), carry(1), sum(1) );
fa3: full_add PORT MAP (add1(2), add2(2), carry(1), carry(2), sum(2) );
fa4: full_add PORT MAP (add1(3), add2(3), carry(2), carry(3), sum(3) );
fa5: full_add PORT MAP (add1(4), add2(4), carry(3), carry(4), sum(4) );
fa6: full_add PORT MAP (add1(5), add2(5), carry(4), carry(5), sum(5) );
fa7: full_add PORT MAP (add1(6), add2(6), carry(5), carry(6), sum(6) );
fa8: full_add PORT MAP (add1(7), add2(7), carry(6), carry(7), sum(7) );

covf <= carry(6) xor carry(7);
  
end behaviour;
