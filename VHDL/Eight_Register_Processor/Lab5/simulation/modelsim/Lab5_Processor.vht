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
-- Generated on "04/06/2015 19:08:55"
                                                            
-- Vhdl Test Bench template for design  :  Lab5_Processor
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab5_Processor_vhd_tst IS
END Lab5_Processor_vhd_tst;
ARCHITECTURE Lab5_Processor_arch OF Lab5_Processor_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clk : STD_LOGIC;
SIGNAL Data_Bus : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL DIN : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Done : STD_LOGIC;
SIGNAL InR : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL R0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL R1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL R2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL R3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL R4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL R5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL R6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL R7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RA : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Resetn : STD_LOGIC;
SIGNAL RG : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Run : STD_LOGIC;
COMPONENT Lab5_Processor
	PORT (
	Clk : IN STD_LOGIC;
	Data_Bus : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Done : OUT STD_LOGIC;
	InR : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	R0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	R1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	R2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	R3 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	R4 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	R5 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	R6 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	R7 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	RA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Resetn : IN STD_LOGIC;
	RG : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Run : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab5_Processor
	PORT MAP (
-- list connections between master ports and signals
	Clk => Clk,
	Data_Bus => Data_Bus,
	DIN => DIN,
	Done => Done,
	InR => InR,
	R0 => R0,
	R1 => R1,
	R2 => R2,
	R3 => R3,
	R4 => R4,
	R5 => R5,
	R6 => R6,
	R7 => R7,
	RA => RA,
	Resetn => Resetn,
	RG => RG,
	Run => Run
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- Test 1: Reset --		  
        DIN <= x"0000";		  
        Resetn <= '0';
        Run <= '1'; wait for 9 ps;
		  
		  -- Test 2: mvi(Reg0) --
		  DIN <= x"2000"; wait for 1 ps;
		  Resetn <= '1';  wait for 9 ps;
		  DIN <= x"0005"; wait for 10 ps;
		  
		  -- Test 3: mv(Reg1, Reg0) --
		  DIN <= x"0400"; wait for 20 ps;
		  
		  -- Test 4: add(Reg1, Reg0) --
		  DIN <= x"4400"; wait for 30 ps;
		  
		  -- Test 5: sub(Reg1, Reg0) --
		  DIN <= x"6400"; wait for 20 ps;
		  Run <= '0';
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
clock : PROCESS
BEGIN
	Clk <= '0'; wait for 5 ps;
	Clk <= '1'; wait for 5 ps;
END PROCESS clock;                       
END Lab5_Processor_arch;
