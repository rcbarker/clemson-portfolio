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
-- Generated on "02/16/2015 23:08:29"
                                                            
-- Vhdl Test Bench template for design  :  Lab2b
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab2b_vhd_tst IS
END Lab2b_vhd_tst;
ARCHITECTURE Lab2b_arch OF Lab2b_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL KEY : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL LEDG : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT Lab2b
	PORT (
	KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	LEDG : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	LEDR : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Lab2b
	PORT MAP (
-- list connections between master ports and signals
	KEY => KEY,
	LEDG => LEDG,
	LEDR => LEDR,
	SW => SW
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
		  -- Initialize input and toggle reset
		  SW(0) <= '0';
		  SW(1) <= '1'; wait for 10 ps;
		  SW(0) <= '1';
		  
		  -- Test input
		  SW(1) <= '0'; wait for 27 ps;
		  SW(1) <= '1'; wait for 12 ps;
		  SW(1) <= '0'; wait for 42 ps;
		  SW(1) <= '1'; wait for 52 ps;
		  SW(1) <= '0';                  
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
clk : PROCESS
BEGIN
	KEY(0) <= '0'; wait for 5 ps;
	KEY(0) <= '1'; wait for 5 ps;
END PROCESS clk;                                           
END Lab2b_arch;
