library IEEE;
use IEEE.std_logic_1164.all;

entity genRoundKey is
 port (
 key: in STD_LOGIC_VECTOR (79 downto 0);
 round_counter: in STD_LOGIC_VECTOR(4 downto 0);
 saida: out STD_LOGIC_VECTOR (79 downto 0)
 );
end genRoundKey;

architecture genRoundKey_arch of genRoundKey is

component sBox4
port(
	bloco: in STD_LOGIC_VECTOR (3 downto 0);
	saida: out STD_LOGIC_VECTOR (3 downto 0)
);
end component;

variable skey: STD_LOGIC_VECTOR(79 downto 0);
variable save1,save2: STD_LOGIC_VECTOR(7 downto 0);
variable round: STD_LOGIC_VECTOR(4 downto 0);
variable flag: STD_LOGIC;

begin
	skey(63 downto 0)<= key(79 downto 16);
	skey(79 downto 64)<= key(15 downto 0);
	save2<=  skey(15 downto 8);
	save1<= skey(7 downto 0) and "00000111";
	
	
	skey(4 downto 0):=skey(7 downto 3);
	skey(7 downto 5):=skey(15 downto 13);
	skey(12 downto 8):=skey(15 downto 11);
	skey(15 downto 13):=skey(23 downto 21);
	skey(20 downto 16):=skey(23 downto 19);
	skey(23 downto 21):=skey(31 downto 29);
	skey(28 downto 24):=skey(31 downto 27);
	skey(31 downto 29):=skey(39 downto 37);
	skey(36 downto 32):=skey(39 downto 35);
	skey(39 downto 37):=skey(47 downto 45);
	skey(44 downto 40):=skey(47 downto 43);
	skey(47 downto 45):=skey(55 downto 53);
	skey(52 downto 48):=skey(55 downto 51);
	skey(55 downto 53):=skey(63 downto 61);
	skey(60 downto 56):=skey(63 downto 59);
	skey(63 downto 61):=skey(71 downto 69);
	skey(68 downto 64):=skey(71 downto 67);
	skey(71 downto 69):=skey(79 downto 77);
	skey(76 downto 72):=skey(79 downto 73);
	skey(79 downto 77):=save1(7 downto 5);
	
	s1: sBox4 port map (skey(79 downto 76),save2(7 downto 4));
	skey(79 downto 76):=save2(7 downto 4);
	
	flag:=(round_counter+1)mod 2;
	
	process(flag)
	begin
	if (flag='1') then 
		skey(15 downto 8):=skey(15 downto 8) xor "10000000";
	end if;
	end process;
	
	round:=round_counter+1;
	
	skey(19 downto 16):=skey(19 downto 16) xor round(4 downto 1);
	
	
end genRoundKey_arch;
