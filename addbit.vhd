library ieee;
use ieee.std_logic_1164.all;

entity addbit is 
	port (cin, a, b: in std_logic;
			f, cout: out std_logic);
end addbit;

architecture funcao of addbit is
begin
	f <= a xor b xor cin;
	cout <= (a and b) or (cin and a) or (cin and b);
end funcao;
