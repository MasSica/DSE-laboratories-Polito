LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two_process_fsm IS
PORT (SW: in std_logic_vector (1 downto 0);
 KEY : IN STD_LOGIC_vector(0 downto 0);
LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END two_process_fsm;

ARCHITECTURE Behavior OF two_process_fsm IS

TYPE State_type IS (A, B, C, D, E, F, G, H, I);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next state
BEGIN

PROCESS (SW(1), y_Q) -- state table
BEGIN
CASE y_Q IS

WHEN A => IF (SW(1) = '0') THEN Y_D <= B;
ELSE Y_D <= F;
END IF;

WHEN B=> IF(SW(1)='0') THEN Y_D <= C;
ELSE Y_D <= F;
END IF;

WHEN C=> IF(SW(1)='0') THEN Y_D <= D;
ELSE Y_D <= F;
END IF;

WHEN D=> IF(SW(1)='0') THEN Y_D <= E;
ELSE Y_D <= F;
END IF;

WHEN E=> IF(SW(1)='0') THEN Y_D <= E;
ELSE Y_D <= F;
END IF;

WHEN F=> IF(SW(1)='1') THEN Y_D <= G;
ELSE Y_D <= B;
END IF;

WHEN G=> IF(SW(1)='1') THEN Y_D <= H;
ELSE Y_D <= B;
END IF;

WHEN H=> IF(SW(1)='1') THEN Y_D <= I;
ELSE Y_D <= B;
END IF;

WHEN I=> IF(SW(1)='1') THEN Y_D <= I;
ELSE Y_D <= B;
END IF;

WHEN others => Y_D <= A;

END CASE;
END PROCESS; -- state table

PROCESS (KEY(0)) -- state flip-flops
BEGIN

if(rising_edge(KEY(0))) then
if(SW(0) = '0')then
y_Q <= A;

else 
y_Q<=Y_D;

end if;
end if;

END PROCESS;

PROCESS(y_Q)
begin

if (y_Q = I OR y_Q = E) then 
LEDR(0)<='1';
else LEDR(0)<='0';
end if;

END PROCESS;
end Behavior;










