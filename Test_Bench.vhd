use work.my_package.all
entity TB_AddSub is end;
architecture Test_Bench of TB_AddSub is
	signal c, d : std_logic_vector (3 downto 0);
	signal oper : operation;
	signal signo: std_logic;
	signal res 	: std_logic_vector (4 downto 0);
begin
	MuT	: entity work.AddSub(Functional) port map (c, d, 
oper, signo, res);
	Stimuli: process;
	begin
		c <= "0110"; d <= "0011"; oper <= add;
		wait for 100ns;
		oper <= sub; wait for 100ns;
		d <= "1001"; wait for 100ns;
		oper <= add; wait;
	end process Stimuli;
end Test_Bench;
