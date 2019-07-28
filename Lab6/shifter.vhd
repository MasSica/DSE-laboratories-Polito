LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY shifter IS
PORT ( input : IN signed(7 downto 0);
sel: IN STD_LOGIC_VECTOR(1 downto 0);
output : OUT signed(7 downto 0);
ovf:out std_logic;
in7: out std_logic);
END shifter;

ARCHITECTURE Behavior OF shifter IS
BEGIN

process(input,sel)

variable tmp_in: signed(7 downto 0);
variable tmp_out: signed(7 downto 0);

begin

tmp_in := input;

if tmp_in(7)='1' then 
tmp_in := NOT tmp_in + 1 ;
end if;

if sel = "00" then
tmp_out := "00" & tmp_in(7 downto 2);
elsif sel = "01" then
tmp_out := '0'  & tmp_in(7 downto 1);
elsif sel = "10" then
tmp_out := tmp_in(6 downto 0)  & '0';
else
tmp_out := tmp_in(5 downto 0)  & "00";
end if;

if input(7) ='1' then
tmp_out := NOT tmp_out +1;
end if;

output <= tmp_out;
ovf <= (not(tmp_in(6)) and tmp_in(5) and sel(1) and sel(0)) OR (tmp_in(6) and sel(1));
in7 <= input(7);

end process;
END Behavior;
