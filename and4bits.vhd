library ieee;
use ieee.std_logic_1664.all;

entity and4bits is 
  port (a, b: in std_logic_vector (3 downto 0); --entradas
        c: out std_logic_vector (3 downto 0)); --saídas
end and4bits;

architecture function of and4bits is
begin
  c(0) <= a(0) AND b(0); --primeiro bit
  c(1) <= a(1) AND b(1); --segundo bit
  c(2) <= a(2) AND b(2); --terceiro bit
  c(3) <= a(3) AND b(3); --quarto bit
end function; 