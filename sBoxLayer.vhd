library IEEE;
use IEEE.std_logic_1164.all;

entity sBoxLayer is
 port (
 bloco: in STD_LOGIC_VECTOR (7 downto 0);
 rst,clk: in STD_LOGIC;
 saida: out STD_LOGIC_VECTOR (7 downto 0)
 );
end sBoxLayer;
