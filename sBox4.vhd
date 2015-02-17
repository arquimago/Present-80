library IEEE;
use IEEE.std_logic_1164.all;

entity sBox4 is
 port (
	bloco: in STD_LOGIC_VECTOR (3 downto 0);
	saida: out STD_LOGIC_VECTOR (3 downto 0)
 );
end sBox4;

architecture sBox4_arch of sBox4 is
	begin
	process(bloco)
		begin
		case bloco is
			when "0000" => saida <= "1100";
			when "0001" => saida <= "0101";
			when "0010" => saida <= "0110";
			when "0011" => saida <= "1011";
			when "0100" => saida <= "1001";
			when "0101" => saida <= "0000";
			when "0110" => saida <= "1010";
			when "0111" => saida <= "1101";
			when "1000" => saida <= "0011";
			when "1001" => saida <= "1110";
			when "1010" => saida <= "1111";
			when "1011" => saida <= "1000";
			when "1100" => saida <= "0100";
			when "1101" => saida <= "0111";
			when "1110" => saida <= "0001";
			when "1111" => saida <= "0010";
			when others => saida <= "ZZZZ";
		end case;
	end process;
end sBox4_arch;
