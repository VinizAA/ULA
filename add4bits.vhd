library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add4bits is 
	port (a, b: in std_logic_vector(3 downto 0);
			s: in std_logic;
			f: out std_logic_vector (3 downto 0); 
			cout: out std_logic);
end add4bits;

architecture funcao of add4bits is
	signal m: std_logic_vector (2 downto 0);
	signal bn, f1: std_logic_vector (3 downto 0);
	
	component addbit is 
		port (cin, a, b: in std_logic;
				f, cout: out std_logic);
	end component;
	
begin

	with s select bn <= 
	NOT b when '1',
	b when others;
	
	add0: addbit PORT MAP (s, a(0), bn(0), f1(0), m(0));
	add1: addbit PORT MAP (m(0), a(1), bn(1), f1(1), m(1));
	add2: addbit PORT MAP (m(1), a(2), bn(2), f1(2), m(2));
	add3: addbit PORT MAP (m(2), a(3), bn(3), f1(3), cout);
	
	f <= f1;
end funcao;
