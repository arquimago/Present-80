library IEEE;
use IEEE.std_logic_1164.all;

entity pLayer is
 port (
 bloco: in STD_LOGIC_VECTOR (63 downto 0);
 saida: out STD_LOGIC_VECTOR (63 downto 0)
 );
end pLayer;

architecture pLayer_arch of pLayer is
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
end pLayer_arch;
