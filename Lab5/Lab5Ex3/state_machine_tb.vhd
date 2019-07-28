LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY state_machine_tb IS
END state_machine_tb;

ARCHITECTURE behavior of state_machine_tb is

signal SW0_tb: std_logic;	
signal KEY0_tb: std_logic;
signal SW1_tb: std_logic;
signal LEDR_tb: std_logic;

component two_process_fsm IS
PORT (SW: in std_logic_vector (1 downto 0);
 KEY : IN STD_LOGIC_vector(0 downto 0);
LEDR : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END component;

BEGIN
uut: two_process_fsm PORT MAP(
SW(0)=>SW0_tb,
SW(1)=>SW1_tb,
KEY(0)=>KEY0_tb,
LEDR(0)=>LEDR_tb
);

process
begin
SW1_tb <= '1';
SW0_tb <='0';
wait for 25 ns; 
SW0_tb <='1';
wait for 100 ns;
SW1_tb <= '0';
wait for 50 ns;
SW1_tb <= '1';
wait for 24 ns;
SW1_tb <= '0';
wait;
end process;

PROCESS(KEY0_tb)
BEGIN
if KEY0_tb='U' then
   KEY0_tb<='0' after 10 ns; 
else
   KEY0_tb<= not KEY0_tb after 10 ns;
end if;
end process;

end behavior;
