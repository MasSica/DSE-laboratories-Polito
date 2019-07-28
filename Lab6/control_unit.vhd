LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY control_unit IS
PORT (start, clock: in std_logic;
address: out unsigned(9 downto 0);
cs_a,cs_b: out std_logic;
sel_a,sel_b: out std_logic;
factor: out std_logic_vector(2 downto 0);
mux_s, rst, done: out std_logic
);
END control_unit;

ARCHITECTURE Behavior OF control_unit IS

TYPE State_type IS (A, B, C, D, E, F, G, H);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next state
signal flag_s, index_s: unsigned(10 downto 0);

BEGIN

PROCESS (start, clock, y_Q, flag_s, index_s) -- state table
BEGIN

CASE y_Q IS

WHEN A => IF(start = '1' ) THEN Y_D <= B;
ELSE Y_D <= A;
END IF;

--00000001000 used in simulation to avoid long time
WHEN B => IF(flag_s ="10000000000") THEN Y_D <= C;
ELSE Y_D <= B;
END IF;

WHEN C => IF(rising_edge(clock)) THEN Y_D <= D;
ELSE Y_D <= C;
END IF;

WHEN D => IF(rising_edge(clock)) THEN Y_D <= E;
ELSE Y_D <= D;
END IF;

WHEN E => IF(rising_edge(clock)) THEN Y_D <= F;
ELSE Y_D <= E;
END IF;

WHEN F => IF(rising_edge(clock)) THEN Y_D <= G;
ELSE Y_D <= F;
END IF;

--00000000111 used in simulation to avoid long time
WHEN G => IF(index_s = "01111111111") THEN Y_D <= A;
ELSE Y_D <= H;
END IF;

WHEN H => IF(rising_edge(clock)) THEN Y_D <= C;
ELSE Y_D <= H;
END IF;

WHEN others => Y_D <= A;

END CASE;
END PROCESS; -- state table


PROCESS(clock)
variable flag: unsigned(10 downto 0);
variable index:unsigned(10 downto 0);
begin

case y_Q is

when A =>
done<='1';
cs_a<='0';
cs_b<='0';
rst<='0';
flag:="11111111111";
index:="00000000000";
address<=flag(9 downto 0);

when B =>
done<='0';
rst<='1';
cs_a<='1';
cs_b<='0';
sel_a<='0';
address<=flag(9 downto 0);

if (rising_edge(clock))then
flag:=flag+1;
end if;

when C =>
rst<='1';
cs_a<='1';
cs_b<='0';
sel_a<='1';
factor <= "101";
address<= index(9 downto 0); 
mux_s<='1';

when D =>
rst<='1';
cs_a<='1';
cs_b<='0';
sel_a<='1';
factor <= "110";

if index ="00000000000" then
mux_s<='0';
else 
address<= index(9 downto 0)-1;
mux_s<='1';
end if;

when E =>
rst<='1';
cs_a<='1';
cs_b<='0';
sel_a<='1';
factor <= "011";

if index="00000000000" OR index="00000000001" then
mux_s<='0';
else 
address<= index(9 downto 0)-2;
mux_s<='1';
end if;

when F =>
rst<='1';
cs_a<='1';
cs_b<='0';
sel_a<='1';
factor <= "000";

if index="00000000000" OR index="00000000001" OR index="000000000010" then
mux_s<='0';
else 
address<= index(9 downto 0)-3;
mux_s<='1';
end if;

when G =>
rst<='1';
cs_a<='0';
cs_b<='1';
sel_b<='0';
address<= index(9 downto 0);

if(rising_edge(clock)) then
index:=index+1;
end if;

when H =>
rst<='0';
cs_a<='0';
cs_b<='0';

when others =>
rst<='0';
cs_a<='0';
cs_b<='0';
flag:="11111111111";
index:="00000000000";
address<=flag(9 downto 0);

end case;

flag_s <= flag;
index_s <= index;
Y_Q<=Y_D;

END PROCESS;
end Behavior;


