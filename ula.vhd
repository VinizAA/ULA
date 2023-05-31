library ieee;
use ieee.std_logic_1664.all;

entity ula is 
  generic (i : INTEGER := 0 );
  port (au, bu: in std_logic_vector (3 downto 0); --entradas
        su: in std_logic_vector (1 downto 0);
        cinu: in std_logic;
        c: out std_logic_vector (3 downto 0); --saídas
        coutu: out std_logic);
end ula;

architecture function of ula is
    signal m: std_logic_vector (2 downto 0);
    component fulladder --componente
        port (cin, x, y: in std_logic; --entradas
              t, cout: out std_logic); --saídas
    end component;

    component and4bits
        port (aa, ba: in std_logic_vector (3 downto 0); --entradas
              ca: out std_logic_vector (3 downto 0)); --saídas
    end component;

    component or4bits
        port (ao, bo: in std_logic_vector (3 downto 0); --entradas
              co: out std_logic_vector (3 downto 0)); --saídas
    end component;

begin
    if s = '00' THEN
        add0: fulladder PORT MAP (cin, a(0), b(0), c(0), m(0));
        add1: fulladder PORT MAP (m(1), a(1), b(1), c(1), m(1));
        add2: fulladder PORT MAP (m(2), a(2), b(2), c(2), m(2));
        add3: fulladder PORT MAP (m(3), a(3), b(3), c(3), cout);
    elsif s = '10' THEN
        subtração
    elsif s = '01' THEN
        ca(0) <= aa(0) AND ba(0); --primeiro bit
        ca(1) <= aa(1) AND ba(1); --segundo bit
        ca(2) <= aa(2) AND ba(2); --terceiro bit
        ca(3) <= aa(3) AND ba(3); --quarto bit
    else
        co(0) <= ao(0) AND bo(0); --primeiro bit
        co(1) <= ao(1) AND bo(1); --segundo bit
        co(2) <= ao(2) AND bo(2); --terceiro bit
        co(3) <= ao(3) AND bo(3); --quarto bit
    end if;
    
    
end function; 