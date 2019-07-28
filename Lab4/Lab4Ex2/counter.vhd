library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
port( enable: in std_logic;
clock: in std_logic;
clear: in std_logic;
Q: out std_logic_vector(0 to 15)
);
end counter;

architecture behavior of counter is 

component t_ff is
port( t: in std_logic;
clock: in std_logic;
clear: in std_logic;
Q: out std_logic);
end component;

signal Q_s: std_logic_vector(0 to 15);
signal in_s: std_logic_vector(0 to 14);

begin

c1: t_ff PORT MAP(enable,clock,clear,Q_s(0));
in_s(0) <= enable and Q_s(0);
c2: t_ff PORT MAP(in_s(0),clock,clear,Q_s(1));
in_s(1) <= in_s(0) and Q_s(1);
c3: t_ff PORT MAP(in_s(1),clock,clear,Q_s(2));
in_s(2) <= in_s(1) and Q_s(2);
c4: t_ff PORT MAP(in_s(2),clock,clear,Q_s(3));
in_s(3) <= in_s(2) and Q_s(3);

c5: t_ff PORT MAP(in_s(3),clock,clear,Q_s(4));
in_s(4) <= in_s(3) and Q_s(4);
c6: t_ff PORT MAP(in_s(4),clock,clear,Q_s(5));
in_s(5) <= in_s(4) and Q_s(5);
c7: t_ff PORT MAP(in_s(5),clock,clear,Q_s(6));
in_s(6) <= in_s(5) and Q_s(6);
c8: t_ff PORT MAP(in_s(6),clock,clear,Q_s(7));
in_s(7) <= in_s(6) and Q_s(7);

c9: t_ff PORT MAP(in_s(7),clock,clear,Q_s(8));
in_s(8) <= in_s(7) and Q_s(8);
c10: t_ff PORT MAP(in_s(8),clock,clear,Q_s(9));
in_s(9) <= in_s(8) and Q_s(9);
c11: t_ff PORT MAP(in_s(9),clock,clear,Q_s(10));
in_s(10) <= in_s(9) and Q_s(10);
c12: t_ff PORT MAP(in_s(10),clock,clear,Q_s(11));
in_s(11) <= in_s(10) and Q_s(11);

c13: t_ff PORT MAP(in_s(11),clock,clear,Q_s(12));
in_s(12) <= in_s(11) and Q_s(12);
c14: t_ff PORT MAP(in_s(12),clock,clear,Q_s(13));
in_s(13) <= in_s(12) and Q_s(13);
c15: t_ff PORT MAP(in_s(13),clock,clear,Q_s(14));
in_s(14) <= in_s(13) and Q_s(14);
c16: t_ff PORT MAP(in_s(14),clock,clear,Q_s(15));

Q <= Q_s;

end behavior;
