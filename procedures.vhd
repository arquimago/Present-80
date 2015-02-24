LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE procedures IS
	procedure soma5bits (
		SIGNAL cin: in STD_LOGIC;
		SIGNAL a,b: in STD_LOGIC_VECTOR (3 DOWNTO 0);
		SIGNAL cout: out STD_LOGIC;
		SIGNAL s: out STD_LOGIC_VECTOR (3 DOWNTO 0));
	procedure sBox4(
		SIGNAL bloco: in STD_LOGIC_VECTOR (3 downto 0);
		SIGNAL saida: out STD_LOGIC_VECTOR (3 downto 0));
	procedure sBoxLayer (
		SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
		SIGNAL saida: out STD_LOGIC_VECTOR (63 downto 0));
	procedure pLayer(
		SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
		SIGNAL saida: out STD_LOGIC_VECTOR (63 downto 0));
	procedure addRoundKey (
		SIGNAL key: in STD_LOGIC_VECTOR (79 downto 0);
		SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
		SIGNAL saida: out STD_LOGIC_VECTOR (63 downto 0));
	procedure genRoundKey(
		SIGNAL key: in STD_LOGIC_VECTOR (79 downto 0);
		SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
		SIGNAL round_counter: in STD_LOGIC_VECTOR(4 downto 0);
		SIGNAL saida: out STD_LOGIC_VECTOR (79 downto 0));
		
END procedures;

PACKAGE BODY procedures IS


procedure soma5bits (
	SIGNAL cin: in STD_LOGIC;
	SIGNAL a,b: in STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL cout: out STD_LOGIC;
	SIGNAL s: out STD_LOGIC_VECTOR (3 DOWNTO 0)
) is

	variable soma:std_logic_vector(4 downto 0);
	variable c:std_logic;
	begin
	c := cin;
	for i in 0 to 4 loop
		soma(i) := a(i) xor b(i) xor c;
		c := (a(i) and b(i)) or ((a(i) xor b(i)) and c);
	end loop;
	cout <= c;
	s <= soma;
end soma5bits;

PROCEDURE sBox4(SIGNAL bloco: in STD_LOGIC_VECTOR (3 downto 0);
				SIGNAL saida: out STD_LOGIC_VECTOR (3 downto 0)) IS
 begin
		
 end sBox4;

 PROCEDURE sBoxLayer (
	SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
	SIGNAL saida: out STD_LOGIC_VECTOR (63 downto 0)
 ) IS
 
 begin
	sBox4 (bloco(3 downto 0),saida(3 downto 0));
	sBox4 (bloco(7 downto 4),saida(7 downto 4));
	sBox4 (bloco(11 downto 8),saida(11 downto 8));
	sBox4 (bloco(15 downto 10),saida(15 downto 10));
	sBox4 (bloco(19 downto 16),saida(19 downto 16));
	sBox4 (bloco(23 downto 20),saida(23 downto 20));
	sBox4 (bloco(27 downto 24),saida(27 downto 24));
	sBox4 (bloco(31 downto 28),saida(31 downto 28));
	sBox4 (bloco(35 downto 32),saida(35 downto 32));
	sBox4 (bloco(39 downto 36),saida(39 downto 36));
	sBox4 (bloco(43 downto 40),saida(43 downto 40));
	sBox4 (bloco(47 downto 44),saida(47 downto 44));
	sBox4 (bloco(51 downto 48),saida(51 downto 48));
	sBox4 (bloco(55 downto 52),saida(55 downto 52));
	sBox4 (bloco(59 downto 56),saida(59 downto 56));
	sBox4 (bloco(63 downto 60),saida(63 downto 60));
end sBoxLayer;

procedure pLayer(
 SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
 SIGNAL saida: out STD_LOGIC_VECTOR (63 downto 0)
 ) is
 
 begin
	saida(0)<=bloco(0);
	saida(1)<=bloco(16);
	saida(2)<=bloco(32);
	saida(3)<=bloco(48);
	saida(4)<=bloco(1);
	saida(5)<=bloco(17);
	saida(6)<=bloco(33);
	saida(7)<=bloco(49);
	saida(8)<=bloco(2);
	saida(9)<=bloco(18);
	saida(10)<=bloco(34);
	saida(11)<=bloco(50);
	saida(12)<=bloco(3);
	saida(13)<=bloco(19);
	saida(14)<=bloco(35);
	saida(15)<=bloco(51);
	saida(16)<=bloco(4);
	saida(17)<=bloco(20);
	saida(18)<=bloco(36);
	saida(19)<=bloco(52);
	saida(20)<=bloco(5);
	saida(21)<=bloco(21);
	saida(22)<=bloco(37);
	saida(23)<=bloco(53);
	saida(24)<=bloco(6);
	saida(25)<=bloco(22);
	saida(26)<=bloco(38);
	saida(27)<=bloco(54);
	saida(28)<=bloco(7);
	saida(29)<=bloco(23);
	saida(30)<=bloco(39);
	saida(31)<=bloco(55);
	saida(32)<=bloco(8);
	saida(33)<=bloco(24);
	saida(34)<=bloco(40);
	saida(35)<=bloco(56);
	saida(36)<=bloco(9);
	saida(37)<=bloco(25);
	saida(38)<=bloco(41);
	saida(39)<=bloco(57);
	saida(40)<=bloco(10);
	saida(41)<=bloco(26);
	saida(42)<=bloco(42);
	saida(43)<=bloco(58);
	saida(44)<=bloco(11);
	saida(45)<=bloco(27);
	saida(46)<=bloco(43);
	saida(47)<=bloco(59);
	saida(48)<=bloco(12);
	saida(49)<=bloco(28);
	saida(50)<=bloco(44);
	saida(51)<=bloco(60);
	saida(52)<=bloco(13);
	saida(53)<=bloco(29);
	saida(54)<=bloco(45);
	saida(55)<=bloco(61);
	saida(56)<=bloco(14);
	saida(57)<=bloco(30);
	saida(58)<=bloco(46);
	saida(59)<=bloco(62);
	saida(60)<=bloco(15);
	saida(61)<=bloco(31);
	saida(62)<=bloco(47);
	saida(63)<=bloco(63);

end pLayer;

procedure addRoundKey (
 SIGNAL key: in STD_LOGIC_VECTOR (79 downto 0);
 SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
 SIGNAL saida: out STD_LOGIC_VECTOR (63 downto 0)
 ) is
 
 begin

saida<= bloco xor key(79 downto 16);

end addRoundKey;

procedure genRoundKey(
 SIGNAL key: in STD_LOGIC_VECTOR (79 downto 0);
 SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
 SIGNAL round_counter: in STD_LOGIC_VECTOR(4 downto 0);
 SIGNAL saida: out STD_LOGIC_VECTOR (79 downto 0)
 ) is

variable skey: STD_LOGIC_VECTOR(79 downto 0);
variable save1,save2: STD_LOGIC_VECTOR(7 downto 0);
variable round: STD_LOGIC_VECTOR(4 downto 0);
variable flag: STD_LOGIC;

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
	
	sBox4(skey(79 downto 76),save2(7 downto 4));
	skey(79 downto 76):=save2(7 downto 4);
	
	flag:=(round_counter+1)mod 2;

	if (flag='1') then skey(15 downto 8)<=skey(15 downto 8) xor "10000000";
	end if;
	
	round<=round_counter+1;
	
	skey(19 downto 16)<=skey(19 downto 16) xor round(4 downto 1);
	
	saida<=skey;
	
end genRoundKey;
 
END procedures;