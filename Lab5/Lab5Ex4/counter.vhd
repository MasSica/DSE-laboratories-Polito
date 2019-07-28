library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port( clear: in std_logic;
clock: in std_logic;
h_o: out std_logic);
end counter;

architecture behavior of counter is
begin

process(clock, clear)

variable v: unsigned(25 downto 0);

begin 

if(rising_edge(clock))then

if(clear = '0') then
v:=(others=>'0');
end if;

--0000000000000000000001011 used for simulation in order to reduce simulation time
--10111110101111000010000000 
if(v="10111110101111000010000000") then
h_o<='1';
v:=(others=>'0');

else
v:=1+v;
h_o<='0';

end if;
end if;
end process;
end behavior;

