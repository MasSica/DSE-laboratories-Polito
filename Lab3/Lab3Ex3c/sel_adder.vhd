LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity sel_adder is
PORT( a,b: in signed (15 downto 0);
      c_in: in std_logic;
      result: out signed (15 downto 0);
      covf: out std_logic;      
      cout: out std_logic
);
	 
end sel_adder;

architecture behavior of sel_adder is

component partial_sel is
PORT( add1,add2: in signed (3 downto 0);
      sel: in std_logic;
      sum: out signed (3 downto 0);
      c_ovf: out std_logic;
      c_out: out std_logic
);
end component;

signal c_out_s: std_logic_vector(2 downto 0);	 
signal c_ovf_s: std_logic_vector(2 downto 0);
  
begin
	  
stage1: partial_sel PORT MAP (a(3 downto 0),b(3 downto 0), '0', result(3 downto 0),c_ovf_s(0),c_out_s(0));	  
stage2: partial_sel PORT MAP (a(7 downto 4),b(7 downto 4), c_out_s(0),result(7 downto 4),c_ovf_s(1),c_out_s(1));	  
stage3: partial_sel PORT MAP (a(11 downto 8),b(11 downto 8), c_out_s(1), result(11 downto 8),c_ovf_s(2),c_out_s(2));	  
stage4: partial_sel PORT MAP (a(15 downto 12),b(15 downto 12), c_out_s(2), result(15 downto 12),covf,cout);

end behavior;			
