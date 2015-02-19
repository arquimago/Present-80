library IEEE;
use IEEE.std_logic_1164.all;

entity addRoundKey is
 port (
 key: in STD_LOGIC_VECTOR (79 downto 0);
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end addRoundKey;

architecture addRoundKey_arch of addRoundKey is
begin

saida:= bloco xor key(79 downto 16);

end addRoundKey_arch;