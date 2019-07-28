LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two_process_fsm IS
PORT (w :in std_logic;
Clock:in std_logic;
Clear:in std_logic;
regin:in std_logic_vector(0 to 6);
z :out std_logic_vector(0 to 6));
END two_process_fsm;

ARCHITECTURE Behavior OF two_process_fsm IS

TYPE State_type IS (BL,H,E,L1,L2,O,SC);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next state
BEGIN

PROCESS (w, y_Q) -- state table
BEGIN
CASE y_Q IS

WHEN BL => IF (W = '1') THEN Y_D <= H;
ELSIF (W='0') THEN Y_D <= BL;
END IF;

WHEN H => IF (W = '1') THEN Y_D <= E;
ELSIF (W='0') THEN Y_D <= H;
END IF;

WHEN E=> IF(W='1') THEN Y_D <= L1;
ELSIF (W='0') THEN Y_D <= E;
END IF;

WHEN L1=> IF(W='1') THEN Y_D <= L2;
ELSIF (W='0') THEN Y_D <= L1;
END IF;

WHEN L2=> IF(W='1') THEN Y_D <= O;
ELSIF (W='0') THEN Y_D <= L2;
END IF;

WHEN O=> IF(W='1') THEN Y_D <= SC;
ELSIF (W='0') THEN Y_D <= O;
END IF;

WHEN SC=> Y_D <= SC;

WHEN others => Y_D <= BL;

END CASE;
END PROCESS; -- state table

PROCESS (Clock) -- state flip-flops
BEGIN

if(rising_edge(Clock)) then
if(Clear = '0')then
y_Q <= BL;

else 
y_Q<=Y_D;

end if;
end if;

END PROCESS;

PROCESS(y_Q,regin)
begin

if (y_Q = H) then 
z<="0110111";
elsif (y_Q=E) then
z<="1001111";
elsif (y_Q=L1) then
z<="0001110";
elsif (y_Q=L2) then
z<="0001110";
elsif (y_Q=O) then
z<="1111110";
elsif (y_Q=BL) then
z<="0000000";

else 
z<=regin;
end if;

END PROCESS;
end Behavior;










