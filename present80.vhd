library IEEE;
use IEEE.std_logic_1164.all;
use work.procedures.all;

entity present80 is
 port (
 key: in STD_LOGIC_VECTOR (79 downto 0);
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end present80;

architecture present80_arch of present80 is

signal chave_aux: STD_LOGIC_VECTOR(79 downto 0);
signal entrada_aux1,entrada_aux2,entrada_aux3,entrada_aux4: STD_LOGIC_VECTOR(63 downto 0);
signal chave: STD_LOGIC_VECTOR(79 downto 0);
signal contador,contador_aux,um: STD_LOGIC_VECTOR(4 downto 0);
signal a,zero: STD_LOGIC;

begin
entrada_aux1<= bloco;
chave<=key;
zero<='0';
um<="00001";
contador<="00001";
chave_aux<=key;

process(key)
begin
	for i in 1 to 31 loop
		addRoundKey (chave_aux,entrada_aux1,entrada_aux2);
		sBoxLayer (entrada_aux2,entrada_aux3);
		pLayer (entrada_aux3,entrada_aux4);
		genRoundKey (chave_aux,contador,chave);
		soma5bits(zero,contador,um,a,contador_aux);
		entrada_aux1<=entrada_aux4;
		chave_aux<=chave;
		contador<=contador_aux;
	end loop;
		addRoundKey (chave,entrada_aux1,saida);
	end process;
end present80_arch;
