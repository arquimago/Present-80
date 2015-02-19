library IEEE;
use IEEE.std_logic_1164.all;

entity present80 is
 port (
 key: in STD_LOGIC_VECTOR (79 downto 0);
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end present80;

architecture present80_arch of present80 is
component addRoundKey
port (
 key: in STD_LOGIC_VECTOR (79 downto 0);
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end component;

component sBoxLayer
port (
	bloco: in STD_LOGIC_VECTOR (63 downto 0);
	saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end component;

component pLayer
port (
	bloco: in STD_LOGIC_VECTOR (63 downto 0);
	saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end component;

component genRoundKey
port (
	key: in STD_LOGIC_VECTOR (79 downto 0);
	bloco: in STD_LOGIC_VECTOR (63 downto 0);
	round_counter: in STD_LOGIC_VECTOR(4 downto 0);	
	saida: out STD_LOGIC_VECTOR (79 downto 0)
);
end component;

begin
	begin
	for i in 0 to 30 loop
		--aqui chamamos as coisas :P
	end loop;
	-- aqui a gente chama o addroundKey pela ultima vez
end present80_arch;