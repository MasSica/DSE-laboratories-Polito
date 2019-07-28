library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port( clear: in std_logic;
clock: in std_logic;
stop:in std_logic;
time_d:in unsigned (7 downto 0);
led: out std_logic;
h_o:out unsigned(15 downto 0)
);

end counter;

architecture behavior of counter is
begin

process(clock, clear, time_d,stop)

variable v1: unsigned(7 downto 0);
variable s1: std_logic;
variable v2: unsigned(15 downto 0);
variable s2: std_logic;
variable h: unsigned(15 downto 0);

begin 

if(rising_edge(clock))then

if(clear = '1') then
v1:=(others=>'0');
v2:=(others=>'0');
led<='0';
s1:='0';
s2:='0';
h:=(others=>'0');
end if;

if (v1=time_d and s1='0') then
led<='1';
v1:=(others=>'0');
s1:='1';
end if;

if(s1='0') then
v1:=v1+1;
end if;

if(stop = '1') then 
s2:='1';
led<='0';
end if;

if(s2='0' and s1='1')then

--"0000000000010000" used for simulation to avoid long simulation times
if(v2="1100001101010000") then  
h:=h+1;
v2:=(others=>'0');

else
v2:=1+v2;
end if;

end if;
end if;

h_o<=h;

end process;
end behavior;

