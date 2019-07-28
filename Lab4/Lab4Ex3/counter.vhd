library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port( clear: in std_logic;
clock: in std_logic;
h_o: out unsigned(3 downto 0));
end counter;

architecture behavior of counter is
begin

process(clock, clear)

variable v: unsigned(25 downto 0);
variable h: unsigned(3 downto 0);

begin 

if(rising_edge(clock))then

if(clear = '1') then
v:=(others=>'0');
h:=(others=>'0');
end if;

--0000000000000000000001011 used for simulation in order to reduce simulation time
if(v="10111110101111000010000000") then
h:=h+1;
if(h="1010") then
h:="0000";
end if;
v:=(others=>'0');

else
v:=1+v;

end if;
end if;

h_o<=h;
end process;
end behavior;

