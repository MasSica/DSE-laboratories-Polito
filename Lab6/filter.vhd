LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY filter is
PORT ( start: in std_logic;
clock: in std_logic;
data_in: in signed(7 downto 0);
data_out: out signed(7 downto 0);
done: out std_logic
);
END filter;


ARCHITECTURE behavior of filter is

component data_path is
port( x: in signed (7 downto 0);
clock: in std_logic;
clear: in std_logic;
sel: in std_logic_vector (2 downto 0);
mux_s: in std_logic;
y: out signed(7 downto 0)
);
end component;

component control_unit IS
PORT (start, clock: in std_logic;
address: out unsigned(9 downto 0);
cs_a,cs_b: out std_logic;
sel_a,sel_b: out std_logic;
factor: out std_logic_vector(2 downto 0);
mux_s, rst, done: out std_logic
);
END component;

component mem IS
PORT (data_in: in signed(7 downto 0);
address: in unsigned(9 downto 0);
clock, cs, wr, rd: in std_logic;
data_out: out signed(7 downto 0)
); 
END component;

signal x_s, y_s: signed(7 downto 0);
signal add_s: unsigned(9 downto 0);
signal sel_as, sel_bs, cs_as, cs_bs: std_logic;
signal wr_a, wr_b: std_logic;
signal factor_s: std_logic_vector(2 downto 0);
signal m_s, rst_s: std_logic;

BEGIN

wr_a <= not(sel_as);
mema: mem PORT MAP (data_in,add_s,clock,cs_as,wr_a, sel_as, x_s);
wr_b <= not(sel_bs);
memb: mem PORT MAP (y_s,add_s,clock,cs_bs,wr_b, sel_bs, data_out);
datapath: data_path PORT MAP (x_s, clock, rst_s, factor_s, m_s, y_s);
control: control_unit PORT MAP (start, clock, add_s, cs_as, cs_bs, sel_as, sel_bs, factor_s, m_s, rst_s, done);

end behavior;
	
