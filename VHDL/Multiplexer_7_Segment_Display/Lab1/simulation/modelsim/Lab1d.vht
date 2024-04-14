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
-- Generated on "01/31/2015 23:03:04"
                                                            
-- Vhdl Test Bench template for design  :  Lab1d
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab1d_vhd_tst IS
END Lab1d_vhd_tst;
ARCHITECTURE Lab1d_arch OF Lab1d_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(17 DOWNTO 0);
COMPONENT Lab1d
	PORT (
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Lab1d
	PORT MAP (
-- list connections between master ports and signals
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	SW => SW
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once    

		  -- Set inputs --
		  SW(2 DOWNTO 0) <= "000"; -- T
		  SW(5 DOWNTO 3) <= "001"; -- I
		  SW(8 DOWNTO 6) <= "010"; -- G
		  SW(11 DOWNTO 9) <= "011"; -- E
		  SW(14 DOWNTO 12) <= "111"; -- R
		  
		  -- Toggle control state every 25 ps for all valid values --
        SW(17 DOWNTO 15) <= "000"; wait for 25 ps;
        SW(17 DOWNTO 15) <= "001"; wait for 25 ps;
        SW(17 DOWNTO 15) <= "010"; wait for 25 ps;
        SW(17 DOWNTO 15) <= "011"; wait for 25 ps;
        SW(17 DOWNTO 15) <= "100"; 
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
END Lab1d_arch;
