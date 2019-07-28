LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT (
x: in std_logic;
y: in std_logic;
z: in std_logic;
m: out std_logic
);
END mux;

ARCHITECTURE behaviour of mux IS
BEGIN
m <= (NOT (z) AND x) OR (z AND y);

END behaviour;
