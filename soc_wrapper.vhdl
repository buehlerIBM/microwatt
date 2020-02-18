library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;
use work.wishbone_types.all;

entity soc_wrapper is
    generic (
	MEMORY_SIZE   : positive := 524288;
	RAM_INIT_FILE : string := "/tmp/hello_world.hex";
	RESET_LOW     : boolean := false;
	SIM           : boolean := false;
	DISABLE_FLATTEN_CORE : boolean := false
	);
    port(
	rst          : in  std_ulogic;
	system_clk   : in  std_ulogic;

	-- UART0 signals:
	uart0_txd    : out std_ulogic;
	uart0_rxd    : in  std_ulogic;

	-- Misc (to use for things like LEDs)
	led_out      :  out std_ulogic_vector(5 downto 0)
	);

end soc_wrapper;

architecture behave of soc_wrapper is

begin 

    soc0: entity work.soc
	generic map(
	    SIM => SIM,
	    MEMORY_SIZE => MEMORY_SIZE,
	    RAM_INIT_FILE => RAM_INIT_FILE,
	    RESET_LOW => RESET_LOW
	    )
	port map(
	    rst        => rst,
	    system_clk => system_clk,
	    uart0_rxd  => uart0_rxd,
	    uart0_txd  => uart0_txd
	    -- debug      => led_out
	    );

end;
