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
-- Generated on "04/04/2015 16:37:03"
                                                            
-- Vhdl Test Bench template for design  :  Lab5_Mux
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab5_Mux_vhd_tst IS
END Lab5_Mux_vhd_tst;
ARCHITECTURE Lab5_Mux_arch OF Lab5_Mux_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL adder_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL adder_out : STD_LOGIC;
SIGNAL data_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL data_out : STD_LOGIC;
SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg0_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg0_out : STD_LOGIC;
SIGNAL reg1_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg1_out : STD_LOGIC;
SIGNAL reg2_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg2_out : STD_LOGIC;
SIGNAL reg3_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg3_out : STD_LOGIC;
SIGNAL reg4_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg4_out : STD_LOGIC;
SIGNAL reg5_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg5_out : STD_LOGIC;
SIGNAL reg6_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg6_out : STD_LOGIC;
SIGNAL reg7_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reg7_out : STD_LOGIC;
COMPONENT Lab5_Mux
	PORT (
	adder_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	adder_out : IN STD_LOGIC;
	data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	data_out : IN STD_LOGIC;
	output : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg0_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg0_out : IN STD_LOGIC;
	reg1_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg1_out : IN STD_LOGIC;
	reg2_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg2_out : IN STD_LOGIC;
	reg3_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg3_out : IN STD_LOGIC;
	reg4_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg4_out : IN STD_LOGIC;
	reg5_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg5_out : IN STD_LOGIC;
	reg6_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg6_out : IN STD_LOGIC;
	reg7_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reg7_out : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab5_Mux
	PORT MAP (
-- list connections between master ports and signals
	adder_in => adder_in,
	adder_out => adder_out,
	data_in => data_in,
	data_out => data_out,
	output => output,
	reg0_in => reg0_in,
	reg0_out => reg0_out,
	reg1_in => reg1_in,
	reg1_out => reg1_out,
	reg2_in => reg2_in,
	reg2_out => reg2_out,
	reg3_in => reg3_in,
	reg3_out => reg3_out,
	reg4_in => reg4_in,
	reg4_out => reg4_out,
	reg5_in => reg5_in,
	reg5_out => reg5_out,
	reg6_in => reg6_in,
	reg6_out => reg6_out,
	reg7_in => reg7_in,
	reg7_out => reg7_out
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- Initializations --
        reg0_in <=  "0000000000000000";
        reg1_in <=  "0000000000000001";
        reg2_in <=  "0000000000000010";
        reg3_in <=  "0000000000000100";
        reg4_in <=  "0000000000001000";
        reg5_in <=  "0000000000010000";
        reg6_in <=  "0000000000100000";
        reg7_in <=  "0000000001000000";		  
		  data_in <=  "0000000010000000";
		  adder_in <= "0000000100000000";
		  
		  -- Initial Control Lines --
		  reg0_out <= '1';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;
		  
		  -- Toggle Control Lines --
		  reg0_out <= '0';
		  reg1_out <= '1';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;
		  
		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '1';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;
		  
		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '1';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;

		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '1';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;

		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '1';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;
		  
		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '1';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;
		  
		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '1';
		  data_out <= '0';
		  adder_out <= '0'; wait for 10 ps;
	
		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '1';
		  adder_out <= '0'; wait for 10 ps;
		  
		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '1'; wait for 10 ps;
		  
		  reg0_out <= '0';
		  reg1_out <= '0';
		  reg2_out <= '0';
		  reg3_out <= '0';
		  reg4_out <= '0';
		  reg5_out <= '0';
		  reg6_out <= '0';		  
		  reg7_out <= '0';
		  data_out <= '0';
		  adder_out <= '0';
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
END Lab5_Mux_arch;
