-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/14/2015 12:21:16"
                                                            
-- Vhdl Test Bench template for design  :  Lab4_Shift_tst
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab4_Shift_tst_vhd_tst IS
END Lab4_Shift_tst_vhd_tst;
ARCHITECTURE Lab4_Shift_tst_arch OF Lab4_Shift_tst_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL loadreg : STD_LOGIC;
SIGNAL multiplier : STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL partial_product : STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL product : STD_LOGIC_VECTOR(35 DOWNTO 0);
SIGNAL regB_out : STD_LOGIC_VECTOR(17 DOWNTO 0);
SIGNAL regB_to_ctrl : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL regC_out : STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL shift : STD_LOGIC;
COMPONENT Lab4_Shift_tst
	PORT (
	clk : IN STD_LOGIC;
	loadreg : IN STD_LOGIC;
	multiplier : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
	partial_product : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
	product : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
	regB_out : BUFFER STD_LOGIC_VECTOR(17 DOWNTO 0);
	regB_to_ctrl : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	regC_out : BUFFER STD_LOGIC_VECTOR(18 DOWNTO 0);
	shift : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab4_Shift_tst
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	loadreg => loadreg,
	multiplier => multiplier,
	partial_product => partial_product,
	product => product,
	regB_out => regB_out,
	regB_to_ctrl => regB_to_ctrl,
	regC_out => regC_out,
	shift => shift
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- Test with postive PP --
        partial_product <= "0010101010101010101";
	     multiplier <=       "000000000000000001";
		  shift <= '0'; 
		  loadreg <= '1'; wait for 10 ps;
		  loadreg <= '0';
		  
		  -- Shift for 9 cycles --
		  shift <= '1'; wait for 90 ps;
        shift <= '0';
		  
		  wait for 20 ps;
		  
		  -- Test with negative PP --
        partial_product <= "1101010101010101010";
	     multiplier <=       "000000000000000001";
		  shift <= '0'; 
		  loadreg <= '1'; wait for 10 ps;
		  loadreg <= '0';
		  
		  -- Shift for 9 cycles --
		  shift <= '1'; wait for 90 ps;
        shift <= '0';
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                  
falling_clock : PROCESS
BEGIN
	clk <= '1'; wait for 5 ps;
	clk <= '0'; wait for 5 ps;
END PROCESS falling_clock;                         
END Lab4_Shift_tst_arch;
