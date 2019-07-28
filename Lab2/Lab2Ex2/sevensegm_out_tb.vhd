LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sevensegm_out_tb IS
END sevensegm_out_tb;

ARCHITECTURE behav of sevensegm_out_tb is

signal HEX0_tb, HEX1_tb, HEX2_tb, HEX3_tb, HEX4_tb: STD_LOGIC_VECTOR(0 to 6);
signal SW_tb: std_logic_vector(4 downto 0);

component sevensegm_out  
PORT ( SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(0 to 6));
END COMPONENT;

BEGIN
uut: sevensegm_out PORT MAP(
HEX0 => HEX0_tb,
HEX1 => HEX1_tb,
HEX2 => HEX2_tb,
HEX3 => HEX3_tb,
HEX4 => HEX4_tb,
SW => SW_tb
);


PROCESS
BEGIN
SW_tb <= "00001";
wait for 100 ns;
SW_tb <= "00101";
wait for 100 ns;
SW_tb <= "00011";
wait for 100 ns;
SW_tb <= "01011";
wait;
END PROCESS;

END behav;
