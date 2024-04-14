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
-- Generated on "03/11/2015 23:55:22"
                                                            
-- Vhdl Test Bench template for design  :  Lab4_RegA_Mux
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab4_RegA_Mux_vhd_tst IS
END Lab4_RegA_Mux_vhd_tst;
ARCHITECTURE Lab4_RegA_Mux_arch OF Lab4_RegA_Mux_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL mux_ctrl : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL output : STD_LOGIC_VECTOR(18 DOWNTO 0);
SIGNAL regA_out : STD_LOGIC_VECTOR(18 DOWNTO 0);
COMPONENT Lab4_RegA_Mux
	PORT (
	mux_ctrl : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	output : OUT STD_LOGIC_VECTOR(18 DOWNTO 0);
	regA_out : IN STD_LOGIC_VECTOR(18 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Lab4_RegA_Mux
	PORT MAP (
-- list connections between master ports and signals
	mux_ctrl => mux_ctrl,
	output => output,
	regA_out => regA_out
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- check for a positive number --
        regA_out <= "0010101010101010101";
        mux_ctrl <= "000"; wait for 25 ps;
        mux_ctrl <= "001";	wait for 25 ps;	  
		  mux_ctrl <= "010";	wait for 25 ps;
	     mux_ctrl <= "011";	wait for 25 ps;
        mux_ctrl <= "100";	wait for 25 ps;
        mux_ctrl <= "101";	wait for 25 ps;
        mux_ctrl <= "110";	wait for 25 ps;
        mux_ctrl <= "111"; wait for 25 ps;
		  
        -- code that executes only once 
        regA_out <= "1101010101010101010";

        mux_ctrl <= "000"; wait for 25 ps;
        mux_ctrl <= "001";	wait for 25 ps;	  
		  mux_ctrl <= "010";	wait for 25 ps;
	     mux_ctrl <= "011";	wait for 25 ps;
        mux_ctrl <= "100";	wait for 25 ps;
        mux_ctrl <= "101";	wait for 25 ps;
        mux_ctrl <= "110";	wait for 25 ps;
        mux_ctrl <= "111";		  		  
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
END Lab4_RegA_Mux_arch;
