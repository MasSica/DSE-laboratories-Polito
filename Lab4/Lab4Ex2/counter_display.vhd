library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_display is
port( SW: in std_logic_vector(1 downto 0);
KEY0: in std_logic;
HEX0,HEX1,HEX2,HEX3: out std_logic_vector(0 to 6)
);
end counter_display;

architecture behavior of counter_display is

component counter is 
port( enable: in std_logic;
clock: in std_logic;
clear: in std_logic;
Q: out std_logic_vector(0 to 15));
end component;

component decoder IS
PORT ( m : IN std_logic_vector(0 TO 3);
bi : in std_logic;
Display : OUT STD_LOGIC_VECTOR(0 TO 6);
bi_out: out std_logic
);
END component;

signal Q_top: std_logic_vector(0 to 15);
signal bi_out_s: std_logic_vector(3 downto 0);

begin
count: counter PORT MAP (SW(1),KEY0,SW(0),Q_top);
dec4: decoder PORT MAP(Q_top(12 to 15),'0',HEX3,bi_out_s(3));
dec3: decoder PORT MAP(Q_top(8 to 11),bi_out_s(3),HEX2,bi_out_s(2));
dec2: decoder PORT MAP(Q_top(4 to 7),bi_out_s(2),HEX1,bi_out_s(1));
dec1: decoder PORT MAP(Q_top(0 to 3),'1',HEX0, bi_out_s(0));


end behavior;
