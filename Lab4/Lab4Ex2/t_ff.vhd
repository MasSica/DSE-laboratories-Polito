library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff is
port( t: in std_logic;
clock: in std_logic;
clear: in std_logic;
Q: out std_logic);
end t_ff;

architecture Behavior of t_ff is

begin

process (clock, clear, t)
variable tmp: std_logic;

begin

if (clock'event and clock='1') then
if clear = '1' then 
tmp:='0';
end if;

if t='1' then
tmp := not (tmp);
end if;
end if;

Q <= tmp;

end process;
end Behavior;
