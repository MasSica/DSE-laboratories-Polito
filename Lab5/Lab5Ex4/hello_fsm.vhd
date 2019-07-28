library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hello_fsm is
port( KEY: in std_logic_vector(0 downto 0);
CLOCK_50: in std_logic;
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5: out std_logic_vector (0 to 6));
end hello_fsm;

architecture behavior of hello_fsm is

component counter is
port( clear: in std_logic;
clock: in std_logic;
h_o: out std_logic);
end component;

component regn IS
GENERIC ( N : integer:=7); PORT (R : IN  std_logic_vector(N-1 DOWNTO 0);
Clock, Resetn, en : IN STD_LOGIC; Q : OUT  std_logic_vector(N-1 DOWNTO 0));
END component;

component two_process_fsm IS
PORT (w :in std_logic;
Clock:in std_logic;
Clear:in std_logic;
regin:in std_logic_vector(0 to 6);
z :out std_logic_vector(0 to 6));
END component ;

signal w_s: std_logic;
signal reg0_s: std_logic_vector(0 to 6);
signal reg1_s: std_logic_vector(0 to 6);
signal reg2_s: std_logic_vector(0 to 6);
signal reg3_s: std_logic_vector(0 to 6);
signal reg4_s: std_logic_vector(0 to 6);
signal reg5_s: std_logic_vector(0 to 6);
signal reg6_s: std_logic_vector(0 to 6);


begin



c1: counter PORT MAP (KEY(0), CLOCK_50,w_s );
fsm: two_process_fsm PORT MAP(w_s,CLOCK_50,KEY(0), reg6_s, reg0_s);
reg0: regn PORT MAP (reg0_s, Clock_50, KEY(0),w_s,reg1_s);
reg1: regn PORT MAP (reg1_s, Clock_50, KEY(0),w_s,reg2_s);
reg2: regn PORT MAP (reg2_s, Clock_50, KEY(0),w_s,reg3_s);
reg3: regn PORT MAP (reg3_s, Clock_50, KEY(0),w_s,reg4_s);
reg4: regn PORT MAP (reg4_s, Clock_50, KEY(0),w_s,reg5_s);
reg5: regn PORT MAP (reg5_s, Clock_50, KEY(0),w_s,reg6_s);


hex0<= not reg1_s;
hex1<= not reg2_s;
hex2<= not reg3_s;
hex3<= not reg4_s;
hex4<= not reg5_s;
hex5<= not reg6_s;


end behavior;
