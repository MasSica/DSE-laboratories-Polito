LIBRARY ieee;
USE ieee.std_logic_1164.all; USE ieee.numeric_std.all;

entity multiplier is 
PORT (sw : in std_logic_vector(7 downto 0);
p:out std_logic_vector (7 downto 0)
);
end multiplier;

architecture behavior of multiplier is 

component stage_one is 
PORT (add,badd : in std_logic_vector(3 downto 0);
cin: in std_logic;
sum: out std_logic_vector(3 downto 0);
cout: out std_logic
);
end component;

signal a1_s : std_logic_vector (3 downto 0);
signal b1_s : std_logic_vector (3 downto 0);
signal a2_s : std_logic_vector (3 downto 0); 
signal b2_s : std_logic_vector (3 downto 0);
signal a3_s : std_logic_vector (3 downto 0);
signal b3_s : std_logic_vector (3 downto 0);
signal sum1_s: std_logic_vector (3 downto 0);
signal sum2_s: std_logic_vector (3 downto 0);
signal sum3_s: std_logic_vector (3 downto 0);
signal carry1_s: std_logic;
signal carry2_s: std_logic;
signal carry3_s: std_logic;


begin 

a1_s(0)<= sw(5)AND sw(0);
b1_s(0)<= sw(4)AND sw(1);
a1_s(1)<= sw(6)AND sw(0);
b1_s(1)<= sw(5)AND sw(1);
a1_s(2)<= sw(7)AND sw(0);
b1_s(2)<= sw(6)AND sw(1);
a1_s(3)<= '0';
b1_s(3)<= sw(7)AND sw(1);

a2_s(0)<= sum1_s(1);
b2_s(0)<= sw(4)AND sw(2);
a2_s(1)<= sum1_s(2);
b2_s(1)<= sw(5)AND sw(2);
a2_s(2)<= sum1_s(3);
b2_s(2)<= sw(6)AND sw(2);
a2_s(3)<= carry1_s;
b2_s(3)<= sw(7)AND sw(2);

a3_s(0)<= sum2_s(1);
b3_s(0)<= sw(4)AND sw(3);
a3_s(1)<= sum2_s(2);
b3_s(1)<= sw(5)AND sw(3);
a3_s(2)<= sum2_s(3);
b3_s(2)<= sw(6)AND sw(3);
a3_s(3)<= carry2_s;
b3_s(3)<= sw(7)AND sw(3);

s1: stage_one PORT MAP(a1_s,b1_s,'0',sum1_s,carry1_s);
s2: stage_one PORT MAP(a2_s,b2_s,'0',sum2_s,carry2_s);
s3: stage_one PORT MAP(a3_s,b3_s,'0',sum3_s,carry3_s);

p(0)<=sw(4)AND sw(0);
p(1)<=sum1_s(0);
p(2)<=sum2_s(0);
p(3)<=sum3_s(0);
p(4)<=sum3_s(1);
p(5)<=sum3_s(2);
p(6)<=sum3_s(3);
p(7)<= carry3_s;

end behavior;


