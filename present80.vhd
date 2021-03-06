library ieee;
use ieee.std_logic_1164.all;

package present_funcoes is
  subtype parte4 is std_logic_vector(3 downto 0);
  subtype parte5 is std_logic_vector(4 downto 0);
  function sbox4(input : parte4) return parte4;
  function soma1(input : parte5) return parte5;
end present_funcoes ;

package body present_funcoes is
  function sbox4(input : parte4) return parte4 is
  begin
    case(input) is
      when x"0" => return x"c";
      when x"1" => return x"5";
      when x"2" => return x"6";
      when x"3" => return x"b";
      when x"4" => return x"9";
      when x"5" => return x"0";
      when x"6" => return x"a";
      when x"7" => return x"d";
      when x"8" => return x"3";
      when x"9" => return x"e";
      when x"a" => return x"f";
      when x"b" => return x"8";
      when x"c" => return x"4";
      when x"d" => return x"7";
      when x"e" => return x"1";
      when others => return x"2";
    end case ;
  end sbox4;
  
 function soma1(input : parte5) return parte5 is
  
  variable soma,b:parte5;
  variable c:std_logic;
  
  begin
	c := '0';
	b := "00001";
	for i in 0 to 4 loop
		soma(i) := input(i) xor b(i) xor c;
		c := (input(i) and b(i)) or ((input(i) xor b(i)) and c);
	end loop;
	return soma;
end soma1;
  
  
end present_funcoes;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.present_funcoes.all;

PACKAGE procedures IS
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
		SIGNAL round_counter: in STD_LOGIC_VECTOR(4 downto 0);
		SIGNAL saida: out STD_LOGIC_VECTOR (79 downto 0));
		
END procedures;

PACKAGE BODY procedures IS

 PROCEDURE sBoxLayer (
	SIGNAL bloco: in STD_LOGIC_VECTOR (63 downto 0);
	SIGNAL saida: out STD_LOGIC_VECTOR (63 downto 0)
 ) IS
 begin
	saida(3 downto 0)<=sBox4(bloco(3 downto 0));
	saida(7 downto 4)<=sBox4(bloco(7 downto 4));
	saida(11 downto 8)<=sBox4(bloco(11 downto 8));
	saida(15 downto 12)<=sBox4(bloco(15 downto 12));
	saida(19 downto 16)<=sBox4(bloco(19 downto 16));
	saida(23 downto 20)<=sBox4(bloco(23 downto 20));
	saida(27 downto 24)<=sBox4(bloco(27 downto 24));
	saida(31 downto 28)<=sBox4(bloco(31 downto 28));
	saida(35 downto 32)<=sBox4(bloco(35 downto 32));
	saida(39 downto 36)<=sBox4(bloco(39 downto 36));
	saida(43 downto 40)<=sBox4(bloco(43 downto 40));
	saida(47 downto 44)<=sBox4(bloco(47 downto 44));
	saida(51 downto 48)<=sBox4(bloco(51 downto 48));
	saida(55 downto 52)<=sBox4(bloco(55 downto 52));
	saida(59 downto 56)<=sBox4(bloco(59 downto 56));
	saida(63 downto 60)<=sBox4(bloco(63 downto 60));
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
	
	skey(76 downto 72):=skey(79 downto 75);
	skey(79 downto 77):=save1(7 downto 5);
	
	skey(79 downto 76):=sBox4(skey(79 downto 76));
		
	round:=soma1(round_counter);
	flag:=round(0);

	if (flag='1') then 
		skey(15 downto 8):=skey(15 downto 8) xor "10000000";
	end if;
	
	skey(19 downto 16):=skey(19 downto 16) xor round(4 downto 1);
	
	saida<=skey;
	
end genRoundKey;
 
END procedures;

library IEEE;
use IEEE.std_logic_1164.all;
use work.procedures.all;
use work.present_funcoes.all;

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
signal contador,b,soma: STD_LOGIC_VECTOR(4 downto 0);
signal zero,c: std_LOGIC;
shared variable cont_aux:STD_LOGIC_VECTOR(4 downto 0);


begin

zero<='0';
entrada_aux1<= bloco;
b<="00001";


process(zero)

begin
	cont_aux:="00001";
	addRoundKey (key,entrada_aux1,entrada_aux2);
	for i in 1 to 31 loop
		sBoxLayer (entrada_aux2,entrada_aux3);
		pLayer (entrada_aux3,entrada_aux4);
		genRoundKey (key,contador,chave);
		for i in 0 to 4 loop
			soma(i) <= cont_aux(i) xor b(i) xor c;
			c <= (cont_aux(i) and b(i)) or ((cont_aux(i) xor b(i)) and c);
		end loop;
		contador<=soma;
		cont_aux:=soma;
		entrada_aux1<=entrada_aux4;
		addRoundKey (chave,entrada_aux1,entrada_aux2);
	end loop;
		saida<=entrada_aux2;
	end process;
end present80_arch;
