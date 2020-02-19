-- Single port Block RAM with one cycle output buffer

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

use     ieee.math_real.all;




library work;

library xil_defaultlib; 

entity main_bram is
    generic(
	WIDTH        : natural := 64;
	HEIGHT_BITS  : natural := 1024;
	MEMORY_SIZE  : natural := 65536*8;
	RAM_INIT_FILE : string
	);
    port(
	clk  : in std_logic;
	addr : in std_logic_vector(15 downto 0) ;
	di   : in std_logic_vector(WIDTH-1 downto 0);
	do   : out std_logic_vector(WIDTH-1 downto 0);
	sel  : in std_logic_vector((WIDTH/8)-1 downto 0);
	re   : in std_ulogic;
	we   : in std_ulogic
	);
end entity main_bram;

architecture behaviour of main_bram is


 signal strobe : std_logic_vector(7 downto 0);

    
begin

  strobe <= sel and (7 downto 0 => we);

  ram_0: entity work.bram_template
    generic map (
      RAM_DEPTH => integer(ceil(real(MEMORY_SIZE)/8.0)),
      INIT_FILE => RAM_INIT_FILE
      )
    port map (
      addra  => addr,
      addrb  => addr,
      dina   => di,
      clka   => clk,
      wea    => strobe,
      enb    => re,
      rstb   => '0',
      regceb => re,
      doutb  => do
      );

end architecture behaviour;
