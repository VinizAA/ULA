library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is --entity da ula
	port (a, b: in std_logic_vector(3 downto 0); --entradas: a/b são os números da conta
			s: in std_logic_vector (1 downto 0); --entrada: s é a seleção da 
			f: out std_logic_vector (3 downto 0); 
			c, z, v, n: out std_logic);
end ula;

architecture funcao of ula is
	signal m: std_logic_vector (2 downto 0);
	signal f1, f2, f3, f4: std_logic_vector (3 downto 0);
	
	component add4bits is 
		port (a, b: in std_logic_vector(3 downto 0);
			   s: in std_logic;
			   f: out std_logic_vector (3 downto 0); 
			   cout: out std_logic);
	end component;
	
begin
	res: add4bits PORT MAP (a, b, s(1), f1, c);
	
	f2 <= a and b;
	f3 <= a or b;
		
	with s select f4 <= 
		f2 when "01", --and
		f3 when "11", --or
		f1 when others; --soma/subtração
		
	v <= (a(3) and b(3) and not f4(3)) or (not a(3) and not b(3) and f4(3)) when s(0) = '0' else --faz a conta do overflow
			'0' when s(0) = '1'; --n faz a conta do overflow
	z <= not(f4(0) or f4(1) or f4(2) or f4(3)); 
	n <= f4(3);
	f <= f4;
end funcao;
