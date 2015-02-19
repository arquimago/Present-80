library IEEE;
use IEEE.std_logic_1164.all;

entity genRoundKey is
 port (
 key: in STD_LOGIC_VECTOR (79 downto 0);
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 round_counter: in STD_LOGIC;
 saida: out STD_LOGIC_VECTOR (79 downto 0);
 round_conter_out: out STD_LOGIC;
 );
end genRoundKey;

architecture genRoundKey_arch of genRoundKey is

variable skey: STD_LOGIC_VECTOR(79 downto 0);
variable save1,save2: STD_LOGIC_VECTOR(7 downto 0);

begin
	skey(63 downto 0):=key(79 downto 16);
	skey(79 downto 64):=key(15 downto 0);
	save2:=skey(15 downto 8);
	save1:=skey(7 downto 0) and "00000111";
	
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
	
	
	
	
end genRoundKey;
