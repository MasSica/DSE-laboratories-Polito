LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

entity sel_adder_top is  
PORT (SW:in SIGNED (31 downto 0); --A e B
LEDR: out std_logic; --overflow
KEY: in std_logic_vector(1 downto 0)); --reset and clock
end sel_adder_top;

architecture behaviour of sel_adder_top is

component regn is
GENERIC ( N : integer:=16);
PORT (R : IN SIGNED (N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC; 
Q : OUT SIGNED(N-1 DOWNTO 0));
end  component;

component flipflop is
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
end component;

component overflow IS
PORT( c_in, c_out: in std_logic;
	flag: out std_logic);
end component;

component sel_adder is
PORT( a,b: in signed (15 downto 0);
      c_in: in std_logic;
      result: out signed (15 downto 0);
      covf: out std_logic;  
      cout: out std_logic
);
end component;

signal A_add: signed (15 downto 0);
signal B_add: signed (15 downto 0);
signal s_s: signed(15 downto 0); -- output dell'adder 
signal c_out_s: std_logic;
signal c_ovf_s: std_logic;
signal flag_s: std_logic;
signal s_dec: signed(15 downto 0); --output vector final register

begin

regn1: regn PORT MAP (sw(31 downto 16), KEY(1), KEY(0), A_add);
regn2: regn PORT MAP (sw(15 downto 0), KEY(1), KEY(0), B_add);	
seladder0: sel_adder PORT MAP (A_add, B_add, '0', s_s, c_ovf_s, c_out_s);
regn3: regn PORT MAP (s_s, KEY(1), KEY(0), s_dec);
overflow_det: overflow PORT MAP (c_ovf_s, c_out_s, flag_s);  
flip_flop: flipflop PORT MAP (flag_s, KEY(1), KEY(0), ledr);

end behaviour;
