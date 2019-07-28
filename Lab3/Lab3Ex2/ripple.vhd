LIBRARY ieee;
USE ieee.std_logic_1164.all;		
USE ieee.numeric_std.all;

entity ripple is  
PORT (SW:in SIGNED (8 downto 0); --A e B
	LEDR: out std_logic; --overflow
	HEX0, HEX1, HEX2: out std_logic_vector(0 to 6);
  KEY: in std_logic_vector(1 downto 0)
); --reset and clock
end ripple;

architecture behaviour of ripple is

component regn is
GENERIC ( N : integer:=4); --serve per poter definire un registro con un numero di input e  output variabile, pag 430

PORT (R : IN SIGNED (N-1 DOWNTO 0);
Clock, Resetn : IN STD_LOGIC; 
Q : OUT SIGNED(N-1 DOWNTO 0));
end  component;

component overflow is
PORT( c_in, c_out: in std_logic;
	flag: out std_logic);
end component;

component complement is 
PORT ( sel: in std_logic;
b_in: in signed(3 downto 0);
b_out: out signed(3 downto 0));
end component;

component flipflop is
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
end component;

component adder is
  Port(add1, add2: in signed(3 downto 0);
    sum: out signed(3 downto 0);
    cin: in std_logic;
    cout: out std_logic;
    c_ovf: out std_logic
  );
end component;

component decoder is
PORT ( m : IN signed(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END component;

signal A_add: signed (3 downto 0);
signal B_add: signed (3 downto 0);
signal s_s: signed(3 downto 0); -- output bit dell'adder 
signal c_out_s: std_logic;
signal c_ovf_s: std_logic;
signal flag_s: std_logic;
signal s_dec: signed(3 downto 0); --output vector final register
signal B_add_compl:signed (3 downto 0);

begin

regn1: regn PORT MAP (sw(3 downto 0), KEY(1), KEY(0), A_add);
regn2: regn PORT MAP (sw(7 downto 4), KEY(1), KEY(0), B_add);	
compl: complement PORT MAP (sw(8),B_add,B_add_compl);
adder1: adder PORT MAP (A_add, B_add_compl, s_s, '0', c_out_s, c_ovf_s);
regn3: regn PORT MAP (s_s, KEY(1), KEY(0), s_dec);
overflow_det: overflow PORT MAP (c_ovf_s, c_out_s, flag_s);  
flip_flop: flipflop PORT MAP (flag_s, KEY(1), KEY(0), LEDR);
DEC_A: decoder PORT MAP(sw(3 downto 0),HEX0);
DEC_B: decoder  PORT MAP(sw(7 downto 4 ), HEX1);
DEC_S: decoder PORT MAP(s_dec, HEX2);

end behaviour;
