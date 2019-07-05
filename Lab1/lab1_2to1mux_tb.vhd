LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mux2to1_tb IS
END mux2to1_tb;

ARCHITECTURE mux_a of mux2to1_tb is
signal x_tb: std_logic_vector(3 downto 0);
signal y_tb: std_logic_vector(3 downto 0);
signal s_tb: std_logic;
signal m_tb: std_logic_vector(3 downto 0);

COMPONENT mux_c
PORT (x: in std_logic_vector(3 downto 0);
y: in std_logic_vector(3 downto 0);
s: in std_logic;
m: out std_logic_vector(3 downto 0)
);
END COMPONENT;

BEGIN
uut: mux_c PORT MAP(
x => x_tb,
y => y_tb,
s => s_tb,
m => m_tb
);

PROCESS
BEGIN
s_tb <= '0';
x_tb <= "1010";
y_tb <= "0101";
wait for 400 ns;
s_tb <= '1';
wait;
END PROCESS;
END mux_a;
