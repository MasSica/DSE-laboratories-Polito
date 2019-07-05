LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY five_to_one_mux_tb IS
END five_to_one_mux_tb;

ARCHITECTURE mux_a of five_to_one_mux_tb is
signal x_tb: std_logic_vector(2 downto 0);
signal y_tb: std_logic_vector(2 downto 0);
signal v_tb: std_logic_vector(2 downto 0);
signal s_tb: std_logic_vector (2 downto 0);
signal u_tb: std_logic_vector(2 downto 0);
signal w_tb: std_logic_vector(2 downto 0);
signal m_tb: std_logic_vector(2 downto 0);

COMPONENT five_to_one_mux
PORT (x: in std_logic_vector(2 downto 0);
y: in std_logic_vector(2 downto 0);
s: in std_logic_vector(2 downto 0);
v: in std_logic_vector(2 downto 0);
u: in std_logic_vector(2 downto 0);
w: in std_logic_vector(2 downto 0);
m: out std_logic_vector( 2 downto 0)
);
END COMPONENT;

BEGIN
uut: five_to_one_mux PORT MAP(
x => x_tb,
y => y_tb,
s => s_tb,
v => v_tb,
u => u_tb,
w => w_tb,
m => m_tb
);

PROCESS
BEGIN
s_tb <= "000";

u_tb <= "101";
v_tb <= "010";
w_tb <= "111";
x_tb <="011";
y_tb <= "100";

wait for 400 ns;
s_tb <= "001";

wait for 400 ns;
s_tb <= "010";

wait for 400 ns;
s_tb <= "011";

wait for 400 ns;
s_tb <= "100";

wait for 400 ns;
s_tb <= "101";

wait for 400 ns;
s_tb <= "110";

wait for 400 ns;
s_tb <= "111";

wait;
END PROCESS;
END mux_a;

