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

<<<<<<< HEAD

variable chave_aux: STD_LOGIC_VECTOR(79 downto 0);
variable entrada_aux1,entrada_aux2: STD_LOGIC_VECTOR(63 downto 0);
variable chave: STD_LOGIC_VECTOR(79 downto 0);
variable contador: STD_LOGIC_VECTOR(4 downto 0);

begin
entrada_aux1<=bloco;
chave<=key;
contador<="00000";
contador<=contador+1;
chave_aux<=key;

	for i in 1 to 31 loop
		ark: addRoundKey port map (chave_aux,entrada_aux1,entrada_aux2);
		sbl: sBoxLayer port map (entrada_aux2,entrada_aux1);
		pl: pLayer port map (entrada_aux1,entrada_aux2);
		grk: genRoundKey port map (chave_aux,contador,chave);
		contador<=contador+1;
		entrada_aux1<=entrada_aux2;
		chave_aux<=chave;		
	end loop;
	ark2: addRoundKey port map (chave,entrada_aux1,saida);

=======
begin
	begin
	for i in 0 to 30 loop
		--aqui chamamos as coisas :P
	end loop;
	-- aqui a gente chama o addroundKey pela ultima vez
>>>>>>> parent of 796cd56... "main" quase pronto
end present80_arch;