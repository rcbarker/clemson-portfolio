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
-- Generated on "04/04/2015 16:17:17"
                                                            
-- Vhdl Test Bench template for design  :  Lab5_Reg
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab5_Reg_vhd_tst IS
END Lab5_Reg_vhd_tst;
ARCHITECTURE Lab5_Reg_arch OF Lab5_Reg_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL input : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL load : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT Lab5_Reg
	PORT (
	clk : IN STD_LOGIC;
	input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	load : IN STD_LOGIC;
	output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab5_Reg
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	input => input,
	load => load,
	output => output,
	reset => reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- Initializations --
     	  input <= "1111111111111111";
		  load <= '1'; 
		  reset <= '0'; wait for 10 ps;
		  reset <= '1'; wait for 10 ps;
		  input <= "0000000000000000";
		  load <= '0'; wait for 10 ps;
		  load <= '1'; wait for 10 ps;
		  load <= '0';  
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
END Lab5_Reg_arch;
