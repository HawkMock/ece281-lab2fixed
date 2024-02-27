--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : halfAdder_tb.vhd
--| AUTHOR(S)     : Capt Warner and Dustin Mock
--| CREATED       : 01/17/2017
--| DESCRIPTION   : This file implements a half adder test bench.
--|
--| DOCUMENTATION : Modified slightly by Capt Johnson
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : halfAdder.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity sevSegDecoder_tb is
end sevSegDecoder_tb;

architecture test_bench of sevSegDecoder_tb is 

	-- Component Declaration	
  component sevenSegDecoder is
	Port ( i_D : in STD_LOGIC_VECTOR (3 downto 0);
           o_S : out STD_LOGIC_VECTOR (6 downto 0));	
  end component;

  signal w_sw : std_logic_vector (3 downto 0) := "0000";
  signal w_seg : std_logic_vector (6 downto 0) := "0000000"; 
  
    
begin
	-- PORT MAPS ----------------------------------------
	sevenSegDecoder1_inst : sevenSegDecoder port map (
		i_D => w_sw,
		o_S => w_seg  
	);
	-----------------------------------------------------
	
	-- PROCESSES ----------------------------------------	
	-- Test plan process
	-- Testing each combination of i_A and i_B (4 total)
	test_process : process 
	begin

	
        w_sw <= x"0"; wait for 10 ns;
            assert w_seg = x"40" report "bad x0" severity failure;
        w_sw <= x"1"; wait for 10 ns;
            assert w_seg = x"79" report "bad x1" severity failure;
        w_sw <= x"2"; wait for 10 ns;
            assert w_seg = x"24" report "bad x2" severity failure;
        w_sw <= x"3"; wait for 10 ns;
            assert w_seg = x"30" report "bad x3" severity failure;
        w_sw <= x"4"; wait for 10 ns;
            assert w_seg = x"19" report "bad x4" severity failure;
        w_sw <= x"5"; wait for 10 ns;
            assert w_seg = x"12" report "bad x5" severity failure;
        w_sw <= x"6"; wait for 10 ns;
            assert w_seg = x"02" report "bad x6" severity failure;
        w_sw <= x"7"; wait for 10 ns;
            assert w_seg = x"78" report "bad x7" severity failure;
        w_sw <= x"8"; wait for 10 ns;
            assert w_seg = x"00" report "bad x8" severity failure;
        w_sw <= x"9"; wait for 10 ns;
            assert w_seg = x"10" report "bad x9" severity failure;
        w_sw <= x"A"; wait for 10 ns;
            assert w_seg = x"08" report "bad xA" severity failure;
        w_sw <= x"B"; wait for 10 ns;
            assert w_seg = x"03" report "bad xB" severity failure;
        w_sw <= x"C"; wait for 10 ns;
            assert w_seg = x"27" report "bad xC" severity failure;
        w_sw <= x"D"; wait for 10 ns;
            assert w_seg = x"21" report "bad xD" severity failure;
        w_sw <= x"E"; wait for 10 ns;
            assert w_seg = x"06" report "bad xE" severity failure;
        w_sw <= x"F"; wait for 10 ns;
            assert w_seg = x"0E" report "bad xF" severity failure;
		  
		wait; -- wait forever
		
	end process;	
	-----------------------------------------------------	
	
end test_bench;
