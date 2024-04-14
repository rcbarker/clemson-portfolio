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
-- Generated on "04/05/2015 20:46:15"
                                                            
-- Vhdl Test Bench template for design  :  Lab5_Ctrl_tst
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab5_Ctrl_tst_vhd_tst IS
END Lab5_Ctrl_tst_vhd_tst;
ARCHITECTURE Lab5_Ctrl_tst_arch OF Lab5_Ctrl_tst_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A_in : STD_LOGIC;
SIGNAL AddSub : STD_LOGIC;
SIGNAL Clk : STD_LOGIC;
SIGNAL DIN_out : STD_LOGIC;
SIGNAL Done : STD_LOGIC;
SIGNAL G_in : STD_LOGIC;
SIGNAL G_out : STD_LOGIC;
SIGNAL IR_bits : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL R0_in : STD_LOGIC;
SIGNAL R0_out : STD_LOGIC;
SIGNAL R1_in : STD_LOGIC;
SIGNAL R1_out : STD_LOGIC;
SIGNAL R2_in : STD_LOGIC;
SIGNAL R2_out : STD_LOGIC;
SIGNAL R3_in : STD_LOGIC;
SIGNAL R3_out : STD_LOGIC;
SIGNAL R4_in : STD_LOGIC;
SIGNAL R4_out : STD_LOGIC;
SIGNAL R5_in : STD_LOGIC;
SIGNAL R5_out : STD_LOGIC;
SIGNAL R6_in : STD_LOGIC;
SIGNAL R6_out : STD_LOGIC;
SIGNAL R7_in : STD_LOGIC;
SIGNAL R7_out : STD_LOGIC;
SIGNAL Resetn : STD_LOGIC;
SIGNAL Run : STD_LOGIC;
COMPONENT Lab5_Ctrl_tst
	PORT (
	A_in : OUT STD_LOGIC;
	AddSub : OUT STD_LOGIC;
	Clk : IN STD_LOGIC;
	DIN_out : OUT STD_LOGIC;
	Done : OUT STD_LOGIC;
	G_in : OUT STD_LOGIC;
	G_out : OUT STD_LOGIC;
	IR_bits : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	R0_in : OUT STD_LOGIC;
	R0_out : OUT STD_LOGIC;
	R1_in : OUT STD_LOGIC;
	R1_out : OUT STD_LOGIC;
	R2_in : OUT STD_LOGIC;
	R2_out : OUT STD_LOGIC;
	R3_in : OUT STD_LOGIC;
	R3_out : OUT STD_LOGIC;
	R4_in : OUT STD_LOGIC;
	R4_out : OUT STD_LOGIC;
	R5_in : OUT STD_LOGIC;
	R5_out : OUT STD_LOGIC;
	R6_in : OUT STD_LOGIC;
	R6_out : OUT STD_LOGIC;
	R7_in : OUT STD_LOGIC;
	R7_out : OUT STD_LOGIC;
	Resetn : IN STD_LOGIC;
	Run : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab5_Ctrl_tst
	PORT MAP (
-- list connections between master ports and signals
	A_in => A_in,
	AddSub => AddSub,
	Clk => Clk,
	DIN_out => DIN_out,
	Done => Done,
	G_in => G_in,
	G_out => G_out,
	IR_bits => IR_bits,
	R0_in => R0_in,
	R0_out => R0_out,
	R1_in => R1_in,
	R1_out => R1_out,
	R2_in => R2_in,
	R2_out => R2_out,
	R3_in => R3_in,
	R3_out => R3_out,
	R4_in => R4_in,
	R4_out => R4_out,
	R5_in => R5_in,
	R5_out => R5_out,
	R6_in => R6_in,
	R6_out => R6_out,
	R7_in => R7_in,
	R7_out => R7_out,
	Resetn => Resetn,
	Run => Run
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once 
		  Run <= '1'; 
        IR_bits <= "000111000"; -- move 0 into 7
        Resetn <= '0'; wait for 10 ps;
		  Resetn <= '1'; wait for 10 ps;
        Run <= '0';    wait for 10 ps;
        IR_bits <= "001101000"; -- mvi into 5
		  Run <= '1';    wait for 10 ps;
		  IR_bits <= "101010101";
		  Run <= '0';    wait for 10 ps;
		  IR_bits <= "010001010"; -- add 1 and 2. Store 1.
		  Run <= '1';    wait for 10 ps;
		  Run <= '0';    wait for 30 ps;
		  IR_bits <= "011100001"; -- subtract 4 and 1. Store 4.
		  Run <= '1';    wait for 10 ps;
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
END Lab5_Ctrl_tst_arch;
