LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY control_unit IS
PORT (start, clock: in std_logic;
address: out unsigned(9 downto 0);
cs_a,cs_b: out std_logic;
sel_a,sel_b: out std_logic;
factor: out std_logic_vector(2 downto 0);
mux_s, rst: out std_logic
);
END control_unit;

ARCHITECTURE Behavior OF control_unit IS

TYPE State_type IS (A, B, C, D, E, F, G, H);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next state
signal flag, index: unsigned(10 downto 0);

BEGIN

PROCESS (start, clock, y_Q, flag, index) -- state table
BEGIN

CASE y_Q IS

WHEN A => IF(start = '1' ) THEN Y_D <= B;
ELSE Y_D <= A;
END IF;

WHEN B => IF(flag ="00000001000") THEN Y_D <= C;
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

WHEN G => IF(rising_edge(clock)) THEN

IF(index = "00000001000") THEN Y_D <= A;
ELSE Y_D <= C;
END IF;

ELSE
Y_D <= G;
END IF;

WHEN others => Y_D <= A;

END CASE;
END PROCESS; -- state table

PROCESS(y_Q, y_D, clock, flag, index)
begin

if (y_Q = B and rising_edge(clock))then
flag<=flag+1;

elsif(y_Q = G and rising_edge(clock)) then
index<=index+1;

else
Y_Q<=Y_D;

end if;
END PROCESS;

PROCESS(clock, y_Q, flag, index)
begin

if(y_Q = A) then 
cs_a<='0';
cs_b<='0';
rst<='0';
flag<="00000000000";
index<="00000000000";

elsif(y_Q = B) then
cs_a<='1';
cs_b<='0';
sel_a<='0';
rst<='1';
address<=flag(9 downto 0);

elsif(y_Q = C) then
cs_a<='1';
cs_b<='0';
sel_a<='1';
rst<='1';
address<= index(9 downto 0); 
mux_s<='1';
factor <= "101";

elsif(y_Q = D) then
cs_a<='1';
cs_b<='0';
sel_a<='1';
rst<='1';
factor <= "110";
if index ="00000000000" then
mux_s<='0';

else 
address<= index(9 downto 0)-1;
mux_s<='1';

end if;

elsif(y_Q = E) then
cs_a<='1';
cs_b<='0';
sel_a<='1';
rst<='1';
factor <= "011";
if index =("00000000000")OR index =("00000000001") then
mux_s<='0';

else 
address<= index(9 downto 0)-2;
mux_s<='1';

end if;

elsif(y_Q = F) then
cs_a<='1';
cs_b<='0';
sel_a<='1';
rst<='1';
factor <= "000";

if index=("00000000000")OR index=("00000000001")OR index=("000000000010") then
mux_s<='0';

else 
address<= index(9 downto 0)-3;
mux_s<='1';

end if;

elsif(y_Q = G) then
cs_a<='0';
cs_b<='1';
sel_b<='0';
rst<='1';
address<= index(9 downto 0);

else
cs_a<='0';
cs_b<='0';
rst<='0';
flag<="00000000000";
index<="00000000000";

end if;
END PROCESS;

end Behavior;

