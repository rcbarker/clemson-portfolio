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
-- Generated on "03/12/2015 17:39:58"
                                                            
-- Vhdl Test Bench template for design  :  Lab4_RegD
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab4_RegD_vhd_tst IS
END Lab4_RegD_vhd_tst;
ARCHITECTURE Lab4_RegD_arch OF Lab4_RegD_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC;
SIGNAL loadreg : STD_LOGIC;
SIGNAL maxval : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL output : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT Lab4_RegD
	PORT (
	clk : IN STD_LOGIC;
	count : IN STD_LOGIC;
	loadreg : IN STD_LOGIC;
	maxval : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Lab4_RegD
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	count => count,
	loadreg => loadreg,
	maxval => maxval,
	output => output
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                          
        -- Initialize Register D inputs --
		  maxval <= "1001";
		  count <= '0';
        loadreg <= '1'; wait for 10 ps;
		  loadreg <= '0';
		  count <= '1'; wait for 90 ps;
        maxval <= "0101";		  
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
END Lab4_RegD_arch;
