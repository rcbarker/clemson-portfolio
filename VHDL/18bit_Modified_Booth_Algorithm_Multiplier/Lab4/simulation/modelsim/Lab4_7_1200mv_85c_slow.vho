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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "03/17/2015 11:54:44"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab4 IS
    PORT (
	start : IN std_logic;
	multiplicand : IN std_logic_vector(17 DOWNTO 0);
	multiplier : IN std_logic_vector(17 DOWNTO 0);
	clk : IN std_logic;
	busy : BUFFER std_logic;
	product : BUFFER std_logic_vector(35 DOWNTO 0)
	);
END Lab4;

-- Design Ports Information
-- busy	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[0]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[1]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[2]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[3]	=>  Location: PIN_A22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[4]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[5]	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[6]	=>  Location: PIN_D24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[7]	=>  Location: PIN_D22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[8]	=>  Location: PIN_G24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[9]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[10]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[11]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[12]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[13]	=>  Location: PIN_C23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[14]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[15]	=>  Location: PIN_D23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[16]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[17]	=>  Location: PIN_C24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[18]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[19]	=>  Location: PIN_G25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[20]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[21]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[22]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[23]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[24]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[25]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[26]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[27]	=>  Location: PIN_H23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[28]	=>  Location: PIN_D27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[29]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[30]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[31]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[32]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[33]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[34]	=>  Location: PIN_H24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- product[35]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_J28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[0]	=>  Location: PIN_J27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[1]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[2]	=>  Location: PIN_C25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[3]	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[4]	=>  Location: PIN_A25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[5]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[6]	=>  Location: PIN_B25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[7]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[8]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[9]	=>  Location: PIN_A23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[10]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[11]	=>  Location: PIN_D25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[12]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[13]	=>  Location: PIN_B23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[14]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[15]	=>  Location: PIN_A26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[16]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplier[17]	=>  Location: PIN_D21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[0]	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[1]	=>  Location: PIN_D28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[2]	=>  Location: PIN_C27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[3]	=>  Location: PIN_F24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[4]	=>  Location: PIN_F25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[5]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[6]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[7]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[8]	=>  Location: PIN_G26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[9]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[10]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[11]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[12]	=>  Location: PIN_D26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[13]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[14]	=>  Location: PIN_J23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[15]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[16]	=>  Location: PIN_L21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- multiplicand[17]	=>  Location: PIN_J24,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_multiplicand : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_multiplier : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_busy : std_logic;
SIGNAL ww_product : std_logic_vector(35 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \busy~output_o\ : std_logic;
SIGNAL \product[0]~output_o\ : std_logic;
SIGNAL \product[1]~output_o\ : std_logic;
SIGNAL \product[2]~output_o\ : std_logic;
SIGNAL \product[3]~output_o\ : std_logic;
SIGNAL \product[4]~output_o\ : std_logic;
SIGNAL \product[5]~output_o\ : std_logic;
SIGNAL \product[6]~output_o\ : std_logic;
SIGNAL \product[7]~output_o\ : std_logic;
SIGNAL \product[8]~output_o\ : std_logic;
SIGNAL \product[9]~output_o\ : std_logic;
SIGNAL \product[10]~output_o\ : std_logic;
SIGNAL \product[11]~output_o\ : std_logic;
SIGNAL \product[12]~output_o\ : std_logic;
SIGNAL \product[13]~output_o\ : std_logic;
SIGNAL \product[14]~output_o\ : std_logic;
SIGNAL \product[15]~output_o\ : std_logic;
SIGNAL \product[16]~output_o\ : std_logic;
SIGNAL \product[17]~output_o\ : std_logic;
SIGNAL \product[18]~output_o\ : std_logic;
SIGNAL \product[19]~output_o\ : std_logic;
SIGNAL \product[20]~output_o\ : std_logic;
SIGNAL \product[21]~output_o\ : std_logic;
SIGNAL \product[22]~output_o\ : std_logic;
SIGNAL \product[23]~output_o\ : std_logic;
SIGNAL \product[24]~output_o\ : std_logic;
SIGNAL \product[25]~output_o\ : std_logic;
SIGNAL \product[26]~output_o\ : std_logic;
SIGNAL \product[27]~output_o\ : std_logic;
SIGNAL \product[28]~output_o\ : std_logic;
SIGNAL \product[29]~output_o\ : std_logic;
SIGNAL \product[30]~output_o\ : std_logic;
SIGNAL \product[31]~output_o\ : std_logic;
SIGNAL \product[32]~output_o\ : std_logic;
SIGNAL \product[33]~output_o\ : std_logic;
SIGNAL \product[34]~output_o\ : std_logic;
SIGNAL \product[35]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \Ctrl|state~8_combout\ : std_logic;
SIGNAL \Ctrl|state.B~q\ : std_logic;
SIGNAL \RegD|counter[1]~4_combout\ : std_logic;
SIGNAL \RegD|counter[0]~2_combout\ : std_logic;
SIGNAL \RegD|Add0~0_combout\ : std_logic;
SIGNAL \RegD|counter[3]~3_combout\ : std_logic;
SIGNAL \RegD|counter[0]~0_combout\ : std_logic;
SIGNAL \RegD|counter[0]~1_combout\ : std_logic;
SIGNAL \RegD|Add0~1_combout\ : std_logic;
SIGNAL \RegD|counter[2]~5_combout\ : std_logic;
SIGNAL \Ctrl|Selector0~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector1~0_combout\ : std_logic;
SIGNAL \Ctrl|state.C~q\ : std_logic;
SIGNAL \Ctrl|state.D~q\ : std_logic;
SIGNAL \Ctrl|Selector0~1_combout\ : std_logic;
SIGNAL \Ctrl|state.A~q\ : std_logic;
SIGNAL \multiplier[2]~input_o\ : std_logic;
SIGNAL \multiplier[14]~input_o\ : std_logic;
SIGNAL \RegB|last_bit~0_combout\ : std_logic;
SIGNAL \multiplier[3]~input_o\ : std_logic;
SIGNAL \RegC|output[0]~17_combout\ : std_logic;
SIGNAL \multiplicand[16]~input_o\ : std_logic;
SIGNAL \RegA_Mux|Mux17~3_combout\ : std_logic;
SIGNAL \multiplicand[15]~input_o\ : std_logic;
SIGNAL \multiplicand[14]~input_o\ : std_logic;
SIGNAL \multiplicand[13]~input_o\ : std_logic;
SIGNAL \multiplicand[12]~input_o\ : std_logic;
SIGNAL \multiplicand[11]~input_o\ : std_logic;
SIGNAL \multiplicand[10]~input_o\ : std_logic;
SIGNAL \multiplicand[9]~input_o\ : std_logic;
SIGNAL \multiplicand[8]~input_o\ : std_logic;
SIGNAL \multiplicand[7]~input_o\ : std_logic;
SIGNAL \multiplicand[6]~input_o\ : std_logic;
SIGNAL \multiplicand[5]~input_o\ : std_logic;
SIGNAL \multiplicand[4]~input_o\ : std_logic;
SIGNAL \multiplicand[3]~input_o\ : std_logic;
SIGNAL \multiplicand[2]~input_o\ : std_logic;
SIGNAL \multiplicand[1]~input_o\ : std_logic;
SIGNAL \multiplicand[0]~input_o\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[0]~1_cout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[1]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[2]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[3]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[4]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[5]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[6]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[7]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[8]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[9]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[10]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[11]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[12]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[13]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[14]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[15]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[16]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux1~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux17~2_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux1~1_combout\ : std_logic;
SIGNAL \multiplicand[17]~input_o\ : std_logic;
SIGNAL \RegA_Mux|Mux18~1_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[16]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[17]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux1~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:17:AdderX|sum~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux0~2_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[17]~1\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[18]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux0~3_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:18:AdderX|sum~0_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[15]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[14]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux3~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux3~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux3~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:15:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux2~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux2~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux2~2_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[13]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux4~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux4~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux4~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:15:AdderX|c_out~1_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[12]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux5~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux5~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux5~2_combout\ : std_logic;
SIGNAL \RegC|output[14]~40_combout\ : std_logic;
SIGNAL \RegC|output[14]~41_combout\ : std_logic;
SIGNAL \RegC|output[0]~19_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[11]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux6~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux6~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux6~2_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[10]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux7~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux7~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux7~2_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[9]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux8~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux8~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux8~2_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[8]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux9~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux9~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux9~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:9:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[7]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux10~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux10~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux10~2_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[6]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux12~4_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[5]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux12~2_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux12~3_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[3]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[2]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux15~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux15~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux15~2_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[1]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux16~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux16~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux16~2_combout\ : std_logic;
SIGNAL \RegC|output[0]~16_combout\ : std_logic;
SIGNAL \RegC|output[0]~18_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux17~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux17~1_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:1:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegC|output[2]~22_combout\ : std_logic;
SIGNAL \RegC|output[2]~23_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:2:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:3:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegA_Mux|multiplex:twos_complement[4]~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux14~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux14~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux14~2_combout\ : std_logic;
SIGNAL \RegC|output[4]~26_combout\ : std_logic;
SIGNAL \RegC|output[4]~27_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:4:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux13~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux13~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux13~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:5:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegC|output[6]~30_combout\ : std_logic;
SIGNAL \RegC|output[6]~31_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:6:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux11~0_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux11~1_combout\ : std_logic;
SIGNAL \RegA_Mux|Mux11~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:6:AdderX|c_out~1_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:6:AdderX|c_out~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:7:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegC|output[8]~32_combout\ : std_logic;
SIGNAL \RegC|output[8]~33_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:9:AdderX|c_out~1_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:9:AdderX|c_out~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:10:AdderX|sum~combout\ : std_logic;
SIGNAL \RegC|output[10]~45_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:10:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:11:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegC|output[12]~38_combout\ : std_logic;
SIGNAL \RegC|output[12]~39_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:12:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:12:AdderX|c_out~1_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:12:AdderX|c_out~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:13:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:15:AdderX|c_out~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:16:AdderX|sum~combout\ : std_logic;
SIGNAL \RegC|output[16]~48_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:16:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:18:AdderX|sum~combout\ : std_logic;
SIGNAL \load_or_add~combout\ : std_logic;
SIGNAL \RegC|output[16]~42_combout\ : std_logic;
SIGNAL \RegC|output[17]~43_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:15:AdderX|sum~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:15:AdderX|sum~combout\ : std_logic;
SIGNAL \RegC|output[15]~47_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:13:AdderX|sum~combout\ : std_logic;
SIGNAL \RegC|output[13]~46_combout\ : std_logic;
SIGNAL \RegC|output[11]~36_combout\ : std_logic;
SIGNAL \RegC|output[11]~37_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:8:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegC|output[9]~34_combout\ : std_logic;
SIGNAL \RegC|output[9]~35_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:7:AdderX|sum~combout\ : std_logic;
SIGNAL \RegC|output[7]~44_combout\ : std_logic;
SIGNAL \RegC|output[5]~28_combout\ : std_logic;
SIGNAL \RegC|output[5]~29_combout\ : std_logic;
SIGNAL \RegC|output[3]~24_combout\ : std_logic;
SIGNAL \RegC|output[3]~25_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:0:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \RegC|output[1]~20_combout\ : std_logic;
SIGNAL \RegC|output[1]~21_combout\ : std_logic;
SIGNAL \RegC|bits_out[1]~2_combout\ : std_logic;
SIGNAL \multiplier[17]~input_o\ : std_logic;
SIGNAL \RegB|output[17]~18_combout\ : std_logic;
SIGNAL \RegB|output[7]~1_combout\ : std_logic;
SIGNAL \multiplier[15]~input_o\ : std_logic;
SIGNAL \RegB|output[15]~16_combout\ : std_logic;
SIGNAL \multiplier[13]~input_o\ : std_logic;
SIGNAL \RegB|output[13]~14_combout\ : std_logic;
SIGNAL \multiplier[11]~input_o\ : std_logic;
SIGNAL \RegB|output[11]~12_combout\ : std_logic;
SIGNAL \multiplier[9]~input_o\ : std_logic;
SIGNAL \RegB|output[9]~10_combout\ : std_logic;
SIGNAL \multiplier[7]~input_o\ : std_logic;
SIGNAL \RegB|output[7]~8_combout\ : std_logic;
SIGNAL \multiplier[5]~input_o\ : std_logic;
SIGNAL \RegB|output[5]~6_combout\ : std_logic;
SIGNAL \RegB|output[3]~4_combout\ : std_logic;
SIGNAL \multiplier[1]~input_o\ : std_logic;
SIGNAL \RegB|output[1]~2_combout\ : std_logic;
SIGNAL \RegB|last_bit~q\ : std_logic;
SIGNAL \RegA_Mux|Mux18~0_combout\ : std_logic;
SIGNAL \RegC|bits_out[0]~3_combout\ : std_logic;
SIGNAL \multiplier[16]~input_o\ : std_logic;
SIGNAL \RegB|output[16]~17_combout\ : std_logic;
SIGNAL \RegB|output[14]~15_combout\ : std_logic;
SIGNAL \multiplier[12]~input_o\ : std_logic;
SIGNAL \RegB|output[12]~13_combout\ : std_logic;
SIGNAL \multiplier[10]~input_o\ : std_logic;
SIGNAL \RegB|output[10]~11_combout\ : std_logic;
SIGNAL \multiplier[8]~input_o\ : std_logic;
SIGNAL \RegB|output[8]~9_combout\ : std_logic;
SIGNAL \multiplier[6]~input_o\ : std_logic;
SIGNAL \RegB|output[6]~7_combout\ : std_logic;
SIGNAL \multiplier[4]~input_o\ : std_logic;
SIGNAL \RegB|output[4]~5_combout\ : std_logic;
SIGNAL \RegB|output[2]~3_combout\ : std_logic;
SIGNAL \multiplier[0]~input_o\ : std_logic;
SIGNAL \RegB|output[0]~0_combout\ : std_logic;
SIGNAL \RegC|output\ : std_logic_vector(18 DOWNTO 0);
SIGNAL \RegB|bits_out\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \RegC|bits_out\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \RegB|output\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \RegD|counter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RegA|output\ : std_logic_vector(18 DOWNTO 0);
SIGNAL \ALT_INV_clk~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_start <= start;
ww_multiplicand <= multiplicand;
ww_multiplier <= multiplier;
ww_clk <= clk;
busy <= ww_busy;
product <= ww_product;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clk~inputclkctrl_outclk\ <= NOT \clk~inputclkctrl_outclk\;

-- Location: IOOBUF_X83_Y73_N16
\busy~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Ctrl|state.A~q\,
	devoe => ww_devoe,
	o => \busy~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\product[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|bits_out\(1),
	devoe => ww_devoe,
	o => \product[0]~output_o\);

-- Location: IOOBUF_X87_Y73_N2
\product[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|bits_out\(2),
	devoe => ww_devoe,
	o => \product[1]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\product[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(2),
	devoe => ww_devoe,
	o => \product[2]~output_o\);

-- Location: IOOBUF_X89_Y73_N9
\product[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(3),
	devoe => ww_devoe,
	o => \product[3]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\product[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(4),
	devoe => ww_devoe,
	o => \product[4]~output_o\);

-- Location: IOOBUF_X96_Y73_N16
\product[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(5),
	devoe => ww_devoe,
	o => \product[5]~output_o\);

-- Location: IOOBUF_X98_Y73_N23
\product[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(6),
	devoe => ww_devoe,
	o => \product[6]~output_o\);

-- Location: IOOBUF_X111_Y73_N2
\product[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(7),
	devoe => ww_devoe,
	o => \product[7]~output_o\);

-- Location: IOOBUF_X115_Y69_N23
\product[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(8),
	devoe => ww_devoe,
	o => \product[8]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\product[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(9),
	devoe => ww_devoe,
	o => \product[9]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\product[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(10),
	devoe => ww_devoe,
	o => \product[10]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\product[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(11),
	devoe => ww_devoe,
	o => \product[11]~output_o\);

-- Location: IOOBUF_X83_Y73_N9
\product[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(12),
	devoe => ww_devoe,
	o => \product[12]~output_o\);

-- Location: IOOBUF_X100_Y73_N23
\product[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(13),
	devoe => ww_devoe,
	o => \product[13]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\product[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(14),
	devoe => ww_devoe,
	o => \product[14]~output_o\);

-- Location: IOOBUF_X100_Y73_N16
\product[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(15),
	devoe => ww_devoe,
	o => \product[15]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\product[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(16),
	devoe => ww_devoe,
	o => \product[16]~output_o\);

-- Location: IOOBUF_X98_Y73_N16
\product[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegB|output\(17),
	devoe => ww_devoe,
	o => \product[17]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\product[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(0),
	devoe => ww_devoe,
	o => \product[18]~output_o\);

-- Location: IOOBUF_X115_Y66_N16
\product[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(1),
	devoe => ww_devoe,
	o => \product[19]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\product[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(2),
	devoe => ww_devoe,
	o => \product[20]~output_o\);

-- Location: IOOBUF_X87_Y73_N23
\product[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(3),
	devoe => ww_devoe,
	o => \product[21]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\product[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(4),
	devoe => ww_devoe,
	o => \product[22]~output_o\);

-- Location: IOOBUF_X79_Y73_N2
\product[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(5),
	devoe => ww_devoe,
	o => \product[23]~output_o\);

-- Location: IOOBUF_X81_Y73_N9
\product[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(6),
	devoe => ww_devoe,
	o => \product[24]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\product[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(7),
	devoe => ww_devoe,
	o => \product[25]~output_o\);

-- Location: IOOBUF_X85_Y73_N9
\product[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(8),
	devoe => ww_devoe,
	o => \product[26]~output_o\);

-- Location: IOOBUF_X115_Y65_N16
\product[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(9),
	devoe => ww_devoe,
	o => \product[27]~output_o\);

-- Location: IOOBUF_X115_Y61_N23
\product[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(10),
	devoe => ww_devoe,
	o => \product[28]~output_o\);

-- Location: IOOBUF_X85_Y73_N2
\product[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(11),
	devoe => ww_devoe,
	o => \product[29]~output_o\);

-- Location: IOOBUF_X81_Y73_N2
\product[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(12),
	devoe => ww_devoe,
	o => \product[30]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\product[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(13),
	devoe => ww_devoe,
	o => \product[31]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\product[32]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(14),
	devoe => ww_devoe,
	o => \product[32]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\product[33]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(15),
	devoe => ww_devoe,
	o => \product[33]~output_o\);

-- Location: IOOBUF_X115_Y65_N23
\product[34]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(16),
	devoe => ww_devoe,
	o => \product[34]~output_o\);

-- Location: IOOBUF_X79_Y73_N9
\product[35]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegC|output\(17),
	devoe => ww_devoe,
	o => \product[35]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y37_N8
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X87_Y65_N26
\Ctrl|state~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|state~8_combout\ = (\start~input_o\ & !\Ctrl|state.A~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datac => \Ctrl|state.A~q\,
	combout => \Ctrl|state~8_combout\);

-- Location: FF_X87_Y65_N27
\Ctrl|state.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Ctrl|state~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.B~q\);

-- Location: LCCOMB_X89_Y63_N12
\RegD|counter[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|counter[1]~4_combout\ = (\RegD|counter[0]~0_combout\ & (\Ctrl|state.C~q\ & (\RegD|counter\(0) $ (\RegD|counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegD|counter\(0),
	datab => \RegD|counter[0]~0_combout\,
	datac => \RegD|counter\(1),
	datad => \Ctrl|state.C~q\,
	combout => \RegD|counter[1]~4_combout\);

-- Location: LCCOMB_X89_Y63_N14
\RegD|counter[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|counter[0]~2_combout\ = \Ctrl|state.C~q\ $ (\Ctrl|state.B~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Ctrl|state.C~q\,
	datad => \Ctrl|state.B~q\,
	combout => \RegD|counter[0]~2_combout\);

-- Location: FF_X89_Y63_N13
\RegD|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegD|counter[1]~4_combout\,
	ena => \RegD|counter[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegD|counter\(1));

-- Location: LCCOMB_X89_Y63_N24
\RegD|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|Add0~0_combout\ = \RegD|counter\(3) $ (((\RegD|counter\(2) & (\RegD|counter\(0) & \RegD|counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegD|counter\(3),
	datab => \RegD|counter\(2),
	datac => \RegD|counter\(0),
	datad => \RegD|counter\(1),
	combout => \RegD|Add0~0_combout\);

-- Location: LCCOMB_X89_Y63_N30
\RegD|counter[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|counter[3]~3_combout\ = (\RegD|Add0~0_combout\ & (\Ctrl|state.C~q\ & \RegD|counter[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegD|Add0~0_combout\,
	datac => \Ctrl|state.C~q\,
	datad => \RegD|counter[0]~0_combout\,
	combout => \RegD|counter[3]~3_combout\);

-- Location: FF_X89_Y63_N31
\RegD|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegD|counter[3]~3_combout\,
	ena => \RegD|counter[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegD|counter\(3));

-- Location: LCCOMB_X89_Y63_N16
\RegD|counter[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|counter[0]~0_combout\ = ((!\RegD|counter\(2) & (!\RegD|counter\(0) & !\RegD|counter\(1)))) # (!\RegD|counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegD|counter\(3),
	datab => \RegD|counter\(2),
	datac => \RegD|counter\(0),
	datad => \RegD|counter\(1),
	combout => \RegD|counter[0]~0_combout\);

-- Location: LCCOMB_X89_Y63_N28
\RegD|counter[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|counter[0]~1_combout\ = (\Ctrl|state.C~q\ & (!\RegD|counter\(0) & \RegD|counter[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.C~q\,
	datac => \RegD|counter\(0),
	datad => \RegD|counter[0]~0_combout\,
	combout => \RegD|counter[0]~1_combout\);

-- Location: FF_X89_Y63_N29
\RegD|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegD|counter[0]~1_combout\,
	ena => \RegD|counter[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegD|counter\(0));

-- Location: LCCOMB_X89_Y63_N22
\RegD|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|Add0~1_combout\ = \RegD|counter\(2) $ (((\RegD|counter\(0) & \RegD|counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegD|counter\(2),
	datac => \RegD|counter\(0),
	datad => \RegD|counter\(1),
	combout => \RegD|Add0~1_combout\);

-- Location: LCCOMB_X89_Y63_N2
\RegD|counter[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegD|counter[2]~5_combout\ = (\RegD|Add0~1_combout\ & (\Ctrl|state.C~q\ & \RegD|counter[0]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegD|Add0~1_combout\,
	datac => \Ctrl|state.C~q\,
	datad => \RegD|counter[0]~0_combout\,
	combout => \RegD|counter[2]~5_combout\);

-- Location: FF_X89_Y63_N3
\RegD|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegD|counter[2]~5_combout\,
	ena => \RegD|counter[0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegD|counter\(2));

-- Location: LCCOMB_X88_Y63_N4
\Ctrl|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~0_combout\ = (!\RegD|counter\(2) & (!\RegD|counter\(1) & (\RegD|counter\(3) & \RegD|counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegD|counter\(2),
	datab => \RegD|counter\(1),
	datac => \RegD|counter\(3),
	datad => \RegD|counter\(0),
	combout => \Ctrl|Selector0~0_combout\);

-- Location: LCCOMB_X87_Y65_N22
\Ctrl|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector1~0_combout\ = (\Ctrl|state.B~q\) # ((\Ctrl|state.D~q\ & !\Ctrl|Selector0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \Ctrl|state.B~q\,
	datad => \Ctrl|Selector0~0_combout\,
	combout => \Ctrl|Selector1~0_combout\);

-- Location: FF_X87_Y65_N23
\Ctrl|state.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Ctrl|Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.C~q\);

-- Location: FF_X87_Y65_N13
\Ctrl|state.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Ctrl|state.C~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.D~q\);

-- Location: LCCOMB_X87_Y65_N8
\Ctrl|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~1_combout\ = (\Ctrl|state.D~q\ & (!\Ctrl|Selector0~0_combout\ & ((\start~input_o\) # (\Ctrl|state.A~q\)))) # (!\Ctrl|state.D~q\ & ((\start~input_o\) # ((\Ctrl|state.A~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datab => \start~input_o\,
	datac => \Ctrl|state.A~q\,
	datad => \Ctrl|Selector0~0_combout\,
	combout => \Ctrl|Selector0~1_combout\);

-- Location: FF_X87_Y65_N9
\Ctrl|state.A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Ctrl|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.A~q\);

-- Location: IOIBUF_X105_Y73_N8
\multiplier[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(2),
	o => \multiplier[2]~input_o\);

-- Location: IOIBUF_X85_Y73_N15
\multiplier[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(14),
	o => \multiplier[14]~input_o\);

-- Location: LCCOMB_X89_Y64_N12
\RegB|last_bit~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|last_bit~0_combout\ = (\RegB|last_bit~q\ & !\Ctrl|state.B~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegB|last_bit~q\,
	datad => \Ctrl|state.B~q\,
	combout => \RegB|last_bit~0_combout\);

-- Location: IOIBUF_X91_Y73_N15
\multiplier[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(3),
	o => \multiplier[3]~input_o\);

-- Location: LCCOMB_X87_Y65_N12
\RegC|output[0]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[0]~17_combout\ = (!\Ctrl|state.B~q\ & !\Ctrl|state.D~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.B~q\,
	datac => \Ctrl|state.D~q\,
	combout => \RegC|output[0]~17_combout\);

-- Location: IOIBUF_X115_Y62_N8
\multiplicand[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(16),
	o => \multiplicand[16]~input_o\);

-- Location: FF_X90_Y63_N15
\RegA|output[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[16]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(16));

-- Location: LCCOMB_X89_Y64_N28
\RegA_Mux|Mux17~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux17~3_combout\ = (\RegB|last_bit~q\ & ((\RegB|bits_out\(2)) # (\RegB|bits_out\(1)))) # (!\RegB|last_bit~q\ & (\RegB|bits_out\(2) & \RegB|bits_out\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|last_bit~q\,
	datac => \RegB|bits_out\(2),
	datad => \RegB|bits_out\(1),
	combout => \RegA_Mux|Mux17~3_combout\);

-- Location: IOIBUF_X69_Y73_N22
\multiplicand[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(15),
	o => \multiplicand[15]~input_o\);

-- Location: FF_X90_Y63_N13
\RegA|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[15]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(15));

-- Location: IOIBUF_X115_Y63_N1
\multiplicand[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(14),
	o => \multiplicand[14]~input_o\);

-- Location: FF_X90_Y63_N11
\RegA|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[14]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(14));

-- Location: IOIBUF_X83_Y73_N22
\multiplicand[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(13),
	o => \multiplicand[13]~input_o\);

-- Location: FF_X90_Y63_N9
\RegA|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[13]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(13));

-- Location: IOIBUF_X115_Y62_N22
\multiplicand[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(12),
	o => \multiplicand[12]~input_o\);

-- Location: FF_X90_Y63_N31
\RegA|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[12]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(12));

-- Location: IOIBUF_X115_Y62_N15
\multiplicand[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(11),
	o => \multiplicand[11]~input_o\);

-- Location: FF_X90_Y63_N29
\RegA|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[11]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(11));

-- Location: IOIBUF_X69_Y73_N15
\multiplicand[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(10),
	o => \multiplicand[10]~input_o\);

-- Location: FF_X90_Y63_N27
\RegA|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[10]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(10));

-- Location: IOIBUF_X65_Y73_N15
\multiplicand[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(9),
	o => \multiplicand[9]~input_o\);

-- Location: FF_X90_Y63_N21
\RegA|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[9]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(9));

-- Location: IOIBUF_X115_Y66_N22
\multiplicand[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(8),
	o => \multiplicand[8]~input_o\);

-- Location: FF_X90_Y64_N3
\RegA|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[8]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(8));

-- Location: IOIBUF_X115_Y64_N8
\multiplicand[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(7),
	o => \multiplicand[7]~input_o\);

-- Location: FF_X90_Y64_N11
\RegA|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[7]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(7));

-- Location: IOIBUF_X115_Y64_N1
\multiplicand[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(6),
	o => \multiplicand[6]~input_o\);

-- Location: FF_X90_Y64_N7
\RegA|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[6]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(6));

-- Location: IOIBUF_X89_Y73_N22
\multiplicand[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(5),
	o => \multiplicand[5]~input_o\);

-- Location: FF_X90_Y64_N25
\RegA|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[5]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(5));

-- Location: IOIBUF_X115_Y68_N22
\multiplicand[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(4),
	o => \multiplicand[4]~input_o\);

-- Location: FF_X90_Y64_N23
\RegA|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[4]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(4));

-- Location: IOIBUF_X115_Y68_N15
\multiplicand[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(3),
	o => \multiplicand[3]~input_o\);

-- Location: FF_X90_Y64_N21
\RegA|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[3]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(3));

-- Location: IOIBUF_X115_Y61_N15
\multiplicand[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(2),
	o => \multiplicand[2]~input_o\);

-- Location: FF_X90_Y64_N19
\RegA|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[2]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(2));

-- Location: IOIBUF_X115_Y60_N15
\multiplicand[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(1),
	o => \multiplicand[1]~input_o\);

-- Location: FF_X90_Y64_N17
\RegA|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[1]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(1));

-- Location: IOIBUF_X89_Y73_N15
\multiplicand[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(0),
	o => \multiplicand[0]~input_o\);

-- Location: FF_X90_Y64_N5
\RegA|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[0]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(0));

-- Location: LCCOMB_X90_Y64_N14
\RegA_Mux|multiplex:twos_complement[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[0]~1_cout\ = CARRY(!\RegA|output\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(0),
	datad => VCC,
	cout => \RegA_Mux|multiplex:twos_complement[0]~1_cout\);

-- Location: LCCOMB_X90_Y64_N16
\RegA_Mux|multiplex:twos_complement[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[1]~0_combout\ = (\RegA|output\(1) & ((\RegA_Mux|multiplex:twos_complement[0]~1_cout\) # (GND))) # (!\RegA|output\(1) & (!\RegA_Mux|multiplex:twos_complement[0]~1_cout\))
-- \RegA_Mux|multiplex:twos_complement[1]~1\ = CARRY((\RegA|output\(1)) # (!\RegA_Mux|multiplex:twos_complement[0]~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(1),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[0]~1_cout\,
	combout => \RegA_Mux|multiplex:twos_complement[1]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[1]~1\);

-- Location: LCCOMB_X90_Y64_N18
\RegA_Mux|multiplex:twos_complement[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[2]~0_combout\ = (\RegA|output\(2) & (!\RegA_Mux|multiplex:twos_complement[1]~1\ & VCC)) # (!\RegA|output\(2) & (\RegA_Mux|multiplex:twos_complement[1]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[2]~1\ = CARRY((!\RegA|output\(2) & !\RegA_Mux|multiplex:twos_complement[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(2),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[1]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[2]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[2]~1\);

-- Location: LCCOMB_X90_Y64_N20
\RegA_Mux|multiplex:twos_complement[3]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[3]~0_combout\ = (\RegA|output\(3) & ((\RegA_Mux|multiplex:twos_complement[2]~1\) # (GND))) # (!\RegA|output\(3) & (!\RegA_Mux|multiplex:twos_complement[2]~1\))
-- \RegA_Mux|multiplex:twos_complement[3]~1\ = CARRY((\RegA|output\(3)) # (!\RegA_Mux|multiplex:twos_complement[2]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(3),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[2]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[3]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[3]~1\);

-- Location: LCCOMB_X90_Y64_N22
\RegA_Mux|multiplex:twos_complement[4]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[4]~0_combout\ = (\RegA|output\(4) & (!\RegA_Mux|multiplex:twos_complement[3]~1\ & VCC)) # (!\RegA|output\(4) & (\RegA_Mux|multiplex:twos_complement[3]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[4]~1\ = CARRY((!\RegA|output\(4) & !\RegA_Mux|multiplex:twos_complement[3]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(4),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[3]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[4]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[4]~1\);

-- Location: LCCOMB_X90_Y64_N24
\RegA_Mux|multiplex:twos_complement[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[5]~0_combout\ = (\RegA|output\(5) & ((\RegA_Mux|multiplex:twos_complement[4]~1\) # (GND))) # (!\RegA|output\(5) & (!\RegA_Mux|multiplex:twos_complement[4]~1\))
-- \RegA_Mux|multiplex:twos_complement[5]~1\ = CARRY((\RegA|output\(5)) # (!\RegA_Mux|multiplex:twos_complement[4]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(5),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[4]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[5]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[5]~1\);

-- Location: LCCOMB_X90_Y64_N26
\RegA_Mux|multiplex:twos_complement[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[6]~0_combout\ = (\RegA|output\(6) & (!\RegA_Mux|multiplex:twos_complement[5]~1\ & VCC)) # (!\RegA|output\(6) & (\RegA_Mux|multiplex:twos_complement[5]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[6]~1\ = CARRY((!\RegA|output\(6) & !\RegA_Mux|multiplex:twos_complement[5]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(6),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[5]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[6]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[6]~1\);

-- Location: LCCOMB_X90_Y64_N28
\RegA_Mux|multiplex:twos_complement[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[7]~0_combout\ = (\RegA|output\(7) & ((\RegA_Mux|multiplex:twos_complement[6]~1\) # (GND))) # (!\RegA|output\(7) & (!\RegA_Mux|multiplex:twos_complement[6]~1\))
-- \RegA_Mux|multiplex:twos_complement[7]~1\ = CARRY((\RegA|output\(7)) # (!\RegA_Mux|multiplex:twos_complement[6]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(7),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[6]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[7]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[7]~1\);

-- Location: LCCOMB_X90_Y64_N30
\RegA_Mux|multiplex:twos_complement[8]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[8]~0_combout\ = (\RegA|output\(8) & (!\RegA_Mux|multiplex:twos_complement[7]~1\ & VCC)) # (!\RegA|output\(8) & (\RegA_Mux|multiplex:twos_complement[7]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[8]~1\ = CARRY((!\RegA|output\(8) & !\RegA_Mux|multiplex:twos_complement[7]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(8),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[7]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[8]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[8]~1\);

-- Location: LCCOMB_X90_Y63_N0
\RegA_Mux|multiplex:twos_complement[9]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[9]~0_combout\ = (\RegA|output\(9) & ((\RegA_Mux|multiplex:twos_complement[8]~1\) # (GND))) # (!\RegA|output\(9) & (!\RegA_Mux|multiplex:twos_complement[8]~1\))
-- \RegA_Mux|multiplex:twos_complement[9]~1\ = CARRY((\RegA|output\(9)) # (!\RegA_Mux|multiplex:twos_complement[8]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(9),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[8]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[9]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[9]~1\);

-- Location: LCCOMB_X90_Y63_N2
\RegA_Mux|multiplex:twos_complement[10]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[10]~0_combout\ = (\RegA|output\(10) & (!\RegA_Mux|multiplex:twos_complement[9]~1\ & VCC)) # (!\RegA|output\(10) & (\RegA_Mux|multiplex:twos_complement[9]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[10]~1\ = CARRY((!\RegA|output\(10) & !\RegA_Mux|multiplex:twos_complement[9]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(10),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[9]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[10]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[10]~1\);

-- Location: LCCOMB_X90_Y63_N4
\RegA_Mux|multiplex:twos_complement[11]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[11]~0_combout\ = (\RegA|output\(11) & ((\RegA_Mux|multiplex:twos_complement[10]~1\) # (GND))) # (!\RegA|output\(11) & (!\RegA_Mux|multiplex:twos_complement[10]~1\))
-- \RegA_Mux|multiplex:twos_complement[11]~1\ = CARRY((\RegA|output\(11)) # (!\RegA_Mux|multiplex:twos_complement[10]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(11),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[10]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[11]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[11]~1\);

-- Location: LCCOMB_X90_Y63_N6
\RegA_Mux|multiplex:twos_complement[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[12]~0_combout\ = (\RegA|output\(12) & (!\RegA_Mux|multiplex:twos_complement[11]~1\ & VCC)) # (!\RegA|output\(12) & (\RegA_Mux|multiplex:twos_complement[11]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[12]~1\ = CARRY((!\RegA|output\(12) & !\RegA_Mux|multiplex:twos_complement[11]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(12),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[11]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[12]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[12]~1\);

-- Location: LCCOMB_X90_Y63_N8
\RegA_Mux|multiplex:twos_complement[13]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[13]~0_combout\ = (\RegA|output\(13) & ((\RegA_Mux|multiplex:twos_complement[12]~1\) # (GND))) # (!\RegA|output\(13) & (!\RegA_Mux|multiplex:twos_complement[12]~1\))
-- \RegA_Mux|multiplex:twos_complement[13]~1\ = CARRY((\RegA|output\(13)) # (!\RegA_Mux|multiplex:twos_complement[12]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(13),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[12]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[13]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[13]~1\);

-- Location: LCCOMB_X90_Y63_N10
\RegA_Mux|multiplex:twos_complement[14]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[14]~0_combout\ = (\RegA|output\(14) & (!\RegA_Mux|multiplex:twos_complement[13]~1\ & VCC)) # (!\RegA|output\(14) & (\RegA_Mux|multiplex:twos_complement[13]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[14]~1\ = CARRY((!\RegA|output\(14) & !\RegA_Mux|multiplex:twos_complement[13]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(14),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[13]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[14]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[14]~1\);

-- Location: LCCOMB_X90_Y63_N12
\RegA_Mux|multiplex:twos_complement[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[15]~0_combout\ = (\RegA|output\(15) & ((\RegA_Mux|multiplex:twos_complement[14]~1\) # (GND))) # (!\RegA|output\(15) & (!\RegA_Mux|multiplex:twos_complement[14]~1\))
-- \RegA_Mux|multiplex:twos_complement[15]~1\ = CARRY((\RegA|output\(15)) # (!\RegA_Mux|multiplex:twos_complement[14]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(15),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[14]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[15]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[15]~1\);

-- Location: LCCOMB_X90_Y63_N14
\RegA_Mux|multiplex:twos_complement[16]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[16]~0_combout\ = (\RegA|output\(16) & (!\RegA_Mux|multiplex:twos_complement[15]~1\ & VCC)) # (!\RegA|output\(16) & (\RegA_Mux|multiplex:twos_complement[15]~1\ $ (GND)))
-- \RegA_Mux|multiplex:twos_complement[16]~1\ = CARRY((!\RegA|output\(16) & !\RegA_Mux|multiplex:twos_complement[15]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(16),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[15]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[16]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[16]~1\);

-- Location: LCCOMB_X91_Y64_N8
\RegA_Mux|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux1~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[16]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[16]~0_combout\,
	combout => \RegA_Mux|Mux1~0_combout\);

-- Location: LCCOMB_X89_Y64_N26
\RegA_Mux|Mux17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux17~2_combout\ = (\RegB|last_bit~q\ & (!\RegB|bits_out\(2) & \RegB|bits_out\(1))) # (!\RegB|last_bit~q\ & ((!\RegB|bits_out\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|last_bit~q\,
	datac => \RegB|bits_out\(2),
	datad => \RegB|bits_out\(1),
	combout => \RegA_Mux|Mux17~2_combout\);

-- Location: LCCOMB_X88_Y64_N30
\RegA_Mux|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux1~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(16) & ((\RegA_Mux|Mux17~2_combout\)))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux1~0_combout\) # (!\RegA_Mux|Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(16),
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA_Mux|Mux1~0_combout\,
	datad => \RegA_Mux|Mux17~2_combout\,
	combout => \RegA_Mux|Mux1~1_combout\);

-- Location: IOIBUF_X115_Y63_N8
\multiplicand[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplicand(17),
	o => \multiplicand[17]~input_o\);

-- Location: FF_X90_Y63_N17
\RegA|output[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \multiplicand[17]~input_o\,
	sload => VCC,
	ena => \Ctrl|state.B~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(17));

-- Location: LCCOMB_X89_Y64_N0
\RegA_Mux|Mux18~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux18~1_combout\ = \RegB|last_bit~q\ $ (\RegB|bits_out\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|last_bit~q\,
	datad => \RegB|bits_out\(1),
	combout => \RegA_Mux|Mux18~1_combout\);

-- Location: LCCOMB_X90_Y63_N16
\RegA_Mux|multiplex:twos_complement[17]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[17]~0_combout\ = (\RegA|output\(17) & ((\RegA_Mux|multiplex:twos_complement[16]~1\) # (GND))) # (!\RegA|output\(17) & (!\RegA_Mux|multiplex:twos_complement[16]~1\))
-- \RegA_Mux|multiplex:twos_complement[17]~1\ = CARRY((\RegA|output\(17)) # (!\RegA_Mux|multiplex:twos_complement[16]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output\(17),
	datad => VCC,
	cin => \RegA_Mux|multiplex:twos_complement[16]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[17]~0_combout\,
	cout => \RegA_Mux|multiplex:twos_complement[17]~1\);

-- Location: LCCOMB_X88_Y64_N0
\RegA_Mux|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux1~2_combout\ = (\RegA_Mux|Mux1~1_combout\ & ((\RegA|output\(17)) # ((!\RegA_Mux|Mux18~1_combout\)))) # (!\RegA_Mux|Mux1~1_combout\ & (((\RegA_Mux|Mux18~1_combout\ & \RegA_Mux|multiplex:twos_complement[17]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux1~1_combout\,
	datab => \RegA|output\(17),
	datac => \RegA_Mux|Mux18~1_combout\,
	datad => \RegA_Mux|multiplex:twos_complement[17]~0_combout\,
	combout => \RegA_Mux|Mux1~2_combout\);

-- Location: LCCOMB_X88_Y64_N22
\Adder|Gen_Adder:17:AdderX|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:17:AdderX|sum~0_combout\ = \RegC|output\(17) $ (\RegA_Mux|Mux1~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(17),
	datad => \RegA_Mux|Mux1~2_combout\,
	combout => \Adder|Gen_Adder:17:AdderX|sum~0_combout\);

-- Location: LCCOMB_X91_Y64_N2
\RegA_Mux|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux0~2_combout\ = (!\RegB|bits_out\(2) & (\RegA|output\(17) & ((\RegB|last_bit~q\) # (\RegB|bits_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|bits_out\(2),
	datab => \RegB|last_bit~q\,
	datac => \RegB|bits_out\(1),
	datad => \RegA|output\(17),
	combout => \RegA_Mux|Mux0~2_combout\);

-- Location: LCCOMB_X90_Y63_N18
\RegA_Mux|multiplex:twos_complement[18]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|multiplex:twos_complement[18]~0_combout\ = \RegA_Mux|multiplex:twos_complement[17]~1\ $ (\RegA|output\(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \RegA|output\(17),
	cin => \RegA_Mux|multiplex:twos_complement[17]~1\,
	combout => \RegA_Mux|multiplex:twos_complement[18]~0_combout\);

-- Location: LCCOMB_X91_Y64_N26
\RegA_Mux|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux0~3_combout\ = (\RegB|last_bit~q\ & (((!\RegB|bits_out\(1) & \RegA_Mux|multiplex:twos_complement[18]~0_combout\)))) # (!\RegB|last_bit~q\ & ((\RegB|bits_out\(1) & ((\RegA_Mux|multiplex:twos_complement[18]~0_combout\))) # (!\RegB|bits_out\(1) 
-- & (\RegA_Mux|multiplex:twos_complement[17]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|multiplex:twos_complement[17]~0_combout\,
	datab => \RegB|last_bit~q\,
	datac => \RegB|bits_out\(1),
	datad => \RegA_Mux|multiplex:twos_complement[18]~0_combout\,
	combout => \RegA_Mux|Mux0~3_combout\);

-- Location: LCCOMB_X91_Y64_N24
\Adder|Gen_Adder:18:AdderX|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:18:AdderX|sum~0_combout\ = \RegC|output\(18) $ (((\RegA_Mux|Mux0~2_combout\) # ((\RegA_Mux|Mux0~3_combout\ & \RegB|bits_out\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(18),
	datab => \RegA_Mux|Mux0~2_combout\,
	datac => \RegA_Mux|Mux0~3_combout\,
	datad => \RegB|bits_out\(2),
	combout => \Adder|Gen_Adder:18:AdderX|sum~0_combout\);

-- Location: LCCOMB_X88_Y63_N28
\RegA_Mux|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux3~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[14]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[14]~0_combout\,
	combout => \RegA_Mux|Mux3~0_combout\);

-- Location: LCCOMB_X88_Y63_N18
\RegA_Mux|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux3~1_combout\ = (\RegA_Mux|Mux17~2_combout\ & ((\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(14))) # (!\RegA_Mux|Mux17~3_combout\ & ((\RegA_Mux|Mux3~0_combout\))))) # (!\RegA_Mux|Mux17~2_combout\ & (!\RegA_Mux|Mux17~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux17~2_combout\,
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA|output\(14),
	datad => \RegA_Mux|Mux3~0_combout\,
	combout => \RegA_Mux|Mux3~1_combout\);

-- Location: LCCOMB_X88_Y63_N24
\RegA_Mux|Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux3~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux3~1_combout\ & (\RegA|output\(15))) # (!\RegA_Mux|Mux3~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[15]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA|output\(15),
	datac => \RegA_Mux|multiplex:twos_complement[15]~0_combout\,
	datad => \RegA_Mux|Mux3~1_combout\,
	combout => \RegA_Mux|Mux3~2_combout\);

-- Location: LCCOMB_X88_Y63_N0
\Adder|Gen_Adder:15:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:15:AdderX|c_out~0_combout\ = (\RegC|output\(15) & \RegA_Mux|Mux3~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(15),
	datad => \RegA_Mux|Mux3~2_combout\,
	combout => \Adder|Gen_Adder:15:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X88_Y63_N16
\RegA_Mux|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux2~0_combout\ = (\RegA_Mux|multiplex:twos_complement[15]~0_combout\ & \RegB|bits_out\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegA_Mux|multiplex:twos_complement[15]~0_combout\,
	datad => \RegB|bits_out\(2),
	combout => \RegA_Mux|Mux2~0_combout\);

-- Location: LCCOMB_X88_Y63_N26
\RegA_Mux|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux2~1_combout\ = (\RegA_Mux|Mux17~2_combout\ & ((\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(15))) # (!\RegA_Mux|Mux17~3_combout\ & ((\RegA_Mux|Mux2~0_combout\))))) # (!\RegA_Mux|Mux17~2_combout\ & (!\RegA_Mux|Mux17~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux17~2_combout\,
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA|output\(15),
	datad => \RegA_Mux|Mux2~0_combout\,
	combout => \RegA_Mux|Mux2~1_combout\);

-- Location: LCCOMB_X88_Y64_N12
\RegA_Mux|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux2~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux2~1_combout\ & (\RegA|output\(16))) # (!\RegA_Mux|Mux2~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[16]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(16),
	datab => \RegA_Mux|Mux18~1_combout\,
	datac => \RegA_Mux|Mux2~1_combout\,
	datad => \RegA_Mux|multiplex:twos_complement[16]~0_combout\,
	combout => \RegA_Mux|Mux2~2_combout\);

-- Location: LCCOMB_X89_Y63_N8
\RegA_Mux|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux4~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[13]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[13]~0_combout\,
	combout => \RegA_Mux|Mux4~0_combout\);

-- Location: LCCOMB_X89_Y63_N10
\RegA_Mux|Mux4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux4~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(13) & ((\RegA_Mux|Mux17~2_combout\)))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux4~0_combout\) # (!\RegA_Mux|Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux17~3_combout\,
	datab => \RegA|output\(13),
	datac => \RegA_Mux|Mux4~0_combout\,
	datad => \RegA_Mux|Mux17~2_combout\,
	combout => \RegA_Mux|Mux4~1_combout\);

-- Location: LCCOMB_X88_Y63_N30
\RegA_Mux|Mux4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux4~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux4~1_combout\ & (\RegA|output\(14))) # (!\RegA_Mux|Mux4~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[14]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA|output\(14),
	datac => \RegA_Mux|Mux4~1_combout\,
	datad => \RegA_Mux|multiplex:twos_complement[14]~0_combout\,
	combout => \RegA_Mux|Mux4~2_combout\);

-- Location: LCCOMB_X88_Y63_N22
\Adder|Gen_Adder:15:AdderX|c_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:15:AdderX|c_out~1_combout\ = (\RegC|output\(15)) # (\RegA_Mux|Mux3~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(15),
	datad => \RegA_Mux|Mux3~2_combout\,
	combout => \Adder|Gen_Adder:15:AdderX|c_out~1_combout\);

-- Location: LCCOMB_X89_Y63_N6
\RegA_Mux|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux5~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[12]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[12]~0_combout\,
	combout => \RegA_Mux|Mux5~0_combout\);

-- Location: LCCOMB_X89_Y63_N4
\RegA_Mux|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux5~1_combout\ = (\RegA_Mux|Mux17~2_combout\ & ((\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(12))) # (!\RegA_Mux|Mux17~3_combout\ & ((\RegA_Mux|Mux5~0_combout\))))) # (!\RegA_Mux|Mux17~2_combout\ & (((!\RegA_Mux|Mux17~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(12),
	datab => \RegA_Mux|Mux17~2_combout\,
	datac => \RegA_Mux|Mux17~3_combout\,
	datad => \RegA_Mux|Mux5~0_combout\,
	combout => \RegA_Mux|Mux5~1_combout\);

-- Location: LCCOMB_X89_Y63_N26
\RegA_Mux|Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux5~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux5~1_combout\ & (\RegA|output\(13))) # (!\RegA_Mux|Mux5~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[13]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA|output\(13),
	datac => \RegA_Mux|Mux5~1_combout\,
	datad => \RegA_Mux|multiplex:twos_complement[13]~0_combout\,
	combout => \RegA_Mux|Mux5~2_combout\);

-- Location: LCCOMB_X86_Y64_N2
\RegC|output[14]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[14]~40_combout\ = (\RegC|output[0]~17_combout\ & (\RegC|output\(14) $ (\RegA_Mux|Mux4~2_combout\ $ (\Adder|Gen_Adder:13:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output[0]~17_combout\,
	datab => \RegC|output\(14),
	datac => \RegA_Mux|Mux4~2_combout\,
	datad => \Adder|Gen_Adder:13:AdderX|c_out~0_combout\,
	combout => \RegC|output[14]~40_combout\);

-- Location: LCCOMB_X86_Y64_N14
\RegC|output[14]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[14]~41_combout\ = (\RegC|output[14]~40_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \RegC|output\(16),
	datad => \RegC|output[14]~40_combout\,
	combout => \RegC|output[14]~41_combout\);

-- Location: LCCOMB_X87_Y65_N14
\RegC|output[0]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[0]~19_combout\ = \Ctrl|state.D~q\ $ (((\Ctrl|state.C~q\) # (\Ctrl|state.B~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \Ctrl|state.C~q\,
	datad => \Ctrl|state.B~q\,
	combout => \RegC|output[0]~19_combout\);

-- Location: FF_X86_Y64_N15
\RegC|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[14]~41_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(14));

-- Location: LCCOMB_X90_Y63_N30
\RegA_Mux|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux6~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[11]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|bits_out\(2),
	datab => \RegA_Mux|multiplex:twos_complement[11]~0_combout\,
	combout => \RegA_Mux|Mux6~0_combout\);

-- Location: LCCOMB_X90_Y63_N24
\RegA_Mux|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux6~1_combout\ = (\RegA_Mux|Mux17~2_combout\ & ((\RegA_Mux|Mux17~3_combout\ & ((\RegA|output\(11)))) # (!\RegA_Mux|Mux17~3_combout\ & (\RegA_Mux|Mux6~0_combout\)))) # (!\RegA_Mux|Mux17~2_combout\ & (((!\RegA_Mux|Mux17~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux6~0_combout\,
	datab => \RegA|output\(11),
	datac => \RegA_Mux|Mux17~2_combout\,
	datad => \RegA_Mux|Mux17~3_combout\,
	combout => \RegA_Mux|Mux6~1_combout\);

-- Location: LCCOMB_X90_Y63_N22
\RegA_Mux|Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux6~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux6~1_combout\ & ((\RegA|output\(12)))) # (!\RegA_Mux|Mux6~1_combout\ & (\RegA_Mux|multiplex:twos_complement[12]~0_combout\)))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|multiplex:twos_complement[12]~0_combout\,
	datab => \RegA|output\(12),
	datac => \RegA_Mux|Mux18~1_combout\,
	datad => \RegA_Mux|Mux6~1_combout\,
	combout => \RegA_Mux|Mux6~2_combout\);

-- Location: LCCOMB_X90_Y63_N20
\RegA_Mux|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux7~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[10]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[10]~0_combout\,
	combout => \RegA_Mux|Mux7~0_combout\);

-- Location: LCCOMB_X90_Y63_N26
\RegA_Mux|Mux7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux7~1_combout\ = (\RegA_Mux|Mux17~2_combout\ & ((\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(10))) # (!\RegA_Mux|Mux17~3_combout\ & ((\RegA_Mux|Mux7~0_combout\))))) # (!\RegA_Mux|Mux17~2_combout\ & (!\RegA_Mux|Mux17~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux17~2_combout\,
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA|output\(10),
	datad => \RegA_Mux|Mux7~0_combout\,
	combout => \RegA_Mux|Mux7~1_combout\);

-- Location: LCCOMB_X90_Y63_N28
\RegA_Mux|Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux7~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux7~1_combout\ & ((\RegA|output\(11)))) # (!\RegA_Mux|Mux7~1_combout\ & (\RegA_Mux|multiplex:twos_complement[11]~0_combout\)))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA_Mux|multiplex:twos_complement[11]~0_combout\,
	datac => \RegA|output\(11),
	datad => \RegA_Mux|Mux7~1_combout\,
	combout => \RegA_Mux|Mux7~2_combout\);

-- Location: LCCOMB_X89_Y63_N20
\RegA_Mux|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux8~0_combout\ = (\RegA_Mux|multiplex:twos_complement[9]~0_combout\ & \RegB|bits_out\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegA_Mux|multiplex:twos_complement[9]~0_combout\,
	datad => \RegB|bits_out\(2),
	combout => \RegA_Mux|Mux8~0_combout\);

-- Location: LCCOMB_X89_Y63_N18
\RegA_Mux|Mux8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux8~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA_Mux|Mux17~2_combout\ & (\RegA|output\(9)))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux8~0_combout\)) # (!\RegA_Mux|Mux17~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux17~3_combout\,
	datab => \RegA_Mux|Mux17~2_combout\,
	datac => \RegA|output\(9),
	datad => \RegA_Mux|Mux8~0_combout\,
	combout => \RegA_Mux|Mux8~1_combout\);

-- Location: LCCOMB_X89_Y63_N0
\RegA_Mux|Mux8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux8~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux8~1_combout\ & ((\RegA|output\(10)))) # (!\RegA_Mux|Mux8~1_combout\ & (\RegA_Mux|multiplex:twos_complement[10]~0_combout\)))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux8~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|multiplex:twos_complement[10]~0_combout\,
	datab => \RegA|output\(10),
	datac => \RegA_Mux|Mux18~1_combout\,
	datad => \RegA_Mux|Mux8~1_combout\,
	combout => \RegA_Mux|Mux8~2_combout\);

-- Location: LCCOMB_X91_Y64_N16
\RegA_Mux|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux9~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[8]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[8]~0_combout\,
	combout => \RegA_Mux|Mux9~0_combout\);

-- Location: LCCOMB_X91_Y64_N14
\RegA_Mux|Mux9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux9~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(8) & (\RegA_Mux|Mux17~2_combout\))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux9~0_combout\) # (!\RegA_Mux|Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(8),
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA_Mux|Mux17~2_combout\,
	datad => \RegA_Mux|Mux9~0_combout\,
	combout => \RegA_Mux|Mux9~1_combout\);

-- Location: LCCOMB_X91_Y64_N12
\RegA_Mux|Mux9~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux9~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux9~1_combout\ & (\RegA|output\(9))) # (!\RegA_Mux|Mux9~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[9]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux9~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA|output\(9),
	datac => \RegA_Mux|Mux9~1_combout\,
	datad => \RegA_Mux|multiplex:twos_complement[9]~0_combout\,
	combout => \RegA_Mux|Mux9~2_combout\);

-- Location: LCCOMB_X91_Y64_N30
\Adder|Gen_Adder:9:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:9:AdderX|c_out~0_combout\ = (\RegC|output\(9) & \RegA_Mux|Mux9~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(9),
	datad => \RegA_Mux|Mux9~2_combout\,
	combout => \Adder|Gen_Adder:9:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X91_Y64_N18
\RegA_Mux|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux10~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[7]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[7]~0_combout\,
	combout => \RegA_Mux|Mux10~0_combout\);

-- Location: LCCOMB_X90_Y64_N8
\RegA_Mux|Mux10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux10~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(7) & (\RegA_Mux|Mux17~2_combout\))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux10~0_combout\) # (!\RegA_Mux|Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(7),
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA_Mux|Mux17~2_combout\,
	datad => \RegA_Mux|Mux10~0_combout\,
	combout => \RegA_Mux|Mux10~1_combout\);

-- Location: LCCOMB_X90_Y64_N2
\RegA_Mux|Mux10~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux10~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux10~1_combout\ & ((\RegA|output\(8)))) # (!\RegA_Mux|Mux10~1_combout\ & (\RegA_Mux|multiplex:twos_complement[8]~0_combout\)))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux10~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA_Mux|multiplex:twos_complement[8]~0_combout\,
	datac => \RegA|output\(8),
	datad => \RegA_Mux|Mux10~1_combout\,
	combout => \RegA_Mux|Mux10~2_combout\);

-- Location: LCCOMB_X89_Y64_N10
\RegA_Mux|Mux12~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux12~4_combout\ = (\RegB|last_bit~q\ & (\RegA|output\(5) & ((\RegB|bits_out\(2)) # (\RegB|bits_out\(1))))) # (!\RegB|last_bit~q\ & (\RegB|bits_out\(2) & ((\RegA|output\(5)) # (!\RegB|bits_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|last_bit~q\,
	datab => \RegB|bits_out\(2),
	datac => \RegA|output\(5),
	datad => \RegB|bits_out\(1),
	combout => \RegA_Mux|Mux12~4_combout\);

-- Location: LCCOMB_X90_Y64_N12
\RegA_Mux|Mux12~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux12~2_combout\ = (\RegA_Mux|Mux17~2_combout\ & (\RegA_Mux|Mux12~4_combout\ & ((\RegA_Mux|Mux17~3_combout\) # (\RegA_Mux|multiplex:twos_complement[5]~0_combout\)))) # (!\RegA_Mux|Mux17~2_combout\ & (((!\RegA_Mux|Mux17~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux12~4_combout\,
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA_Mux|Mux17~2_combout\,
	datad => \RegA_Mux|multiplex:twos_complement[5]~0_combout\,
	combout => \RegA_Mux|Mux12~2_combout\);

-- Location: LCCOMB_X90_Y64_N6
\RegA_Mux|Mux12~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux12~3_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux12~2_combout\ & ((\RegA|output\(6)))) # (!\RegA_Mux|Mux12~2_combout\ & (\RegA_Mux|multiplex:twos_complement[6]~0_combout\)))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux12~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA_Mux|multiplex:twos_complement[6]~0_combout\,
	datac => \RegA|output\(6),
	datad => \RegA_Mux|Mux12~2_combout\,
	combout => \RegA_Mux|Mux12~3_combout\);

-- Location: LCCOMB_X89_Y64_N16
\RegA_Mux|Mux15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux15~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[2]~0_combout\,
	combout => \RegA_Mux|Mux15~0_combout\);

-- Location: LCCOMB_X88_Y64_N2
\RegA_Mux|Mux15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux15~1_combout\ = (\RegA_Mux|Mux17~2_combout\ & ((\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(2))) # (!\RegA_Mux|Mux17~3_combout\ & ((\RegA_Mux|Mux15~0_combout\))))) # (!\RegA_Mux|Mux17~2_combout\ & (!\RegA_Mux|Mux17~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux17~2_combout\,
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA|output\(2),
	datad => \RegA_Mux|Mux15~0_combout\,
	combout => \RegA_Mux|Mux15~1_combout\);

-- Location: LCCOMB_X88_Y64_N8
\RegA_Mux|Mux15~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux15~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux15~1_combout\ & (\RegA|output\(3))) # (!\RegA_Mux|Mux15~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[3]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux15~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(3),
	datab => \RegA_Mux|Mux18~1_combout\,
	datac => \RegA_Mux|multiplex:twos_complement[3]~0_combout\,
	datad => \RegA_Mux|Mux15~1_combout\,
	combout => \RegA_Mux|Mux15~2_combout\);

-- Location: LCCOMB_X89_Y64_N24
\RegA_Mux|Mux16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux16~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[1]~0_combout\,
	combout => \RegA_Mux|Mux16~0_combout\);

-- Location: LCCOMB_X89_Y64_N18
\RegA_Mux|Mux16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux16~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(1) & (\RegA_Mux|Mux17~2_combout\))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux16~0_combout\) # (!\RegA_Mux|Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(1),
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA_Mux|Mux17~2_combout\,
	datad => \RegA_Mux|Mux16~0_combout\,
	combout => \RegA_Mux|Mux16~1_combout\);

-- Location: LCCOMB_X88_Y64_N10
\RegA_Mux|Mux16~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux16~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux16~1_combout\ & (\RegA|output\(2))) # (!\RegA_Mux|Mux16~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[2]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux16~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(2),
	datab => \RegA_Mux|Mux18~1_combout\,
	datac => \RegA_Mux|multiplex:twos_complement[2]~0_combout\,
	datad => \RegA_Mux|Mux16~1_combout\,
	combout => \RegA_Mux|Mux16~2_combout\);

-- Location: LCCOMB_X85_Y64_N10
\RegC|output[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[0]~16_combout\ = (\RegC|output\(2) & \Ctrl|state.D~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(2),
	datad => \Ctrl|state.D~q\,
	combout => \RegC|output[0]~16_combout\);

-- Location: LCCOMB_X85_Y64_N24
\RegC|output[0]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[0]~18_combout\ = (\RegC|output[0]~16_combout\) # ((\RegC|output[0]~17_combout\ & (\RegA_Mux|Mux18~0_combout\ $ (\RegC|output\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output[0]~16_combout\,
	datab => \RegA_Mux|Mux18~0_combout\,
	datac => \RegC|output\(0),
	datad => \RegC|output[0]~17_combout\,
	combout => \RegC|output[0]~18_combout\);

-- Location: FF_X85_Y64_N25
\RegC|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[0]~18_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(0));

-- Location: LCCOMB_X89_Y64_N6
\RegA_Mux|Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux17~0_combout\ = (\RegA|output\(0) & (\RegB|bits_out\(2) $ (((\RegB|last_bit~q\) # (\RegB|bits_out\(1)))))) # (!\RegA|output\(0) & (!\RegB|bits_out\(2) & (\RegB|last_bit~q\ $ (\RegB|bits_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|last_bit~q\,
	datab => \RegB|bits_out\(1),
	datac => \RegB|bits_out\(2),
	datad => \RegA|output\(0),
	combout => \RegA_Mux|Mux17~0_combout\);

-- Location: LCCOMB_X89_Y64_N20
\RegA_Mux|Mux17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux17~1_combout\ = (\RegA_Mux|Mux17~0_combout\ & ((\RegA|output\(1)) # ((!\RegA_Mux|Mux18~1_combout\)))) # (!\RegA_Mux|Mux17~0_combout\ & (((\RegA_Mux|Mux18~1_combout\ & \RegA_Mux|multiplex:twos_complement[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux17~0_combout\,
	datab => \RegA|output\(1),
	datac => \RegA_Mux|Mux18~1_combout\,
	datad => \RegA_Mux|multiplex:twos_complement[1]~0_combout\,
	combout => \RegA_Mux|Mux17~1_combout\);

-- Location: LCCOMB_X89_Y64_N14
\Adder|Gen_Adder:1:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:1:AdderX|c_out~0_combout\ = (\RegC|output\(1) & ((\RegA_Mux|Mux17~1_combout\) # ((\RegC|output\(0) & \RegA_Mux|Mux18~0_combout\)))) # (!\RegC|output\(1) & (\RegC|output\(0) & (\RegA_Mux|Mux18~0_combout\ & \RegA_Mux|Mux17~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(0),
	datab => \RegC|output\(1),
	datac => \RegA_Mux|Mux18~0_combout\,
	datad => \RegA_Mux|Mux17~1_combout\,
	combout => \Adder|Gen_Adder:1:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X88_Y64_N28
\RegC|output[2]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[2]~22_combout\ = (\RegC|output[0]~17_combout\ & (\RegA_Mux|Mux16~2_combout\ $ (\RegC|output\(2) $ (\Adder|Gen_Adder:1:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux16~2_combout\,
	datab => \RegC|output\(2),
	datac => \Adder|Gen_Adder:1:AdderX|c_out~0_combout\,
	datad => \RegC|output[0]~17_combout\,
	combout => \RegC|output[2]~22_combout\);

-- Location: LCCOMB_X88_Y64_N20
\RegC|output[2]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[2]~23_combout\ = (\RegC|output[2]~22_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ctrl|state.D~q\,
	datac => \RegC|output\(4),
	datad => \RegC|output[2]~22_combout\,
	combout => \RegC|output[2]~23_combout\);

-- Location: FF_X88_Y64_N21
\RegC|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[2]~23_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(2));

-- Location: LCCOMB_X88_Y64_N6
\Adder|Gen_Adder:2:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:2:AdderX|c_out~0_combout\ = (\RegC|output\(2) & ((\Adder|Gen_Adder:1:AdderX|c_out~0_combout\) # (\RegA_Mux|Mux16~2_combout\))) # (!\RegC|output\(2) & (\Adder|Gen_Adder:1:AdderX|c_out~0_combout\ & \RegA_Mux|Mux16~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegC|output\(2),
	datac => \Adder|Gen_Adder:1:AdderX|c_out~0_combout\,
	datad => \RegA_Mux|Mux16~2_combout\,
	combout => \Adder|Gen_Adder:2:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X88_Y64_N24
\Adder|Gen_Adder:3:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:3:AdderX|c_out~0_combout\ = (\RegC|output\(3) & ((\RegA_Mux|Mux15~2_combout\) # (\Adder|Gen_Adder:2:AdderX|c_out~0_combout\))) # (!\RegC|output\(3) & (\RegA_Mux|Mux15~2_combout\ & \Adder|Gen_Adder:2:AdderX|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(3),
	datac => \RegA_Mux|Mux15~2_combout\,
	datad => \Adder|Gen_Adder:2:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:3:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X89_Y64_N22
\RegA_Mux|Mux14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux14~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[3]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|bits_out\(2),
	datac => \RegA_Mux|multiplex:twos_complement[3]~0_combout\,
	combout => \RegA_Mux|Mux14~0_combout\);

-- Location: LCCOMB_X88_Y64_N18
\RegA_Mux|Mux14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux14~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(3) & (\RegA_Mux|Mux17~2_combout\))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux14~0_combout\) # (!\RegA_Mux|Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(3),
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA_Mux|Mux17~2_combout\,
	datad => \RegA_Mux|Mux14~0_combout\,
	combout => \RegA_Mux|Mux14~1_combout\);

-- Location: LCCOMB_X88_Y64_N4
\RegA_Mux|Mux14~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux14~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux14~1_combout\ & (\RegA|output\(4))) # (!\RegA_Mux|Mux14~1_combout\ & ((\RegA_Mux|multiplex:twos_complement[4]~0_combout\))))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux14~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(4),
	datab => \RegA_Mux|Mux18~1_combout\,
	datac => \RegA_Mux|multiplex:twos_complement[4]~0_combout\,
	datad => \RegA_Mux|Mux14~1_combout\,
	combout => \RegA_Mux|Mux14~2_combout\);

-- Location: LCCOMB_X87_Y65_N18
\RegC|output[4]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[4]~26_combout\ = (\RegC|output[0]~17_combout\ & (\RegC|output\(4) $ (\Adder|Gen_Adder:3:AdderX|c_out~0_combout\ $ (\RegA_Mux|Mux14~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(4),
	datab => \Adder|Gen_Adder:3:AdderX|c_out~0_combout\,
	datac => \RegC|output[0]~17_combout\,
	datad => \RegA_Mux|Mux14~2_combout\,
	combout => \RegC|output[4]~26_combout\);

-- Location: LCCOMB_X87_Y65_N16
\RegC|output[4]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[4]~27_combout\ = (\RegC|output[4]~26_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datab => \RegC|output\(6),
	datad => \RegC|output[4]~26_combout\,
	combout => \RegC|output[4]~27_combout\);

-- Location: FF_X87_Y65_N17
\RegC|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[4]~27_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(4));

-- Location: LCCOMB_X88_Y64_N26
\Adder|Gen_Adder:4:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:4:AdderX|c_out~0_combout\ = (\RegC|output\(4) & ((\RegA_Mux|Mux14~2_combout\) # (\Adder|Gen_Adder:3:AdderX|c_out~0_combout\))) # (!\RegC|output\(4) & (\RegA_Mux|Mux14~2_combout\ & \Adder|Gen_Adder:3:AdderX|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegC|output\(4),
	datac => \RegA_Mux|Mux14~2_combout\,
	datad => \Adder|Gen_Adder:3:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:4:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X89_Y64_N4
\RegA_Mux|Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux13~0_combout\ = (\RegB|bits_out\(2) & \RegA_Mux|multiplex:twos_complement[4]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegB|bits_out\(2),
	datad => \RegA_Mux|multiplex:twos_complement[4]~0_combout\,
	combout => \RegA_Mux|Mux13~0_combout\);

-- Location: LCCOMB_X88_Y64_N16
\RegA_Mux|Mux13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux13~1_combout\ = (\RegA_Mux|Mux17~3_combout\ & (\RegA|output\(4) & (\RegA_Mux|Mux17~2_combout\))) # (!\RegA_Mux|Mux17~3_combout\ & (((\RegA_Mux|Mux13~0_combout\) # (!\RegA_Mux|Mux17~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output\(4),
	datab => \RegA_Mux|Mux17~3_combout\,
	datac => \RegA_Mux|Mux17~2_combout\,
	datad => \RegA_Mux|Mux13~0_combout\,
	combout => \RegA_Mux|Mux13~1_combout\);

-- Location: LCCOMB_X88_Y64_N14
\RegA_Mux|Mux13~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux13~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux13~1_combout\ & ((\RegA|output\(5)))) # (!\RegA_Mux|Mux13~1_combout\ & (\RegA_Mux|multiplex:twos_complement[5]~0_combout\)))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|multiplex:twos_complement[5]~0_combout\,
	datab => \RegA|output\(5),
	datac => \RegA_Mux|Mux18~1_combout\,
	datad => \RegA_Mux|Mux13~1_combout\,
	combout => \RegA_Mux|Mux13~2_combout\);

-- Location: LCCOMB_X87_Y65_N0
\Adder|Gen_Adder:5:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:5:AdderX|c_out~0_combout\ = (\RegC|output\(5) & ((\Adder|Gen_Adder:4:AdderX|c_out~0_combout\) # (\RegA_Mux|Mux13~2_combout\))) # (!\RegC|output\(5) & (\Adder|Gen_Adder:4:AdderX|c_out~0_combout\ & \RegA_Mux|Mux13~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(5),
	datac => \Adder|Gen_Adder:4:AdderX|c_out~0_combout\,
	datad => \RegA_Mux|Mux13~2_combout\,
	combout => \Adder|Gen_Adder:5:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X87_Y65_N2
\RegC|output[6]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[6]~30_combout\ = (\RegC|output[0]~17_combout\ & (\RegA_Mux|Mux12~3_combout\ $ (\RegC|output\(6) $ (\Adder|Gen_Adder:5:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux12~3_combout\,
	datab => \RegC|output\(6),
	datac => \RegC|output[0]~17_combout\,
	datad => \Adder|Gen_Adder:5:AdderX|c_out~0_combout\,
	combout => \RegC|output[6]~30_combout\);

-- Location: LCCOMB_X87_Y65_N30
\RegC|output[6]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[6]~31_combout\ = (\RegC|output[6]~30_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \RegC|output\(8),
	datad => \RegC|output[6]~30_combout\,
	combout => \RegC|output[6]~31_combout\);

-- Location: FF_X87_Y65_N31
\RegC|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[6]~31_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(6));

-- Location: LCCOMB_X87_Y64_N4
\Adder|Gen_Adder:6:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:6:AdderX|c_out~0_combout\ = (\RegC|output\(6) & \RegA_Mux|Mux12~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(6),
	datad => \RegA_Mux|Mux12~3_combout\,
	combout => \Adder|Gen_Adder:6:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X91_Y64_N20
\RegA_Mux|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux11~0_combout\ = (\RegA_Mux|multiplex:twos_complement[6]~0_combout\ & \RegB|bits_out\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegA_Mux|multiplex:twos_complement[6]~0_combout\,
	datad => \RegB|bits_out\(2),
	combout => \RegA_Mux|Mux11~0_combout\);

-- Location: LCCOMB_X90_Y64_N0
\RegA_Mux|Mux11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux11~1_combout\ = (\RegA_Mux|Mux17~2_combout\ & ((\RegA_Mux|Mux17~3_combout\ & ((\RegA|output\(6)))) # (!\RegA_Mux|Mux17~3_combout\ & (\RegA_Mux|Mux11~0_combout\)))) # (!\RegA_Mux|Mux17~2_combout\ & (((!\RegA_Mux|Mux17~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux11~0_combout\,
	datab => \RegA_Mux|Mux17~2_combout\,
	datac => \RegA|output\(6),
	datad => \RegA_Mux|Mux17~3_combout\,
	combout => \RegA_Mux|Mux11~1_combout\);

-- Location: LCCOMB_X90_Y64_N10
\RegA_Mux|Mux11~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux11~2_combout\ = (\RegA_Mux|Mux18~1_combout\ & ((\RegA_Mux|Mux11~1_combout\ & ((\RegA|output\(7)))) # (!\RegA_Mux|Mux11~1_combout\ & (\RegA_Mux|multiplex:twos_complement[7]~0_combout\)))) # (!\RegA_Mux|Mux18~1_combout\ & 
-- (((\RegA_Mux|Mux11~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux18~1_combout\,
	datab => \RegA_Mux|multiplex:twos_complement[7]~0_combout\,
	datac => \RegA|output\(7),
	datad => \RegA_Mux|Mux11~1_combout\,
	combout => \RegA_Mux|Mux11~2_combout\);

-- Location: LCCOMB_X90_Y64_N4
\Adder|Gen_Adder:6:AdderX|c_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:6:AdderX|c_out~1_combout\ = (\RegC|output\(6)) # (\RegA_Mux|Mux12~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(6),
	datad => \RegA_Mux|Mux12~3_combout\,
	combout => \Adder|Gen_Adder:6:AdderX|c_out~1_combout\);

-- Location: LCCOMB_X87_Y64_N6
\Adder|Gen_Adder:6:AdderX|c_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:6:AdderX|c_out~2_combout\ = (\Adder|Gen_Adder:6:AdderX|c_out~1_combout\ & ((\RegC|output\(5) & ((\RegA_Mux|Mux13~2_combout\) # (\Adder|Gen_Adder:4:AdderX|c_out~0_combout\))) # (!\RegC|output\(5) & (\RegA_Mux|Mux13~2_combout\ & 
-- \Adder|Gen_Adder:4:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder|Gen_Adder:6:AdderX|c_out~1_combout\,
	datab => \RegC|output\(5),
	datac => \RegA_Mux|Mux13~2_combout\,
	datad => \Adder|Gen_Adder:4:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:6:AdderX|c_out~2_combout\);

-- Location: LCCOMB_X87_Y64_N20
\Adder|Gen_Adder:7:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:7:AdderX|c_out~0_combout\ = (\RegC|output\(7) & ((\Adder|Gen_Adder:6:AdderX|c_out~0_combout\) # ((\RegA_Mux|Mux11~2_combout\) # (\Adder|Gen_Adder:6:AdderX|c_out~2_combout\)))) # (!\RegC|output\(7) & (\RegA_Mux|Mux11~2_combout\ & 
-- ((\Adder|Gen_Adder:6:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:6:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(7),
	datab => \Adder|Gen_Adder:6:AdderX|c_out~0_combout\,
	datac => \RegA_Mux|Mux11~2_combout\,
	datad => \Adder|Gen_Adder:6:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:7:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X86_Y64_N26
\RegC|output[8]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[8]~32_combout\ = (\RegC|output[0]~17_combout\ & (\RegC|output\(8) $ (\RegA_Mux|Mux10~2_combout\ $ (\Adder|Gen_Adder:7:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(8),
	datab => \RegA_Mux|Mux10~2_combout\,
	datac => \RegC|output[0]~17_combout\,
	datad => \Adder|Gen_Adder:7:AdderX|c_out~0_combout\,
	combout => \RegC|output[8]~32_combout\);

-- Location: LCCOMB_X86_Y64_N8
\RegC|output[8]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[8]~33_combout\ = (\RegC|output[8]~32_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datab => \RegC|output\(10),
	datac => \RegC|output[8]~32_combout\,
	combout => \RegC|output[8]~33_combout\);

-- Location: FF_X86_Y64_N9
\RegC|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[8]~33_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(8));

-- Location: LCCOMB_X91_Y64_N28
\Adder|Gen_Adder:9:AdderX|c_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:9:AdderX|c_out~1_combout\ = (\RegC|output\(9)) # (\RegA_Mux|Mux9~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(9),
	datad => \RegA_Mux|Mux9~2_combout\,
	combout => \Adder|Gen_Adder:9:AdderX|c_out~1_combout\);

-- Location: LCCOMB_X87_Y64_N28
\Adder|Gen_Adder:9:AdderX|c_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:9:AdderX|c_out~2_combout\ = (\Adder|Gen_Adder:9:AdderX|c_out~1_combout\ & ((\RegC|output\(8) & ((\RegA_Mux|Mux10~2_combout\) # (\Adder|Gen_Adder:7:AdderX|c_out~0_combout\))) # (!\RegC|output\(8) & (\RegA_Mux|Mux10~2_combout\ & 
-- \Adder|Gen_Adder:7:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(8),
	datab => \RegA_Mux|Mux10~2_combout\,
	datac => \Adder|Gen_Adder:9:AdderX|c_out~1_combout\,
	datad => \Adder|Gen_Adder:7:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:9:AdderX|c_out~2_combout\);

-- Location: LCCOMB_X86_Y64_N0
\Adder|Gen_Adder:10:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:10:AdderX|sum~combout\ = \RegC|output\(10) $ (\RegA_Mux|Mux8~2_combout\ $ (((\Adder|Gen_Adder:9:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:9:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(10),
	datab => \RegA_Mux|Mux8~2_combout\,
	datac => \Adder|Gen_Adder:9:AdderX|c_out~0_combout\,
	datad => \Adder|Gen_Adder:9:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:10:AdderX|sum~combout\);

-- Location: LCCOMB_X86_Y64_N30
\RegC|output[10]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[10]~45_combout\ = (\Ctrl|state.D~q\ & (((\RegC|output\(12))))) # (!\Ctrl|state.D~q\ & (!\Ctrl|state.B~q\ & ((\Adder|Gen_Adder:10:AdderX|sum~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datab => \Ctrl|state.B~q\,
	datac => \RegC|output\(12),
	datad => \Adder|Gen_Adder:10:AdderX|sum~combout\,
	combout => \RegC|output[10]~45_combout\);

-- Location: FF_X86_Y64_N31
\RegC|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[10]~45_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(10));

-- Location: LCCOMB_X87_Y64_N18
\Adder|Gen_Adder:10:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:10:AdderX|c_out~0_combout\ = (\RegA_Mux|Mux8~2_combout\ & ((\RegC|output\(10)) # ((\Adder|Gen_Adder:9:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:9:AdderX|c_out~2_combout\)))) # (!\RegA_Mux|Mux8~2_combout\ & (\RegC|output\(10) & 
-- ((\Adder|Gen_Adder:9:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:9:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux8~2_combout\,
	datab => \RegC|output\(10),
	datac => \Adder|Gen_Adder:9:AdderX|c_out~0_combout\,
	datad => \Adder|Gen_Adder:9:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:10:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X86_Y64_N24
\Adder|Gen_Adder:11:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:11:AdderX|c_out~0_combout\ = (\RegA_Mux|Mux7~2_combout\ & ((\RegC|output\(11)) # (\Adder|Gen_Adder:10:AdderX|c_out~0_combout\))) # (!\RegA_Mux|Mux7~2_combout\ & (\RegC|output\(11) & \Adder|Gen_Adder:10:AdderX|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux7~2_combout\,
	datab => \RegC|output\(11),
	datad => \Adder|Gen_Adder:10:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:11:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X86_Y64_N18
\RegC|output[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[12]~38_combout\ = (\RegC|output[0]~17_combout\ & (\RegC|output\(12) $ (\RegA_Mux|Mux6~2_combout\ $ (\Adder|Gen_Adder:11:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(12),
	datab => \RegA_Mux|Mux6~2_combout\,
	datac => \RegC|output[0]~17_combout\,
	datad => \Adder|Gen_Adder:11:AdderX|c_out~0_combout\,
	combout => \RegC|output[12]~38_combout\);

-- Location: LCCOMB_X86_Y64_N22
\RegC|output[12]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[12]~39_combout\ = (\RegC|output[12]~38_combout\) # ((\RegC|output\(14) & \Ctrl|state.D~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegC|output\(14),
	datac => \Ctrl|state.D~q\,
	datad => \RegC|output[12]~38_combout\,
	combout => \RegC|output[12]~39_combout\);

-- Location: FF_X86_Y64_N23
\RegC|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[12]~39_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(12));

-- Location: LCCOMB_X86_Y64_N4
\Adder|Gen_Adder:12:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:12:AdderX|c_out~0_combout\ = (\RegC|output\(12) & \RegA_Mux|Mux6~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(12),
	datad => \RegA_Mux|Mux6~2_combout\,
	combout => \Adder|Gen_Adder:12:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X86_Y64_N6
\Adder|Gen_Adder:12:AdderX|c_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:12:AdderX|c_out~1_combout\ = (\RegC|output\(12)) # (\RegA_Mux|Mux6~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(12),
	datad => \RegA_Mux|Mux6~2_combout\,
	combout => \Adder|Gen_Adder:12:AdderX|c_out~1_combout\);

-- Location: LCCOMB_X87_Y64_N16
\Adder|Gen_Adder:12:AdderX|c_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:12:AdderX|c_out~2_combout\ = (\Adder|Gen_Adder:12:AdderX|c_out~1_combout\ & ((\RegC|output\(11) & ((\RegA_Mux|Mux7~2_combout\) # (\Adder|Gen_Adder:10:AdderX|c_out~0_combout\))) # (!\RegC|output\(11) & (\RegA_Mux|Mux7~2_combout\ & 
-- \Adder|Gen_Adder:10:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(11),
	datab => \RegA_Mux|Mux7~2_combout\,
	datac => \Adder|Gen_Adder:12:AdderX|c_out~1_combout\,
	datad => \Adder|Gen_Adder:10:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:12:AdderX|c_out~2_combout\);

-- Location: LCCOMB_X87_Y64_N26
\Adder|Gen_Adder:13:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:13:AdderX|c_out~0_combout\ = (\RegC|output\(13) & ((\RegA_Mux|Mux5~2_combout\) # ((\Adder|Gen_Adder:12:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:12:AdderX|c_out~2_combout\)))) # (!\RegC|output\(13) & (\RegA_Mux|Mux5~2_combout\ & 
-- ((\Adder|Gen_Adder:12:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:12:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(13),
	datab => \RegA_Mux|Mux5~2_combout\,
	datac => \Adder|Gen_Adder:12:AdderX|c_out~0_combout\,
	datad => \Adder|Gen_Adder:12:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:13:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X87_Y64_N2
\Adder|Gen_Adder:15:AdderX|c_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:15:AdderX|c_out~2_combout\ = (\Adder|Gen_Adder:15:AdderX|c_out~1_combout\ & ((\RegA_Mux|Mux4~2_combout\ & ((\Adder|Gen_Adder:13:AdderX|c_out~0_combout\) # (\RegC|output\(14)))) # (!\RegA_Mux|Mux4~2_combout\ & 
-- (\Adder|Gen_Adder:13:AdderX|c_out~0_combout\ & \RegC|output\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux4~2_combout\,
	datab => \Adder|Gen_Adder:15:AdderX|c_out~1_combout\,
	datac => \Adder|Gen_Adder:13:AdderX|c_out~0_combout\,
	datad => \RegC|output\(14),
	combout => \Adder|Gen_Adder:15:AdderX|c_out~2_combout\);

-- Location: LCCOMB_X87_Y64_N12
\Adder|Gen_Adder:16:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:16:AdderX|sum~combout\ = \RegC|output\(16) $ (\RegA_Mux|Mux2~2_combout\ $ (((\Adder|Gen_Adder:15:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:15:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder|Gen_Adder:15:AdderX|c_out~0_combout\,
	datab => \RegC|output\(16),
	datac => \RegA_Mux|Mux2~2_combout\,
	datad => \Adder|Gen_Adder:15:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:16:AdderX|sum~combout\);

-- Location: LCCOMB_X87_Y64_N0
\RegC|output[16]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[16]~48_combout\ = (\Ctrl|state.D~q\ & (((\RegC|output\(18))))) # (!\Ctrl|state.D~q\ & (!\Ctrl|state.B~q\ & ((\Adder|Gen_Adder:16:AdderX|sum~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.B~q\,
	datab => \Ctrl|state.D~q\,
	datac => \RegC|output\(18),
	datad => \Adder|Gen_Adder:16:AdderX|sum~combout\,
	combout => \RegC|output[16]~48_combout\);

-- Location: FF_X87_Y64_N1
\RegC|output[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[16]~48_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(16));

-- Location: LCCOMB_X87_Y64_N10
\Adder|Gen_Adder:16:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:16:AdderX|c_out~0_combout\ = (\RegC|output\(16) & ((\Adder|Gen_Adder:15:AdderX|c_out~0_combout\) # ((\RegA_Mux|Mux2~2_combout\) # (\Adder|Gen_Adder:15:AdderX|c_out~2_combout\)))) # (!\RegC|output\(16) & (\RegA_Mux|Mux2~2_combout\ & 
-- ((\Adder|Gen_Adder:15:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:15:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder|Gen_Adder:15:AdderX|c_out~0_combout\,
	datab => \RegC|output\(16),
	datac => \RegA_Mux|Mux2~2_combout\,
	datad => \Adder|Gen_Adder:15:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:16:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X87_Y64_N8
\Adder|Gen_Adder:18:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:18:AdderX|sum~combout\ = \Adder|Gen_Adder:18:AdderX|sum~0_combout\ $ (((\RegC|output\(17) & ((\RegA_Mux|Mux1~2_combout\) # (\Adder|Gen_Adder:16:AdderX|c_out~0_combout\))) # (!\RegC|output\(17) & (\RegA_Mux|Mux1~2_combout\ & 
-- \Adder|Gen_Adder:16:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(17),
	datab => \Adder|Gen_Adder:18:AdderX|sum~0_combout\,
	datac => \RegA_Mux|Mux1~2_combout\,
	datad => \Adder|Gen_Adder:16:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:18:AdderX|sum~combout\);

-- Location: LCCOMB_X87_Y65_N20
load_or_add : cycloneive_lcell_comb
-- Equation(s):
-- \load_or_add~combout\ = (\Ctrl|state.B~q\) # (\Ctrl|state.C~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.B~q\,
	datac => \Ctrl|state.C~q\,
	combout => \load_or_add~combout\);

-- Location: FF_X87_Y64_N9
\RegC|output[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:18:AdderX|sum~combout\,
	sclr => \Ctrl|state.B~q\,
	ena => \load_or_add~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(18));

-- Location: LCCOMB_X91_Y64_N10
\RegC|output[16]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[16]~42_combout\ = (\RegC|output\(18) & \Ctrl|state.D~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(18),
	datad => \Ctrl|state.D~q\,
	combout => \RegC|output[16]~42_combout\);

-- Location: LCCOMB_X87_Y64_N22
\RegC|output[17]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[17]~43_combout\ = (\RegC|output[16]~42_combout\) # ((\RegC|output[0]~17_combout\ & (\Adder|Gen_Adder:17:AdderX|sum~0_combout\ $ (\Adder|Gen_Adder:16:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output[0]~17_combout\,
	datab => \Adder|Gen_Adder:17:AdderX|sum~0_combout\,
	datac => \RegC|output[16]~42_combout\,
	datad => \Adder|Gen_Adder:16:AdderX|c_out~0_combout\,
	combout => \RegC|output[17]~43_combout\);

-- Location: FF_X87_Y64_N23
\RegC|output[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[17]~43_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(17));

-- Location: LCCOMB_X88_Y63_N10
\Adder|Gen_Adder:15:AdderX|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:15:AdderX|sum~0_combout\ = \RegC|output\(15) $ (\RegA_Mux|Mux3~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RegC|output\(15),
	datad => \RegA_Mux|Mux3~2_combout\,
	combout => \Adder|Gen_Adder:15:AdderX|sum~0_combout\);

-- Location: LCCOMB_X87_Y64_N24
\Adder|Gen_Adder:15:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:15:AdderX|sum~combout\ = \Adder|Gen_Adder:15:AdderX|sum~0_combout\ $ (((\RegC|output\(14) & ((\RegA_Mux|Mux4~2_combout\) # (\Adder|Gen_Adder:13:AdderX|c_out~0_combout\))) # (!\RegC|output\(14) & (\RegA_Mux|Mux4~2_combout\ & 
-- \Adder|Gen_Adder:13:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(14),
	datab => \Adder|Gen_Adder:15:AdderX|sum~0_combout\,
	datac => \RegA_Mux|Mux4~2_combout\,
	datad => \Adder|Gen_Adder:13:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:15:AdderX|sum~combout\);

-- Location: LCCOMB_X87_Y64_N30
\RegC|output[15]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[15]~47_combout\ = (\Ctrl|state.D~q\ & (((\RegC|output\(17))))) # (!\Ctrl|state.D~q\ & (!\Ctrl|state.B~q\ & ((\Adder|Gen_Adder:15:AdderX|sum~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.B~q\,
	datab => \Ctrl|state.D~q\,
	datac => \RegC|output\(17),
	datad => \Adder|Gen_Adder:15:AdderX|sum~combout\,
	combout => \RegC|output[15]~47_combout\);

-- Location: FF_X87_Y64_N31
\RegC|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[15]~47_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(15));

-- Location: LCCOMB_X86_Y64_N20
\Adder|Gen_Adder:13:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:13:AdderX|sum~combout\ = \RegC|output\(13) $ (\RegA_Mux|Mux5~2_combout\ $ (((\Adder|Gen_Adder:12:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:12:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(13),
	datab => \RegA_Mux|Mux5~2_combout\,
	datac => \Adder|Gen_Adder:12:AdderX|c_out~0_combout\,
	datad => \Adder|Gen_Adder:12:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:13:AdderX|sum~combout\);

-- Location: LCCOMB_X86_Y64_N12
\RegC|output[13]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[13]~46_combout\ = (\Ctrl|state.D~q\ & (((\RegC|output\(15))))) # (!\Ctrl|state.D~q\ & (!\Ctrl|state.B~q\ & ((\Adder|Gen_Adder:13:AdderX|sum~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datab => \Ctrl|state.B~q\,
	datac => \RegC|output\(15),
	datad => \Adder|Gen_Adder:13:AdderX|sum~combout\,
	combout => \RegC|output[13]~46_combout\);

-- Location: FF_X86_Y64_N13
\RegC|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[13]~46_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(13));

-- Location: LCCOMB_X86_Y64_N10
\RegC|output[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[11]~36_combout\ = (\RegC|output[0]~17_combout\ & (\RegC|output\(11) $ (\RegA_Mux|Mux7~2_combout\ $ (\Adder|Gen_Adder:10:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output[0]~17_combout\,
	datab => \RegC|output\(11),
	datac => \RegA_Mux|Mux7~2_combout\,
	datad => \Adder|Gen_Adder:10:AdderX|c_out~0_combout\,
	combout => \RegC|output[11]~36_combout\);

-- Location: LCCOMB_X86_Y64_N16
\RegC|output[11]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[11]~37_combout\ = (\RegC|output[11]~36_combout\) # ((\RegC|output\(13) & \Ctrl|state.D~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(13),
	datac => \Ctrl|state.D~q\,
	datad => \RegC|output[11]~36_combout\,
	combout => \RegC|output[11]~37_combout\);

-- Location: FF_X86_Y64_N17
\RegC|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[11]~37_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(11));

-- Location: LCCOMB_X87_Y64_N14
\Adder|Gen_Adder:8:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:8:AdderX|c_out~0_combout\ = (\RegC|output\(8) & ((\RegA_Mux|Mux10~2_combout\) # (\Adder|Gen_Adder:7:AdderX|c_out~0_combout\))) # (!\RegC|output\(8) & (\RegA_Mux|Mux10~2_combout\ & \Adder|Gen_Adder:7:AdderX|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(8),
	datac => \RegA_Mux|Mux10~2_combout\,
	datad => \Adder|Gen_Adder:7:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:8:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X87_Y65_N24
\RegC|output[9]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[9]~34_combout\ = (\RegC|output[0]~17_combout\ & (\RegA_Mux|Mux9~2_combout\ $ (\RegC|output\(9) $ (\Adder|Gen_Adder:8:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA_Mux|Mux9~2_combout\,
	datab => \RegC|output\(9),
	datac => \RegC|output[0]~17_combout\,
	datad => \Adder|Gen_Adder:8:AdderX|c_out~0_combout\,
	combout => \RegC|output[9]~34_combout\);

-- Location: LCCOMB_X87_Y65_N28
\RegC|output[9]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[9]~35_combout\ = (\RegC|output[9]~34_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datab => \RegC|output\(11),
	datad => \RegC|output[9]~34_combout\,
	combout => \RegC|output[9]~35_combout\);

-- Location: FF_X87_Y65_N29
\RegC|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[9]~35_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(9));

-- Location: LCCOMB_X86_Y64_N28
\Adder|Gen_Adder:7:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:7:AdderX|sum~combout\ = \RegC|output\(7) $ (\RegA_Mux|Mux11~2_combout\ $ (((\Adder|Gen_Adder:6:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:6:AdderX|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder|Gen_Adder:6:AdderX|c_out~0_combout\,
	datab => \RegC|output\(7),
	datac => \RegA_Mux|Mux11~2_combout\,
	datad => \Adder|Gen_Adder:6:AdderX|c_out~2_combout\,
	combout => \Adder|Gen_Adder:7:AdderX|sum~combout\);

-- Location: LCCOMB_X85_Y64_N6
\RegC|output[7]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[7]~44_combout\ = (\Ctrl|state.D~q\ & (((\RegC|output\(9))))) # (!\Ctrl|state.D~q\ & (!\Ctrl|state.B~q\ & ((\Adder|Gen_Adder:7:AdderX|sum~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.B~q\,
	datab => \Ctrl|state.D~q\,
	datac => \RegC|output\(9),
	datad => \Adder|Gen_Adder:7:AdderX|sum~combout\,
	combout => \RegC|output[7]~44_combout\);

-- Location: FF_X85_Y64_N7
\RegC|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[7]~44_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(7));

-- Location: LCCOMB_X87_Y65_N10
\RegC|output[5]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[5]~28_combout\ = (\RegC|output[0]~17_combout\ & (\RegC|output\(5) $ (\Adder|Gen_Adder:4:AdderX|c_out~0_combout\ $ (\RegA_Mux|Mux13~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output\(5),
	datab => \RegC|output[0]~17_combout\,
	datac => \Adder|Gen_Adder:4:AdderX|c_out~0_combout\,
	datad => \RegA_Mux|Mux13~2_combout\,
	combout => \RegC|output[5]~28_combout\);

-- Location: LCCOMB_X87_Y65_N6
\RegC|output[5]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[5]~29_combout\ = (\RegC|output[5]~28_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datab => \RegC|output\(7),
	datad => \RegC|output[5]~28_combout\,
	combout => \RegC|output[5]~29_combout\);

-- Location: FF_X87_Y65_N7
\RegC|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[5]~29_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(5));

-- Location: LCCOMB_X88_Y65_N28
\RegC|output[3]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[3]~24_combout\ = (\RegC|output[0]~17_combout\ & (\RegA_Mux|Mux15~2_combout\ $ (\RegC|output\(3) $ (\Adder|Gen_Adder:2:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|output[0]~17_combout\,
	datab => \RegA_Mux|Mux15~2_combout\,
	datac => \RegC|output\(3),
	datad => \Adder|Gen_Adder:2:AdderX|c_out~0_combout\,
	combout => \RegC|output[3]~24_combout\);

-- Location: LCCOMB_X88_Y65_N30
\RegC|output[3]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[3]~25_combout\ = (\RegC|output[3]~24_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \RegC|output\(5),
	datad => \RegC|output[3]~24_combout\,
	combout => \RegC|output[3]~25_combout\);

-- Location: FF_X88_Y65_N31
\RegC|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[3]~25_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(3));

-- Location: LCCOMB_X89_Y64_N30
\Adder|Gen_Adder:0:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:0:AdderX|c_out~0_combout\ = (\RegC|output\(0) & (\RegA|output\(0) & (\RegB|last_bit~q\ $ (\RegB|bits_out\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|last_bit~q\,
	datab => \RegB|bits_out\(1),
	datac => \RegC|output\(0),
	datad => \RegA|output\(0),
	combout => \Adder|Gen_Adder:0:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X88_Y65_N18
\RegC|output[1]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[1]~20_combout\ = (\RegC|output[0]~17_combout\ & (\Adder|Gen_Adder:0:AdderX|c_out~0_combout\ $ (\RegA_Mux|Mux17~1_combout\ $ (\RegC|output\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder|Gen_Adder:0:AdderX|c_out~0_combout\,
	datab => \RegA_Mux|Mux17~1_combout\,
	datac => \RegC|output\(1),
	datad => \RegC|output[0]~17_combout\,
	combout => \RegC|output[1]~20_combout\);

-- Location: LCCOMB_X88_Y65_N4
\RegC|output[1]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|output[1]~21_combout\ = (\RegC|output[1]~20_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \RegC|output\(3),
	datad => \RegC|output[1]~20_combout\,
	combout => \RegC|output[1]~21_combout\);

-- Location: FF_X88_Y65_N5
\RegC|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|output[1]~21_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|output\(1));

-- Location: LCCOMB_X88_Y65_N24
\RegC|bits_out[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|bits_out[1]~2_combout\ = (\RegC|output[1]~20_combout\) # ((\Ctrl|state.D~q\ & \RegC|output\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \RegC|output\(1),
	datad => \RegC|output[1]~20_combout\,
	combout => \RegC|bits_out[1]~2_combout\);

-- Location: FF_X88_Y65_N25
\RegC|bits_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|bits_out[1]~2_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|bits_out\(1));

-- Location: IOIBUF_X96_Y73_N22
\multiplier[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(17),
	o => \multiplier[17]~input_o\);

-- Location: LCCOMB_X94_Y69_N12
\RegB|output[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[17]~18_combout\ = (\Ctrl|state.D~q\ & (\RegC|bits_out\(1))) # (!\Ctrl|state.D~q\ & ((\multiplier[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|bits_out\(1),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[17]~input_o\,
	combout => \RegB|output[17]~18_combout\);

-- Location: LCCOMB_X87_Y65_N4
\RegB|output[7]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[7]~1_combout\ = \Ctrl|state.B~q\ $ (\Ctrl|state.D~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Ctrl|state.B~q\,
	datad => \Ctrl|state.D~q\,
	combout => \RegB|output[7]~1_combout\);

-- Location: FF_X94_Y69_N13
\RegB|output[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[17]~18_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(17));

-- Location: IOIBUF_X109_Y73_N1
\multiplier[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(15),
	o => \multiplier[15]~input_o\);

-- Location: LCCOMB_X94_Y69_N22
\RegB|output[15]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[15]~16_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(17))) # (!\Ctrl|state.D~q\ & ((\multiplier[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|output\(17),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[15]~input_o\,
	combout => \RegB|output[15]~16_combout\);

-- Location: FF_X94_Y69_N23
\RegB|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[15]~16_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(15));

-- Location: IOIBUF_X102_Y73_N8
\multiplier[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(13),
	o => \multiplier[13]~input_o\);

-- Location: LCCOMB_X94_Y69_N20
\RegB|output[13]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[13]~14_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(15))) # (!\Ctrl|state.D~q\ & ((\multiplier[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|output\(15),
	datab => \Ctrl|state.D~q\,
	datac => \multiplier[13]~input_o\,
	combout => \RegB|output[13]~14_combout\);

-- Location: FF_X94_Y69_N21
\RegB|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[13]~14_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(13));

-- Location: IOIBUF_X105_Y73_N1
\multiplier[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(11),
	o => \multiplier[11]~input_o\);

-- Location: LCCOMB_X94_Y69_N10
\RegB|output[11]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[11]~12_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(13))) # (!\Ctrl|state.D~q\ & ((\multiplier[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(13),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[11]~input_o\,
	combout => \RegB|output[11]~12_combout\);

-- Location: FF_X94_Y69_N11
\RegB|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[11]~12_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(11));

-- Location: IOIBUF_X102_Y73_N1
\multiplier[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(9),
	o => \multiplier[9]~input_o\);

-- Location: LCCOMB_X94_Y69_N24
\RegB|output[9]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[9]~10_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(11))) # (!\Ctrl|state.D~q\ & ((\multiplier[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(11),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[9]~input_o\,
	combout => \RegB|output[9]~10_combout\);

-- Location: FF_X94_Y69_N25
\RegB|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[9]~10_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(9));

-- Location: IOIBUF_X107_Y73_N8
\multiplier[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(7),
	o => \multiplier[7]~input_o\);

-- Location: LCCOMB_X94_Y69_N4
\RegB|output[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[7]~8_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(9))) # (!\Ctrl|state.D~q\ & ((\multiplier[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(9),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[7]~input_o\,
	combout => \RegB|output[7]~8_combout\);

-- Location: FF_X94_Y69_N5
\RegB|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[7]~8_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(7));

-- Location: IOIBUF_X94_Y73_N8
\multiplier[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(5),
	o => \multiplier[5]~input_o\);

-- Location: LCCOMB_X94_Y69_N16
\RegB|output[5]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[5]~6_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(7))) # (!\Ctrl|state.D~q\ & ((\multiplier[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(7),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[5]~input_o\,
	combout => \RegB|output[5]~6_combout\);

-- Location: FF_X94_Y69_N17
\RegB|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[5]~6_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(5));

-- Location: LCCOMB_X91_Y69_N0
\RegB|output[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[3]~4_combout\ = (\Ctrl|state.D~q\ & ((\RegB|output\(5)))) # (!\Ctrl|state.D~q\ & (\multiplier[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.D~q\,
	datac => \multiplier[3]~input_o\,
	datad => \RegB|output\(5),
	combout => \RegB|output[3]~4_combout\);

-- Location: FF_X91_Y69_N1
\RegB|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[3]~4_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(3));

-- Location: IOIBUF_X67_Y73_N15
\multiplier[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(1),
	o => \multiplier[1]~input_o\);

-- Location: LCCOMB_X91_Y69_N30
\RegB|output[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[1]~2_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(3))) # (!\Ctrl|state.D~q\ & ((\multiplier[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(3),
	datac => \multiplier[1]~input_o\,
	datad => \Ctrl|state.D~q\,
	combout => \RegB|output[1]~2_combout\);

-- Location: FF_X90_Y64_N15
\RegB|bits_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \RegB|output[1]~2_combout\,
	sload => VCC,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|bits_out\(2));

-- Location: FF_X89_Y64_N13
\RegB|last_bit\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|last_bit~0_combout\,
	asdata => \RegB|bits_out\(2),
	sload => \Ctrl|state.D~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|last_bit~q\);

-- Location: LCCOMB_X89_Y64_N8
\RegA_Mux|Mux18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA_Mux|Mux18~0_combout\ = (\RegA|output\(0) & (\RegB|bits_out\(1) $ (\RegB|last_bit~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|bits_out\(1),
	datac => \RegB|last_bit~q\,
	datad => \RegA|output\(0),
	combout => \RegA_Mux|Mux18~0_combout\);

-- Location: LCCOMB_X85_Y64_N12
\RegC|bits_out[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegC|bits_out[0]~3_combout\ = (\Ctrl|state.D~q\ & (((\RegC|output\(0))))) # (!\Ctrl|state.D~q\ & (!\Ctrl|state.B~q\ & (\RegA_Mux|Mux18~0_combout\ $ (\RegC|output\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.B~q\,
	datab => \RegA_Mux|Mux18~0_combout\,
	datac => \RegC|output\(0),
	datad => \Ctrl|state.D~q\,
	combout => \RegC|bits_out[0]~3_combout\);

-- Location: FF_X85_Y64_N13
\RegC|bits_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegC|bits_out[0]~3_combout\,
	ena => \RegC|output[0]~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegC|bits_out\(0));

-- Location: IOIBUF_X74_Y73_N22
\multiplier[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(16),
	o => \multiplier[16]~input_o\);

-- Location: LCCOMB_X85_Y69_N22
\RegB|output[16]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[16]~17_combout\ = (\Ctrl|state.D~q\ & (\RegC|bits_out\(0))) # (!\Ctrl|state.D~q\ & ((\multiplier[16]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegC|bits_out\(0),
	datac => \multiplier[16]~input_o\,
	datad => \Ctrl|state.D~q\,
	combout => \RegB|output[16]~17_combout\);

-- Location: FF_X85_Y69_N23
\RegB|output[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[16]~17_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(16));

-- Location: LCCOMB_X85_Y69_N12
\RegB|output[14]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[14]~15_combout\ = (\Ctrl|state.D~q\ & ((\RegB|output\(16)))) # (!\Ctrl|state.D~q\ & (\multiplier[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \multiplier[14]~input_o\,
	datac => \RegB|output\(16),
	datad => \Ctrl|state.D~q\,
	combout => \RegB|output[14]~15_combout\);

-- Location: FF_X85_Y69_N13
\RegB|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[14]~15_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(14));

-- Location: IOIBUF_X81_Y73_N22
\multiplier[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(12),
	o => \multiplier[12]~input_o\);

-- Location: LCCOMB_X85_Y69_N2
\RegB|output[12]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[12]~13_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(14))) # (!\Ctrl|state.D~q\ & ((\multiplier[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|output\(14),
	datac => \multiplier[12]~input_o\,
	datad => \Ctrl|state.D~q\,
	combout => \RegB|output[12]~13_combout\);

-- Location: FF_X85_Y69_N3
\RegB|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[12]~13_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(12));

-- Location: IOIBUF_X81_Y73_N15
\multiplier[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(10),
	o => \multiplier[10]~input_o\);

-- Location: LCCOMB_X85_Y69_N24
\RegB|output[10]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[10]~11_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(12))) # (!\Ctrl|state.D~q\ & ((\multiplier[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(12),
	datac => \multiplier[10]~input_o\,
	datad => \Ctrl|state.D~q\,
	combout => \RegB|output[10]~11_combout\);

-- Location: FF_X85_Y69_N25
\RegB|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[10]~11_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(10));

-- Location: IOIBUF_X94_Y73_N1
\multiplier[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(8),
	o => \multiplier[8]~input_o\);

-- Location: LCCOMB_X94_Y69_N30
\RegB|output[8]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[8]~9_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(10))) # (!\Ctrl|state.D~q\ & ((\multiplier[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(10),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[8]~input_o\,
	combout => \RegB|output[8]~9_combout\);

-- Location: FF_X94_Y69_N31
\RegB|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[8]~9_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(8));

-- Location: IOIBUF_X107_Y73_N1
\multiplier[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(6),
	o => \multiplier[6]~input_o\);

-- Location: LCCOMB_X94_Y69_N26
\RegB|output[6]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[6]~7_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(8))) # (!\Ctrl|state.D~q\ & ((\multiplier[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|output\(8),
	datab => \multiplier[6]~input_o\,
	datac => \Ctrl|state.D~q\,
	combout => \RegB|output[6]~7_combout\);

-- Location: FF_X94_Y69_N27
\RegB|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[6]~7_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(6));

-- Location: IOIBUF_X109_Y73_N8
\multiplier[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(4),
	o => \multiplier[4]~input_o\);

-- Location: LCCOMB_X94_Y69_N2
\RegB|output[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[4]~5_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(6))) # (!\Ctrl|state.D~q\ & ((\multiplier[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegB|output\(6),
	datac => \Ctrl|state.D~q\,
	datad => \multiplier[4]~input_o\,
	combout => \RegB|output[4]~5_combout\);

-- Location: FF_X94_Y69_N3
\RegB|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[4]~5_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(4));

-- Location: LCCOMB_X94_Y69_N0
\RegB|output[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[2]~3_combout\ = (\Ctrl|state.D~q\ & ((\RegB|output\(4)))) # (!\Ctrl|state.D~q\ & (\multiplier[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \multiplier[2]~input_o\,
	datab => \Ctrl|state.D~q\,
	datad => \RegB|output\(4),
	combout => \RegB|output[2]~3_combout\);

-- Location: FF_X94_Y69_N1
\RegB|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[2]~3_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|output\(2));

-- Location: IOIBUF_X115_Y37_N1
\multiplier[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_multiplier(0),
	o => \multiplier[0]~input_o\);

-- Location: LCCOMB_X89_Y64_N2
\RegB|output[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegB|output[0]~0_combout\ = (\Ctrl|state.D~q\ & (\RegB|output\(2))) # (!\Ctrl|state.D~q\ & ((\multiplier[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegB|output\(2),
	datac => \multiplier[0]~input_o\,
	datad => \Ctrl|state.D~q\,
	combout => \RegB|output[0]~0_combout\);

-- Location: FF_X89_Y64_N3
\RegB|bits_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \RegB|output[0]~0_combout\,
	ena => \RegB|output[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegB|bits_out\(1));

ww_busy <= \busy~output_o\;

ww_product(0) <= \product[0]~output_o\;

ww_product(1) <= \product[1]~output_o\;

ww_product(2) <= \product[2]~output_o\;

ww_product(3) <= \product[3]~output_o\;

ww_product(4) <= \product[4]~output_o\;

ww_product(5) <= \product[5]~output_o\;

ww_product(6) <= \product[6]~output_o\;

ww_product(7) <= \product[7]~output_o\;

ww_product(8) <= \product[8]~output_o\;

ww_product(9) <= \product[9]~output_o\;

ww_product(10) <= \product[10]~output_o\;

ww_product(11) <= \product[11]~output_o\;

ww_product(12) <= \product[12]~output_o\;

ww_product(13) <= \product[13]~output_o\;

ww_product(14) <= \product[14]~output_o\;

ww_product(15) <= \product[15]~output_o\;

ww_product(16) <= \product[16]~output_o\;

ww_product(17) <= \product[17]~output_o\;

ww_product(18) <= \product[18]~output_o\;

ww_product(19) <= \product[19]~output_o\;

ww_product(20) <= \product[20]~output_o\;

ww_product(21) <= \product[21]~output_o\;

ww_product(22) <= \product[22]~output_o\;

ww_product(23) <= \product[23]~output_o\;

ww_product(24) <= \product[24]~output_o\;

ww_product(25) <= \product[25]~output_o\;

ww_product(26) <= \product[26]~output_o\;

ww_product(27) <= \product[27]~output_o\;

ww_product(28) <= \product[28]~output_o\;

ww_product(29) <= \product[29]~output_o\;

ww_product(30) <= \product[30]~output_o\;

ww_product(31) <= \product[31]~output_o\;

ww_product(32) <= \product[32]~output_o\;

ww_product(33) <= \product[33]~output_o\;

ww_product(34) <= \product[34]~output_o\;

ww_product(35) <= \product[35]~output_o\;
END structure;


