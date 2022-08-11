library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.my_package.all;
entity AddSub is
	Port	(	signal a, b: in std_logic_vector (3 downto 0);
				signal opcode: in std_logic;
				signal sign: out std_logic;
				signal z: out std_logic_vector (4 downto 0));
End entity AddSub;
architecture Functional of AddSub is
Begin
	Operate: process (a, b, opcode)
		variable x, y : std_logic_vector(3 downto 0);
		variable s : std_logic;
	begin
		if a>=b then x:=a; y:=b; s:='0';
				else x:=b; y:=a; s:='1';
		end if;
		case opcode is
			when add => z<='0'&x + '0'&y; sign<='0';
			when sub => z<='0'&x - '0'&y; sign<=s;
		end case;
	end process Operate;
End Architecture Functional;
