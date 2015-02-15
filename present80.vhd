library IEEE;
use IEEE.std_logic_1164.all;

entity present80 is
 port (
 key: in STD_LOGIC_VECTOR (79 downto 0);
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 rst,clk: in STD_LOGIC;
 saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end present80;

--Fazer tudo por componentes e adicionar aqui com uma maquina de estado para rodar os 32 rounds