library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--ENTRADAS--
entity ula is 
	port (a, b: in std_logic_vector(3 downto 0); --entradas: a/b são os números da conta
			s: in std_logic_vector (1 downto 0); --entrada: s é a seleção da operação ('soma', 'subtração', 'and' ou 'or'
			f: out std_logic_vector (3 downto 0); --saída da operação
			c, z, v, n: out std_logic); --flags: carry/zero/overflow/negativo
end ula;
------------

--ARCHITECTURE--
architecture funcao of ula is
	signal cout: std_logic; --sinal de carry-out
	signal m: std_logic_vector (2 downto 0); --sinal de carry-out (próximo) 
	signal f1, f2, f3, f4: std_logic_vector (3 downto 0); --saídas das operações
	
	--COMPONENTE--
	component add4bits is 
		port (a, b: in std_logic_vector(3 downto 0); --1º número/2º número
			   s: in std_logic; --seleção de operação
			   f: out std_logic_vector (3 downto 0); --saída da operação
			   cout: out std_logic; --carry-out
				v: out std_logic); --flag de overflow
	end component;
	--------------
begin
	res: add4bits PORT MAP (a, b, s(1), f1, c, v); --operação de soma 
	
	f2 <= a and b; --AND
	f3 <= a or b; --OR
	
	with s select f4 <= 
		f2 when "01", --quando selecionado 'AND', f4 (resposta final) recebe valor do AND dos 2 números
		f3 when "11", --quando selecionado 'OR', f4 (resposta final) recebe valor do OR dos 2 números
		f1 when others; --quando não for 'AND' ou 'OR' f4 (resposta final) recebe valor da soma/subtração
		
	z <= not(f4(0) or f4(1) or f4(2) or f4(3)); --flag de zero: 'OR' entre os bits da resposta. Caso o número tiver qualquer bit = '1', o flag é zero
	
	with s select n <= 
		f4(3) when "00", --quando a operação for 'SOMA', verifica o bit mais significativo do resultado
		f4(3) when "10", --quando a operação for 'SUBTRAÇÃO', verifica o bit mais significativo do resultado
		'0' when "01", --quando a operação for 'AND', flag de zero = '0'
		'0' when "11"; --quando a operação for 'OR', flag de zero = '0'
		
	f <= f4; --resposta final vai para f (oficializar)
end funcao;
----------------
