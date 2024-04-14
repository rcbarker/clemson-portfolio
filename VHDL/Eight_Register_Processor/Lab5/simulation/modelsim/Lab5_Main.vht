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
-- Generated on "04/08/2015 21:28:21"
                                                            
-- Vhdl Test Bench template for design  :  Lab5_Main
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab5_Main_vhd_tst IS
END Lab5_Main_vhd_tst;
ARCHITECTURE Lab5_Main_arch OF Lab5_Main_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Data_Bus : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Done : STD_LOGIC;
SIGNAL InRg : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL MClk : STD_LOGIC;
SIGNAL PClk : STD_LOGIC;
SIGNAL Resetn : STD_LOGIC;
SIGNAL Rg0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rg1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rg2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rg3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rg4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rg5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rg6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rg7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RgA : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RgG : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Run : STD_LOGIC;
COMPONENT Lab5_Main
	PORT (
	Data_Bus : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Done : BUFFER STD_LOGIC;
	InRg : BUFFER STD_LOGIC_VECTOR(8 DOWNTO 0);
	MClk : IN STD_LOGIC;
	PClk : IN STD_LOGIC;
	Resetn : IN STD_LOGIC;
	Rg0 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rg1 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rg2 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rg3 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rg4 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rg5 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rg6 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rg7 : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	RgA : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	RgG : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	Run : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab5_Main
	PORT MAP (
-- list connections between master ports and signals
	Data_Bus => Data_Bus,
	Done => Done,
	InRg => InRg,
	MClk => MClk,
	PClk => PClk,
	Resetn => Resetn,
	Rg0 => Rg0,
	Rg1 => Rg1,
	Rg2 => Rg2,
	Rg3 => Rg3,
	Rg4 => Rg4,
	Rg5 => Rg5,
	Rg6 => Rg6,
	Rg7 => Rg7,
	RgA => RgA,
	RgG => RgG,
	Run => Run
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once         
        Resetn <= '0';
        Run <= '1'; wait for 10 ps;
        Resetn <= '1';		  
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
Mclock : PROCESS
BEGIN
	MClk <= '0'; wait for 5 ps;
	MClk <= '1'; wait for 5 ps;
END PROCESS Mclock;              
Pclock : PROCESS
BEGIN
	PClk <= '0'; wait for 5 ps;
	PClk <= '1'; wait for 5 ps;
END PROCESS Pclock;                                        
END Lab5_Main_arch;
