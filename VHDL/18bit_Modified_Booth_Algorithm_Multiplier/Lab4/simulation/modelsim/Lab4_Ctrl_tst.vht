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
-- Generated on "03/13/2015 22:40:53"
                                                            
-- Vhdl Test Bench template for design  :  Lab4_Ctrl_tst
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab4_Ctrl_tst_vhd_tst IS
END Lab4_Ctrl_tst_vhd_tst;
ARCHITECTURE Lab4_Ctrl_tst_arch OF Lab4_Ctrl_tst_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL addreg : STD_LOGIC;
SIGNAL busy : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC;
SIGNAL loadreg : STD_LOGIC;
SIGNAL mux_ctrl : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL shiftreg : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT Lab4_Ctrl_tst
	PORT (
	addreg : OUT STD_LOGIC;
	busy : OUT STD_LOGIC;
	clk : IN STD_LOGIC;
	count : BUFFER STD_LOGIC;
	loadreg : BUFFER STD_LOGIC;
	mux_ctrl : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	shiftreg : OUT STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab4_Ctrl_tst
	PORT MAP (
-- list connections between master ports and signals
	addreg => addreg,
	busy => busy,
	clk => clk,
	count => count,
	loadreg => loadreg,
	mux_ctrl => mux_ctrl,
	shiftreg => shiftreg,
	start => start
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- Pulse start signal to observe required behavior --
		  start <= '0'; wait for 10 ps;
		  start <= '1'; wait for 500 ps;
		  start <= '0';
WAIT;                                                        
END PROCESS always;   
clock : PROCESS
BEGIN
	clk <= '0'; wait for 5 ps;
	clk <= '1'; wait for 5 ps;
END PROCESS clock;                                                
END Lab4_Ctrl_tst_arch;
