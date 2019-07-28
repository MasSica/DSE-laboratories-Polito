library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reaction is
port( SW: in unsigned (7 downto 0);
clock_50: in std_logic;
KEY0,KEY3:in std_logic;
LEDR0: out std_logic;
HEX3,HEX2,HEX1,HEX0:out std_logic_vector(0 to 6)
);
end reaction;

architecture behavior of reaction is 

component counter is
port( clear: in std_logic;
clock: in std_logic;
stop:in std_logic;
time_d:in unsigned (7 downto 0);
led: out std_logic;
h_o:out unsigned(15 downto 0)
);
end component;

component decoder IS
PORT ( m : IN unsigned(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END component;

signal h_o_s: unsigned(15 downto 0);

begin

count: counter PORT MAP (KEY0,clock_50,KEY3,sw(7 downto 0),LEDR0,h_o_s);
dec0: decoder PORT MAP (h_o_s(3 downto 0),HEX0);
dec1: decoder PORT MAP (h_o_s(7 downto 4),HEX1);
dec2: decoder PORT MAP (h_o_s(11 downto 8),HEX2);
dec3: decoder PORT MAP (h_o_s(15 downto 12),HEX3);

end behavior;
