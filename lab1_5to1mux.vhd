LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab1_5to1mux IS
PORT (x: in std_logic_vector(2 downto 0);
y: in std_logic_vector(2 downto 0);
s: in std_logic_vector (2 downto 0);
m: out std_logic_vector(2 downto 0)
);
END lab1_5to1mux;

ARCHITECTURE behaviour of lab1_5to1mux IS

signal v: std_logic_vector(2 downto 0);
signal w: std_logic_vector(2 downto 0);
signal u: std_logic_vector(2 downto 0);

BEGIN
m(2) <= (NOT (s(2)) AND NOT (s(1)) AND NOT (s(0)) AND u(2)) OR (NOT (s(2)) AND NOT (s(1)) AND s(0) AND v(2)) 
OR (NOT (s(2)) AND s(1) AND NOT (s(0)) AND w(2)) OR (NOT (s(2)) AND s(1) AND s(0) AND x(2)) OR (s(2) AND y(2));
m(1) <= (NOT (s(2)) AND NOT (s(1)) AND NOT (s(0)) AND u(1)) OR (NOT (s(2)) AND NOT (s(1)) AND s(0) AND v(1)) 
OR (NOT (s(2)) AND s(1) AND NOT (s(0)) AND w(1)) OR (NOT (s(2)) AND s(1) AND s(0) AND x(1)) OR (s(2) AND y(1));
m(0) <= (NOT (s(2)) AND NOT (s(1)) AND NOT (s(0)) AND u(0)) OR (NOT (s(2)) AND NOT (s(1)) AND s(0) AND v(0)) 
OR (NOT (s(2)) AND s(1) AND NOT (s(0)) AND w(0)) OR (NOT (s(2)) AND s(1) AND s(0) AND x(0)) OR (s(2) AND y(0));

v <= "010";
u <= "101";
w <= "111";

END behaviour;
