library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flasher is
port(SW: in std_logic;
CLOCK_50: in std_logic;
hex0: out std_logic_vector(0 to 6));
end flasher;

architecture behavior of flasher is

component decoder is
PORT ( m : IN unsigned(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END component;

component counter is
port(clear: in std_logic;
clock: in std_logic;
h_o: out unsigned(3 downto 0));
end component;

signal h_o_s: unsigned(3 downto 0);

begin 
count: counter PORT MAP(SW,CLOCK_50,h_o_s);
dec: decoder PORT MAP (h_o_s,hex0);

end behavior;
