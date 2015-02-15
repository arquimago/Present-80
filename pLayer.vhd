library IEEE;
use IEEE.std_logic_1164.all;

entity pLayer is
 port (
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 rst,clk: in STD_LOGIC;
 saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end pLayer;