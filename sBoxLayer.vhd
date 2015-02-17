library IEEE;
use IEEE.std_logic_1164.all;

entity sBoxLayer is
 port (
	bloco: in STD_LOGIC_VECTOR (63 downto 0);
	saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end sBoxLayer;

architecture sBoxLayer_arch of sBoxLayer is
component sBox4
port(
	bloco: in STD_LOGIC_VECTOR (3 downto 0);
	saida: out STD_LOGIC_VECTOR (3 downto 0)
);
end component;

begin
	s1: sBox4 port map (bloco(3 downto 0),saida(3 downto 0));
	s2: sBox4 port map (bloco(7 downto 4),saida(7 downto 4));
	s3: sBox4 port map (bloco(11 downto 8),saida(11 downto 8));
	s4: sBox4 port map (bloco(15 downto 10),saida(15 downto 10));
	s5: sBox4 port map (bloco(19 downto 16),saida(19 downto 16));
	s6: sBox4 port map (bloco(23 downto 20),saida(23 downto 20));
	s7: sBox4 port map (bloco(27 downto 24),saida(27 downto 24));
	s8: sBox4 port map (bloco(31 downto 28),saida(31 downto 28));
	s9: sBox4 port map (bloco(35 downto 32),saida(35 downto 32));
	s10: sBox4 port map (bloco(39 downto 36),saida(39 downto 36));
	s11: sBox4 port map (bloco(43 downto 40),saida(43 downto 40));
	s12: sBox4 port map (bloco(47 downto 44),saida(47 downto 44));
	s13: sBox4 port map (bloco(51 downto 48),saida(51 downto 48));
	s14: sBox4 port map (bloco(55 downto 52),saida(55 downto 52));
	s15: sBox4 port map (bloco(59 downto 56),saida(59 downto 56));
	s16: sBox4 port map (bloco(63 downto 60),saida(63 downto 60));
end sBoxLayer_arch;
