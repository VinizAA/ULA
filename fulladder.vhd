library ieee;
use ieee.std_logic_1664.all;

entity fulladder is 
  port (a, b: in std_logic_vector (3 downto 0); --entradas
        cin: in std_logic;
        c: out std_logic_vector (3 downto 0); --saídas
        cout: out std_logic);
end fulladder;

architecture function of fulladder is
    signal m: std_logic_vector (2 downto 0)
    component add4bits
        port (cin, x, y: in std_logic; --entradas do componente
              s, cout: out std_logic); --saídas do componente
    end component;
begin
    add0: add4bits PORT MAP (cin, a(0), b(0), c(0), m(0)); 
    add1: add4bits PORT MAP (m(1), a(1), b(1), c(1), m(1));
    add2: add4bits PORT MAP (m(2), a(2), b(2), c(2), m(2));
    add3: add4bits PORT MAP (m(3), a(3), b(3), c(3), cout);
end function; 