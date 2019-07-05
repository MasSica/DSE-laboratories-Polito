LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab1_2to1mux IS
PORT (SW: in std_logic_vector(8 downto 0);
LEDR: out std_logic_vector(3 downto 0)
);
END lab1_2to1mux;

ARCHITECTURE behaviour of lab1_2to1mux IS
BEGIN
LEDR(0) <= (NOT (SW(8)) AND SW(0)) OR (SW(8) AND SW(4));
LEDR(1) <= (NOT (SW(8)) AND SW(1)) OR (SW(8) AND SW(5));
LEDR(2) <= (NOT (SW(8)) AND SW(2)) OR (SW(8) AND SW(6));
LEDR(3) <= (NOT (SW(8)) AND SW(3)) OR (SW(8) AND SW(7));
END behaviour;
