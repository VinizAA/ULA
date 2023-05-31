library ieee;
use ieee.std_logic_1164.all;

entity add4bits is 
	port (a, b: in std_logic_vector(3 downto 0);
			s: in std_logic;
			f: out std_logic_vector (3 downto 0); 
			cout: out std_logic);
end add4bits;

architecture funcao of add4bits is
	signal m: std_logic_vector (2 downto 0);
	signal bn: std_logic_vector (3 downto 0);
	signal teste: std_logic_vector (3 downto 0);
	
	component addbit is 
		port (cin, a, b: in std_logic;
				f, cout: out std_logic);
	end component;
	
begin
	bn <= (b XOR "1111") when s = '1' else
			b	when s = '0';
		
	add0: addbit PORT MAP (s, a(0), bn(0), f(0), m(0));
	add1: addbit PORT MAP (m(0), a(1), bn(1), f(1), m(1));
	add2: addbit PORT MAP (m(1), a(2), bn(2), f(2), m(2));
	add3: addbit PORT MAP (m(2), a(3), bn(3), f(3), cout);
	
end funcao;
