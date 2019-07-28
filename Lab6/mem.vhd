LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY mem IS
PORT (data_in: in signed(7 downto 0);
address: in unsigned(9 downto 0);
clock, cs, wr, rd: in std_logic;
data_out: out signed(7 downto 0)
); 
END mem;

ARCHITECTURE Behavior OF mem IS

type array_t is array(1023 downto 0) of signed(7 downto 0);
signal reg_array: array_t;

BEGIN
PROCESS (data_in, address, clock, cs, wr, rd)

BEGIN

IF (cs = '1') THEN

IF (Clock'EVENT AND Clock = '1' and wr = '1') THEN
reg_array(to_integer(address)) <= data_in;
END IF;

IF (rd = '1') THEN
data_out <= reg_array(to_integer(address));
END IF;

ELSE
data_out <= (others => '0');
END IF;

END PROCESS;
END Behavior;
