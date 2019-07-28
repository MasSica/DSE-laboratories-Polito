LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

Entity adder is
  Port(add1, add2: in signed(15 downto 0); --16 bits
    sum: out signed(15 downto 0); -- 16 bits
    cin: in std_logic;
    cout: out std_logic;
    c_ovf: out std_logic
  );
end adder;

Architecture behaviour of adder is

signal carry: std_logic_vector(14 downto 0); --carry with 16 bits

Component full_add is
PORT (a,b,c_in: in std_logic;
	c_out,s: out std_logic);
end component;

begin
fa1: full_add PORT MAP  (add1(0), add2(0), cin, carry(0), sum(0) );
fa2: full_add PORT MAP  (add1(1), add2(1), carry(0), carry(1), sum(1) );
fa3: full_add PORT MAP  (add1(2), add2(2), carry(1), carry(2), sum(2) );
fa4: full_add PORT MAP  (add1(3), add2(3), carry(2), carry(3), sum(3) );
fa5: full_add PORT MAP  (add1(4), add2(4), carry(3), carry(4), sum(4) );
fa6: full_add PORT MAP  (add1(5), add2(5), carry(4), carry(5), sum(5) );
fa7: full_add PORT MAP  (add1(6), add2(6), carry(5), carry(6), sum(6) );
fa8: full_add PORT MAP  (add1(7), add2(7), carry(6), carry(7), sum(7) );
fa9: full_add PORT MAP  (add1(8), add2(8), carry(7), carry(8), sum(8) );
fa10: full_add PORT MAP (add1(9), add2(9), carry(8), carry(9), sum(9) );
fa11: full_add PORT MAP (add1(10), add2(10), carry(9), carry(10), sum(10) );
fa12: full_add PORT MAP (add1(11), add2(11), carry(10), carry(11), sum(11) );
fa13: full_add PORT MAP (add1(12), add2(12), carry(11), carry(12), sum(12) );
fa14: full_add PORT MAP (add1(13), add2(13), carry(12), carry(13), sum(13) );
fa15: full_add PORT MAP (add1(14), add2(14), carry(13), carry(14), sum(14) );
fa16: full_add PORT MAP (add1(15), add2(15), carry(14), cout, sum(15) );

c_ovf <= carry(14);
  
end behaviour;
