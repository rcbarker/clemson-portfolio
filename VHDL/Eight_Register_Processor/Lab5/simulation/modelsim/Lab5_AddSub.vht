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
-- Generated on "04/04/2015 17:11:35"
                                                            
-- Vhdl Test Bench template for design  :  Lab5_AddSub
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab5_AddSub_vhd_tst IS
END Lab5_AddSub_vhd_tst;
ARCHITECTURE Lab5_AddSub_arch OF Lab5_AddSub_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL c_out : STD_LOGIC;
SIGNAL in1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL in2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL mode : STD_LOGIC;
SIGNAL sum : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT Lab5_AddSub
	PORT (
	c_out : BUFFER STD_LOGIC;
	in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	in2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	mode : IN STD_LOGIC;
	sum : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Lab5_AddSub
	PORT MAP (
-- list connections between master ports and signals
	c_out => c_out,
	in1 => in1,
	in2 => in2,
	mode => mode,
	sum => sum
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- Initializations --
	     in1  <= "0000000000000001";
	     in2  <= "0000000000000001";
		  
		  -- Toggle mode --
        mode <= '0'; wait for 10 ps;
        mode <= '1'; wait for 10 ps;

	     in1  <= "1111111111111111";
	     in2  <= "0000000000000001";
        mode <= '0'; wait for 10 ps;
        mode <= '1'; wait for 10 ps;

	     in1  <= "0101010101010100";
	     in2  <= "0000000000000001";
        mode <= '0'; wait for 10 ps;
        mode <= '1';  		  
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
END Lab5_AddSub_arch;
