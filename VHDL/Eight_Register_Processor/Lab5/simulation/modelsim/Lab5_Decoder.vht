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
-- Generated on "04/05/2015 19:50:44"
                                                            
-- Vhdl Test Bench template for design  :  Lab5_Decoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab5_Decoder_vhd_tst IS
END Lab5_Decoder_vhd_tst;
ARCHITECTURE Lab5_Decoder_arch OF Lab5_Decoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL input : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL out0 : STD_LOGIC;
SIGNAL out1 : STD_LOGIC;
SIGNAL out2 : STD_LOGIC;
SIGNAL out3 : STD_LOGIC;
SIGNAL out4 : STD_LOGIC;
SIGNAL out5 : STD_LOGIC;
SIGNAL out6 : STD_LOGIC;
SIGNAL out7 : STD_LOGIC;
COMPONENT Lab5_Decoder
	PORT (
	input : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	out0 : OUT STD_LOGIC;
	out1 : OUT STD_LOGIC;
	out2 : OUT STD_LOGIC;
	out3 : OUT STD_LOGIC;
	out4 : OUT STD_LOGIC;
	out5 : OUT STD_LOGIC;
	out6 : OUT STD_LOGIC;
	out7 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab5_Decoder
	PORT MAP (
-- list connections between master ports and signals
	input => input,
	out0 => out0,
	out1 => out1,
	out2 => out2,
	out3 => out3,
	out4 => out4,
	out5 => out5,
	out6 => out6,
	out7 => out7
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once     
        input <= "000"; wait for 10 ps;
        input <= "001"; wait for 10 ps;
        input <= "010"; wait for 10 ps;
        input <= "011"; wait for 10 ps;
        input <= "100"; wait for 10 ps;
        input <= "101"; wait for 10 ps;
        input <= "110"; wait for 10 ps;
        input <= "111";		  
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
END Lab5_Decoder_arch;
