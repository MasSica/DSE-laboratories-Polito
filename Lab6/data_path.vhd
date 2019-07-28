library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;

entity data_path is
port( x: in signed (7 downto 0);
clock: in std_logic;
clear: in std_logic;
sel: in std_logic_vector (2 downto 0);
mux_s: in std_logic;
y: out signed(7 downto 0)
);
end data_path;

architecture behavior of data_path is 

component twos IS
PORT ( input: in signed(7 downto 0);
sel: IN std_logic;
ovf: IN std_logic;
output : OUT signed(7 downto 0));
END component;

component mux IS
PORT ( in7: IN STD_LOGIC;
ovf: IN std_logic;
shift_out:in signed (7 downto 0);
output : OUT signed(7 downto 0));
END component;

component muxb IS
PORT ( sel: IN STD_LOGIC;
input: in signed(7 downto 0);
output : OUT signed(7 downto 0));
END component;

component shifter IS
PORT ( input : IN signed(7 downto 0);
sel: IN STD_LOGIC_VECTOR(1 downto 0);
output : OUT signed(7 downto 0);
ovf:out std_logic;
in7: out std_logic);
END component;

component adder is
PORT(add1, add2: in signed(7 downto 0); 
sum: out signed(7 downto 0); 
cin: in std_logic;
covf: out std_logic
);
end component;

component regn IS
GENERIC ( N : integer:=8); PORT (R : IN SIGNED(N-1 DOWNTO 0); -- modify to process 8 bits
Clock, Resetn : IN STD_LOGIC; Q : OUT SIGNED(N-1 DOWNTO 0));
END component;

signal x_s: signed(7 downto 0);
signal shifter_out: signed(7 downto 0);
signal over1_s: std_logic;
signal mux1_out: signed(7 downto 0);
signal twos_out: signed(7 downto 0);
signal reg_out: signed (7 downto 0);
signal sum_out: signed (7 downto 0);
signal mux2_out: signed(7 downto 0);
signal over2_s: std_logic;
signal x7: std_logic;
signal mux_in: std_logic;

BEGIN 

x7<=x(7);

mux0: muxb PORT MAP(mux_s, x, x_s);
shift: shifter PORT MAP(x_s,sel(1 downto 0),shifter_out,over1_s,x7);
mux1: mux PORT MAP(x(7),over1_s,shifter_out,mux1_out);
twos1: twos PORT MAP(mux1_out,sel(2),over1_s,twos_out);
adder1: adder PORT MAP(twos_out,reg_out,sum_out,'0',over2_s);
mux_in<=twos_out(7)and reg_out(7);
mux2: mux PORT MAP(mux_in,over2_s,sum_out,mux2_out);
regst: regn PORT MAP (mux2_out, clock, clear, reg_out);

y<= reg_out;

end behavior;

