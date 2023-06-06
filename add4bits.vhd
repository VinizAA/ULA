library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--ENTRADAS--
entity add4bits is 
	port (a, b: in std_logic_vector(3 downto 0); --1º número/2º número
			s: in std_logic; --seletor de operação (soma ou subtração)
			f: out std_logic_vector (3 downto 0); --saída da operação
			cout: out std_logic; --carry-out
			v: out std_logic); --flag de overflow
end add4bits;
------------

--ARCHITECTURE--
architecture funcao of add4bits is
	signal m: std_logic_vector (3 downto 0); --sinal interno:
	signal bn, f1: std_logic_vector (3 downto 0); --sinal interno: 2º número negado/ saída das operações
--COMPONENTE--
	component addbit is 
		port (cin, a, b: in std_logic; --carry-in/1º número/2º número
				f, cout1: out std_logic); --saída da operação/ carry-out
	end component;
--------------
begin

	with s select bn <= 
		NOT b when '1', --bn recebe o número negado se selecionado a operação 'subtração'
		b when others; --bn recebe o próprio número se selecionado qualquer outra operação
	
	add0: addbit PORT MAP (s, a(0), bn(0), f1(0), m(0)); --somador do primeiro bit
	add1: addbit PORT MAP (m(0), a(1), bn(1), f1(1), m(1)); --somador do segundo bit
	add2: addbit PORT MAP (m(1), a(2), bn(2), f1(2), m(2)); --somador do terceiro bit
	add3: addbit PORT MAP (m(2), a(3), bn(3), f1(3), m(3)); --somador do quarto bit
	
	f <= f1; --f recebe o resultado da operação
	cout <= m(3); --cout recebe o carry-out da operação
	
	v <= a(3) XOR bn(3) XOR f1(3) XOR m(3) when s = '0' else --v recebe o valor de overflow ('1') se a operação for soma
	'0' when s = '1'; --v recebe o valor de '0' se for qualquer outra operação
end funcao;
----------------
