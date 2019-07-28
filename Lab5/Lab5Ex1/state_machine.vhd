LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY state_machine IS
PORT (SW: in std_logic_vector (1 downto 0);
 KEY : IN STD_LOGIC_vector(0 downto 0);
LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END state_machine;

architecture behavior of state_machine is

component flipflop IS
PORT (D, Clock, Resetn : IN STD_LOGIC;
Q : OUT STD_LOGIC);
END component;

signal o_s: std_logic_vector(8 downto 0);
signal b_in: std_logic;
signal c_in: std_logic;
signal d_in: std_logic;
signal e_in: std_logic;
signal f_in: std_logic;
signal g_in: std_logic;
signal h_in: std_logic;
signal i_in: std_logic;
signal a_out: std_logic;

BEGIN 
a: flipflop PORT MAP(SW(0),KEY(0),SW(0),a_out);
o_s(0)<=not a_out;
b_in <= (o_s(0) and (not SW(1)))OR(o_s(5) and (not SW(1)))OR(o_s(6)and not(SW(1)))OR(o_s(7) and not(SW(1)))OR(o_s(8) and not(SW(1)));
b: flipflop PORT MAP(b_in,key(0),SW(0),o_s(1));
c_in <= o_s(1)and not(SW(1));
c: flipflop PORT MAP(c_in,key(0),SW(0),o_s(2));
d_in <= o_s(2)and not(SW(1));
d: flipflop PORT MAP(d_in,key(0),SW(0),o_s(3));
e_in <= (o_s(3)and not(SW(1))) OR (o_s(4) and not(SW(1)));
e: flipflop PORT MAP(e_in,key(0),SW(0),o_s(4));
f_in <= (o_s(0) and SW(1))OR(o_s(1) and SW(1))OR(o_s(2)and SW(1))OR(o_s(3) and SW(1))OR(o_s(4) and SW(1));
f: flipflop PORT MAP(f_in,key(0),SW(0),o_s(5));
g_in<= o_s(5) and SW(1);
g: flipflop PORT MAP(g_in,key(0),SW(0),o_s(6));
h_in<= o_s(6) and SW(1);
h: flipflop PORT MAP(h_in,key(0),SW(0),o_s(7));
i_in<= (o_s(7)and SW(1)) OR (o_s(8) and SW(1));
i: flipflop PORT MAP(i_in,key(0),SW(0),o_s(8));

LEDR(0)<=o_s(4)OR o_s(8);

end behavior;
