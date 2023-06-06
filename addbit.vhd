library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--ENTRADAS--
entity addbit is 
	port (cin, a, b: in std_logic; --carry-in/1º número/2º número
			f, cout1: out std_logic); --saída da operação/ carry-out
end addbit;
------------

--ARCHITECTURE--
architecture funcao of addbit is
begin
	f <= a xor b xor cin; --Somador de 1 bit
	cout1 <= (a and b) or (cin and a) or (cin and b); --Carry-out do somador
end funcao;
----------------
