LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY mux is
PORT (cin_prev, cin_next: in std_logic;
sel: in std_logic;
cout: out std_logic
);
end mux;

architecture behavior of mux is 

begin
   
with sel select

cout <= cin_prev when '1',
        cin_next when others;

end behavior;
