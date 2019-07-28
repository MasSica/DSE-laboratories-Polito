LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

entity multiplier_display is 
PORT (sw : in std_logic_vector(7 downto 0);
HEX0,HEX1,HEX2,HEX3:out std_logic_vector (6 downto 0)
);
end multiplier_display;

architecture behavior of multiplier_display is 

component multiplier is 
PORT (sw : in std_logic_vector(7 downto 0);
p:out std_logic_vector (7 downto 0)
);
end component;

component decoder is 
PORT ( m : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Display : OUT STD_LOGIC_VECTOR(0 TO 6));
END component;

signal p_s: std_logic_vector(7 downto 0);

begin 

Product:multiplier PORT MAP (sw,p_s);
decA: decoder PORT MAP (sw(7 downto 4),HEX0);
decB: decoder PORT MAP (sw(3 downto 0),HEX1);
decP: decoder PORT MAP (p_s(7 downto 4),HEX2);
decP2:decoder PORT MAP (p_s(3 downto 0),HEX3);

end behavior;
