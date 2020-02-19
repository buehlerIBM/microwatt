library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;
use work.wishbone_types.all;

entity core_tb is
end core_tb;

architecture behave of core_tb is
	signal clk, rst: std_logic;

	-- testbench signals
	constant clk_period : time := 10 ns;
begin

    soc0: entity work.soc_wrapper
	generic map(
	    SIM => true,
	    MEMORY_SIZE => 524288,
	    RAM_INIT_FILE => "/afs/bb/u/buehler/quantum/volumes/q1/mw_prj/src/microwatt/fpga/hello_world_reiner.hex",
	    RESET_LOW => false
	    )
	port map(
	    rst => rst,
	    system_clk => clk,
	    uart0_rxd => '1',
	    uart0_txd => open,
	    led_out   => open
	    
	    );

    clk_process: process
    begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
    end process;

    rst_process: process
    begin
	rst <= '1';
	wait for 10*clk_period;
	rst <= '0';
	wait;
    end process;

  --  jtag: entity work.sim_jtag;
end;
