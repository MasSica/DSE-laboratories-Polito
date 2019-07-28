LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity  partial_sel is
PORT( add1,add2: in signed (3 downto 0);
  sel: in std_logic;
  sum: out signed (3 downto 0);
  c_ovf: out std_logic;
  c_out: out std_logic
);
end partial_sel;
	  
architecture behavior of partial_sel is

signal sum0_s: signed(5 downto 0);
signal sum1_s: signed(5 downto 0);

component adder is
Port(add1, add2: in signed(3 downto 0); 
  cin: in std_logic;   
  sum: out signed(5 downto 0) --sum + carry(n-1) + carry(n)   
);
end component;

component mux is
PORT (sum0,sum1: in signed(5 downto 0);
        sel: in std_logic;
	c_ovf:out std_logic;
	c_out: out std_logic;
        sum_out: out signed(3 downto 0)
);
end component;

begin
adder0: adder PORT MAP (add1, add2, '0', sum0_s );
adder1: adder PORT MAP (add1, add2, '1', sum1_s );
mux0: mux PORT MAP (sum0_s, sum1_s, sel, c_ovf, c_out, sum);
end behavior;
