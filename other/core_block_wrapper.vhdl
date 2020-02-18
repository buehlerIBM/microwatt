--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
--Date        : Tue Jan 21 11:14:55 2020
--Host        : hdclf154.boeblingen.de.ibm.com running 64-bit Red Hat Enterprise Linux Workstation release 7.5 (Maipo)
--Command     : generate_target core_block_wrapper.bd
--Design      : core_block_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity core_block_wrapper is
  port (
    CLK_IN_D_0_clk_n : in STD_LOGIC;
    CLK_IN_D_0_clk_p : in STD_LOGIC;
    led_out_0 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    uart0_rxd_0 : in STD_LOGIC;
    uart0_txd_0 : out STD_LOGIC
  );
end core_block_wrapper;

architecture STRUCTURE of core_block_wrapper is
  component soc_block is
  port (
    uart0_rxd_0 : in STD_LOGIC;
    uart0_txd_0 : out STD_LOGIC;
    led_out_0 : out STD_LOGIC_VECTOR ( 5 downto 0 );
    CLK_IN_D_0_clk_p : in STD_LOGIC;
    CLK_IN_D_0_clk_n : in STD_LOGIC
  );
  end component soc_block;
begin
core_block_i: component soc_block
     port map (
      CLK_IN_D_0_clk_n => CLK_IN_D_0_clk_n,
      CLK_IN_D_0_clk_p => CLK_IN_D_0_clk_p,
      led_out_0(5 downto 0) => led_out_0(5 downto 0),
      uart0_rxd_0 => uart0_rxd_0,
      uart0_txd_0 => uart0_txd_0
    );
end STRUCTURE;
