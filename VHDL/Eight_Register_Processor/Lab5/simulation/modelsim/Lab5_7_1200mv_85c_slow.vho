-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "04/17/2015 16:38:28"

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

ENTITY 	Lab5_Processor IS
    PORT (
	DIN : IN std_logic_vector(15 DOWNTO 0);
	Run : IN std_logic;
	Resetn : IN std_logic;
	Clk : IN std_logic;
	Data_Bus : BUFFER std_logic_vector(15 DOWNTO 0);
	InR : OUT std_logic_vector(8 DOWNTO 0);
	R0 : OUT std_logic_vector(15 DOWNTO 0);
	R1 : OUT std_logic_vector(15 DOWNTO 0);
	R2 : OUT std_logic_vector(15 DOWNTO 0);
	R3 : OUT std_logic_vector(15 DOWNTO 0);
	R4 : OUT std_logic_vector(15 DOWNTO 0);
	R5 : OUT std_logic_vector(15 DOWNTO 0);
	R6 : OUT std_logic_vector(15 DOWNTO 0);
	R7 : OUT std_logic_vector(15 DOWNTO 0);
	RA : OUT std_logic_vector(15 DOWNTO 0);
	RG : OUT std_logic_vector(15 DOWNTO 0);
	Done : OUT std_logic
	);
END Lab5_Processor;

-- Design Ports Information
-- Data_Bus[0]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[1]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[2]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[3]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[4]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[5]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[6]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[7]	=>  Location: PIN_AF2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[8]	=>  Location: PIN_AB4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[9]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[10]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[11]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[12]	=>  Location: PIN_AC5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[13]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[14]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Data_Bus[15]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[0]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[1]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[2]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[3]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[4]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[5]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[6]	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[7]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InR[8]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[0]	=>  Location: PIN_AE5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[1]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[2]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[3]	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[4]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[5]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[6]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[7]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[8]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[9]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[10]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[11]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[12]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[13]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[14]	=>  Location: PIN_AB2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R0[15]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[0]	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[1]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[2]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[3]	=>  Location: PIN_U8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[4]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[5]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[6]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[7]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[8]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[9]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[10]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[11]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[12]	=>  Location: PIN_AG4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[13]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[14]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R1[15]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[0]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[1]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[2]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[3]	=>  Location: PIN_AA3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[4]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[5]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[6]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[7]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[8]	=>  Location: PIN_Y5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[9]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[10]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[11]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[12]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[13]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[14]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R2[15]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[0]	=>  Location: PIN_AC4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[1]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[2]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[3]	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[4]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[5]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[6]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[7]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[8]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[9]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[10]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[11]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[12]	=>  Location: PIN_AC7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[13]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[14]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R3[15]	=>  Location: PIN_Y6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[0]	=>  Location: PIN_AF3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[1]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[2]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[3]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[4]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[5]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[6]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[7]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[8]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[9]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[10]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[11]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[12]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[13]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[14]	=>  Location: PIN_AC2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R4[15]	=>  Location: PIN_V6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[0]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[2]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[3]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[4]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[5]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[6]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[7]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[8]	=>  Location: PIN_W7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[9]	=>  Location: PIN_V2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[10]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[11]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[12]	=>  Location: PIN_AD8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[13]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[14]	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R5[15]	=>  Location: PIN_AE2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[0]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[1]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[2]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[3]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[4]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[5]	=>  Location: PIN_AD4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[6]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[7]	=>  Location: PIN_AE4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[8]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[9]	=>  Location: PIN_V3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[10]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[11]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[12]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[13]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[14]	=>  Location: PIN_AB1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R6[15]	=>  Location: PIN_W3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[0]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[1]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[2]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[3]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[4]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[5]	=>  Location: PIN_AG6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[6]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[7]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[8]	=>  Location: PIN_Y7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[9]	=>  Location: PIN_V4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[10]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[11]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[12]	=>  Location: PIN_AH6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[13]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[14]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- R7[15]	=>  Location: PIN_AE1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[0]	=>  Location: PIN_AE3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[1]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[2]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[3]	=>  Location: PIN_AD1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[4]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[5]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[6]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[7]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[8]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[9]	=>  Location: PIN_V1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[10]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[11]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[12]	=>  Location: PIN_AA5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[13]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[14]	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RA[15]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[0]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[1]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[2]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[3]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[4]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[5]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[6]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[7]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[8]	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[9]	=>  Location: PIN_K4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[10]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[11]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[12]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[13]	=>  Location: PIN_K3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[14]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RG[15]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Done	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[0]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[1]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[2]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[3]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[4]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[5]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[6]	=>  Location: PIN_J5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[7]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[8]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[9]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[10]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[11]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[12]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[13]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[14]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DIN[15]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Resetn	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Run	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab5_Processor IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_DIN : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Run : std_logic;
SIGNAL ww_Resetn : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Data_Bus : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_InR : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_R0 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R1 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R2 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R3 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R4 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R5 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R6 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_R7 : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_RA : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_RG : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Done : std_logic;
SIGNAL \Resetn~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Ctrl|Selector15~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector8~1_combout\ : std_logic;
SIGNAL \Ctrl|R_out~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector8~2_combout\ : std_logic;
SIGNAL \Ctrl|Selector14~2_combout\ : std_logic;
SIGNAL \Ctrl|Selector4~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector13~2_combout\ : std_logic;
SIGNAL \Ctrl|Selector11~0_combout\ : std_logic;
SIGNAL \Mux|output[15]~9_combout\ : std_logic;
SIGNAL \Reg6|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegG|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegG|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[7]~62_combout\ : std_logic;
SIGNAL \Mux|output[7]~63_combout\ : std_logic;
SIGNAL \Mux|output[7]~64_combout\ : std_logic;
SIGNAL \RegG|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegG|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[9]~74_combout\ : std_logic;
SIGNAL \Mux|output[9]~75_combout\ : std_logic;
SIGNAL \Mux|output[9]~76_combout\ : std_logic;
SIGNAL \Reg3|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[9]~77_combout\ : std_logic;
SIGNAL \RegG|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegG|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[11]~86_combout\ : std_logic;
SIGNAL \Mux|output[11]~87_combout\ : std_logic;
SIGNAL \Reg4|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegG|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[12]~92_combout\ : std_logic;
SIGNAL \Mux|output[12]~93_combout\ : std_logic;
SIGNAL \Mux|output[12]~94_combout\ : std_logic;
SIGNAL \Reg3|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[12]~95_combout\ : std_logic;
SIGNAL \Reg6|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegG|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg6|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Ctrl|Selector0~0_combout\ : std_logic;
SIGNAL \DIN[2]~input_o\ : std_logic;
SIGNAL \DIN[5]~input_o\ : std_logic;
SIGNAL \Reg6|output[0]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[1]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[1]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[3]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[3]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[6]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[7]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[7]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[8]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[9]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[9]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg7|output[9]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[10]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[11]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg7|output[12]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[12]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[12]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[13]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[14]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg6|output[15]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Data_Bus[0]~output_o\ : std_logic;
SIGNAL \Data_Bus[1]~output_o\ : std_logic;
SIGNAL \Data_Bus[2]~output_o\ : std_logic;
SIGNAL \Data_Bus[3]~output_o\ : std_logic;
SIGNAL \Data_Bus[4]~output_o\ : std_logic;
SIGNAL \Data_Bus[5]~output_o\ : std_logic;
SIGNAL \Data_Bus[6]~output_o\ : std_logic;
SIGNAL \Data_Bus[7]~output_o\ : std_logic;
SIGNAL \Data_Bus[8]~output_o\ : std_logic;
SIGNAL \Data_Bus[9]~output_o\ : std_logic;
SIGNAL \Data_Bus[10]~output_o\ : std_logic;
SIGNAL \Data_Bus[11]~output_o\ : std_logic;
SIGNAL \Data_Bus[12]~output_o\ : std_logic;
SIGNAL \Data_Bus[13]~output_o\ : std_logic;
SIGNAL \Data_Bus[14]~output_o\ : std_logic;
SIGNAL \Data_Bus[15]~output_o\ : std_logic;
SIGNAL \InR[0]~output_o\ : std_logic;
SIGNAL \InR[1]~output_o\ : std_logic;
SIGNAL \InR[2]~output_o\ : std_logic;
SIGNAL \InR[3]~output_o\ : std_logic;
SIGNAL \InR[4]~output_o\ : std_logic;
SIGNAL \InR[5]~output_o\ : std_logic;
SIGNAL \InR[6]~output_o\ : std_logic;
SIGNAL \InR[7]~output_o\ : std_logic;
SIGNAL \InR[8]~output_o\ : std_logic;
SIGNAL \R0[0]~output_o\ : std_logic;
SIGNAL \R0[1]~output_o\ : std_logic;
SIGNAL \R0[2]~output_o\ : std_logic;
SIGNAL \R0[3]~output_o\ : std_logic;
SIGNAL \R0[4]~output_o\ : std_logic;
SIGNAL \R0[5]~output_o\ : std_logic;
SIGNAL \R0[6]~output_o\ : std_logic;
SIGNAL \R0[7]~output_o\ : std_logic;
SIGNAL \R0[8]~output_o\ : std_logic;
SIGNAL \R0[9]~output_o\ : std_logic;
SIGNAL \R0[10]~output_o\ : std_logic;
SIGNAL \R0[11]~output_o\ : std_logic;
SIGNAL \R0[12]~output_o\ : std_logic;
SIGNAL \R0[13]~output_o\ : std_logic;
SIGNAL \R0[14]~output_o\ : std_logic;
SIGNAL \R0[15]~output_o\ : std_logic;
SIGNAL \R1[0]~output_o\ : std_logic;
SIGNAL \R1[1]~output_o\ : std_logic;
SIGNAL \R1[2]~output_o\ : std_logic;
SIGNAL \R1[3]~output_o\ : std_logic;
SIGNAL \R1[4]~output_o\ : std_logic;
SIGNAL \R1[5]~output_o\ : std_logic;
SIGNAL \R1[6]~output_o\ : std_logic;
SIGNAL \R1[7]~output_o\ : std_logic;
SIGNAL \R1[8]~output_o\ : std_logic;
SIGNAL \R1[9]~output_o\ : std_logic;
SIGNAL \R1[10]~output_o\ : std_logic;
SIGNAL \R1[11]~output_o\ : std_logic;
SIGNAL \R1[12]~output_o\ : std_logic;
SIGNAL \R1[13]~output_o\ : std_logic;
SIGNAL \R1[14]~output_o\ : std_logic;
SIGNAL \R1[15]~output_o\ : std_logic;
SIGNAL \R2[0]~output_o\ : std_logic;
SIGNAL \R2[1]~output_o\ : std_logic;
SIGNAL \R2[2]~output_o\ : std_logic;
SIGNAL \R2[3]~output_o\ : std_logic;
SIGNAL \R2[4]~output_o\ : std_logic;
SIGNAL \R2[5]~output_o\ : std_logic;
SIGNAL \R2[6]~output_o\ : std_logic;
SIGNAL \R2[7]~output_o\ : std_logic;
SIGNAL \R2[8]~output_o\ : std_logic;
SIGNAL \R2[9]~output_o\ : std_logic;
SIGNAL \R2[10]~output_o\ : std_logic;
SIGNAL \R2[11]~output_o\ : std_logic;
SIGNAL \R2[12]~output_o\ : std_logic;
SIGNAL \R2[13]~output_o\ : std_logic;
SIGNAL \R2[14]~output_o\ : std_logic;
SIGNAL \R2[15]~output_o\ : std_logic;
SIGNAL \R3[0]~output_o\ : std_logic;
SIGNAL \R3[1]~output_o\ : std_logic;
SIGNAL \R3[2]~output_o\ : std_logic;
SIGNAL \R3[3]~output_o\ : std_logic;
SIGNAL \R3[4]~output_o\ : std_logic;
SIGNAL \R3[5]~output_o\ : std_logic;
SIGNAL \R3[6]~output_o\ : std_logic;
SIGNAL \R3[7]~output_o\ : std_logic;
SIGNAL \R3[8]~output_o\ : std_logic;
SIGNAL \R3[9]~output_o\ : std_logic;
SIGNAL \R3[10]~output_o\ : std_logic;
SIGNAL \R3[11]~output_o\ : std_logic;
SIGNAL \R3[12]~output_o\ : std_logic;
SIGNAL \R3[13]~output_o\ : std_logic;
SIGNAL \R3[14]~output_o\ : std_logic;
SIGNAL \R3[15]~output_o\ : std_logic;
SIGNAL \R4[0]~output_o\ : std_logic;
SIGNAL \R4[1]~output_o\ : std_logic;
SIGNAL \R4[2]~output_o\ : std_logic;
SIGNAL \R4[3]~output_o\ : std_logic;
SIGNAL \R4[4]~output_o\ : std_logic;
SIGNAL \R4[5]~output_o\ : std_logic;
SIGNAL \R4[6]~output_o\ : std_logic;
SIGNAL \R4[7]~output_o\ : std_logic;
SIGNAL \R4[8]~output_o\ : std_logic;
SIGNAL \R4[9]~output_o\ : std_logic;
SIGNAL \R4[10]~output_o\ : std_logic;
SIGNAL \R4[11]~output_o\ : std_logic;
SIGNAL \R4[12]~output_o\ : std_logic;
SIGNAL \R4[13]~output_o\ : std_logic;
SIGNAL \R4[14]~output_o\ : std_logic;
SIGNAL \R4[15]~output_o\ : std_logic;
SIGNAL \R5[0]~output_o\ : std_logic;
SIGNAL \R5[1]~output_o\ : std_logic;
SIGNAL \R5[2]~output_o\ : std_logic;
SIGNAL \R5[3]~output_o\ : std_logic;
SIGNAL \R5[4]~output_o\ : std_logic;
SIGNAL \R5[5]~output_o\ : std_logic;
SIGNAL \R5[6]~output_o\ : std_logic;
SIGNAL \R5[7]~output_o\ : std_logic;
SIGNAL \R5[8]~output_o\ : std_logic;
SIGNAL \R5[9]~output_o\ : std_logic;
SIGNAL \R5[10]~output_o\ : std_logic;
SIGNAL \R5[11]~output_o\ : std_logic;
SIGNAL \R5[12]~output_o\ : std_logic;
SIGNAL \R5[13]~output_o\ : std_logic;
SIGNAL \R5[14]~output_o\ : std_logic;
SIGNAL \R5[15]~output_o\ : std_logic;
SIGNAL \R6[0]~output_o\ : std_logic;
SIGNAL \R6[1]~output_o\ : std_logic;
SIGNAL \R6[2]~output_o\ : std_logic;
SIGNAL \R6[3]~output_o\ : std_logic;
SIGNAL \R6[4]~output_o\ : std_logic;
SIGNAL \R6[5]~output_o\ : std_logic;
SIGNAL \R6[6]~output_o\ : std_logic;
SIGNAL \R6[7]~output_o\ : std_logic;
SIGNAL \R6[8]~output_o\ : std_logic;
SIGNAL \R6[9]~output_o\ : std_logic;
SIGNAL \R6[10]~output_o\ : std_logic;
SIGNAL \R6[11]~output_o\ : std_logic;
SIGNAL \R6[12]~output_o\ : std_logic;
SIGNAL \R6[13]~output_o\ : std_logic;
SIGNAL \R6[14]~output_o\ : std_logic;
SIGNAL \R6[15]~output_o\ : std_logic;
SIGNAL \R7[0]~output_o\ : std_logic;
SIGNAL \R7[1]~output_o\ : std_logic;
SIGNAL \R7[2]~output_o\ : std_logic;
SIGNAL \R7[3]~output_o\ : std_logic;
SIGNAL \R7[4]~output_o\ : std_logic;
SIGNAL \R7[5]~output_o\ : std_logic;
SIGNAL \R7[6]~output_o\ : std_logic;
SIGNAL \R7[7]~output_o\ : std_logic;
SIGNAL \R7[8]~output_o\ : std_logic;
SIGNAL \R7[9]~output_o\ : std_logic;
SIGNAL \R7[10]~output_o\ : std_logic;
SIGNAL \R7[11]~output_o\ : std_logic;
SIGNAL \R7[12]~output_o\ : std_logic;
SIGNAL \R7[13]~output_o\ : std_logic;
SIGNAL \R7[14]~output_o\ : std_logic;
SIGNAL \R7[15]~output_o\ : std_logic;
SIGNAL \RA[0]~output_o\ : std_logic;
SIGNAL \RA[1]~output_o\ : std_logic;
SIGNAL \RA[2]~output_o\ : std_logic;
SIGNAL \RA[3]~output_o\ : std_logic;
SIGNAL \RA[4]~output_o\ : std_logic;
SIGNAL \RA[5]~output_o\ : std_logic;
SIGNAL \RA[6]~output_o\ : std_logic;
SIGNAL \RA[7]~output_o\ : std_logic;
SIGNAL \RA[8]~output_o\ : std_logic;
SIGNAL \RA[9]~output_o\ : std_logic;
SIGNAL \RA[10]~output_o\ : std_logic;
SIGNAL \RA[11]~output_o\ : std_logic;
SIGNAL \RA[12]~output_o\ : std_logic;
SIGNAL \RA[13]~output_o\ : std_logic;
SIGNAL \RA[14]~output_o\ : std_logic;
SIGNAL \RA[15]~output_o\ : std_logic;
SIGNAL \RG[0]~output_o\ : std_logic;
SIGNAL \RG[1]~output_o\ : std_logic;
SIGNAL \RG[2]~output_o\ : std_logic;
SIGNAL \RG[3]~output_o\ : std_logic;
SIGNAL \RG[4]~output_o\ : std_logic;
SIGNAL \RG[5]~output_o\ : std_logic;
SIGNAL \RG[6]~output_o\ : std_logic;
SIGNAL \RG[7]~output_o\ : std_logic;
SIGNAL \RG[8]~output_o\ : std_logic;
SIGNAL \RG[9]~output_o\ : std_logic;
SIGNAL \RG[10]~output_o\ : std_logic;
SIGNAL \RG[11]~output_o\ : std_logic;
SIGNAL \RG[12]~output_o\ : std_logic;
SIGNAL \RG[13]~output_o\ : std_logic;
SIGNAL \RG[14]~output_o\ : std_logic;
SIGNAL \RG[15]~output_o\ : std_logic;
SIGNAL \Done~output_o\ : std_logic;
SIGNAL \Reg0|output[0]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Resetn~input_o\ : std_logic;
SIGNAL \Resetn~inputclkctrl_outclk\ : std_logic;
SIGNAL \DIN[11]~input_o\ : std_logic;
SIGNAL \Run~input_o\ : std_logic;
SIGNAL \Ctrl|state~8_combout\ : std_logic;
SIGNAL \Ctrl|state.B~q\ : std_logic;
SIGNAL \DIN[15]~input_o\ : std_logic;
SIGNAL \Ctrl|Selector7~4_combout\ : std_logic;
SIGNAL \Ctrl|state.C~q\ : std_logic;
SIGNAL \Ctrl|state.D~q\ : std_logic;
SIGNAL \DIN[14]~input_o\ : std_logic;
SIGNAL \Ctrl|R_out~1_combout\ : std_logic;
SIGNAL \Ctrl|Selector0~1_combout\ : std_logic;
SIGNAL \Ctrl|state.A~q\ : std_logic;
SIGNAL \DIN[10]~input_o\ : std_logic;
SIGNAL \Ctrl|Selector17~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector16~0_combout\ : std_logic;
SIGNAL \Reg0|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \DIN[9]~input_o\ : std_logic;
SIGNAL \DIN[8]~input_o\ : std_logic;
SIGNAL \Ctrl|Selector8~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector7~0_combout\ : std_logic;
SIGNAL \DIN[13]~input_o\ : std_logic;
SIGNAL \Ctrl|Selector7~1_combout\ : std_logic;
SIGNAL \Ctrl|Selector7~2_combout\ : std_logic;
SIGNAL \Ctrl|Selector7~3_combout\ : std_logic;
SIGNAL \Mux|output[15]~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector15~1_combout\ : std_logic;
SIGNAL \Reg1|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \Ctrl|Selector14~3_combout\ : std_logic;
SIGNAL \Reg2|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[0]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \DIN[12]~input_o\ : std_logic;
SIGNAL \Ctrl|Selector12~0_combout\ : std_logic;
SIGNAL \Reg4|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \Ctrl|Selector13~3_combout\ : std_logic;
SIGNAL \Reg3|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \DIN[7]~input_o\ : std_logic;
SIGNAL \Ctrl|Selector5~0_combout\ : std_logic;
SIGNAL \Ctrl|Equal0~0_combout\ : std_logic;
SIGNAL \Ctrl|Selector5~1_combout\ : std_logic;
SIGNAL \Mux|output[15]~5_combout\ : std_logic;
SIGNAL \Mux|output[15]~7_combout\ : std_logic;
SIGNAL \Mux|output[15]~8_combout\ : std_logic;
SIGNAL \Ctrl|Selector11~1_combout\ : std_logic;
SIGNAL \Reg5|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \DIN[0]~input_o\ : std_logic;
SIGNAL \RegA|output[0]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \RegA|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \Adder|Gen_Adder:0:AdderX|sum~0_combout\ : std_logic;
SIGNAL \RegG|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[15]~15_combout\ : std_logic;
SIGNAL \Mux|output[15]~16_combout\ : std_logic;
SIGNAL \Mux|output[15]~17_combout\ : std_logic;
SIGNAL \Mux|output[15]~13_combout\ : std_logic;
SIGNAL \Mux|output[15]~14_combout\ : std_logic;
SIGNAL \Mux|output[15]~19_combout\ : std_logic;
SIGNAL \Ctrl|Selector9~0_combout\ : std_logic;
SIGNAL \Reg7|output[0]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[15]~10_combout\ : std_logic;
SIGNAL \Mux|output[15]~11_combout\ : std_logic;
SIGNAL \Mux|output[15]~12_combout\ : std_logic;
SIGNAL \Mux|output[0]~20_combout\ : std_logic;
SIGNAL \Mux|output[0]~21_combout\ : std_logic;
SIGNAL \Mux|output[0]~22_combout\ : std_logic;
SIGNAL \Mux|output[0]~23_combout\ : std_logic;
SIGNAL \Mux|output[0]~24_combout\ : std_logic;
SIGNAL \Mux|output[0]~25_combout\ : std_logic;
SIGNAL \Mux|output[15]~1_combout\ : std_logic;
SIGNAL \Mux|output[15]~2_combout\ : std_logic;
SIGNAL \Mux|output[15]~3_combout\ : std_logic;
SIGNAL \Mux|output[15]~4_combout\ : std_logic;
SIGNAL \Reg2|output[1]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg1|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \DIN[1]~input_o\ : std_logic;
SIGNAL \RegA|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Ctrl|AddSub~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:0:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:0:AdderX|c_out~1_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:1:AdderX|sum~combout\ : std_logic;
SIGNAL \RegG|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[1]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[1]~26_combout\ : std_logic;
SIGNAL \Mux|output[1]~27_combout\ : std_logic;
SIGNAL \Mux|output[1]~28_combout\ : std_logic;
SIGNAL \Mux|output[1]~29_combout\ : std_logic;
SIGNAL \Mux|output[1]~30_combout\ : std_logic;
SIGNAL \Mux|output[1]~31_combout\ : std_logic;
SIGNAL \Reg1|output[2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg1|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg2|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[2]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[15]~18_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:1:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:2:AdderX|sum~combout\ : std_logic;
SIGNAL \RegG|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[2]~32_combout\ : std_logic;
SIGNAL \Mux|output[2]~33_combout\ : std_logic;
SIGNAL \Mux|output[2]~34_combout\ : std_logic;
SIGNAL \Mux|output[2]~35_combout\ : std_logic;
SIGNAL \Mux|output[2]~36_combout\ : std_logic;
SIGNAL \Mux|output[2]~37_combout\ : std_logic;
SIGNAL \Reg2|output[3]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg1|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \DIN[3]~input_o\ : std_logic;
SIGNAL \RegA|output[2]~_Duplicate_1_q\ : std_logic;
SIGNAL \Adder|Gen_Adder:2:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:3:AdderX|sum~combout\ : std_logic;
SIGNAL \RegG|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[3]~38_combout\ : std_logic;
SIGNAL \Mux|output[3]~39_combout\ : std_logic;
SIGNAL \Mux|output[3]~40_combout\ : std_logic;
SIGNAL \Mux|output[3]~41_combout\ : std_logic;
SIGNAL \Mux|output[3]~42_combout\ : std_logic;
SIGNAL \Mux|output[3]~43_combout\ : std_logic;
SIGNAL \Reg1|output[4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg1|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg2|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[4]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \DIN[4]~input_o\ : std_logic;
SIGNAL \RegA|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[3]~_Duplicate_1_q\ : std_logic;
SIGNAL \Adder|Gen_Adder:3:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:4:AdderX|sum~combout\ : std_logic;
SIGNAL \RegG|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[4]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[4]~44_combout\ : std_logic;
SIGNAL \Mux|output[4]~45_combout\ : std_logic;
SIGNAL \Mux|output[4]~46_combout\ : std_logic;
SIGNAL \Mux|output[4]~47_combout\ : std_logic;
SIGNAL \Mux|output[4]~48_combout\ : std_logic;
SIGNAL \Mux|output[4]~49_combout\ : std_logic;
SIGNAL \Reg2|output[5]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg1|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Adder|Gen_Adder:4:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:5:AdderX|sum~combout\ : std_logic;
SIGNAL \RegG|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[5]~50_combout\ : std_logic;
SIGNAL \Mux|output[5]~51_combout\ : std_logic;
SIGNAL \Mux|output[5]~52_combout\ : std_logic;
SIGNAL \Mux|output[5]~53_combout\ : std_logic;
SIGNAL \Mux|output[5]~54_combout\ : std_logic;
SIGNAL \Mux|output[5]~55_combout\ : std_logic;
SIGNAL \Reg1|output[6]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg1|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[6]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \DIN[6]~input_o\ : std_logic;
SIGNAL \Reg7|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[6]~56_combout\ : std_logic;
SIGNAL \Mux|output[6]~57_combout\ : std_logic;
SIGNAL \Reg5|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[6]~58_combout\ : std_logic;
SIGNAL \Mux|output[6]~59_combout\ : std_logic;
SIGNAL \Reg2|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[6]~60_combout\ : std_logic;
SIGNAL \Mux|output[6]~61_combout\ : std_logic;
SIGNAL \Reg2|output[7]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg1|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[7]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[7]~65_combout\ : std_logic;
SIGNAL \Mux|output[7]~66_combout\ : std_logic;
SIGNAL \Mux|output[7]~67_combout\ : std_logic;
SIGNAL \Reg1|output[8]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg1|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[8]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[8]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg7|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[8]~68_combout\ : std_logic;
SIGNAL \Mux|output[8]~69_combout\ : std_logic;
SIGNAL \Mux|output[8]~70_combout\ : std_logic;
SIGNAL \Mux|output[8]~71_combout\ : std_logic;
SIGNAL \Reg2|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[8]~72_combout\ : std_logic;
SIGNAL \Mux|output[8]~73_combout\ : std_logic;
SIGNAL \Reg1|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[9]~78_combout\ : std_logic;
SIGNAL \Reg0|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg2|output[9]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[9]~79_combout\ : std_logic;
SIGNAL \Reg1|output[10]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg1|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[10]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[10]~80_combout\ : std_logic;
SIGNAL \Mux|output[10]~81_combout\ : std_logic;
SIGNAL \Mux|output[10]~82_combout\ : std_logic;
SIGNAL \Mux|output[10]~83_combout\ : std_logic;
SIGNAL \Reg2|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[10]~84_combout\ : std_logic;
SIGNAL \Reg0|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[10]~85_combout\ : std_logic;
SIGNAL \Reg2|output[11]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg1|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[11]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg3|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Ctrl|Selector4~1_combout\ : std_logic;
SIGNAL \Ctrl|Selector4~2_combout\ : std_logic;
SIGNAL \Mux|output[15]~6_combout\ : std_logic;
SIGNAL \Reg4|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[11]~88_combout\ : std_logic;
SIGNAL \Mux|output[11]~89_combout\ : std_logic;
SIGNAL \Mux|output[11]~90_combout\ : std_logic;
SIGNAL \Mux|output[11]~91_combout\ : std_logic;
SIGNAL \Reg1|output[12]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg1|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg2|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[12]~96_combout\ : std_logic;
SIGNAL \Mux|output[12]~97_combout\ : std_logic;
SIGNAL \Reg2|output[13]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg1|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[12]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[11]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[10]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[9]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[8]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[7]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[6]~_Duplicate_1_q\ : std_logic;
SIGNAL \RegA|output[5]~_Duplicate_1_q\ : std_logic;
SIGNAL \Adder|Gen_Adder:5:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:6:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:7:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:8:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:9:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:10:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:11:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:12:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:13:AdderX|sum~combout\ : std_logic;
SIGNAL \RegG|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[13]~98_combout\ : std_logic;
SIGNAL \Mux|output[13]~99_combout\ : std_logic;
SIGNAL \Reg4|output[13]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[13]~100_combout\ : std_logic;
SIGNAL \Reg3|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[13]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[13]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[13]~101_combout\ : std_logic;
SIGNAL \Mux|output[13]~102_combout\ : std_logic;
SIGNAL \Mux|output[13]~103_combout\ : std_logic;
SIGNAL \Reg1|output[14]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg1|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg2|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[14]~104_combout\ : std_logic;
SIGNAL \RegA|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Adder|Gen_Adder:13:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:14:AdderX|sum~combout\ : std_logic;
SIGNAL \RegG|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[14]~105_combout\ : std_logic;
SIGNAL \Reg5|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[14]~106_combout\ : std_logic;
SIGNAL \Reg3|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[14]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg4|output[14]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[14]~107_combout\ : std_logic;
SIGNAL \Mux|output[14]~108_combout\ : std_logic;
SIGNAL \Mux|output[14]~109_combout\ : std_logic;
SIGNAL \Reg2|output[15]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg2|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg0|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg1|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg4|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg7|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[15]~110_combout\ : std_logic;
SIGNAL \Mux|output[15]~111_combout\ : std_logic;
SIGNAL \Mux|output[15]~112_combout\ : std_logic;
SIGNAL \Reg3|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Reg5|output[15]~_Duplicate_1feeder_combout\ : std_logic;
SIGNAL \Reg5|output[15]~_Duplicate_1_q\ : std_logic;
SIGNAL \Mux|output[15]~113_combout\ : std_logic;
SIGNAL \Mux|output[15]~114_combout\ : std_logic;
SIGNAL \Mux|output[15]~115_combout\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Ctrl|Selector10~2_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:6:AdderX|sum~combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:7:AdderX|sum~combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:8:AdderX|sum~combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:9:AdderX|sum~combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:10:AdderX|sum~combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:11:AdderX|sum~combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:12:AdderX|sum~combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:14:AdderX|c_out~0_combout\ : std_logic;
SIGNAL \Adder|Gen_Adder:15:AdderX|sum~combout\ : std_logic;
SIGNAL \Reg1|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Reg2|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Reg3|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Reg4|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Reg5|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Reg6|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Reg7|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \RegA|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \RegG|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \IR|output\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \Reg0|output\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \Adder|xors\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_Clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Ctrl|ALT_INV_state.A~q\ : std_logic;

BEGIN

ww_DIN <= DIN;
ww_Run <= Run;
ww_Resetn <= Resetn;
ww_Clk <= Clk;
Data_Bus <= ww_Data_Bus;
InR <= ww_InR;
R0 <= ww_R0;
R1 <= ww_R1;
R2 <= ww_R2;
R3 <= ww_R3;
R4 <= ww_R4;
R5 <= ww_R5;
R6 <= ww_R6;
R7 <= ww_R7;
RA <= ww_RA;
RG <= ww_RG;
Done <= ww_Done;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Resetn~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Resetn~input_o\);

\Clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk~input_o\);
\ALT_INV_Clk~inputclkctrl_outclk\ <= NOT \Clk~inputclkctrl_outclk\;
\Ctrl|ALT_INV_state.A~q\ <= NOT \Ctrl|state.A~q\;

-- Location: LCCOMB_X1_Y54_N28
\Ctrl|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector15~0_combout\ = (\IR|output\(3) & !\IR|output\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \IR|output\(3),
	datad => \IR|output\(5),
	combout => \Ctrl|Selector15~0_combout\);

-- Location: LCCOMB_X5_Y54_N28
\Ctrl|Selector8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector8~1_combout\ = (!\IR|output\(2) & (!\IR|output\(1) & !\IR|output\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|output\(2),
	datac => \IR|output\(1),
	datad => \IR|output\(0),
	combout => \Ctrl|Selector8~1_combout\);

-- Location: LCCOMB_X4_Y53_N16
\Ctrl|R_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|R_out~0_combout\ = (\IR|output\(5)) # ((\IR|output\(3)) # ((\IR|output\(8)) # (!\IR|output\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(3),
	datac => \IR|output\(8),
	datad => \IR|output\(7),
	combout => \Ctrl|R_out~0_combout\);

-- Location: LCCOMB_X4_Y53_N2
\Ctrl|Selector8~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector8~2_combout\ = (\Ctrl|Equal0~0_combout\ & (((\Ctrl|Selector8~1_combout\)))) # (!\Ctrl|Equal0~0_combout\ & (!\IR|output\(4) & ((!\Ctrl|R_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Equal0~0_combout\,
	datab => \IR|output\(4),
	datac => \Ctrl|Selector8~1_combout\,
	datad => \Ctrl|R_out~0_combout\,
	combout => \Ctrl|Selector8~2_combout\);

-- Location: LCCOMB_X4_Y53_N6
\Ctrl|Selector14~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector14~2_combout\ = (!\IR|output\(3) & \IR|output\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \IR|output\(3),
	datad => \IR|output\(4),
	combout => \Ctrl|Selector14~2_combout\);

-- Location: LCCOMB_X5_Y54_N22
\Ctrl|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector4~0_combout\ = (!\IR|output\(0) & \IR|output\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \IR|output\(0),
	datad => \IR|output\(2),
	combout => \Ctrl|Selector4~0_combout\);

-- Location: LCCOMB_X4_Y53_N10
\Ctrl|Selector13~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector13~2_combout\ = (\IR|output\(3) & (!\IR|output\(5) & \IR|output\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|output\(3),
	datac => \IR|output\(5),
	datad => \IR|output\(4),
	combout => \Ctrl|Selector13~2_combout\);

-- Location: LCCOMB_X1_Y54_N10
\Ctrl|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector11~0_combout\ = (\IR|output\(3) & \IR|output\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \IR|output\(3),
	datad => \IR|output\(5),
	combout => \Ctrl|Selector11~0_combout\);

-- Location: LCCOMB_X5_Y54_N4
\Mux|output[15]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~9_combout\ = (\IR|output\(2) & \IR|output\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|output\(2),
	datac => \IR|output\(1),
	combout => \Mux|output[15]~9_combout\);

-- Location: FF_X2_Y54_N1
\Reg6|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[0]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[0]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N3
\Reg5|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[1]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[1]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N29
\Reg6|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[1]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[1]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N15
\Reg6|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[2]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[2]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N25
\Reg5|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[3]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[3]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N23
\Reg6|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[3]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[3]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N13
\Reg6|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[4]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[4]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N31
\Reg5|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[5]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[5]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N17
\Reg6|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[5]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[5]~_Duplicate_1_q\);

-- Location: FF_X1_Y55_N31
\RegG|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:6:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[6]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N11
\Reg6|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[6]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[6]~_Duplicate_1_q\);

-- Location: FF_X1_Y54_N21
\Reg4|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[7]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[7]~_Duplicate_1_q\);

-- Location: FF_X1_Y55_N21
\RegG|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:7:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[7]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N7
\Reg7|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[7]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N19
\Reg6|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[7]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[7]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N6
\Mux|output[7]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[7]~62_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[7]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[7]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[7]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[7]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[7]~62_combout\);

-- Location: LCCOMB_X3_Y54_N8
\Mux|output[7]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[7]~63_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[7]~62_combout\ & ((\DIN[7]~input_o\))) # (!\Mux|output[7]~62_combout\ & (\RegG|output[7]~_Duplicate_1_q\)))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[7]~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegG|output[7]~_Duplicate_1_q\,
	datab => \DIN[7]~input_o\,
	datac => \Mux|output[15]~18_combout\,
	datad => \Mux|output[7]~62_combout\,
	combout => \Mux|output[7]~63_combout\);

-- Location: LCCOMB_X3_Y54_N30
\Mux|output[7]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[7]~64_combout\ = (\Mux|output[15]~8_combout\ & (((\Mux|output[15]~6_combout\)))) # (!\Mux|output[15]~8_combout\ & ((\Mux|output[15]~6_combout\ & (\Reg4|output[7]~_Duplicate_1_q\)) # (!\Mux|output[15]~6_combout\ & 
-- ((\Mux|output[7]~63_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg4|output[7]~_Duplicate_1_q\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Mux|output[7]~63_combout\,
	datad => \Mux|output[15]~6_combout\,
	combout => \Mux|output[7]~64_combout\);

-- Location: FF_X1_Y57_N17
\RegG|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:8:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[8]~_Duplicate_1_q\);

-- Location: FF_X3_Y53_N5
\Reg6|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[8]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[8]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N9
\Reg5|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[9]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[9]~_Duplicate_1_q\);

-- Location: FF_X1_Y54_N23
\Reg4|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[9]~_Duplicate_1_q\);

-- Location: FF_X1_Y53_N1
\RegG|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:9:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[9]~_Duplicate_1_q\);

-- Location: FF_X1_Y55_N9
\Reg7|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg7|output[9]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[9]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N7
\Reg6|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[9]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[9]~_Duplicate_1_q\);

-- Location: LCCOMB_X1_Y54_N0
\Mux|output[9]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[9]~74_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[9]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((!\Mux|output[15]~12_combout\ & \Reg7|output[9]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[9]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Mux|output[15]~12_combout\,
	datad => \Reg7|output[9]~_Duplicate_1_q\,
	combout => \Mux|output[9]~74_combout\);

-- Location: LCCOMB_X1_Y54_N30
\Mux|output[9]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[9]~75_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[9]~74_combout\ & (\DIN[9]~input_o\)) # (!\Mux|output[9]~74_combout\ & ((\RegG|output[9]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[9]~74_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIN[9]~input_o\,
	datab => \RegG|output[9]~_Duplicate_1_q\,
	datac => \Mux|output[15]~18_combout\,
	datad => \Mux|output[9]~74_combout\,
	combout => \Mux|output[9]~75_combout\);

-- Location: LCCOMB_X1_Y54_N22
\Mux|output[9]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[9]~76_combout\ = (\Mux|output[15]~6_combout\ & (((\Reg4|output[9]~_Duplicate_1_q\) # (\Mux|output[15]~8_combout\)))) # (!\Mux|output[15]~6_combout\ & (\Mux|output[9]~75_combout\ & ((!\Mux|output[15]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[9]~75_combout\,
	datab => \Mux|output[15]~6_combout\,
	datac => \Reg4|output[9]~_Duplicate_1_q\,
	datad => \Mux|output[15]~8_combout\,
	combout => \Mux|output[9]~76_combout\);

-- Location: FF_X5_Y55_N31
\Reg3|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[9]~_Duplicate_1_q\);

-- Location: LCCOMB_X5_Y55_N30
\Mux|output[9]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[9]~77_combout\ = (\Mux|output[15]~8_combout\ & ((\Mux|output[9]~76_combout\ & ((\Reg3|output[9]~_Duplicate_1_q\))) # (!\Mux|output[9]~76_combout\ & (\Reg5|output[9]~_Duplicate_1_q\)))) # (!\Mux|output[15]~8_combout\ & 
-- (((\Mux|output[9]~76_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg5|output[9]~_Duplicate_1_q\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg3|output[9]~_Duplicate_1_q\,
	datad => \Mux|output[9]~76_combout\,
	combout => \Mux|output[9]~77_combout\);

-- Location: FF_X1_Y52_N17
\RegG|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:10:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[10]~_Duplicate_1_q\);

-- Location: FF_X3_Y53_N1
\Reg6|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[10]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[10]~_Duplicate_1_q\);

-- Location: FF_X1_Y54_N7
\RegG|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Adder|Gen_Adder:11:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[11]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N15
\Reg7|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[11]~_Duplicate_1_q\);

-- Location: FF_X3_Y53_N29
\Reg6|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[11]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[11]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N14
\Mux|output[11]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[11]~86_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[11]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[11]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[11]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[11]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[11]~86_combout\);

-- Location: LCCOMB_X1_Y54_N6
\Mux|output[11]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[11]~87_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[11]~86_combout\ & (\DIN[11]~input_o\)) # (!\Mux|output[11]~86_combout\ & ((\RegG|output[11]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & 
-- (((\Mux|output[11]~86_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIN[11]~input_o\,
	datab => \Mux|output[15]~18_combout\,
	datac => \RegG|output[11]~_Duplicate_1_q\,
	datad => \Mux|output[11]~86_combout\,
	combout => \Mux|output[11]~87_combout\);

-- Location: FF_X7_Y54_N3
\Reg4|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[12]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[12]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N9
\Reg5|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[12]~_Duplicate_1_q\);

-- Location: FF_X1_Y55_N27
\RegG|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:12:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[12]~_Duplicate_1_q\);

-- Location: FF_X1_Y55_N13
\Reg7|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg7|output[12]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[12]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N21
\Reg6|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[12]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[12]~_Duplicate_1_q\);

-- Location: LCCOMB_X1_Y54_N16
\Mux|output[12]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[12]~92_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[12]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((!\Mux|output[15]~12_combout\ & \Reg7|output[12]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[12]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Mux|output[15]~12_combout\,
	datad => \Reg7|output[12]~_Duplicate_1_q\,
	combout => \Mux|output[12]~92_combout\);

-- Location: LCCOMB_X1_Y54_N14
\Mux|output[12]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[12]~93_combout\ = (\Mux|output[12]~92_combout\ & ((\DIN[12]~input_o\) # ((!\Mux|output[15]~18_combout\)))) # (!\Mux|output[12]~92_combout\ & (((\Mux|output[15]~18_combout\ & \RegG|output[12]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIN[12]~input_o\,
	datab => \Mux|output[12]~92_combout\,
	datac => \Mux|output[15]~18_combout\,
	datad => \RegG|output[12]~_Duplicate_1_q\,
	combout => \Mux|output[12]~93_combout\);

-- Location: LCCOMB_X6_Y54_N8
\Mux|output[12]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[12]~94_combout\ = (\Mux|output[15]~6_combout\ & (((\Mux|output[15]~8_combout\)))) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & ((\Reg5|output[12]~_Duplicate_1_q\))) # (!\Mux|output[15]~8_combout\ & 
-- (\Mux|output[12]~93_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[12]~93_combout\,
	datac => \Reg5|output[12]~_Duplicate_1_q\,
	datad => \Mux|output[15]~8_combout\,
	combout => \Mux|output[12]~94_combout\);

-- Location: FF_X6_Y54_N23
\Reg3|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[12]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y54_N22
\Mux|output[12]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[12]~95_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[12]~94_combout\ & (\Reg3|output[12]~_Duplicate_1_q\)) # (!\Mux|output[12]~94_combout\ & ((\Reg4|output[12]~_Duplicate_1_q\))))) # (!\Mux|output[15]~6_combout\ & 
-- (\Mux|output[12]~94_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[12]~94_combout\,
	datac => \Reg3|output[12]~_Duplicate_1_q\,
	datad => \Reg4|output[12]~_Duplicate_1_q\,
	combout => \Mux|output[12]~95_combout\);

-- Location: FF_X3_Y53_N13
\Reg6|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[13]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[13]~_Duplicate_1_q\);

-- Location: FF_X2_Y54_N27
\Reg6|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[14]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[14]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N5
\RegG|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:15:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[15]~_Duplicate_1_q\);

-- Location: FF_X3_Y53_N9
\Reg6|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg6|output[15]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output[15]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N15
\RegA|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[15]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y57_N14
\Ctrl|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~0_combout\ = (!\Run~input_o\ & !\Ctrl|state.A~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Run~input_o\,
	datad => \Ctrl|state.A~q\,
	combout => \Ctrl|Selector0~0_combout\);

-- Location: IOIBUF_X0_Y67_N22
\DIN[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(2),
	o => \DIN[2]~input_o\);

-- Location: IOIBUF_X0_Y46_N15
\DIN[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(5),
	o => \DIN[5]~input_o\);

-- Location: LCCOMB_X2_Y54_N0
\Reg6|output[0]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[0]~_Duplicate_1feeder_combout\ = \Mux|output[0]~25_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[0]~25_combout\,
	combout => \Reg6|output[0]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N28
\Reg6|output[1]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[1]~_Duplicate_1feeder_combout\ = \Mux|output[1]~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[1]~31_combout\,
	combout => \Reg6|output[1]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N2
\Reg5|output[1]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[1]~_Duplicate_1feeder_combout\ = \Mux|output[1]~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[1]~31_combout\,
	combout => \Reg5|output[1]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N14
\Reg6|output[2]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[2]~_Duplicate_1feeder_combout\ = \Mux|output[2]~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[2]~37_combout\,
	combout => \Reg6|output[2]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N22
\Reg6|output[3]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[3]~_Duplicate_1feeder_combout\ = \Mux|output[3]~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[3]~43_combout\,
	combout => \Reg6|output[3]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N24
\Reg5|output[3]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[3]~_Duplicate_1feeder_combout\ = \Mux|output[3]~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[3]~43_combout\,
	combout => \Reg5|output[3]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N12
\Reg6|output[4]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[4]~_Duplicate_1feeder_combout\ = \Mux|output[4]~49_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[4]~49_combout\,
	combout => \Reg6|output[4]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N16
\Reg6|output[5]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[5]~_Duplicate_1feeder_combout\ = \Mux|output[5]~55_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[5]~55_combout\,
	combout => \Reg6|output[5]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N30
\Reg5|output[5]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[5]~_Duplicate_1feeder_combout\ = \Mux|output[5]~55_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[5]~55_combout\,
	combout => \Reg5|output[5]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N10
\Reg6|output[6]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[6]~_Duplicate_1feeder_combout\ = \Mux|output[6]~61_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[6]~61_combout\,
	combout => \Reg6|output[6]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N18
\Reg6|output[7]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[7]~_Duplicate_1feeder_combout\ = \Mux|output[7]~67_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[7]~67_combout\,
	combout => \Reg6|output[7]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X1_Y54_N20
\Reg4|output[7]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[7]~_Duplicate_1feeder_combout\ = \Mux|output[7]~67_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[7]~67_combout\,
	combout => \Reg4|output[7]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X3_Y53_N4
\Reg6|output[8]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[8]~_Duplicate_1feeder_combout\ = \Mux|output[8]~73_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[8]~73_combout\,
	combout => \Reg6|output[8]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N6
\Reg6|output[9]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[9]~_Duplicate_1feeder_combout\ = \Mux|output[9]~79_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[9]~79_combout\,
	combout => \Reg6|output[9]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N8
\Reg5|output[9]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[9]~_Duplicate_1feeder_combout\ = \Mux|output[9]~79_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[9]~79_combout\,
	combout => \Reg5|output[9]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X1_Y55_N8
\Reg7|output[9]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg7|output[9]~_Duplicate_1feeder_combout\ = \Mux|output[9]~79_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[9]~79_combout\,
	combout => \Reg7|output[9]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X3_Y53_N0
\Reg6|output[10]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[10]~_Duplicate_1feeder_combout\ = \Mux|output[10]~85_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[10]~85_combout\,
	combout => \Reg6|output[10]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X3_Y53_N28
\Reg6|output[11]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[11]~_Duplicate_1feeder_combout\ = \Mux|output[11]~91_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[11]~91_combout\,
	combout => \Reg6|output[11]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X1_Y55_N12
\Reg7|output[12]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg7|output[12]~_Duplicate_1feeder_combout\ = \Mux|output[12]~97_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[12]~97_combout\,
	combout => \Reg7|output[12]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X7_Y54_N2
\Reg4|output[12]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[12]~_Duplicate_1feeder_combout\ = \Mux|output[12]~97_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[12]~97_combout\,
	combout => \Reg4|output[12]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N20
\Reg6|output[12]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[12]~_Duplicate_1feeder_combout\ = \Mux|output[12]~97_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[12]~97_combout\,
	combout => \Reg6|output[12]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X3_Y53_N12
\Reg6|output[13]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[13]~_Duplicate_1feeder_combout\ = \Mux|output[13]~103_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[13]~103_combout\,
	combout => \Reg6|output[13]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X2_Y54_N26
\Reg6|output[14]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[14]~_Duplicate_1feeder_combout\ = \Mux|output[14]~109_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[14]~109_combout\,
	combout => \Reg6|output[14]~_Duplicate_1feeder_combout\);

-- Location: LCCOMB_X3_Y53_N8
\Reg6|output[15]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg6|output[15]~_Duplicate_1feeder_combout\ = \Mux|output[15]~115_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[15]~115_combout\,
	combout => \Reg6|output[15]~_Duplicate_1feeder_combout\);

-- Location: IOOBUF_X0_Y15_N16
\Data_Bus[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[0]~25_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[0]~output_o\);

-- Location: IOOBUF_X27_Y73_N23
\Data_Bus[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[1]~31_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[1]~output_o\);

-- Location: IOOBUF_X25_Y73_N16
\Data_Bus[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[2]~37_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[2]~output_o\);

-- Location: IOOBUF_X0_Y20_N16
\Data_Bus[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[3]~43_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[3]~output_o\);

-- Location: IOOBUF_X0_Y69_N9
\Data_Bus[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[4]~49_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[4]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\Data_Bus[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[5]~55_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[5]~output_o\);

-- Location: IOOBUF_X35_Y73_N23
\Data_Bus[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[6]~61_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[6]~output_o\);

-- Location: IOOBUF_X0_Y6_N2
\Data_Bus[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[7]~67_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[7]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\Data_Bus[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[8]~73_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[8]~output_o\);

-- Location: IOOBUF_X0_Y31_N16
\Data_Bus[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[9]~79_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[9]~output_o\);

-- Location: IOOBUF_X33_Y0_N9
\Data_Bus[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[10]~85_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[10]~output_o\);

-- Location: IOOBUF_X0_Y43_N16
\Data_Bus[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[11]~91_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[11]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\Data_Bus[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[12]~97_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[12]~output_o\);

-- Location: IOOBUF_X18_Y73_N16
\Data_Bus[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[13]~103_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[13]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\Data_Bus[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[14]~109_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[14]~output_o\);

-- Location: IOOBUF_X0_Y15_N23
\Data_Bus[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux|output[15]~115_combout\,
	devoe => ww_devoe,
	o => \Data_Bus[15]~output_o\);

-- Location: IOOBUF_X0_Y49_N2
\InR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(0),
	devoe => ww_devoe,
	o => \InR[0]~output_o\);

-- Location: IOOBUF_X0_Y45_N23
\InR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(1),
	devoe => ww_devoe,
	o => \InR[1]~output_o\);

-- Location: IOOBUF_X0_Y61_N23
\InR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(2),
	devoe => ww_devoe,
	o => \InR[2]~output_o\);

-- Location: IOOBUF_X0_Y46_N23
\InR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(3),
	devoe => ww_devoe,
	o => \InR[3]~output_o\);

-- Location: IOOBUF_X0_Y45_N16
\InR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(4),
	devoe => ww_devoe,
	o => \InR[4]~output_o\);

-- Location: IOOBUF_X0_Y58_N16
\InR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(5),
	devoe => ww_devoe,
	o => \InR[5]~output_o\);

-- Location: IOOBUF_X0_Y63_N23
\InR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(6),
	devoe => ww_devoe,
	o => \InR[6]~output_o\);

-- Location: IOOBUF_X0_Y60_N16
\InR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(7),
	devoe => ww_devoe,
	o => \InR[7]~output_o\);

-- Location: IOOBUF_X0_Y64_N2
\InR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IR|output\(8),
	devoe => ww_devoe,
	o => \InR[8]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\R0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(0),
	devoe => ww_devoe,
	o => \R0[0]~output_o\);

-- Location: IOOBUF_X29_Y73_N2
\R0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(1),
	devoe => ww_devoe,
	o => \R0[1]~output_o\);

-- Location: IOOBUF_X25_Y73_N23
\R0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(2),
	devoe => ww_devoe,
	o => \R0[2]~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\R0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(3),
	devoe => ww_devoe,
	o => \R0[3]~output_o\);

-- Location: IOOBUF_X0_Y68_N2
\R0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(4),
	devoe => ww_devoe,
	o => \R0[4]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\R0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(5),
	devoe => ww_devoe,
	o => \R0[5]~output_o\);

-- Location: IOOBUF_X29_Y73_N9
\R0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(6),
	devoe => ww_devoe,
	o => \R0[6]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\R0[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(7),
	devoe => ww_devoe,
	o => \R0[7]~output_o\);

-- Location: IOOBUF_X5_Y0_N9
\R0[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(8),
	devoe => ww_devoe,
	o => \R0[8]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\R0[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(9),
	devoe => ww_devoe,
	o => \R0[9]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\R0[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(10),
	devoe => ww_devoe,
	o => \R0[10]~output_o\);

-- Location: IOOBUF_X0_Y35_N16
\R0[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(11),
	devoe => ww_devoe,
	o => \R0[11]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\R0[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(12),
	devoe => ww_devoe,
	o => \R0[12]~output_o\);

-- Location: IOOBUF_X18_Y73_N23
\R0[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(13),
	devoe => ww_devoe,
	o => \R0[13]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\R0[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(14),
	devoe => ww_devoe,
	o => \R0[14]~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\R0[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg0|output\(15),
	devoe => ww_devoe,
	o => \R0[15]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\R1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(0),
	devoe => ww_devoe,
	o => \R1[0]~output_o\);

-- Location: IOOBUF_X33_Y73_N9
\R1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(1),
	devoe => ww_devoe,
	o => \R1[1]~output_o\);

-- Location: IOOBUF_X3_Y73_N23
\R1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(2),
	devoe => ww_devoe,
	o => \R1[2]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\R1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(3),
	devoe => ww_devoe,
	o => \R1[3]~output_o\);

-- Location: IOOBUF_X3_Y73_N9
\R1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(4),
	devoe => ww_devoe,
	o => \R1[4]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\R1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(5),
	devoe => ww_devoe,
	o => \R1[5]~output_o\);

-- Location: IOOBUF_X33_Y73_N2
\R1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(6),
	devoe => ww_devoe,
	o => \R1[6]~output_o\);

-- Location: IOOBUF_X29_Y0_N23
\R1[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(7),
	devoe => ww_devoe,
	o => \R1[7]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\R1[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(8),
	devoe => ww_devoe,
	o => \R1[8]~output_o\);

-- Location: IOOBUF_X0_Y33_N23
\R1[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(9),
	devoe => ww_devoe,
	o => \R1[9]~output_o\);

-- Location: IOOBUF_X33_Y0_N2
\R1[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(10),
	devoe => ww_devoe,
	o => \R1[10]~output_o\);

-- Location: IOOBUF_X0_Y42_N9
\R1[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(11),
	devoe => ww_devoe,
	o => \R1[11]~output_o\);

-- Location: IOOBUF_X9_Y0_N23
\R1[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(12),
	devoe => ww_devoe,
	o => \R1[12]~output_o\);

-- Location: IOOBUF_X16_Y73_N2
\R1[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(13),
	devoe => ww_devoe,
	o => \R1[13]~output_o\);

-- Location: IOOBUF_X0_Y33_N16
\R1[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(14),
	devoe => ww_devoe,
	o => \R1[14]~output_o\);

-- Location: IOOBUF_X0_Y14_N9
\R1[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg1|output\(15),
	devoe => ww_devoe,
	o => \R1[15]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\R2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(0),
	devoe => ww_devoe,
	o => \R2[0]~output_o\);

-- Location: IOOBUF_X11_Y73_N9
\R2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(1),
	devoe => ww_devoe,
	o => \R2[1]~output_o\);

-- Location: IOOBUF_X13_Y73_N9
\R2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(2),
	devoe => ww_devoe,
	o => \R2[2]~output_o\);

-- Location: IOOBUF_X0_Y19_N9
\R2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(3),
	devoe => ww_devoe,
	o => \R2[3]~output_o\);

-- Location: IOOBUF_X5_Y73_N2
\R2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(4),
	devoe => ww_devoe,
	o => \R2[4]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\R2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(5),
	devoe => ww_devoe,
	o => \R2[5]~output_o\);

-- Location: IOOBUF_X13_Y73_N2
\R2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(6),
	devoe => ww_devoe,
	o => \R2[6]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\R2[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(7),
	devoe => ww_devoe,
	o => \R2[7]~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\R2[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(8),
	devoe => ww_devoe,
	o => \R2[8]~output_o\);

-- Location: IOOBUF_X0_Y32_N16
\R2[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(9),
	devoe => ww_devoe,
	o => \R2[9]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\R2[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(10),
	devoe => ww_devoe,
	o => \R2[10]~output_o\);

-- Location: IOOBUF_X0_Y32_N23
\R2[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(11),
	devoe => ww_devoe,
	o => \R2[11]~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\R2[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(12),
	devoe => ww_devoe,
	o => \R2[12]~output_o\);

-- Location: IOOBUF_X13_Y73_N16
\R2[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(13),
	devoe => ww_devoe,
	o => \R2[13]~output_o\);

-- Location: IOOBUF_X0_Y25_N16
\R2[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(14),
	devoe => ww_devoe,
	o => \R2[14]~output_o\);

-- Location: IOOBUF_X0_Y25_N23
\R2[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg2|output\(15),
	devoe => ww_devoe,
	o => \R2[15]~output_o\);

-- Location: IOOBUF_X0_Y4_N2
\R3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(0),
	devoe => ww_devoe,
	o => \R3[0]~output_o\);

-- Location: IOOBUF_X20_Y73_N16
\R3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(1),
	devoe => ww_devoe,
	o => \R3[1]~output_o\);

-- Location: IOOBUF_X20_Y73_N23
\R3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(2),
	devoe => ww_devoe,
	o => \R3[2]~output_o\);

-- Location: IOOBUF_X0_Y22_N23
\R3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(3),
	devoe => ww_devoe,
	o => \R3[3]~output_o\);

-- Location: IOOBUF_X0_Y68_N16
\R3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(4),
	devoe => ww_devoe,
	o => \R3[4]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\R3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(5),
	devoe => ww_devoe,
	o => \R3[5]~output_o\);

-- Location: IOOBUF_X20_Y73_N2
\R3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(6),
	devoe => ww_devoe,
	o => \R3[6]~output_o\);

-- Location: IOOBUF_X20_Y0_N16
\R3[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(7),
	devoe => ww_devoe,
	o => \R3[7]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\R3[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(8),
	devoe => ww_devoe,
	o => \R3[8]~output_o\);

-- Location: IOOBUF_X0_Y30_N9
\R3[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(9),
	devoe => ww_devoe,
	o => \R3[9]~output_o\);

-- Location: IOOBUF_X16_Y73_N9
\R3[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(10),
	devoe => ww_devoe,
	o => \R3[10]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\R3[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(11),
	devoe => ww_devoe,
	o => \R3[11]~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\R3[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(12),
	devoe => ww_devoe,
	o => \R3[12]~output_o\);

-- Location: IOOBUF_X16_Y73_N23
\R3[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(13),
	devoe => ww_devoe,
	o => \R3[13]~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\R3[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(14),
	devoe => ww_devoe,
	o => \R3[14]~output_o\);

-- Location: IOOBUF_X0_Y13_N9
\R3[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg3|output\(15),
	devoe => ww_devoe,
	o => \R3[15]~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\R4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(0),
	devoe => ww_devoe,
	o => \R4[0]~output_o\);

-- Location: IOOBUF_X27_Y73_N9
\R4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(1),
	devoe => ww_devoe,
	o => \R4[1]~output_o\);

-- Location: IOOBUF_X23_Y73_N23
\R4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(2),
	devoe => ww_devoe,
	o => \R4[2]~output_o\);

-- Location: IOOBUF_X0_Y24_N9
\R4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(3),
	devoe => ww_devoe,
	o => \R4[3]~output_o\);

-- Location: IOOBUF_X0_Y68_N9
\R4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(4),
	devoe => ww_devoe,
	o => \R4[4]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\R4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(5),
	devoe => ww_devoe,
	o => \R4[5]~output_o\);

-- Location: IOOBUF_X27_Y73_N16
\R4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(6),
	devoe => ww_devoe,
	o => \R4[6]~output_o\);

-- Location: IOOBUF_X27_Y0_N23
\R4[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(7),
	devoe => ww_devoe,
	o => \R4[7]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\R4[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(8),
	devoe => ww_devoe,
	o => \R4[8]~output_o\);

-- Location: IOOBUF_X0_Y30_N2
\R4[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(9),
	devoe => ww_devoe,
	o => \R4[9]~output_o\);

-- Location: IOOBUF_X27_Y0_N9
\R4[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(10),
	devoe => ww_devoe,
	o => \R4[10]~output_o\);

-- Location: IOOBUF_X0_Y42_N2
\R4[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(11),
	devoe => ww_devoe,
	o => \R4[11]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\R4[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(12),
	devoe => ww_devoe,
	o => \R4[12]~output_o\);

-- Location: IOOBUF_X16_Y73_N16
\R4[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(13),
	devoe => ww_devoe,
	o => \R4[13]~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\R4[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(14),
	devoe => ww_devoe,
	o => \R4[14]~output_o\);

-- Location: IOOBUF_X0_Y16_N23
\R4[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg4|output\(15),
	devoe => ww_devoe,
	o => \R4[15]~output_o\);

-- Location: IOOBUF_X0_Y4_N9
\R5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(0),
	devoe => ww_devoe,
	o => \R5[0]~output_o\);

-- Location: IOOBUF_X31_Y73_N9
\R5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(1),
	devoe => ww_devoe,
	o => \R5[1]~output_o\);

-- Location: IOOBUF_X20_Y73_N9
\R5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(2),
	devoe => ww_devoe,
	o => \R5[2]~output_o\);

-- Location: IOOBUF_X0_Y24_N16
\R5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(3),
	devoe => ww_devoe,
	o => \R5[3]~output_o\);

-- Location: IOOBUF_X5_Y73_N9
\R5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(4),
	devoe => ww_devoe,
	o => \R5[4]~output_o\);

-- Location: IOOBUF_X13_Y0_N23
\R5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(5),
	devoe => ww_devoe,
	o => \R5[5]~output_o\);

-- Location: IOOBUF_X31_Y73_N2
\R5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(6),
	devoe => ww_devoe,
	o => \R5[6]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\R5[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(7),
	devoe => ww_devoe,
	o => \R5[7]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\R5[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(8),
	devoe => ww_devoe,
	o => \R5[8]~output_o\);

-- Location: IOOBUF_X0_Y28_N16
\R5[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(9),
	devoe => ww_devoe,
	o => \R5[9]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\R5[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(10),
	devoe => ww_devoe,
	o => \R5[10]~output_o\);

-- Location: IOOBUF_X0_Y35_N9
\R5[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(11),
	devoe => ww_devoe,
	o => \R5[11]~output_o\);

-- Location: IOOBUF_X9_Y0_N9
\R5[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(12),
	devoe => ww_devoe,
	o => \R5[12]~output_o\);

-- Location: IOOBUF_X5_Y73_N23
\R5[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(13),
	devoe => ww_devoe,
	o => \R5[13]~output_o\);

-- Location: IOOBUF_X0_Y24_N2
\R5[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(14),
	devoe => ww_devoe,
	o => \R5[14]~output_o\);

-- Location: IOOBUF_X0_Y17_N16
\R5[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg5|output\(15),
	devoe => ww_devoe,
	o => \R5[15]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\R6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(0),
	devoe => ww_devoe,
	o => \R6[0]~output_o\);

-- Location: IOOBUF_X1_Y73_N2
\R6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(1),
	devoe => ww_devoe,
	o => \R6[1]~output_o\);

-- Location: IOOBUF_X9_Y73_N9
\R6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(2),
	devoe => ww_devoe,
	o => \R6[2]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\R6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(3),
	devoe => ww_devoe,
	o => \R6[3]~output_o\);

-- Location: IOOBUF_X1_Y73_N23
\R6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(4),
	devoe => ww_devoe,
	o => \R6[4]~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\R6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(5),
	devoe => ww_devoe,
	o => \R6[5]~output_o\);

-- Location: IOOBUF_X9_Y73_N2
\R6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(6),
	devoe => ww_devoe,
	o => \R6[6]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\R6[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(7),
	devoe => ww_devoe,
	o => \R6[7]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\R6[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(8),
	devoe => ww_devoe,
	o => \R6[8]~output_o\);

-- Location: IOOBUF_X0_Y29_N23
\R6[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(9),
	devoe => ww_devoe,
	o => \R6[9]~output_o\);

-- Location: IOOBUF_X1_Y73_N9
\R6[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(10),
	devoe => ww_devoe,
	o => \R6[10]~output_o\);

-- Location: IOOBUF_X0_Y34_N9
\R6[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(11),
	devoe => ww_devoe,
	o => \R6[11]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\R6[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(12),
	devoe => ww_devoe,
	o => \R6[12]~output_o\);

-- Location: IOOBUF_X1_Y73_N16
\R6[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(13),
	devoe => ww_devoe,
	o => \R6[13]~output_o\);

-- Location: IOOBUF_X0_Y27_N23
\R6[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(14),
	devoe => ww_devoe,
	o => \R6[14]~output_o\);

-- Location: IOOBUF_X0_Y13_N2
\R6[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg6|output\(15),
	devoe => ww_devoe,
	o => \R6[15]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\R7[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(0),
	devoe => ww_devoe,
	o => \R7[0]~output_o\);

-- Location: IOOBUF_X11_Y73_N2
\R7[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(1),
	devoe => ww_devoe,
	o => \R7[1]~output_o\);

-- Location: IOOBUF_X11_Y73_N16
\R7[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(2),
	devoe => ww_devoe,
	o => \R7[2]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\R7[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(3),
	devoe => ww_devoe,
	o => \R7[3]~output_o\);

-- Location: IOOBUF_X7_Y73_N23
\R7[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(4),
	devoe => ww_devoe,
	o => \R7[4]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\R7[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(5),
	devoe => ww_devoe,
	o => \R7[5]~output_o\);

-- Location: IOOBUF_X11_Y73_N23
\R7[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(6),
	devoe => ww_devoe,
	o => \R7[6]~output_o\);

-- Location: IOOBUF_X11_Y0_N2
\R7[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(7),
	devoe => ww_devoe,
	o => \R7[7]~output_o\);

-- Location: IOOBUF_X0_Y11_N23
\R7[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(8),
	devoe => ww_devoe,
	o => \R7[8]~output_o\);

-- Location: IOOBUF_X0_Y29_N16
\R7[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(9),
	devoe => ww_devoe,
	o => \R7[9]~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\R7[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(10),
	devoe => ww_devoe,
	o => \R7[10]~output_o\);

-- Location: IOOBUF_X0_Y34_N2
\R7[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(11),
	devoe => ww_devoe,
	o => \R7[11]~output_o\);

-- Location: IOOBUF_X11_Y0_N16
\R7[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(12),
	devoe => ww_devoe,
	o => \R7[12]~output_o\);

-- Location: IOOBUF_X7_Y73_N16
\R7[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(13),
	devoe => ww_devoe,
	o => \R7[13]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\R7[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(14),
	devoe => ww_devoe,
	o => \R7[14]~output_o\);

-- Location: IOOBUF_X0_Y16_N16
\R7[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Reg7|output\(15),
	devoe => ww_devoe,
	o => \R7[15]~output_o\);

-- Location: IOOBUF_X0_Y7_N9
\RA[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(0),
	devoe => ww_devoe,
	o => \RA[0]~output_o\);

-- Location: IOOBUF_X23_Y73_N9
\RA[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(1),
	devoe => ww_devoe,
	o => \RA[1]~output_o\);

-- Location: IOOBUF_X23_Y73_N2
\RA[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(2),
	devoe => ww_devoe,
	o => \RA[2]~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\RA[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(3),
	devoe => ww_devoe,
	o => \RA[3]~output_o\);

-- Location: IOOBUF_X3_Y73_N2
\RA[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(4),
	devoe => ww_devoe,
	o => \RA[4]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\RA[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(5),
	devoe => ww_devoe,
	o => \RA[5]~output_o\);

-- Location: IOOBUF_X23_Y73_N16
\RA[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(6),
	devoe => ww_devoe,
	o => \RA[6]~output_o\);

-- Location: IOOBUF_X23_Y0_N23
\RA[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(7),
	devoe => ww_devoe,
	o => \RA[7]~output_o\);

-- Location: IOOBUF_X0_Y10_N16
\RA[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(8),
	devoe => ww_devoe,
	o => \RA[8]~output_o\);

-- Location: IOOBUF_X0_Y28_N23
\RA[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(9),
	devoe => ww_devoe,
	o => \RA[9]~output_o\);

-- Location: IOOBUF_X20_Y0_N23
\RA[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(10),
	devoe => ww_devoe,
	o => \RA[10]~output_o\);

-- Location: IOOBUF_X0_Y44_N23
\RA[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(11),
	devoe => ww_devoe,
	o => \RA[11]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\RA[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(12),
	devoe => ww_devoe,
	o => \RA[12]~output_o\);

-- Location: IOOBUF_X13_Y73_N23
\RA[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(13),
	devoe => ww_devoe,
	o => \RA[13]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\RA[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(14),
	devoe => ww_devoe,
	o => \RA[14]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\RA[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegA|output\(15),
	devoe => ww_devoe,
	o => \RA[15]~output_o\);

-- Location: IOOBUF_X0_Y44_N16
\RG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(0),
	devoe => ww_devoe,
	o => \RG[0]~output_o\);

-- Location: IOOBUF_X0_Y44_N2
\RG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(1),
	devoe => ww_devoe,
	o => \RG[1]~output_o\);

-- Location: IOOBUF_X0_Y44_N9
\RG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(2),
	devoe => ww_devoe,
	o => \RG[2]~output_o\);

-- Location: IOOBUF_X0_Y48_N9
\RG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(3),
	devoe => ww_devoe,
	o => \RG[3]~output_o\);

-- Location: IOOBUF_X0_Y52_N16
\RG[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(4),
	devoe => ww_devoe,
	o => \RG[4]~output_o\);

-- Location: IOOBUF_X0_Y51_N16
\RG[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(5),
	devoe => ww_devoe,
	o => \RG[5]~output_o\);

-- Location: IOOBUF_X0_Y52_N2
\RG[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(6),
	devoe => ww_devoe,
	o => \RG[6]~output_o\);

-- Location: IOOBUF_X0_Y57_N23
\RG[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(7),
	devoe => ww_devoe,
	o => \RG[7]~output_o\);

-- Location: IOOBUF_X0_Y57_N16
\RG[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(8),
	devoe => ww_devoe,
	o => \RG[8]~output_o\);

-- Location: IOOBUF_X0_Y53_N2
\RG[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(9),
	devoe => ww_devoe,
	o => \RG[9]~output_o\);

-- Location: IOOBUF_X0_Y52_N23
\RG[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(10),
	devoe => ww_devoe,
	o => \RG[10]~output_o\);

-- Location: IOOBUF_X0_Y54_N9
\RG[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(11),
	devoe => ww_devoe,
	o => \RG[11]~output_o\);

-- Location: IOOBUF_X0_Y55_N16
\RG[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(12),
	devoe => ww_devoe,
	o => \RG[12]~output_o\);

-- Location: IOOBUF_X0_Y53_N9
\RG[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(13),
	devoe => ww_devoe,
	o => \RG[13]~output_o\);

-- Location: IOOBUF_X0_Y55_N9
\RG[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(14),
	devoe => ww_devoe,
	o => \RG[14]~output_o\);

-- Location: IOOBUF_X0_Y55_N23
\RG[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegG|output\(15),
	devoe => ww_devoe,
	o => \RG[15]~output_o\);

-- Location: IOOBUF_X0_Y49_N9
\Done~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Ctrl|Selector17~0_combout\,
	devoe => ww_devoe,
	o => \Done~output_o\);

-- Location: LCCOMB_X6_Y55_N30
\Reg0|output[0]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg0|output[0]~_Duplicate_1feeder_combout\ = \Mux|output[0]~25_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[0]~25_combout\,
	combout => \Reg0|output[0]~_Duplicate_1feeder_combout\);

-- Location: IOIBUF_X0_Y36_N15
\Resetn~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Resetn,
	o => \Resetn~input_o\);

-- Location: CLKCTRL_G4
\Resetn~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Resetn~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Resetn~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y47_N15
\DIN[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(11),
	o => \DIN[11]~input_o\);

-- Location: IOIBUF_X0_Y65_N15
\Run~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Run,
	o => \Run~input_o\);

-- Location: LCCOMB_X3_Y57_N4
\Ctrl|state~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|state~8_combout\ = (\Run~input_o\ & !\Ctrl|state.A~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Run~input_o\,
	datad => \Ctrl|state.A~q\,
	combout => \Ctrl|state~8_combout\);

-- Location: FF_X4_Y54_N7
\Ctrl|state.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \Ctrl|state~8_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.B~q\);

-- Location: IOIBUF_X0_Y62_N15
\DIN[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(15),
	o => \DIN[15]~input_o\);

-- Location: FF_X0_Y62_N17
\IR|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[15]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(8));

-- Location: LCCOMB_X3_Y55_N26
\Ctrl|Selector7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector7~4_combout\ = (\IR|output\(7) & (\Ctrl|state.B~q\ & !\IR|output\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(7),
	datac => \Ctrl|state.B~q\,
	datad => \IR|output\(8),
	combout => \Ctrl|Selector7~4_combout\);

-- Location: FF_X4_Y54_N5
\Ctrl|state.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \Ctrl|Selector7~4_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.C~q\);

-- Location: FF_X4_Y54_N9
\Ctrl|state.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \Ctrl|state.C~q\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.D~q\);

-- Location: IOIBUF_X0_Y59_N22
\DIN[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(14),
	o => \DIN[14]~input_o\);

-- Location: FF_X0_Y59_N24
\IR|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[14]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(7));

-- Location: LCCOMB_X4_Y53_N24
\Ctrl|R_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|R_out~1_combout\ = (!\IR|output\(8) & \IR|output\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \IR|output\(8),
	datad => \IR|output\(7),
	combout => \Ctrl|R_out~1_combout\);

-- Location: LCCOMB_X4_Y53_N0
\Ctrl|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector0~1_combout\ = (!\Ctrl|Selector0~0_combout\ & (!\Ctrl|state.D~q\ & ((\Ctrl|R_out~1_combout\) # (!\Ctrl|state.B~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector0~0_combout\,
	datab => \Ctrl|state.B~q\,
	datac => \Ctrl|state.D~q\,
	datad => \Ctrl|R_out~1_combout\,
	combout => \Ctrl|Selector0~1_combout\);

-- Location: FF_X4_Y53_N1
\Ctrl|state.A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \Ctrl|Selector0~1_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ctrl|state.A~q\);

-- Location: FF_X0_Y47_N17
\IR|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[11]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(4));

-- Location: IOIBUF_X0_Y47_N1
\DIN[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(10),
	o => \DIN[10]~input_o\);

-- Location: FF_X0_Y47_N3
\IR|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[10]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(3));

-- Location: LCCOMB_X4_Y53_N20
\Ctrl|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector17~0_combout\ = (\Ctrl|state.D~q\) # ((!\IR|output\(8) & (!\IR|output\(7) & \Ctrl|state.B~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(8),
	datab => \IR|output\(7),
	datac => \Ctrl|state.B~q\,
	datad => \Ctrl|state.D~q\,
	combout => \Ctrl|Selector17~0_combout\);

-- Location: LCCOMB_X4_Y53_N12
\Ctrl|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector16~0_combout\ = (!\IR|output\(5) & (!\IR|output\(4) & (!\IR|output\(3) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(3),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector16~0_combout\);

-- Location: FF_X6_Y55_N31
\Reg0|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg0|output[0]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[0]~_Duplicate_1_q\);

-- Location: IOIBUF_X0_Y62_N22
\DIN[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(9),
	o => \DIN[9]~input_o\);

-- Location: FF_X0_Y62_N24
\IR|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[9]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(2));

-- Location: IOIBUF_X0_Y47_N22
\DIN[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(8),
	o => \DIN[8]~input_o\);

-- Location: FF_X0_Y47_N24
\IR|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[8]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(1));

-- Location: LCCOMB_X5_Y55_N22
\Ctrl|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector8~0_combout\ = (!\IR|output\(0) & (!\IR|output\(2) & (!\IR|output\(1) & \Ctrl|state.C~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(0),
	datab => \IR|output\(2),
	datac => \IR|output\(1),
	datad => \Ctrl|state.C~q\,
	combout => \Ctrl|Selector8~0_combout\);

-- Location: LCCOMB_X4_Y54_N6
\Ctrl|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector7~0_combout\ = (!\IR|output\(8) & (\IR|output\(7) & (\Ctrl|state.B~q\ & !\IR|output\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(8),
	datab => \IR|output\(7),
	datac => \Ctrl|state.B~q\,
	datad => \IR|output\(4),
	combout => \Ctrl|Selector7~0_combout\);

-- Location: IOIBUF_X0_Y63_N15
\DIN[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(13),
	o => \DIN[13]~input_o\);

-- Location: FF_X0_Y63_N17
\IR|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[13]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(6));

-- Location: LCCOMB_X4_Y54_N10
\Ctrl|Selector7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector7~1_combout\ = (!\IR|output\(8) & (!\IR|output\(6) & (!\IR|output\(7) & \Ctrl|state.B~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(8),
	datab => \IR|output\(6),
	datac => \IR|output\(7),
	datad => \Ctrl|state.B~q\,
	combout => \Ctrl|Selector7~1_combout\);

-- Location: LCCOMB_X4_Y54_N4
\Ctrl|Selector7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector7~2_combout\ = (\IR|output\(0) & (!\IR|output\(1) & ((\Ctrl|state.C~q\) # (\Ctrl|Selector7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(0),
	datab => \IR|output\(1),
	datac => \Ctrl|state.C~q\,
	datad => \Ctrl|Selector7~1_combout\,
	combout => \Ctrl|Selector7~2_combout\);

-- Location: LCCOMB_X4_Y54_N26
\Ctrl|Selector7~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector7~3_combout\ = (\Ctrl|Selector15~0_combout\ & ((\Ctrl|Selector7~0_combout\) # ((!\IR|output\(2) & \Ctrl|Selector7~2_combout\)))) # (!\Ctrl|Selector15~0_combout\ & (((!\IR|output\(2) & \Ctrl|Selector7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector15~0_combout\,
	datab => \Ctrl|Selector7~0_combout\,
	datac => \IR|output\(2),
	datad => \Ctrl|Selector7~2_combout\,
	combout => \Ctrl|Selector7~3_combout\);

-- Location: LCCOMB_X5_Y55_N20
\Mux|output[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~0_combout\ = (\Ctrl|Selector8~0_combout\) # ((\Ctrl|Selector7~3_combout\) # ((\Ctrl|Selector8~2_combout\ & \Ctrl|state.B~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector8~2_combout\,
	datab => \Ctrl|state.B~q\,
	datac => \Ctrl|Selector8~0_combout\,
	datad => \Ctrl|Selector7~3_combout\,
	combout => \Mux|output[15]~0_combout\);

-- Location: LCCOMB_X4_Y53_N30
\Ctrl|Selector15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector15~1_combout\ = (!\IR|output\(5) & (!\IR|output\(4) & (\IR|output\(3) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(3),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector15~1_combout\);

-- Location: FF_X5_Y55_N1
\Reg1|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y53_N18
\Ctrl|Selector14~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector14~3_combout\ = (!\IR|output\(5) & (\IR|output\(4) & (!\IR|output\(3) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(3),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector14~3_combout\);

-- Location: FF_X6_Y55_N5
\Reg2|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X7_Y54_N28
\Reg4|output[0]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[0]~_Duplicate_1feeder_combout\ = \Mux|output[0]~25_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[0]~25_combout\,
	combout => \Reg4|output[0]~_Duplicate_1feeder_combout\);

-- Location: IOIBUF_X0_Y59_N15
\DIN[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(12),
	o => \DIN[12]~input_o\);

-- Location: FF_X0_Y59_N17
\IR|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[12]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(5));

-- Location: LCCOMB_X1_Y54_N26
\Ctrl|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector12~0_combout\ = (!\IR|output\(3) & (\IR|output\(5) & (!\IR|output\(4) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(3),
	datab => \IR|output\(5),
	datac => \IR|output\(4),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector12~0_combout\);

-- Location: FF_X7_Y54_N29
\Reg4|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[0]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y53_N26
\Ctrl|Selector13~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector13~3_combout\ = (!\IR|output\(5) & (\IR|output\(4) & (\IR|output\(3) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(3),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector13~3_combout\);

-- Location: FF_X6_Y54_N3
\Reg3|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[0]~_Duplicate_1_q\);

-- Location: IOIBUF_X0_Y48_N1
\DIN[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(7),
	o => \DIN[7]~input_o\);

-- Location: FF_X0_Y48_N3
\IR|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \DIN[7]~input_o\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|ALT_INV_state.A~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IR|output\(0));

-- Location: LCCOMB_X5_Y54_N8
\Ctrl|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector5~0_combout\ = (\IR|output\(0) & (\IR|output\(1) & !\IR|output\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \IR|output\(0),
	datac => \IR|output\(1),
	datad => \IR|output\(2),
	combout => \Ctrl|Selector5~0_combout\);

-- Location: LCCOMB_X3_Y55_N28
\Ctrl|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Equal0~0_combout\ = (!\IR|output\(7) & (!\IR|output\(6) & !\IR|output\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(7),
	datac => \IR|output\(6),
	datad => \IR|output\(8),
	combout => \Ctrl|Equal0~0_combout\);

-- Location: LCCOMB_X4_Y53_N8
\Ctrl|Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector5~1_combout\ = (\Ctrl|Selector13~2_combout\ & ((\Ctrl|R_out~1_combout\) # ((\Ctrl|Equal0~0_combout\ & \Ctrl|Selector5~0_combout\)))) # (!\Ctrl|Selector13~2_combout\ & (((\Ctrl|Equal0~0_combout\ & \Ctrl|Selector5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector13~2_combout\,
	datab => \Ctrl|R_out~1_combout\,
	datac => \Ctrl|Equal0~0_combout\,
	datad => \Ctrl|Selector5~0_combout\,
	combout => \Ctrl|Selector5~1_combout\);

-- Location: LCCOMB_X5_Y54_N26
\Mux|output[15]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~5_combout\ = (\Ctrl|state.C~q\ & (!\Ctrl|Selector5~0_combout\ & ((!\Ctrl|state.B~q\) # (!\Ctrl|Selector5~1_combout\)))) # (!\Ctrl|state.C~q\ & (((!\Ctrl|state.B~q\) # (!\Ctrl|Selector5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.C~q\,
	datab => \Ctrl|Selector5~0_combout\,
	datac => \Ctrl|Selector5~1_combout\,
	datad => \Ctrl|state.B~q\,
	combout => \Mux|output[15]~5_combout\);

-- Location: LCCOMB_X5_Y54_N10
\Mux|output[15]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~7_combout\ = (\Ctrl|Selector11~0_combout\ & ((\Ctrl|Selector7~0_combout\) # ((\IR|output\(2) & \Ctrl|Selector7~2_combout\)))) # (!\Ctrl|Selector11~0_combout\ & (\IR|output\(2) & (\Ctrl|Selector7~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector11~0_combout\,
	datab => \IR|output\(2),
	datac => \Ctrl|Selector7~2_combout\,
	datad => \Ctrl|Selector7~0_combout\,
	combout => \Mux|output[15]~7_combout\);

-- Location: LCCOMB_X5_Y54_N20
\Mux|output[15]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~8_combout\ = ((!\Ctrl|Selector4~2_combout\ & \Mux|output[15]~7_combout\)) # (!\Mux|output[15]~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector4~2_combout\,
	datac => \Mux|output[15]~5_combout\,
	datad => \Mux|output[15]~7_combout\,
	combout => \Mux|output[15]~8_combout\);

-- Location: LCCOMB_X2_Y53_N22
\Ctrl|Selector11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector11~1_combout\ = (!\IR|output\(4) & (\IR|output\(5) & (\IR|output\(3) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(4),
	datab => \IR|output\(5),
	datac => \IR|output\(3),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector11~1_combout\);

-- Location: FF_X6_Y54_N17
\Reg5|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[0]~_Duplicate_1_q\);

-- Location: IOIBUF_X0_Y67_N15
\DIN[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(0),
	o => \DIN[0]~input_o\);

-- Location: LCCOMB_X3_Y55_N24
\RegA|output[0]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegA|output[0]~_Duplicate_1feeder_combout\ = \Mux|output[0]~25_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[0]~25_combout\,
	combout => \RegA|output[0]~_Duplicate_1feeder_combout\);

-- Location: FF_X3_Y55_N25
\RegA|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \RegA|output[0]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y55_N8
\Adder|Gen_Adder:0:AdderX|sum~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:0:AdderX|sum~0_combout\ = \RegA|output[0]~_Duplicate_1_q\ $ (\Mux|output[0]~25_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output[0]~_Duplicate_1_q\,
	datad => \Mux|output[0]~25_combout\,
	combout => \Adder|Gen_Adder:0:AdderX|sum~0_combout\);

-- Location: FF_X5_Y54_N15
\RegG|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Adder|Gen_Adder:0:AdderX|sum~0_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y55_N30
\Mux|output[15]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~15_combout\ = (!\IR|output\(7) & \IR|output\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(7),
	datac => \IR|output\(6),
	combout => \Mux|output[15]~15_combout\);

-- Location: LCCOMB_X4_Y53_N14
\Mux|output[15]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~16_combout\ = (\IR|output\(5) & (\IR|output\(4) & (!\IR|output\(3) & \IR|output\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(3),
	datad => \IR|output\(7),
	combout => \Mux|output[15]~16_combout\);

-- Location: LCCOMB_X4_Y54_N30
\Mux|output[15]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~17_combout\ = (!\IR|output\(8) & (\Ctrl|state.B~q\ & ((\Mux|output[15]~15_combout\) # (\Mux|output[15]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(8),
	datab => \Mux|output[15]~15_combout\,
	datac => \Mux|output[15]~16_combout\,
	datad => \Ctrl|state.B~q\,
	combout => \Mux|output[15]~17_combout\);

-- Location: LCCOMB_X4_Y54_N2
\Mux|output[15]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~13_combout\ = (!\IR|output\(8) & (!\IR|output\(6) & (!\IR|output\(7) & \Ctrl|state.B~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(8),
	datab => \IR|output\(6),
	datac => \IR|output\(7),
	datad => \Ctrl|state.B~q\,
	combout => \Mux|output[15]~13_combout\);

-- Location: LCCOMB_X4_Y54_N24
\Mux|output[15]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~14_combout\ = (\Ctrl|Selector4~0_combout\ & (\IR|output\(1) & ((\Ctrl|state.C~q\) # (\Mux|output[15]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector4~0_combout\,
	datab => \IR|output\(1),
	datac => \Ctrl|state.C~q\,
	datad => \Mux|output[15]~13_combout\,
	combout => \Mux|output[15]~14_combout\);

-- Location: LCCOMB_X4_Y54_N0
\Mux|output[15]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~19_combout\ = (\Mux|output[15]~17_combout\) # (\Mux|output[15]~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[15]~17_combout\,
	datad => \Mux|output[15]~14_combout\,
	combout => \Mux|output[15]~19_combout\);

-- Location: LCCOMB_X4_Y53_N22
\Ctrl|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector9~0_combout\ = (\IR|output\(5) & (\IR|output\(4) & (\IR|output\(3) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(3),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector9~0_combout\);

-- Location: FF_X4_Y54_N15
\Reg7|output[0]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[0]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y54_N18
\Mux|output[15]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~10_combout\ = (\Ctrl|state.B~q\ & (((\IR|output\(5) & \IR|output\(4))) # (!\IR|output\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(7),
	datad => \Ctrl|state.B~q\,
	combout => \Mux|output[15]~10_combout\);

-- Location: LCCOMB_X4_Y54_N20
\Mux|output[15]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~11_combout\ = (!\IR|output\(8) & (\Mux|output[15]~10_combout\ & ((\IR|output\(7)) # (!\IR|output\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(8),
	datab => \IR|output\(6),
	datac => \IR|output\(7),
	datad => \Mux|output[15]~10_combout\,
	combout => \Mux|output[15]~11_combout\);

-- Location: LCCOMB_X4_Y54_N28
\Mux|output[15]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~12_combout\ = (\Mux|output[15]~9_combout\ & (((!\Ctrl|state.C~q\ & !\Mux|output[15]~11_combout\)))) # (!\Mux|output[15]~9_combout\ & (((!\Mux|output[15]~11_combout\)) # (!\IR|output\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~9_combout\,
	datab => \IR|output\(7),
	datac => \Ctrl|state.C~q\,
	datad => \Mux|output[15]~11_combout\,
	combout => \Mux|output[15]~12_combout\);

-- Location: LCCOMB_X4_Y54_N14
\Mux|output[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[0]~20_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[0]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[0]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[0]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[0]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[0]~20_combout\);

-- Location: LCCOMB_X5_Y54_N14
\Mux|output[0]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[0]~21_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[0]~20_combout\ & (\DIN[0]~input_o\)) # (!\Mux|output[0]~20_combout\ & ((\RegG|output[0]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[0]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~18_combout\,
	datab => \DIN[0]~input_o\,
	datac => \RegG|output[0]~_Duplicate_1_q\,
	datad => \Mux|output[0]~20_combout\,
	combout => \Mux|output[0]~21_combout\);

-- Location: LCCOMB_X6_Y54_N16
\Mux|output[0]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[0]~22_combout\ = (\Mux|output[15]~6_combout\ & (\Mux|output[15]~8_combout\)) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & (\Reg5|output[0]~_Duplicate_1_q\)) # (!\Mux|output[15]~8_combout\ & ((\Mux|output[0]~21_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg5|output[0]~_Duplicate_1_q\,
	datad => \Mux|output[0]~21_combout\,
	combout => \Mux|output[0]~22_combout\);

-- Location: LCCOMB_X6_Y54_N2
\Mux|output[0]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[0]~23_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[0]~22_combout\ & ((\Reg3|output[0]~_Duplicate_1_q\))) # (!\Mux|output[0]~22_combout\ & (\Reg4|output[0]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & 
-- (((\Mux|output[0]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Reg4|output[0]~_Duplicate_1_q\,
	datac => \Reg3|output[0]~_Duplicate_1_q\,
	datad => \Mux|output[0]~22_combout\,
	combout => \Mux|output[0]~23_combout\);

-- Location: LCCOMB_X6_Y55_N4
\Mux|output[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[0]~24_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[15]~0_combout\) # ((\Reg2|output[0]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & (!\Mux|output[15]~0_combout\ & ((\Mux|output[0]~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg2|output[0]~_Duplicate_1_q\,
	datad => \Mux|output[0]~23_combout\,
	combout => \Mux|output[0]~24_combout\);

-- Location: LCCOMB_X5_Y55_N0
\Mux|output[0]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[0]~25_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[0]~24_combout\ & (\Reg0|output[0]~_Duplicate_1_q\)) # (!\Mux|output[0]~24_combout\ & ((\Reg1|output[0]~_Duplicate_1_q\))))) # (!\Mux|output[15]~0_combout\ & 
-- (((\Mux|output[0]~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg0|output[0]~_Duplicate_1_q\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg1|output[0]~_Duplicate_1_q\,
	datad => \Mux|output[0]~24_combout\,
	combout => \Mux|output[0]~25_combout\);

-- Location: LCCOMB_X4_Y53_N28
\Mux|output[15]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~1_combout\ = (\Ctrl|Selector14~2_combout\ & (!\IR|output\(5) & (!\Ctrl|Equal0~0_combout\ & \Ctrl|R_out~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector14~2_combout\,
	datab => \IR|output\(5),
	datac => \Ctrl|Equal0~0_combout\,
	datad => \Ctrl|R_out~1_combout\,
	combout => \Mux|output[15]~1_combout\);

-- Location: LCCOMB_X5_Y55_N14
\Mux|output[15]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~2_combout\ = (\Ctrl|state.B~q\ & ((\Ctrl|Selector8~2_combout\) # ((\Mux|output[15]~1_combout\ & !\Ctrl|Selector7~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector8~2_combout\,
	datab => \Mux|output[15]~1_combout\,
	datac => \Ctrl|state.B~q\,
	datad => \Ctrl|Selector7~3_combout\,
	combout => \Mux|output[15]~2_combout\);

-- Location: LCCOMB_X5_Y55_N12
\Mux|output[15]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~3_combout\ = (\IR|output\(1) & (!\Ctrl|Selector7~3_combout\ & ((\Ctrl|state.C~q\) # (\Ctrl|Selector7~1_combout\)))) # (!\IR|output\(1) & (\Ctrl|state.C~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|state.C~q\,
	datab => \Ctrl|Selector7~1_combout\,
	datac => \IR|output\(1),
	datad => \Ctrl|Selector7~3_combout\,
	combout => \Mux|output[15]~3_combout\);

-- Location: LCCOMB_X5_Y55_N26
\Mux|output[15]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~4_combout\ = (\Mux|output[15]~2_combout\) # ((!\IR|output\(0) & (!\IR|output\(2) & \Mux|output[15]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(0),
	datab => \IR|output\(2),
	datac => \Mux|output[15]~2_combout\,
	datad => \Mux|output[15]~3_combout\,
	combout => \Mux|output[15]~4_combout\);

-- Location: LCCOMB_X4_Y55_N0
\Reg2|output[1]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[1]~_Duplicate_1feeder_combout\ = \Mux|output[1]~31_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[1]~31_combout\,
	combout => \Reg2|output[1]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N1
\Reg2|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[1]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[1]~_Duplicate_1_q\);

-- Location: FF_X4_Y55_N31
\Reg0|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[1]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N5
\Reg1|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[1]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N3
\Reg3|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[1]~_Duplicate_1_q\);

-- Location: FF_X5_Y54_N3
\Reg4|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[1]~_Duplicate_1_q\);

-- Location: IOIBUF_X0_Y50_N15
\DIN[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(1),
	o => \DIN[1]~input_o\);

-- Location: FF_X2_Y55_N23
\RegA|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[1]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y55_N18
\Ctrl|AddSub~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|AddSub~0_combout\ = (\IR|output\(7) & (\Ctrl|state.C~q\ & (\IR|output\(6) & !\IR|output\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(7),
	datab => \Ctrl|state.C~q\,
	datac => \IR|output\(6),
	datad => \IR|output\(8),
	combout => \Ctrl|AddSub~0_combout\);

-- Location: LCCOMB_X3_Y55_N4
\Adder|Gen_Adder:0:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:0:AdderX|c_out~0_combout\ = (\RegA|output[0]~_Duplicate_1_q\ & (\Ctrl|AddSub~0_combout\ $ (\Mux|output[0]~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output[0]~_Duplicate_1_q\,
	datac => \Ctrl|AddSub~0_combout\,
	datad => \Mux|output[0]~25_combout\,
	combout => \Adder|Gen_Adder:0:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X3_Y55_N2
\Adder|Gen_Adder:0:AdderX|c_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:0:AdderX|c_out~1_combout\ = (\Ctrl|AddSub~0_combout\ & (\RegA|output[0]~_Duplicate_1_q\ $ (!\Mux|output[0]~25_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegA|output[0]~_Duplicate_1_q\,
	datac => \Ctrl|AddSub~0_combout\,
	datad => \Mux|output[0]~25_combout\,
	combout => \Adder|Gen_Adder:0:AdderX|c_out~1_combout\);

-- Location: LCCOMB_X3_Y55_N0
\Adder|Gen_Adder:1:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:1:AdderX|sum~combout\ = \Adder|xors\(1) $ (\RegA|output[1]~_Duplicate_1_q\ $ (((\Adder|Gen_Adder:0:AdderX|c_out~0_combout\) # (\Adder|Gen_Adder:0:AdderX|c_out~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder|xors\(1),
	datab => \RegA|output[1]~_Duplicate_1_q\,
	datac => \Adder|Gen_Adder:0:AdderX|c_out~0_combout\,
	datad => \Adder|Gen_Adder:0:AdderX|c_out~1_combout\,
	combout => \Adder|Gen_Adder:1:AdderX|sum~combout\);

-- Location: FF_X5_Y54_N25
\RegG|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Adder|Gen_Adder:1:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[1]~_Duplicate_1_q\);

-- Location: FF_X4_Y54_N23
\Reg7|output[1]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[1]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y54_N22
\Mux|output[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[1]~26_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[1]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[1]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[1]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[1]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[1]~26_combout\);

-- Location: LCCOMB_X5_Y54_N24
\Mux|output[1]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[1]~27_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[1]~26_combout\ & (\DIN[1]~input_o\)) # (!\Mux|output[1]~26_combout\ & ((\RegG|output[1]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[1]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~18_combout\,
	datab => \DIN[1]~input_o\,
	datac => \RegG|output[1]~_Duplicate_1_q\,
	datad => \Mux|output[1]~26_combout\,
	combout => \Mux|output[1]~27_combout\);

-- Location: LCCOMB_X5_Y54_N2
\Mux|output[1]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[1]~28_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\) # ((\Reg4|output[1]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & (!\Mux|output[15]~8_combout\ & ((\Mux|output[1]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg4|output[1]~_Duplicate_1_q\,
	datad => \Mux|output[1]~27_combout\,
	combout => \Mux|output[1]~28_combout\);

-- Location: LCCOMB_X5_Y55_N2
\Mux|output[1]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[1]~29_combout\ = (\Mux|output[15]~8_combout\ & ((\Mux|output[1]~28_combout\ & ((\Reg3|output[1]~_Duplicate_1_q\))) # (!\Mux|output[1]~28_combout\ & (\Reg5|output[1]~_Duplicate_1_q\)))) # (!\Mux|output[15]~8_combout\ & 
-- (((\Mux|output[1]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg5|output[1]~_Duplicate_1_q\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg3|output[1]~_Duplicate_1_q\,
	datad => \Mux|output[1]~28_combout\,
	combout => \Mux|output[1]~29_combout\);

-- Location: LCCOMB_X5_Y55_N4
\Mux|output[1]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[1]~30_combout\ = (\Mux|output[15]~4_combout\ & (\Mux|output[15]~0_combout\)) # (!\Mux|output[15]~4_combout\ & ((\Mux|output[15]~0_combout\ & (\Reg1|output[1]~_Duplicate_1_q\)) # (!\Mux|output[15]~0_combout\ & ((\Mux|output[1]~29_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg1|output[1]~_Duplicate_1_q\,
	datad => \Mux|output[1]~29_combout\,
	combout => \Mux|output[1]~30_combout\);

-- Location: LCCOMB_X4_Y55_N30
\Mux|output[1]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[1]~31_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[1]~30_combout\ & ((\Reg0|output[1]~_Duplicate_1_q\))) # (!\Mux|output[1]~30_combout\ & (\Reg2|output[1]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & 
-- (((\Mux|output[1]~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Reg2|output[1]~_Duplicate_1_q\,
	datac => \Reg0|output[1]~_Duplicate_1_q\,
	datad => \Mux|output[1]~30_combout\,
	combout => \Mux|output[1]~31_combout\);

-- Location: LCCOMB_X7_Y55_N4
\Reg1|output[2]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg1|output[2]~_Duplicate_1feeder_combout\ = \Mux|output[2]~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[2]~37_combout\,
	combout => \Reg1|output[2]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y55_N5
\Reg1|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg1|output[2]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[2]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N23
\Reg0|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[2]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N13
\Reg2|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[2]~_Duplicate_1_q\);

-- Location: LCCOMB_X7_Y54_N18
\Reg4|output[2]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[2]~_Duplicate_1feeder_combout\ = \Mux|output[2]~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[2]~37_combout\,
	combout => \Reg4|output[2]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y54_N19
\Reg4|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[2]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[2]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N7
\Reg3|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[2]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N13
\Reg5|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[2]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y54_N8
\Mux|output[15]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~18_combout\ = (\Mux|output[15]~12_combout\ & ((\Mux|output[15]~17_combout\) # ((\Mux|output[15]~14_combout\) # (\Ctrl|state.D~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~17_combout\,
	datab => \Mux|output[15]~14_combout\,
	datac => \Ctrl|state.D~q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[15]~18_combout\);

-- Location: LCCOMB_X2_Y55_N14
\Adder|xors[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|xors\(1) = \Ctrl|AddSub~0_combout\ $ (\Mux|output[1]~31_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Ctrl|AddSub~0_combout\,
	datad => \Mux|output[1]~31_combout\,
	combout => \Adder|xors\(1));

-- Location: LCCOMB_X2_Y55_N22
\Adder|Gen_Adder:1:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:1:AdderX|c_out~0_combout\ = (\Adder|xors\(1) & ((\Adder|Gen_Adder:0:AdderX|c_out~1_combout\) # ((\RegA|output[1]~_Duplicate_1_q\) # (\Adder|Gen_Adder:0:AdderX|c_out~0_combout\)))) # (!\Adder|xors\(1) & (\RegA|output[1]~_Duplicate_1_q\ & 
-- ((\Adder|Gen_Adder:0:AdderX|c_out~1_combout\) # (\Adder|Gen_Adder:0:AdderX|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder|Gen_Adder:0:AdderX|c_out~1_combout\,
	datab => \Adder|xors\(1),
	datac => \RegA|output[1]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:0:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:1:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X3_Y55_N22
\Adder|Gen_Adder:2:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:2:AdderX|sum~combout\ = \RegA|output[2]~_Duplicate_1_q\ $ (\Ctrl|AddSub~0_combout\ $ (\Adder|Gen_Adder:1:AdderX|c_out~0_combout\ $ (\Mux|output[2]~37_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[2]~_Duplicate_1_q\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \Adder|Gen_Adder:1:AdderX|c_out~0_combout\,
	datad => \Mux|output[2]~37_combout\,
	combout => \Adder|Gen_Adder:2:AdderX|sum~combout\);

-- Location: FF_X3_Y54_N25
\RegG|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Adder|Gen_Adder:2:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[2]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N19
\Reg7|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[2]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N18
\Mux|output[2]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[2]~32_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[2]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[2]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[2]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[2]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[2]~32_combout\);

-- Location: LCCOMB_X3_Y54_N24
\Mux|output[2]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[2]~33_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[2]~32_combout\ & (\DIN[2]~input_o\)) # (!\Mux|output[2]~32_combout\ & ((\RegG|output[2]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[2]~32_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIN[2]~input_o\,
	datab => \Mux|output[15]~18_combout\,
	datac => \RegG|output[2]~_Duplicate_1_q\,
	datad => \Mux|output[2]~32_combout\,
	combout => \Mux|output[2]~33_combout\);

-- Location: LCCOMB_X6_Y54_N12
\Mux|output[2]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[2]~34_combout\ = (\Mux|output[15]~6_combout\ & (\Mux|output[15]~8_combout\)) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & (\Reg5|output[2]~_Duplicate_1_q\)) # (!\Mux|output[15]~8_combout\ & ((\Mux|output[2]~33_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg5|output[2]~_Duplicate_1_q\,
	datad => \Mux|output[2]~33_combout\,
	combout => \Mux|output[2]~34_combout\);

-- Location: LCCOMB_X6_Y54_N6
\Mux|output[2]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[2]~35_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[2]~34_combout\ & ((\Reg3|output[2]~_Duplicate_1_q\))) # (!\Mux|output[2]~34_combout\ & (\Reg4|output[2]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & 
-- (((\Mux|output[2]~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Reg4|output[2]~_Duplicate_1_q\,
	datac => \Reg3|output[2]~_Duplicate_1_q\,
	datad => \Mux|output[2]~34_combout\,
	combout => \Mux|output[2]~35_combout\);

-- Location: LCCOMB_X6_Y55_N12
\Mux|output[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[2]~36_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[15]~0_combout\) # ((\Reg2|output[2]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & (!\Mux|output[15]~0_combout\ & ((\Mux|output[2]~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg2|output[2]~_Duplicate_1_q\,
	datad => \Mux|output[2]~35_combout\,
	combout => \Mux|output[2]~36_combout\);

-- Location: LCCOMB_X6_Y55_N22
\Mux|output[2]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[2]~37_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[2]~36_combout\ & ((\Reg0|output[2]~_Duplicate_1_q\))) # (!\Mux|output[2]~36_combout\ & (\Reg1|output[2]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & 
-- (((\Mux|output[2]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg1|output[2]~_Duplicate_1_q\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg0|output[2]~_Duplicate_1_q\,
	datad => \Mux|output[2]~36_combout\,
	combout => \Mux|output[2]~37_combout\);

-- Location: LCCOMB_X4_Y55_N4
\Reg2|output[3]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[3]~_Duplicate_1feeder_combout\ = \Mux|output[3]~43_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[3]~43_combout\,
	combout => \Reg2|output[3]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N5
\Reg2|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[3]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[3]~_Duplicate_1_q\);

-- Location: FF_X4_Y55_N11
\Reg0|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[3]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N17
\Reg1|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[3]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N19
\Reg3|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[3]~_Duplicate_1_q\);

-- Location: FF_X5_Y54_N19
\Reg4|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[3]~_Duplicate_1_q\);

-- Location: IOIBUF_X0_Y66_N15
\DIN[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(3),
	o => \DIN[3]~input_o\);

-- Location: FF_X2_Y55_N25
\RegA|output[2]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[2]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y55_N24
\Adder|Gen_Adder:2:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:2:AdderX|c_out~0_combout\ = (\RegA|output[2]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:1:AdderX|c_out~0_combout\) # (\Mux|output[2]~37_combout\ $ (\Ctrl|AddSub~0_combout\)))) # (!\RegA|output[2]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:1:AdderX|c_out~0_combout\ & (\Mux|output[2]~37_combout\ $ (\Ctrl|AddSub~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[2]~37_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[2]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:1:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:2:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X3_Y55_N20
\Adder|Gen_Adder:3:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:3:AdderX|sum~combout\ = \RegA|output[3]~_Duplicate_1_q\ $ (\Ctrl|AddSub~0_combout\ $ (\Mux|output[3]~43_combout\ $ (\Adder|Gen_Adder:2:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[3]~_Duplicate_1_q\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \Mux|output[3]~43_combout\,
	datad => \Adder|Gen_Adder:2:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:3:AdderX|sum~combout\);

-- Location: FF_X5_Y54_N1
\RegG|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Adder|Gen_Adder:3:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[3]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N17
\Reg7|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[3]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N16
\Mux|output[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[3]~38_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[3]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[3]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[3]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[3]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[3]~38_combout\);

-- Location: LCCOMB_X5_Y54_N0
\Mux|output[3]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[3]~39_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[3]~38_combout\ & (\DIN[3]~input_o\)) # (!\Mux|output[3]~38_combout\ & ((\RegG|output[3]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[3]~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~18_combout\,
	datab => \DIN[3]~input_o\,
	datac => \RegG|output[3]~_Duplicate_1_q\,
	datad => \Mux|output[3]~38_combout\,
	combout => \Mux|output[3]~39_combout\);

-- Location: LCCOMB_X5_Y54_N18
\Mux|output[3]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[3]~40_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\) # ((\Reg4|output[3]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & (!\Mux|output[15]~8_combout\ & ((\Mux|output[3]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg4|output[3]~_Duplicate_1_q\,
	datad => \Mux|output[3]~39_combout\,
	combout => \Mux|output[3]~40_combout\);

-- Location: LCCOMB_X5_Y55_N18
\Mux|output[3]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[3]~41_combout\ = (\Mux|output[15]~8_combout\ & ((\Mux|output[3]~40_combout\ & ((\Reg3|output[3]~_Duplicate_1_q\))) # (!\Mux|output[3]~40_combout\ & (\Reg5|output[3]~_Duplicate_1_q\)))) # (!\Mux|output[15]~8_combout\ & 
-- (((\Mux|output[3]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg5|output[3]~_Duplicate_1_q\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg3|output[3]~_Duplicate_1_q\,
	datad => \Mux|output[3]~40_combout\,
	combout => \Mux|output[3]~41_combout\);

-- Location: LCCOMB_X5_Y55_N16
\Mux|output[3]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[3]~42_combout\ = (\Mux|output[15]~4_combout\ & (\Mux|output[15]~0_combout\)) # (!\Mux|output[15]~4_combout\ & ((\Mux|output[15]~0_combout\ & (\Reg1|output[3]~_Duplicate_1_q\)) # (!\Mux|output[15]~0_combout\ & ((\Mux|output[3]~41_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg1|output[3]~_Duplicate_1_q\,
	datad => \Mux|output[3]~41_combout\,
	combout => \Mux|output[3]~42_combout\);

-- Location: LCCOMB_X4_Y55_N10
\Mux|output[3]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[3]~43_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[3]~42_combout\ & ((\Reg0|output[3]~_Duplicate_1_q\))) # (!\Mux|output[3]~42_combout\ & (\Reg2|output[3]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & 
-- (((\Mux|output[3]~42_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Reg2|output[3]~_Duplicate_1_q\,
	datac => \Reg0|output[3]~_Duplicate_1_q\,
	datad => \Mux|output[3]~42_combout\,
	combout => \Mux|output[3]~43_combout\);

-- Location: LCCOMB_X7_Y55_N26
\Reg1|output[4]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg1|output[4]~_Duplicate_1feeder_combout\ = \Mux|output[4]~49_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[4]~49_combout\,
	combout => \Reg1|output[4]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y55_N27
\Reg1|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg1|output[4]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[4]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N11
\Reg0|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[4]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N25
\Reg2|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[4]~_Duplicate_1_q\);

-- Location: LCCOMB_X7_Y54_N12
\Reg4|output[4]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[4]~_Duplicate_1feeder_combout\ = \Mux|output[4]~49_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[4]~49_combout\,
	combout => \Reg4|output[4]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y54_N13
\Reg4|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[4]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[4]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N31
\Reg3|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[4]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N29
\Reg5|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[4]~_Duplicate_1_q\);

-- Location: IOIBUF_X0_Y66_N22
\DIN[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(4),
	o => \DIN[4]~input_o\);

-- Location: FF_X2_Y55_N1
\RegA|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[4]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N11
\RegA|output[3]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[3]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y55_N10
\Adder|Gen_Adder:3:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:3:AdderX|c_out~0_combout\ = (\RegA|output[3]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:2:AdderX|c_out~0_combout\) # (\Mux|output[3]~43_combout\ $ (\Ctrl|AddSub~0_combout\)))) # (!\RegA|output[3]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:2:AdderX|c_out~0_combout\ & (\Mux|output[3]~43_combout\ $ (\Ctrl|AddSub~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[3]~43_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[3]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:2:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:3:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X1_Y55_N22
\Adder|Gen_Adder:4:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:4:AdderX|sum~combout\ = \Mux|output[4]~49_combout\ $ (\Ctrl|AddSub~0_combout\ $ (\RegA|output[4]~_Duplicate_1_q\ $ (\Adder|Gen_Adder:3:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[4]~49_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[4]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:3:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:4:AdderX|sum~combout\);

-- Location: FF_X5_Y54_N31
\RegG|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Adder|Gen_Adder:4:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[4]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N11
\Reg7|output[4]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[4]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N10
\Mux|output[4]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[4]~44_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[4]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[4]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[4]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[4]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[4]~44_combout\);

-- Location: LCCOMB_X5_Y54_N30
\Mux|output[4]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[4]~45_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[4]~44_combout\ & (\DIN[4]~input_o\)) # (!\Mux|output[4]~44_combout\ & ((\RegG|output[4]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[4]~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~18_combout\,
	datab => \DIN[4]~input_o\,
	datac => \RegG|output[4]~_Duplicate_1_q\,
	datad => \Mux|output[4]~44_combout\,
	combout => \Mux|output[4]~45_combout\);

-- Location: LCCOMB_X6_Y54_N28
\Mux|output[4]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[4]~46_combout\ = (\Mux|output[15]~6_combout\ & (\Mux|output[15]~8_combout\)) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & (\Reg5|output[4]~_Duplicate_1_q\)) # (!\Mux|output[15]~8_combout\ & ((\Mux|output[4]~45_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg5|output[4]~_Duplicate_1_q\,
	datad => \Mux|output[4]~45_combout\,
	combout => \Mux|output[4]~46_combout\);

-- Location: LCCOMB_X6_Y54_N30
\Mux|output[4]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[4]~47_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[4]~46_combout\ & ((\Reg3|output[4]~_Duplicate_1_q\))) # (!\Mux|output[4]~46_combout\ & (\Reg4|output[4]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & 
-- (((\Mux|output[4]~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Reg4|output[4]~_Duplicate_1_q\,
	datac => \Reg3|output[4]~_Duplicate_1_q\,
	datad => \Mux|output[4]~46_combout\,
	combout => \Mux|output[4]~47_combout\);

-- Location: LCCOMB_X6_Y55_N24
\Mux|output[4]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[4]~48_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[15]~0_combout\) # ((\Reg2|output[4]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & (!\Mux|output[15]~0_combout\ & ((\Mux|output[4]~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg2|output[4]~_Duplicate_1_q\,
	datad => \Mux|output[4]~47_combout\,
	combout => \Mux|output[4]~48_combout\);

-- Location: LCCOMB_X6_Y55_N10
\Mux|output[4]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[4]~49_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[4]~48_combout\ & ((\Reg0|output[4]~_Duplicate_1_q\))) # (!\Mux|output[4]~48_combout\ & (\Reg1|output[4]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & 
-- (((\Mux|output[4]~48_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg1|output[4]~_Duplicate_1_q\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg0|output[4]~_Duplicate_1_q\,
	datad => \Mux|output[4]~48_combout\,
	combout => \Mux|output[4]~49_combout\);

-- Location: LCCOMB_X4_Y55_N12
\Reg2|output[5]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[5]~_Duplicate_1feeder_combout\ = \Mux|output[5]~55_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[5]~55_combout\,
	combout => \Reg2|output[5]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N13
\Reg2|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[5]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[5]~_Duplicate_1_q\);

-- Location: FF_X4_Y55_N7
\Reg0|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[5]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N25
\Reg1|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[5]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N7
\Reg3|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[5]~_Duplicate_1_q\);

-- Location: FF_X5_Y54_N17
\Reg4|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[5]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y55_N0
\Adder|Gen_Adder:4:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:4:AdderX|c_out~0_combout\ = (\RegA|output[4]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:3:AdderX|c_out~0_combout\) # (\Ctrl|AddSub~0_combout\ $ (\Mux|output[4]~49_combout\)))) # (!\RegA|output[4]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:3:AdderX|c_out~0_combout\ & (\Ctrl|AddSub~0_combout\ $ (\Mux|output[4]~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \Mux|output[4]~49_combout\,
	datac => \RegA|output[4]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:3:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:4:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X1_Y55_N16
\Adder|Gen_Adder:5:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:5:AdderX|sum~combout\ = \RegA|output[5]~_Duplicate_1_q\ $ (\Ctrl|AddSub~0_combout\ $ (\Adder|Gen_Adder:4:AdderX|c_out~0_combout\ $ (\Mux|output[5]~55_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[5]~_Duplicate_1_q\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \Adder|Gen_Adder:4:AdderX|c_out~0_combout\,
	datad => \Mux|output[5]~55_combout\,
	combout => \Adder|Gen_Adder:5:AdderX|sum~combout\);

-- Location: FF_X1_Y55_N17
\RegG|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:5:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[5]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N5
\Reg7|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[5]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N4
\Mux|output[5]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[5]~50_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[5]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[5]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[5]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[5]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[5]~50_combout\);

-- Location: LCCOMB_X5_Y54_N6
\Mux|output[5]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[5]~51_combout\ = (\Mux|output[5]~50_combout\ & ((\DIN[5]~input_o\) # ((!\Mux|output[15]~18_combout\)))) # (!\Mux|output[5]~50_combout\ & (((\RegG|output[5]~_Duplicate_1_q\ & \Mux|output[15]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIN[5]~input_o\,
	datab => \RegG|output[5]~_Duplicate_1_q\,
	datac => \Mux|output[5]~50_combout\,
	datad => \Mux|output[15]~18_combout\,
	combout => \Mux|output[5]~51_combout\);

-- Location: LCCOMB_X5_Y54_N16
\Mux|output[5]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[5]~52_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\) # ((\Reg4|output[5]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & (!\Mux|output[15]~8_combout\ & ((\Mux|output[5]~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg4|output[5]~_Duplicate_1_q\,
	datad => \Mux|output[5]~51_combout\,
	combout => \Mux|output[5]~52_combout\);

-- Location: LCCOMB_X5_Y55_N6
\Mux|output[5]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[5]~53_combout\ = (\Mux|output[15]~8_combout\ & ((\Mux|output[5]~52_combout\ & ((\Reg3|output[5]~_Duplicate_1_q\))) # (!\Mux|output[5]~52_combout\ & (\Reg5|output[5]~_Duplicate_1_q\)))) # (!\Mux|output[15]~8_combout\ & 
-- (((\Mux|output[5]~52_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg5|output[5]~_Duplicate_1_q\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg3|output[5]~_Duplicate_1_q\,
	datad => \Mux|output[5]~52_combout\,
	combout => \Mux|output[5]~53_combout\);

-- Location: LCCOMB_X5_Y55_N24
\Mux|output[5]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[5]~54_combout\ = (\Mux|output[15]~4_combout\ & (\Mux|output[15]~0_combout\)) # (!\Mux|output[15]~4_combout\ & ((\Mux|output[15]~0_combout\ & (\Reg1|output[5]~_Duplicate_1_q\)) # (!\Mux|output[15]~0_combout\ & ((\Mux|output[5]~53_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg1|output[5]~_Duplicate_1_q\,
	datad => \Mux|output[5]~53_combout\,
	combout => \Mux|output[5]~54_combout\);

-- Location: LCCOMB_X4_Y55_N6
\Mux|output[5]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[5]~55_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[5]~54_combout\ & ((\Reg0|output[5]~_Duplicate_1_q\))) # (!\Mux|output[5]~54_combout\ & (\Reg2|output[5]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & 
-- (((\Mux|output[5]~54_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Reg2|output[5]~_Duplicate_1_q\,
	datac => \Reg0|output[5]~_Duplicate_1_q\,
	datad => \Mux|output[5]~54_combout\,
	combout => \Mux|output[5]~55_combout\);

-- Location: LCCOMB_X7_Y55_N28
\Reg1|output[6]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg1|output[6]~_Duplicate_1feeder_combout\ = \Mux|output[6]~61_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[6]~61_combout\,
	combout => \Reg1|output[6]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y55_N29
\Reg1|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg1|output[6]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[6]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N7
\Reg0|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[6]~_Duplicate_1_q\);

-- Location: LCCOMB_X7_Y54_N6
\Reg4|output[6]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[6]~_Duplicate_1feeder_combout\ = \Mux|output[6]~61_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[6]~61_combout\,
	combout => \Reg4|output[6]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y54_N7
\Reg4|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[6]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[6]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N11
\Reg3|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[6]~_Duplicate_1_q\);

-- Location: IOIBUF_X0_Y50_N22
\DIN[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DIN(6),
	o => \DIN[6]~input_o\);

-- Location: FF_X3_Y54_N3
\Reg7|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[6]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N2
\Mux|output[6]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[6]~56_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[6]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[6]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[6]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[6]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[6]~56_combout\);

-- Location: LCCOMB_X3_Y54_N20
\Mux|output[6]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[6]~57_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[6]~56_combout\ & ((\DIN[6]~input_o\))) # (!\Mux|output[6]~56_combout\ & (\RegG|output[6]~_Duplicate_1_q\)))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[6]~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegG|output[6]~_Duplicate_1_q\,
	datab => \DIN[6]~input_o\,
	datac => \Mux|output[15]~18_combout\,
	datad => \Mux|output[6]~56_combout\,
	combout => \Mux|output[6]~57_combout\);

-- Location: FF_X6_Y54_N25
\Reg5|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[6]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y54_N24
\Mux|output[6]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[6]~58_combout\ = (\Mux|output[15]~6_combout\ & (((\Mux|output[15]~8_combout\)))) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & ((\Reg5|output[6]~_Duplicate_1_q\))) # (!\Mux|output[15]~8_combout\ & 
-- (\Mux|output[6]~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[6]~57_combout\,
	datac => \Reg5|output[6]~_Duplicate_1_q\,
	datad => \Mux|output[15]~8_combout\,
	combout => \Mux|output[6]~58_combout\);

-- Location: LCCOMB_X6_Y54_N10
\Mux|output[6]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[6]~59_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[6]~58_combout\ & ((\Reg3|output[6]~_Duplicate_1_q\))) # (!\Mux|output[6]~58_combout\ & (\Reg4|output[6]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & 
-- (((\Mux|output[6]~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Reg4|output[6]~_Duplicate_1_q\,
	datac => \Reg3|output[6]~_Duplicate_1_q\,
	datad => \Mux|output[6]~58_combout\,
	combout => \Mux|output[6]~59_combout\);

-- Location: FF_X6_Y55_N21
\Reg2|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[6]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y55_N20
\Mux|output[6]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[6]~60_combout\ = (\Mux|output[15]~4_combout\ & (((\Reg2|output[6]~_Duplicate_1_q\) # (\Mux|output[15]~0_combout\)))) # (!\Mux|output[15]~4_combout\ & (\Mux|output[6]~59_combout\ & ((!\Mux|output[15]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[6]~59_combout\,
	datac => \Reg2|output[6]~_Duplicate_1_q\,
	datad => \Mux|output[15]~0_combout\,
	combout => \Mux|output[6]~60_combout\);

-- Location: LCCOMB_X6_Y55_N6
\Mux|output[6]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[6]~61_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[6]~60_combout\ & ((\Reg0|output[6]~_Duplicate_1_q\))) # (!\Mux|output[6]~60_combout\ & (\Reg1|output[6]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & 
-- (((\Mux|output[6]~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg1|output[6]~_Duplicate_1_q\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg0|output[6]~_Duplicate_1_q\,
	datad => \Mux|output[6]~60_combout\,
	combout => \Mux|output[6]~61_combout\);

-- Location: LCCOMB_X4_Y55_N16
\Reg2|output[7]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[7]~_Duplicate_1feeder_combout\ = \Mux|output[7]~67_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[7]~67_combout\,
	combout => \Reg2|output[7]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N17
\Reg2|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[7]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[7]~_Duplicate_1_q\);

-- Location: FF_X4_Y55_N15
\Reg0|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[7]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N29
\Reg1|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[7]~_Duplicate_1_q\);

-- Location: FF_X5_Y55_N11
\Reg3|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[7]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y54_N4
\Reg5|output[7]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[7]~_Duplicate_1feeder_combout\ = \Mux|output[7]~67_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[7]~67_combout\,
	combout => \Reg5|output[7]~_Duplicate_1feeder_combout\);

-- Location: FF_X2_Y54_N5
\Reg5|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[7]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[7]~_Duplicate_1_q\);

-- Location: LCCOMB_X5_Y55_N10
\Mux|output[7]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[7]~65_combout\ = (\Mux|output[7]~64_combout\ & (((\Reg3|output[7]~_Duplicate_1_q\)) # (!\Mux|output[15]~8_combout\))) # (!\Mux|output[7]~64_combout\ & (\Mux|output[15]~8_combout\ & ((\Reg5|output[7]~_Duplicate_1_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[7]~64_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg3|output[7]~_Duplicate_1_q\,
	datad => \Reg5|output[7]~_Duplicate_1_q\,
	combout => \Mux|output[7]~65_combout\);

-- Location: LCCOMB_X5_Y55_N28
\Mux|output[7]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[7]~66_combout\ = (\Mux|output[15]~4_combout\ & (\Mux|output[15]~0_combout\)) # (!\Mux|output[15]~4_combout\ & ((\Mux|output[15]~0_combout\ & (\Reg1|output[7]~_Duplicate_1_q\)) # (!\Mux|output[15]~0_combout\ & ((\Mux|output[7]~65_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg1|output[7]~_Duplicate_1_q\,
	datad => \Mux|output[7]~65_combout\,
	combout => \Mux|output[7]~66_combout\);

-- Location: LCCOMB_X4_Y55_N14
\Mux|output[7]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[7]~67_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[7]~66_combout\ & ((\Reg0|output[7]~_Duplicate_1_q\))) # (!\Mux|output[7]~66_combout\ & (\Reg2|output[7]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & 
-- (((\Mux|output[7]~66_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Reg2|output[7]~_Duplicate_1_q\,
	datac => \Reg0|output[7]~_Duplicate_1_q\,
	datad => \Mux|output[7]~66_combout\,
	combout => \Mux|output[7]~67_combout\);

-- Location: LCCOMB_X7_Y55_N18
\Reg1|output[8]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg1|output[8]~_Duplicate_1feeder_combout\ = \Mux|output[8]~73_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[8]~73_combout\,
	combout => \Reg1|output[8]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y55_N19
\Reg1|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg1|output[8]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[8]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N15
\Reg0|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[8]~_Duplicate_1_q\);

-- Location: LCCOMB_X7_Y54_N8
\Reg4|output[8]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[8]~_Duplicate_1feeder_combout\ = \Mux|output[8]~73_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[8]~73_combout\,
	combout => \Reg4|output[8]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y54_N9
\Reg4|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[8]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[8]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N27
\Reg3|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[8]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N1
\Reg5|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[8]~_Duplicate_1_q\);

-- Location: LCCOMB_X1_Y55_N10
\Reg7|output[8]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg7|output[8]~_Duplicate_1feeder_combout\ = \Mux|output[8]~73_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[8]~73_combout\,
	combout => \Reg7|output[8]~_Duplicate_1feeder_combout\);

-- Location: FF_X1_Y55_N11
\Reg7|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg7|output[8]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[8]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y55_N12
\Mux|output[8]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[8]~68_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[8]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[8]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[8]~_Duplicate_1_q\,
	datab => \Reg7|output[8]~_Duplicate_1_q\,
	datac => \Mux|output[15]~19_combout\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[8]~68_combout\);

-- Location: LCCOMB_X3_Y55_N14
\Mux|output[8]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[8]~69_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[8]~68_combout\ & ((\DIN[8]~input_o\))) # (!\Mux|output[8]~68_combout\ & (\RegG|output[8]~_Duplicate_1_q\)))) # (!\Mux|output[15]~18_combout\ & (((\Mux|output[8]~68_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegG|output[8]~_Duplicate_1_q\,
	datab => \DIN[8]~input_o\,
	datac => \Mux|output[15]~18_combout\,
	datad => \Mux|output[8]~68_combout\,
	combout => \Mux|output[8]~69_combout\);

-- Location: LCCOMB_X6_Y54_N0
\Mux|output[8]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[8]~70_combout\ = (\Mux|output[15]~6_combout\ & (\Mux|output[15]~8_combout\)) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & (\Reg5|output[8]~_Duplicate_1_q\)) # (!\Mux|output[15]~8_combout\ & ((\Mux|output[8]~69_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg5|output[8]~_Duplicate_1_q\,
	datad => \Mux|output[8]~69_combout\,
	combout => \Mux|output[8]~70_combout\);

-- Location: LCCOMB_X6_Y54_N26
\Mux|output[8]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[8]~71_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[8]~70_combout\ & ((\Reg3|output[8]~_Duplicate_1_q\))) # (!\Mux|output[8]~70_combout\ & (\Reg4|output[8]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & 
-- (((\Mux|output[8]~70_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Reg4|output[8]~_Duplicate_1_q\,
	datac => \Reg3|output[8]~_Duplicate_1_q\,
	datad => \Mux|output[8]~70_combout\,
	combout => \Mux|output[8]~71_combout\);

-- Location: FF_X6_Y55_N29
\Reg2|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[8]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y55_N28
\Mux|output[8]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[8]~72_combout\ = (\Mux|output[15]~4_combout\ & (((\Reg2|output[8]~_Duplicate_1_q\) # (\Mux|output[15]~0_combout\)))) # (!\Mux|output[15]~4_combout\ & (\Mux|output[8]~71_combout\ & ((!\Mux|output[15]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[8]~71_combout\,
	datac => \Reg2|output[8]~_Duplicate_1_q\,
	datad => \Mux|output[15]~0_combout\,
	combout => \Mux|output[8]~72_combout\);

-- Location: LCCOMB_X6_Y55_N14
\Mux|output[8]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[8]~73_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[8]~72_combout\ & ((\Reg0|output[8]~_Duplicate_1_q\))) # (!\Mux|output[8]~72_combout\ & (\Reg1|output[8]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & 
-- (((\Mux|output[8]~72_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~0_combout\,
	datab => \Reg1|output[8]~_Duplicate_1_q\,
	datac => \Reg0|output[8]~_Duplicate_1_q\,
	datad => \Mux|output[8]~72_combout\,
	combout => \Mux|output[8]~73_combout\);

-- Location: FF_X5_Y55_N9
\Reg1|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[9]~_Duplicate_1_q\);

-- Location: LCCOMB_X5_Y55_N8
\Mux|output[9]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[9]~78_combout\ = (\Mux|output[15]~0_combout\ & (((\Reg1|output[9]~_Duplicate_1_q\) # (\Mux|output[15]~4_combout\)))) # (!\Mux|output[15]~0_combout\ & (\Mux|output[9]~77_combout\ & ((!\Mux|output[15]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[9]~77_combout\,
	datab => \Mux|output[15]~0_combout\,
	datac => \Reg1|output[9]~_Duplicate_1_q\,
	datad => \Mux|output[15]~4_combout\,
	combout => \Mux|output[9]~78_combout\);

-- Location: FF_X4_Y55_N19
\Reg0|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[9]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y55_N28
\Reg2|output[9]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[9]~_Duplicate_1feeder_combout\ = \Mux|output[9]~79_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[9]~79_combout\,
	combout => \Reg2|output[9]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N29
\Reg2|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[9]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[9]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y55_N18
\Mux|output[9]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[9]~79_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[9]~78_combout\ & (\Reg0|output[9]~_Duplicate_1_q\)) # (!\Mux|output[9]~78_combout\ & ((\Reg2|output[9]~_Duplicate_1_q\))))) # (!\Mux|output[15]~4_combout\ & 
-- (\Mux|output[9]~78_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[9]~78_combout\,
	datac => \Reg0|output[9]~_Duplicate_1_q\,
	datad => \Reg2|output[9]~_Duplicate_1_q\,
	combout => \Mux|output[9]~79_combout\);

-- Location: LCCOMB_X3_Y53_N10
\Reg1|output[10]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg1|output[10]~_Duplicate_1feeder_combout\ = \Mux|output[10]~85_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[10]~85_combout\,
	combout => \Reg1|output[10]~_Duplicate_1feeder_combout\);

-- Location: FF_X3_Y53_N11
\Reg1|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg1|output[10]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[10]~_Duplicate_1_q\);

-- Location: LCCOMB_X7_Y54_N10
\Reg4|output[10]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[10]~_Duplicate_1feeder_combout\ = \Mux|output[10]~85_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[10]~85_combout\,
	combout => \Reg4|output[10]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y54_N11
\Reg4|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[10]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[10]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N15
\Reg3|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[10]~_Duplicate_1_q\);

-- Location: FF_X6_Y54_N21
\Reg5|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[10]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N1
\Reg7|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[10]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N0
\Mux|output[10]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[10]~80_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[10]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[10]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[10]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[10]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[10]~80_combout\);

-- Location: LCCOMB_X7_Y54_N4
\Mux|output[10]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[10]~81_combout\ = (\Mux|output[10]~80_combout\ & (((\DIN[10]~input_o\) # (!\Mux|output[15]~18_combout\)))) # (!\Mux|output[10]~80_combout\ & (\RegG|output[10]~_Duplicate_1_q\ & ((\Mux|output[15]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegG|output[10]~_Duplicate_1_q\,
	datab => \DIN[10]~input_o\,
	datac => \Mux|output[10]~80_combout\,
	datad => \Mux|output[15]~18_combout\,
	combout => \Mux|output[10]~81_combout\);

-- Location: LCCOMB_X6_Y54_N20
\Mux|output[10]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[10]~82_combout\ = (\Mux|output[15]~6_combout\ & (\Mux|output[15]~8_combout\)) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & (\Reg5|output[10]~_Duplicate_1_q\)) # (!\Mux|output[15]~8_combout\ & 
-- ((\Mux|output[10]~81_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[15]~8_combout\,
	datac => \Reg5|output[10]~_Duplicate_1_q\,
	datad => \Mux|output[10]~81_combout\,
	combout => \Mux|output[10]~82_combout\);

-- Location: LCCOMB_X6_Y54_N14
\Mux|output[10]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[10]~83_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[10]~82_combout\ & ((\Reg3|output[10]~_Duplicate_1_q\))) # (!\Mux|output[10]~82_combout\ & (\Reg4|output[10]~_Duplicate_1_q\)))) # (!\Mux|output[15]~6_combout\ & 
-- (((\Mux|output[10]~82_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Reg4|output[10]~_Duplicate_1_q\,
	datac => \Reg3|output[10]~_Duplicate_1_q\,
	datad => \Mux|output[10]~82_combout\,
	combout => \Mux|output[10]~83_combout\);

-- Location: FF_X6_Y55_N9
\Reg2|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[10]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y55_N8
\Mux|output[10]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[10]~84_combout\ = (\Mux|output[15]~4_combout\ & (((\Reg2|output[10]~_Duplicate_1_q\) # (\Mux|output[15]~0_combout\)))) # (!\Mux|output[15]~4_combout\ & (\Mux|output[10]~83_combout\ & ((!\Mux|output[15]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Mux|output[10]~83_combout\,
	datac => \Reg2|output[10]~_Duplicate_1_q\,
	datad => \Mux|output[15]~0_combout\,
	combout => \Mux|output[10]~84_combout\);

-- Location: FF_X6_Y55_N19
\Reg0|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[10]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y55_N18
\Mux|output[10]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[10]~85_combout\ = (\Mux|output[10]~84_combout\ & (((\Reg0|output[10]~_Duplicate_1_q\) # (!\Mux|output[15]~0_combout\)))) # (!\Mux|output[10]~84_combout\ & (\Reg1|output[10]~_Duplicate_1_q\ & ((\Mux|output[15]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg1|output[10]~_Duplicate_1_q\,
	datab => \Mux|output[10]~84_combout\,
	datac => \Reg0|output[10]~_Duplicate_1_q\,
	datad => \Mux|output[15]~0_combout\,
	combout => \Mux|output[10]~85_combout\);

-- Location: LCCOMB_X4_Y55_N24
\Reg2|output[11]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[11]~_Duplicate_1feeder_combout\ = \Mux|output[11]~91_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[11]~91_combout\,
	combout => \Reg2|output[11]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N25
\Reg2|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[11]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[11]~_Duplicate_1_q\);

-- Location: FF_X4_Y55_N23
\Reg0|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[11]~_Duplicate_1_q\);

-- Location: FF_X3_Y53_N23
\Reg1|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[11]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y53_N0
\Reg5|output[11]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[11]~_Duplicate_1feeder_combout\ = \Mux|output[11]~91_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[11]~91_combout\,
	combout => \Reg5|output[11]~_Duplicate_1feeder_combout\);

-- Location: FF_X2_Y53_N1
\Reg5|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[11]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[11]~_Duplicate_1_q\);

-- Location: FF_X2_Y53_N15
\Reg3|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[11]~_Duplicate_1_q\);

-- Location: LCCOMB_X4_Y54_N12
\Ctrl|Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector4~1_combout\ = (\Ctrl|Selector4~0_combout\ & (!\IR|output\(1) & ((\Ctrl|state.C~q\) # (\Ctrl|Selector7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|Selector4~0_combout\,
	datab => \IR|output\(1),
	datac => \Ctrl|state.C~q\,
	datad => \Ctrl|Selector7~1_combout\,
	combout => \Ctrl|Selector4~1_combout\);

-- Location: LCCOMB_X4_Y54_N16
\Ctrl|Selector4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector4~2_combout\ = (\Ctrl|Selector4~1_combout\) # ((!\IR|output\(3) & (\IR|output\(5) & \Ctrl|Selector7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(3),
	datab => \IR|output\(5),
	datac => \Ctrl|Selector7~0_combout\,
	datad => \Ctrl|Selector4~1_combout\,
	combout => \Ctrl|Selector4~2_combout\);

-- Location: LCCOMB_X5_Y54_N12
\Mux|output[15]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~6_combout\ = (\Ctrl|Selector4~2_combout\) # (!\Mux|output[15]~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Ctrl|Selector4~2_combout\,
	datad => \Mux|output[15]~5_combout\,
	combout => \Mux|output[15]~6_combout\);

-- Location: FF_X1_Y54_N5
\Reg4|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[11]~_Duplicate_1_q\);

-- Location: LCCOMB_X1_Y54_N4
\Mux|output[11]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[11]~88_combout\ = (\Mux|output[15]~6_combout\ & (((\Reg4|output[11]~_Duplicate_1_q\) # (\Mux|output[15]~8_combout\)))) # (!\Mux|output[15]~6_combout\ & (\Mux|output[11]~87_combout\ & ((!\Mux|output[15]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[11]~87_combout\,
	datab => \Mux|output[15]~6_combout\,
	datac => \Reg4|output[11]~_Duplicate_1_q\,
	datad => \Mux|output[15]~8_combout\,
	combout => \Mux|output[11]~88_combout\);

-- Location: LCCOMB_X2_Y53_N14
\Mux|output[11]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[11]~89_combout\ = (\Mux|output[15]~8_combout\ & ((\Mux|output[11]~88_combout\ & ((\Reg3|output[11]~_Duplicate_1_q\))) # (!\Mux|output[11]~88_combout\ & (\Reg5|output[11]~_Duplicate_1_q\)))) # (!\Mux|output[15]~8_combout\ & 
-- (((\Mux|output[11]~88_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~8_combout\,
	datab => \Reg5|output[11]~_Duplicate_1_q\,
	datac => \Reg3|output[11]~_Duplicate_1_q\,
	datad => \Mux|output[11]~88_combout\,
	combout => \Mux|output[11]~89_combout\);

-- Location: LCCOMB_X3_Y53_N22
\Mux|output[11]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[11]~90_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[15]~4_combout\) # ((\Reg1|output[11]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & (!\Mux|output[15]~4_combout\ & ((\Mux|output[11]~89_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~0_combout\,
	datab => \Mux|output[15]~4_combout\,
	datac => \Reg1|output[11]~_Duplicate_1_q\,
	datad => \Mux|output[11]~89_combout\,
	combout => \Mux|output[11]~90_combout\);

-- Location: LCCOMB_X4_Y55_N22
\Mux|output[11]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[11]~91_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[11]~90_combout\ & ((\Reg0|output[11]~_Duplicate_1_q\))) # (!\Mux|output[11]~90_combout\ & (\Reg2|output[11]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & 
-- (((\Mux|output[11]~90_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Reg2|output[11]~_Duplicate_1_q\,
	datac => \Reg0|output[11]~_Duplicate_1_q\,
	datad => \Mux|output[11]~90_combout\,
	combout => \Mux|output[11]~91_combout\);

-- Location: LCCOMB_X7_Y55_N8
\Reg1|output[12]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg1|output[12]~_Duplicate_1feeder_combout\ = \Mux|output[12]~97_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[12]~97_combout\,
	combout => \Reg1|output[12]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y55_N9
\Reg1|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg1|output[12]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[12]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N3
\Reg0|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[12]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N1
\Reg2|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[12]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y55_N0
\Mux|output[12]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[12]~96_combout\ = (\Mux|output[15]~4_combout\ & (((\Reg2|output[12]~_Duplicate_1_q\) # (\Mux|output[15]~0_combout\)))) # (!\Mux|output[15]~4_combout\ & (\Mux|output[12]~95_combout\ & ((!\Mux|output[15]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[12]~95_combout\,
	datab => \Mux|output[15]~4_combout\,
	datac => \Reg2|output[12]~_Duplicate_1_q\,
	datad => \Mux|output[15]~0_combout\,
	combout => \Mux|output[12]~96_combout\);

-- Location: LCCOMB_X6_Y55_N2
\Mux|output[12]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[12]~97_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[12]~96_combout\ & ((\Reg0|output[12]~_Duplicate_1_q\))) # (!\Mux|output[12]~96_combout\ & (\Reg1|output[12]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & 
-- (((\Mux|output[12]~96_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~0_combout\,
	datab => \Reg1|output[12]~_Duplicate_1_q\,
	datac => \Reg0|output[12]~_Duplicate_1_q\,
	datad => \Mux|output[12]~96_combout\,
	combout => \Mux|output[12]~97_combout\);

-- Location: LCCOMB_X4_Y55_N20
\Reg2|output[13]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[13]~_Duplicate_1feeder_combout\ = \Mux|output[13]~103_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[13]~103_combout\,
	combout => \Reg2|output[13]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N21
\Reg2|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[13]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[13]~_Duplicate_1_q\);

-- Location: FF_X4_Y55_N3
\Reg0|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[13]~_Duplicate_1_q\);

-- Location: FF_X3_Y53_N19
\Reg1|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[13]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N7
\RegA|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[13]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N17
\RegA|output[12]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[12]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N19
\RegA|output[11]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[11]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N9
\RegA|output[10]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[10]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N3
\RegA|output[9]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[9]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N21
\RegA|output[8]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[8]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N27
\RegA|output[7]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[7]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N29
\RegA|output[6]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[6]~_Duplicate_1_q\);

-- Location: FF_X2_Y55_N31
\RegA|output[5]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[5]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y55_N30
\Adder|Gen_Adder:5:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:5:AdderX|c_out~0_combout\ = (\RegA|output[5]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:4:AdderX|c_out~0_combout\) # (\Ctrl|AddSub~0_combout\ $ (\Mux|output[5]~55_combout\)))) # (!\RegA|output[5]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:4:AdderX|c_out~0_combout\ & (\Ctrl|AddSub~0_combout\ $ (\Mux|output[5]~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \Mux|output[5]~55_combout\,
	datac => \RegA|output[5]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:4:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:5:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N28
\Adder|Gen_Adder:6:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:6:AdderX|c_out~0_combout\ = (\RegA|output[6]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:5:AdderX|c_out~0_combout\) # (\Ctrl|AddSub~0_combout\ $ (\Mux|output[6]~61_combout\)))) # (!\RegA|output[6]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:5:AdderX|c_out~0_combout\ & (\Ctrl|AddSub~0_combout\ $ (\Mux|output[6]~61_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \Mux|output[6]~61_combout\,
	datac => \RegA|output[6]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:5:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:6:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N26
\Adder|Gen_Adder:7:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:7:AdderX|c_out~0_combout\ = (\RegA|output[7]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:6:AdderX|c_out~0_combout\) # (\Ctrl|AddSub~0_combout\ $ (\Mux|output[7]~67_combout\)))) # (!\RegA|output[7]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:6:AdderX|c_out~0_combout\ & (\Ctrl|AddSub~0_combout\ $ (\Mux|output[7]~67_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \Mux|output[7]~67_combout\,
	datac => \RegA|output[7]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:6:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:7:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N20
\Adder|Gen_Adder:8:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:8:AdderX|c_out~0_combout\ = (\RegA|output[8]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:7:AdderX|c_out~0_combout\) # (\Ctrl|AddSub~0_combout\ $ (\Mux|output[8]~73_combout\)))) # (!\RegA|output[8]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:7:AdderX|c_out~0_combout\ & (\Ctrl|AddSub~0_combout\ $ (\Mux|output[8]~73_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \Mux|output[8]~73_combout\,
	datac => \RegA|output[8]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:7:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:8:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N2
\Adder|Gen_Adder:9:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:9:AdderX|c_out~0_combout\ = (\RegA|output[9]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:8:AdderX|c_out~0_combout\) # (\Mux|output[9]~79_combout\ $ (\Ctrl|AddSub~0_combout\)))) # (!\RegA|output[9]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:8:AdderX|c_out~0_combout\ & (\Mux|output[9]~79_combout\ $ (\Ctrl|AddSub~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[9]~79_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[9]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:8:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:9:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N8
\Adder|Gen_Adder:10:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:10:AdderX|c_out~0_combout\ = (\RegA|output[10]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:9:AdderX|c_out~0_combout\) # (\Mux|output[10]~85_combout\ $ (\Ctrl|AddSub~0_combout\)))) # (!\RegA|output[10]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:9:AdderX|c_out~0_combout\ & (\Mux|output[10]~85_combout\ $ (\Ctrl|AddSub~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[10]~85_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[10]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:9:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:10:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N18
\Adder|Gen_Adder:11:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:11:AdderX|c_out~0_combout\ = (\RegA|output[11]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:10:AdderX|c_out~0_combout\) # (\Mux|output[11]~91_combout\ $ (\Ctrl|AddSub~0_combout\)))) # (!\RegA|output[11]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:10:AdderX|c_out~0_combout\ & (\Mux|output[11]~91_combout\ $ (\Ctrl|AddSub~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[11]~91_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[11]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:10:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:11:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N16
\Adder|Gen_Adder:12:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:12:AdderX|c_out~0_combout\ = (\RegA|output[12]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:11:AdderX|c_out~0_combout\) # (\Mux|output[12]~97_combout\ $ (\Ctrl|AddSub~0_combout\)))) # (!\RegA|output[12]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:11:AdderX|c_out~0_combout\ & (\Mux|output[12]~97_combout\ $ (\Ctrl|AddSub~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[12]~97_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[12]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:11:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:12:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X1_Y53_N18
\Adder|Gen_Adder:13:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:13:AdderX|sum~combout\ = \Mux|output[13]~103_combout\ $ (\Ctrl|AddSub~0_combout\ $ (\RegA|output[13]~_Duplicate_1_q\ $ (\Adder|Gen_Adder:12:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[13]~103_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[13]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:12:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:13:AdderX|sum~combout\);

-- Location: FF_X1_Y53_N19
\RegG|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:13:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[13]~_Duplicate_1_q\);

-- Location: FF_X1_Y55_N19
\Reg7|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[13]~_Duplicate_1_q\);

-- Location: LCCOMB_X1_Y55_N18
\Mux|output[13]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[13]~98_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[13]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[13]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[13]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[13]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[13]~98_combout\);

-- Location: LCCOMB_X1_Y55_N28
\Mux|output[13]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[13]~99_combout\ = (\Mux|output[15]~18_combout\ & ((\Mux|output[13]~98_combout\ & (\DIN[13]~input_o\)) # (!\Mux|output[13]~98_combout\ & ((\RegG|output[13]~_Duplicate_1_q\))))) # (!\Mux|output[15]~18_combout\ & 
-- (((\Mux|output[13]~98_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIN[13]~input_o\,
	datab => \Mux|output[15]~18_combout\,
	datac => \RegG|output[13]~_Duplicate_1_q\,
	datad => \Mux|output[13]~98_combout\,
	combout => \Mux|output[13]~99_combout\);

-- Location: LCCOMB_X1_Y54_N12
\Reg4|output[13]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[13]~_Duplicate_1feeder_combout\ = \Mux|output[13]~103_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[13]~103_combout\,
	combout => \Reg4|output[13]~_Duplicate_1feeder_combout\);

-- Location: FF_X1_Y54_N13
\Reg4|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[13]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[13]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y53_N2
\Mux|output[13]~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[13]~100_combout\ = (\Mux|output[15]~8_combout\ & (\Mux|output[15]~6_combout\)) # (!\Mux|output[15]~8_combout\ & ((\Mux|output[15]~6_combout\ & ((\Reg4|output[13]~_Duplicate_1_q\))) # (!\Mux|output[15]~6_combout\ & 
-- (\Mux|output[13]~99_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~8_combout\,
	datab => \Mux|output[15]~6_combout\,
	datac => \Mux|output[13]~99_combout\,
	datad => \Reg4|output[13]~_Duplicate_1_q\,
	combout => \Mux|output[13]~100_combout\);

-- Location: FF_X2_Y53_N25
\Reg3|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[13]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y53_N12
\Reg5|output[13]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[13]~_Duplicate_1feeder_combout\ = \Mux|output[13]~103_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[13]~103_combout\,
	combout => \Reg5|output[13]~_Duplicate_1feeder_combout\);

-- Location: FF_X2_Y53_N13
\Reg5|output[13]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[13]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[13]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y53_N24
\Mux|output[13]~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[13]~101_combout\ = (\Mux|output[15]~8_combout\ & ((\Mux|output[13]~100_combout\ & (\Reg3|output[13]~_Duplicate_1_q\)) # (!\Mux|output[13]~100_combout\ & ((\Reg5|output[13]~_Duplicate_1_q\))))) # (!\Mux|output[15]~8_combout\ & 
-- (\Mux|output[13]~100_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~8_combout\,
	datab => \Mux|output[13]~100_combout\,
	datac => \Reg3|output[13]~_Duplicate_1_q\,
	datad => \Reg5|output[13]~_Duplicate_1_q\,
	combout => \Mux|output[13]~101_combout\);

-- Location: LCCOMB_X3_Y53_N18
\Mux|output[13]~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[13]~102_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[15]~4_combout\) # ((\Reg1|output[13]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & (!\Mux|output[15]~4_combout\ & ((\Mux|output[13]~101_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~0_combout\,
	datab => \Mux|output[15]~4_combout\,
	datac => \Reg1|output[13]~_Duplicate_1_q\,
	datad => \Mux|output[13]~101_combout\,
	combout => \Mux|output[13]~102_combout\);

-- Location: LCCOMB_X4_Y55_N2
\Mux|output[13]~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[13]~103_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[13]~102_combout\ & ((\Reg0|output[13]~_Duplicate_1_q\))) # (!\Mux|output[13]~102_combout\ & (\Reg2|output[13]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & 
-- (((\Mux|output[13]~102_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Reg2|output[13]~_Duplicate_1_q\,
	datac => \Reg0|output[13]~_Duplicate_1_q\,
	datad => \Mux|output[13]~102_combout\,
	combout => \Mux|output[13]~103_combout\);

-- Location: LCCOMB_X7_Y55_N10
\Reg1|output[14]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg1|output[14]~_Duplicate_1feeder_combout\ = \Mux|output[14]~109_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[14]~109_combout\,
	combout => \Reg1|output[14]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y55_N11
\Reg1|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg1|output[14]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[14]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N27
\Reg0|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[14]~_Duplicate_1_q\);

-- Location: FF_X6_Y55_N17
\Reg2|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[14]~_Duplicate_1_q\);

-- Location: FF_X1_Y55_N25
\Reg7|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[14]~_Duplicate_1_q\);

-- Location: LCCOMB_X1_Y55_N24
\Mux|output[14]~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[14]~104_combout\ = (\Mux|output[15]~12_combout\ & (((\Mux|output[15]~19_combout\)))) # (!\Mux|output[15]~12_combout\ & ((\Mux|output[15]~19_combout\ & (\Reg6|output[14]~_Duplicate_1_q\)) # (!\Mux|output[15]~19_combout\ & 
-- ((\Reg7|output[14]~_Duplicate_1_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[14]~_Duplicate_1_q\,
	datab => \Mux|output[15]~12_combout\,
	datac => \Reg7|output[14]~_Duplicate_1_q\,
	datad => \Mux|output[15]~19_combout\,
	combout => \Mux|output[14]~104_combout\);

-- Location: FF_X2_Y55_N13
\RegA|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output[14]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y55_N6
\Adder|Gen_Adder:13:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:13:AdderX|c_out~0_combout\ = (\RegA|output[13]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:12:AdderX|c_out~0_combout\) # (\Ctrl|AddSub~0_combout\ $ (\Mux|output[13]~103_combout\)))) # (!\RegA|output[13]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:12:AdderX|c_out~0_combout\ & (\Ctrl|AddSub~0_combout\ $ (\Mux|output[13]~103_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \Mux|output[13]~103_combout\,
	datac => \RegA|output[13]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:12:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:13:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X1_Y55_N4
\Adder|Gen_Adder:14:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:14:AdderX|sum~combout\ = \Mux|output[14]~109_combout\ $ (\Ctrl|AddSub~0_combout\ $ (\RegA|output[14]~_Duplicate_1_q\ $ (\Adder|Gen_Adder:13:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[14]~109_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[14]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:13:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:14:AdderX|sum~combout\);

-- Location: FF_X1_Y55_N7
\RegG|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Adder|Gen_Adder:14:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output[14]~_Duplicate_1_q\);

-- Location: LCCOMB_X1_Y55_N6
\Mux|output[14]~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[14]~105_combout\ = (\Mux|output[14]~104_combout\ & ((\DIN[14]~input_o\) # ((!\Mux|output[15]~18_combout\)))) # (!\Mux|output[14]~104_combout\ & (((\RegG|output[14]~_Duplicate_1_q\ & \Mux|output[15]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DIN[14]~input_o\,
	datab => \Mux|output[14]~104_combout\,
	datac => \RegG|output[14]~_Duplicate_1_q\,
	datad => \Mux|output[15]~18_combout\,
	combout => \Mux|output[14]~105_combout\);

-- Location: FF_X6_Y54_N5
\Reg5|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[14]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y54_N4
\Mux|output[14]~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[14]~106_combout\ = (\Mux|output[15]~6_combout\ & (((\Mux|output[15]~8_combout\)))) # (!\Mux|output[15]~6_combout\ & ((\Mux|output[15]~8_combout\ & ((\Reg5|output[14]~_Duplicate_1_q\))) # (!\Mux|output[15]~8_combout\ & 
-- (\Mux|output[14]~105_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[14]~105_combout\,
	datac => \Reg5|output[14]~_Duplicate_1_q\,
	datad => \Mux|output[15]~8_combout\,
	combout => \Mux|output[14]~106_combout\);

-- Location: FF_X6_Y54_N19
\Reg3|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[14]~_Duplicate_1_q\);

-- Location: LCCOMB_X7_Y54_N24
\Reg4|output[14]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg4|output[14]~_Duplicate_1feeder_combout\ = \Mux|output[14]~109_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Mux|output[14]~109_combout\,
	combout => \Reg4|output[14]~_Duplicate_1feeder_combout\);

-- Location: FF_X7_Y54_N25
\Reg4|output[14]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg4|output[14]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[14]~_Duplicate_1_q\);

-- Location: LCCOMB_X6_Y54_N18
\Mux|output[14]~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[14]~107_combout\ = (\Mux|output[15]~6_combout\ & ((\Mux|output[14]~106_combout\ & (\Reg3|output[14]~_Duplicate_1_q\)) # (!\Mux|output[14]~106_combout\ & ((\Reg4|output[14]~_Duplicate_1_q\))))) # (!\Mux|output[15]~6_combout\ & 
-- (\Mux|output[14]~106_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~6_combout\,
	datab => \Mux|output[14]~106_combout\,
	datac => \Reg3|output[14]~_Duplicate_1_q\,
	datad => \Reg4|output[14]~_Duplicate_1_q\,
	combout => \Mux|output[14]~107_combout\);

-- Location: LCCOMB_X6_Y55_N16
\Mux|output[14]~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[14]~108_combout\ = (\Mux|output[15]~0_combout\ & (\Mux|output[15]~4_combout\)) # (!\Mux|output[15]~0_combout\ & ((\Mux|output[15]~4_combout\ & (\Reg2|output[14]~_Duplicate_1_q\)) # (!\Mux|output[15]~4_combout\ & 
-- ((\Mux|output[14]~107_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~0_combout\,
	datab => \Mux|output[15]~4_combout\,
	datac => \Reg2|output[14]~_Duplicate_1_q\,
	datad => \Mux|output[14]~107_combout\,
	combout => \Mux|output[14]~108_combout\);

-- Location: LCCOMB_X6_Y55_N26
\Mux|output[14]~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[14]~109_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[14]~108_combout\ & ((\Reg0|output[14]~_Duplicate_1_q\))) # (!\Mux|output[14]~108_combout\ & (\Reg1|output[14]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & 
-- (((\Mux|output[14]~108_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~0_combout\,
	datab => \Reg1|output[14]~_Duplicate_1_q\,
	datac => \Reg0|output[14]~_Duplicate_1_q\,
	datad => \Mux|output[14]~108_combout\,
	combout => \Mux|output[14]~109_combout\);

-- Location: LCCOMB_X4_Y55_N8
\Reg2|output[15]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg2|output[15]~_Duplicate_1feeder_combout\ = \Mux|output[15]~115_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[15]~115_combout\,
	combout => \Reg2|output[15]~_Duplicate_1feeder_combout\);

-- Location: FF_X4_Y55_N9
\Reg2|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg2|output[15]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output[15]~_Duplicate_1_q\);

-- Location: FF_X4_Y55_N27
\Reg0|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output[15]~_Duplicate_1_q\);

-- Location: FF_X3_Y53_N7
\Reg1|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output[15]~_Duplicate_1_q\);

-- Location: FF_X1_Y54_N3
\Reg4|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output[15]~_Duplicate_1_q\);

-- Location: FF_X3_Y54_N13
\Reg7|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output[15]~_Duplicate_1_q\);

-- Location: LCCOMB_X3_Y54_N12
\Mux|output[15]~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~110_combout\ = (\Mux|output[15]~19_combout\ & ((\Reg6|output[15]~_Duplicate_1_q\) # ((\Mux|output[15]~12_combout\)))) # (!\Mux|output[15]~19_combout\ & (((\Reg7|output[15]~_Duplicate_1_q\ & !\Mux|output[15]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reg6|output[15]~_Duplicate_1_q\,
	datab => \Mux|output[15]~19_combout\,
	datac => \Reg7|output[15]~_Duplicate_1_q\,
	datad => \Mux|output[15]~12_combout\,
	combout => \Mux|output[15]~110_combout\);

-- Location: LCCOMB_X1_Y54_N24
\Mux|output[15]~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~111_combout\ = (\Mux|output[15]~110_combout\ & (((\DIN[15]~input_o\) # (!\Mux|output[15]~18_combout\)))) # (!\Mux|output[15]~110_combout\ & (\RegG|output[15]~_Duplicate_1_q\ & (\Mux|output[15]~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegG|output[15]~_Duplicate_1_q\,
	datab => \Mux|output[15]~110_combout\,
	datac => \Mux|output[15]~18_combout\,
	datad => \DIN[15]~input_o\,
	combout => \Mux|output[15]~111_combout\);

-- Location: LCCOMB_X1_Y54_N2
\Mux|output[15]~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~112_combout\ = (\Mux|output[15]~8_combout\ & (\Mux|output[15]~6_combout\)) # (!\Mux|output[15]~8_combout\ & ((\Mux|output[15]~6_combout\ & (\Reg4|output[15]~_Duplicate_1_q\)) # (!\Mux|output[15]~6_combout\ & 
-- ((\Mux|output[15]~111_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~8_combout\,
	datab => \Mux|output[15]~6_combout\,
	datac => \Reg4|output[15]~_Duplicate_1_q\,
	datad => \Mux|output[15]~111_combout\,
	combout => \Mux|output[15]~112_combout\);

-- Location: FF_X2_Y53_N9
\Reg3|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	asdata => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	sload => VCC,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output[15]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y53_N6
\Reg5|output[15]~_Duplicate_1feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \Reg5|output[15]~_Duplicate_1feeder_combout\ = \Mux|output[15]~115_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mux|output[15]~115_combout\,
	combout => \Reg5|output[15]~_Duplicate_1feeder_combout\);

-- Location: FF_X2_Y53_N7
\Reg5|output[15]~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Reg5|output[15]~_Duplicate_1feeder_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output[15]~_Duplicate_1_q\);

-- Location: LCCOMB_X2_Y53_N8
\Mux|output[15]~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~113_combout\ = (\Mux|output[15]~8_combout\ & ((\Mux|output[15]~112_combout\ & (\Reg3|output[15]~_Duplicate_1_q\)) # (!\Mux|output[15]~112_combout\ & ((\Reg5|output[15]~_Duplicate_1_q\))))) # (!\Mux|output[15]~8_combout\ & 
-- (\Mux|output[15]~112_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~8_combout\,
	datab => \Mux|output[15]~112_combout\,
	datac => \Reg3|output[15]~_Duplicate_1_q\,
	datad => \Reg5|output[15]~_Duplicate_1_q\,
	combout => \Mux|output[15]~113_combout\);

-- Location: LCCOMB_X3_Y53_N6
\Mux|output[15]~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~114_combout\ = (\Mux|output[15]~0_combout\ & ((\Mux|output[15]~4_combout\) # ((\Reg1|output[15]~_Duplicate_1_q\)))) # (!\Mux|output[15]~0_combout\ & (!\Mux|output[15]~4_combout\ & ((\Mux|output[15]~113_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~0_combout\,
	datab => \Mux|output[15]~4_combout\,
	datac => \Reg1|output[15]~_Duplicate_1_q\,
	datad => \Mux|output[15]~113_combout\,
	combout => \Mux|output[15]~114_combout\);

-- Location: LCCOMB_X4_Y55_N26
\Mux|output[15]~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux|output[15]~115_combout\ = (\Mux|output[15]~4_combout\ & ((\Mux|output[15]~114_combout\ & ((\Reg0|output[15]~_Duplicate_1_q\))) # (!\Mux|output[15]~114_combout\ & (\Reg2|output[15]~_Duplicate_1_q\)))) # (!\Mux|output[15]~4_combout\ & 
-- (((\Mux|output[15]~114_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[15]~4_combout\,
	datab => \Reg2|output[15]~_Duplicate_1_q\,
	datac => \Reg0|output[15]~_Duplicate_1_q\,
	datad => \Mux|output[15]~114_combout\,
	combout => \Mux|output[15]~115_combout\);

-- Location: IOIBUF_X0_Y36_N8
\Clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G2
\Clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk~inputclkctrl_outclk\);

-- Location: DDIOOUTCELL_X5_Y0_N25
\Reg0|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(0));

-- Location: DDIOOUTCELL_X29_Y73_N4
\Reg0|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(1));

-- Location: DDIOOUTCELL_X25_Y73_N25
\Reg0|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(2));

-- Location: DDIOOUTCELL_X0_Y22_N18
\Reg0|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(3));

-- Location: DDIOOUTCELL_X0_Y68_N4
\Reg0|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(4));

-- Location: DDIOOUTCELL_X18_Y0_N4
\Reg0|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(5));

-- Location: DDIOOUTCELL_X29_Y73_N11
\Reg0|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(6));

-- Location: DDIOOUTCELL_X29_Y0_N18
\Reg0|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(7));

-- Location: DDIOOUTCELL_X5_Y0_N11
\Reg0|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(8));

-- Location: DDIOOUTCELL_X0_Y35_N4
\Reg0|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(9));

-- Location: DDIOOUTCELL_X31_Y0_N4
\Reg0|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(10));

-- Location: DDIOOUTCELL_X0_Y35_N18
\Reg0|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(11));

-- Location: DDIOOUTCELL_X5_Y0_N18
\Reg0|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(12));

-- Location: DDIOOUTCELL_X18_Y73_N25
\Reg0|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(13));

-- Location: DDIOOUTCELL_X0_Y27_N18
\Reg0|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(14));

-- Location: DDIOOUTCELL_X0_Y14_N4
\Reg0|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg0|output\(15));

-- Location: DDIOOUTCELL_X3_Y0_N18
\Reg1|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(0));

-- Location: DDIOOUTCELL_X33_Y73_N11
\Reg1|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(1));

-- Location: DDIOOUTCELL_X3_Y73_N25
\Reg1|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(2));

-- Location: DDIOOUTCELL_X0_Y18_N25
\Reg1|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(3));

-- Location: DDIOOUTCELL_X3_Y73_N11
\Reg1|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(4));

-- Location: DDIOOUTCELL_X18_Y0_N11
\Reg1|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(5));

-- Location: DDIOOUTCELL_X33_Y73_N4
\Reg1|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(6));

-- Location: DDIOOUTCELL_X29_Y0_N25
\Reg1|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(7));

-- Location: DDIOOUTCELL_X3_Y0_N4
\Reg1|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(8));

-- Location: DDIOOUTCELL_X0_Y33_N25
\Reg1|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(9));

-- Location: DDIOOUTCELL_X33_Y0_N4
\Reg1|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(10));

-- Location: DDIOOUTCELL_X0_Y42_N11
\Reg1|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(11));

-- Location: DDIOOUTCELL_X9_Y0_N25
\Reg1|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(12));

-- Location: DDIOOUTCELL_X16_Y73_N4
\Reg1|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(13));

-- Location: DDIOOUTCELL_X0_Y33_N18
\Reg1|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(14));

-- Location: DDIOOUTCELL_X0_Y14_N11
\Reg1|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector15~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg1|output\(15));

-- Location: DDIOOUTCELL_X1_Y0_N18
\Reg2|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(0));

-- Location: DDIOOUTCELL_X11_Y73_N11
\Reg2|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(1));

-- Location: DDIOOUTCELL_X13_Y73_N11
\Reg2|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(2));

-- Location: DDIOOUTCELL_X0_Y19_N11
\Reg2|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(3));

-- Location: DDIOOUTCELL_X5_Y73_N4
\Reg2|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(4));

-- Location: DDIOOUTCELL_X16_Y0_N25
\Reg2|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(5));

-- Location: DDIOOUTCELL_X13_Y73_N4
\Reg2|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(6));

-- Location: DDIOOUTCELL_X16_Y0_N11
\Reg2|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(7));

-- Location: DDIOOUTCELL_X0_Y12_N18
\Reg2|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(8));

-- Location: DDIOOUTCELL_X0_Y32_N18
\Reg2|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(9));

-- Location: DDIOOUTCELL_X16_Y0_N4
\Reg2|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(10));

-- Location: DDIOOUTCELL_X0_Y32_N25
\Reg2|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(11));

-- Location: DDIOOUTCELL_X1_Y0_N4
\Reg2|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(12));

-- Location: DDIOOUTCELL_X13_Y73_N18
\Reg2|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(13));

-- Location: DDIOOUTCELL_X0_Y25_N18
\Reg2|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(14));

-- Location: DDIOOUTCELL_X0_Y25_N25
\Reg2|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector14~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg2|output\(15));

-- Location: DDIOOUTCELL_X0_Y4_N4
\Reg3|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(0));

-- Location: DDIOOUTCELL_X20_Y73_N18
\Reg3|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(1));

-- Location: DDIOOUTCELL_X20_Y73_N25
\Reg3|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(2));

-- Location: DDIOOUTCELL_X0_Y22_N25
\Reg3|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(3));

-- Location: DDIOOUTCELL_X0_Y68_N18
\Reg3|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(4));

-- Location: DDIOOUTCELL_X20_Y0_N11
\Reg3|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(5));

-- Location: DDIOOUTCELL_X20_Y73_N4
\Reg3|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(6));

-- Location: DDIOOUTCELL_X20_Y0_N18
\Reg3|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(7));

-- Location: DDIOOUTCELL_X0_Y9_N18
\Reg3|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(8));

-- Location: DDIOOUTCELL_X0_Y30_N11
\Reg3|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(9));

-- Location: DDIOOUTCELL_X16_Y73_N11
\Reg3|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(10));

-- Location: DDIOOUTCELL_X0_Y34_N18
\Reg3|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(11));

-- Location: DDIOOUTCELL_X9_Y0_N4
\Reg3|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(12));

-- Location: DDIOOUTCELL_X16_Y73_N25
\Reg3|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(13));

-- Location: DDIOOUTCELL_X0_Y23_N25
\Reg3|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(14));

-- Location: DDIOOUTCELL_X0_Y13_N11
\Reg3|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector13~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg3|output\(15));

-- Location: DDIOOUTCELL_X7_Y0_N25
\Reg4|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(0));

-- Location: DDIOOUTCELL_X27_Y73_N11
\Reg4|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(1));

-- Location: DDIOOUTCELL_X23_Y73_N25
\Reg4|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(2));

-- Location: DDIOOUTCELL_X0_Y24_N11
\Reg4|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(3));

-- Location: DDIOOUTCELL_X0_Y68_N11
\Reg4|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(4));

-- Location: DDIOOUTCELL_X18_Y0_N18
\Reg4|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(5));

-- Location: DDIOOUTCELL_X27_Y73_N18
\Reg4|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(6));

-- Location: DDIOOUTCELL_X27_Y0_N25
\Reg4|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(7));

-- Location: DDIOOUTCELL_X7_Y0_N18
\Reg4|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(8));

-- Location: DDIOOUTCELL_X0_Y30_N4
\Reg4|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(9));

-- Location: DDIOOUTCELL_X27_Y0_N11
\Reg4|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(10));

-- Location: DDIOOUTCELL_X0_Y42_N4
\Reg4|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(11));

-- Location: DDIOOUTCELL_X7_Y0_N11
\Reg4|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(12));

-- Location: DDIOOUTCELL_X16_Y73_N18
\Reg4|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(13));

-- Location: DDIOOUTCELL_X0_Y24_N25
\Reg4|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(14));

-- Location: DDIOOUTCELL_X0_Y16_N25
\Reg4|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg4|output\(15));

-- Location: DDIOOUTCELL_X0_Y4_N11
\Reg5|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(0));

-- Location: DDIOOUTCELL_X31_Y73_N11
\Reg5|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(1));

-- Location: DDIOOUTCELL_X20_Y73_N11
\Reg5|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(2));

-- Location: DDIOOUTCELL_X0_Y24_N18
\Reg5|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(3));

-- Location: DDIOOUTCELL_X5_Y73_N11
\Reg5|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(4));

-- Location: DDIOOUTCELL_X13_Y0_N25
\Reg5|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(5));

-- Location: DDIOOUTCELL_X31_Y73_N4
\Reg5|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(6));

-- Location: DDIOOUTCELL_X23_Y0_N18
\Reg5|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(7));

-- Location: DDIOOUTCELL_X0_Y12_N25
\Reg5|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(8));

-- Location: DDIOOUTCELL_X0_Y28_N18
\Reg5|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(9));

-- Location: DDIOOUTCELL_X31_Y0_N11
\Reg5|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(10));

-- Location: DDIOOUTCELL_X0_Y35_N11
\Reg5|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(11));

-- Location: DDIOOUTCELL_X9_Y0_N11
\Reg5|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(12));

-- Location: DDIOOUTCELL_X5_Y73_N25
\Reg5|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(13));

-- Location: DDIOOUTCELL_X0_Y24_N4
\Reg5|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(14));

-- Location: DDIOOUTCELL_X0_Y17_N18
\Reg5|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector11~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg5|output\(15));

-- Location: LCCOMB_X4_Y53_N4
\Ctrl|Selector10~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Ctrl|Selector10~2_combout\ = (\IR|output\(5) & (\IR|output\(4) & (!\IR|output\(3) & \Ctrl|Selector17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \IR|output\(5),
	datab => \IR|output\(4),
	datac => \IR|output\(3),
	datad => \Ctrl|Selector17~0_combout\,
	combout => \Ctrl|Selector10~2_combout\);

-- Location: DDIOOUTCELL_X1_Y0_N25
\Reg6|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(0));

-- Location: DDIOOUTCELL_X1_Y73_N4
\Reg6|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(1));

-- Location: DDIOOUTCELL_X9_Y73_N11
\Reg6|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(2));

-- Location: DDIOOUTCELL_X0_Y18_N18
\Reg6|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(3));

-- Location: DDIOOUTCELL_X1_Y73_N25
\Reg6|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(4));

-- Location: DDIOOUTCELL_X1_Y0_N11
\Reg6|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(5));

-- Location: DDIOOUTCELL_X9_Y73_N4
\Reg6|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(6));

-- Location: DDIOOUTCELL_X3_Y0_N25
\Reg6|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(7));

-- Location: DDIOOUTCELL_X0_Y11_N18
\Reg6|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(8));

-- Location: DDIOOUTCELL_X0_Y29_N25
\Reg6|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(9));

-- Location: DDIOOUTCELL_X1_Y73_N11
\Reg6|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(10));

-- Location: DDIOOUTCELL_X0_Y34_N11
\Reg6|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(11));

-- Location: DDIOOUTCELL_X9_Y0_N18
\Reg6|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(12));

-- Location: DDIOOUTCELL_X1_Y73_N18
\Reg6|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(13));

-- Location: DDIOOUTCELL_X0_Y27_N25
\Reg6|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(14));

-- Location: DDIOOUTCELL_X0_Y13_N4
\Reg6|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector10~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg6|output\(15));

-- Location: DDIOOUTCELL_X0_Y4_N25
\Reg7|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(0));

-- Location: DDIOOUTCELL_X11_Y73_N4
\Reg7|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(1));

-- Location: DDIOOUTCELL_X11_Y73_N18
\Reg7|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(2));

-- Location: DDIOOUTCELL_X0_Y19_N4
\Reg7|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(3));

-- Location: DDIOOUTCELL_X7_Y73_N25
\Reg7|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(4));

-- Location: DDIOOUTCELL_X11_Y0_N25
\Reg7|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(5));

-- Location: DDIOOUTCELL_X11_Y73_N25
\Reg7|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(6));

-- Location: DDIOOUTCELL_X11_Y0_N4
\Reg7|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(7));

-- Location: DDIOOUTCELL_X0_Y11_N25
\Reg7|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(8));

-- Location: DDIOOUTCELL_X0_Y29_N18
\Reg7|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(9));

-- Location: DDIOOUTCELL_X11_Y0_N11
\Reg7|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(10));

-- Location: DDIOOUTCELL_X0_Y34_N4
\Reg7|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(11));

-- Location: DDIOOUTCELL_X11_Y0_N18
\Reg7|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(12));

-- Location: DDIOOUTCELL_X7_Y73_N18
\Reg7|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(13));

-- Location: DDIOOUTCELL_X0_Y34_N25
\Reg7|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(14));

-- Location: DDIOOUTCELL_X0_Y16_N18
\Reg7|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Reg7|output\(15));

-- Location: DDIOOUTCELL_X0_Y7_N11
\RegA|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[0]~25_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(0));

-- Location: DDIOOUTCELL_X23_Y73_N11
\RegA|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[1]~31_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(1));

-- Location: DDIOOUTCELL_X23_Y73_N4
\RegA|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[2]~37_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(2));

-- Location: DDIOOUTCELL_X0_Y21_N18
\RegA|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[3]~43_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(3));

-- Location: DDIOOUTCELL_X3_Y73_N4
\RegA|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[4]~49_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(4));

-- Location: DDIOOUTCELL_X20_Y0_N4
\RegA|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[5]~55_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(5));

-- Location: DDIOOUTCELL_X23_Y73_N18
\RegA|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[6]~61_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(6));

-- Location: DDIOOUTCELL_X23_Y0_N25
\RegA|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[7]~67_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(7));

-- Location: DDIOOUTCELL_X0_Y10_N18
\RegA|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[8]~73_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(8));

-- Location: DDIOOUTCELL_X0_Y28_N25
\RegA|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[9]~79_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(9));

-- Location: DDIOOUTCELL_X20_Y0_N25
\RegA|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[10]~85_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(10));

-- Location: DDIOOUTCELL_X0_Y44_N25
\RegA|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[11]~91_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(11));

-- Location: DDIOOUTCELL_X0_Y10_N25
\RegA|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[12]~97_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(12));

-- Location: DDIOOUTCELL_X13_Y73_N25
\RegA|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[13]~103_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(13));

-- Location: DDIOOUTCELL_X0_Y23_N18
\RegA|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[14]~109_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(14));

-- Location: DDIOOUTCELL_X0_Y21_N25
\RegA|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Mux|output[15]~115_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|Selector7~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegA|output\(15));

-- Location: DDIOOUTCELL_X0_Y44_N18
\RegG|output[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:0:AdderX|sum~0_combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(0));

-- Location: DDIOOUTCELL_X0_Y44_N4
\RegG|output[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:1:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(1));

-- Location: DDIOOUTCELL_X0_Y44_N11
\RegG|output[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:2:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(2));

-- Location: DDIOOUTCELL_X0_Y48_N11
\RegG|output[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:3:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(3));

-- Location: DDIOOUTCELL_X0_Y52_N18
\RegG|output[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:4:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(4));

-- Location: DDIOOUTCELL_X0_Y51_N18
\RegG|output[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:5:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(5));

-- Location: LCCOMB_X1_Y55_N30
\Adder|Gen_Adder:6:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:6:AdderX|sum~combout\ = \RegA|output[6]~_Duplicate_1_q\ $ (\Ctrl|AddSub~0_combout\ $ (\Mux|output[6]~61_combout\ $ (\Adder|Gen_Adder:5:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[6]~_Duplicate_1_q\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \Mux|output[6]~61_combout\,
	datad => \Adder|Gen_Adder:5:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:6:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y52_N4
\RegG|output[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:6:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(6));

-- Location: LCCOMB_X1_Y55_N20
\Adder|Gen_Adder:7:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:7:AdderX|sum~combout\ = \Mux|output[7]~67_combout\ $ (\Ctrl|AddSub~0_combout\ $ (\RegA|output[7]~_Duplicate_1_q\ $ (\Adder|Gen_Adder:6:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[7]~67_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[7]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:6:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:7:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y57_N25
\RegG|output[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:7:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(7));

-- Location: LCCOMB_X1_Y57_N16
\Adder|Gen_Adder:8:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:8:AdderX|sum~combout\ = \Ctrl|AddSub~0_combout\ $ (\RegA|output[8]~_Duplicate_1_q\ $ (\Mux|output[8]~73_combout\ $ (\Adder|Gen_Adder:7:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \RegA|output[8]~_Duplicate_1_q\,
	datac => \Mux|output[8]~73_combout\,
	datad => \Adder|Gen_Adder:7:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:8:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y57_N18
\RegG|output[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:8:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(8));

-- Location: LCCOMB_X1_Y53_N0
\Adder|Gen_Adder:9:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:9:AdderX|sum~combout\ = \RegA|output[9]~_Duplicate_1_q\ $ (\Ctrl|AddSub~0_combout\ $ (\Mux|output[9]~79_combout\ $ (\Adder|Gen_Adder:8:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[9]~_Duplicate_1_q\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \Mux|output[9]~79_combout\,
	datad => \Adder|Gen_Adder:8:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:9:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y53_N4
\RegG|output[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:9:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(9));

-- Location: LCCOMB_X1_Y52_N16
\Adder|Gen_Adder:10:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:10:AdderX|sum~combout\ = \Ctrl|AddSub~0_combout\ $ (\RegA|output[10]~_Duplicate_1_q\ $ (\Mux|output[10]~85_combout\ $ (\Adder|Gen_Adder:9:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ctrl|AddSub~0_combout\,
	datab => \RegA|output[10]~_Duplicate_1_q\,
	datac => \Mux|output[10]~85_combout\,
	datad => \Adder|Gen_Adder:9:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:10:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y52_N25
\RegG|output[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:10:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(10));

-- Location: LCCOMB_X1_Y54_N8
\Adder|Gen_Adder:11:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:11:AdderX|sum~combout\ = \RegA|output[11]~_Duplicate_1_q\ $ (\Mux|output[11]~91_combout\ $ (\Adder|Gen_Adder:10:AdderX|c_out~0_combout\ $ (\Ctrl|AddSub~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[11]~_Duplicate_1_q\,
	datab => \Mux|output[11]~91_combout\,
	datac => \Adder|Gen_Adder:10:AdderX|c_out~0_combout\,
	datad => \Ctrl|AddSub~0_combout\,
	combout => \Adder|Gen_Adder:11:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y54_N11
\RegG|output[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:11:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(11));

-- Location: LCCOMB_X1_Y55_N26
\Adder|Gen_Adder:12:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:12:AdderX|sum~combout\ = \RegA|output[12]~_Duplicate_1_q\ $ (\Ctrl|AddSub~0_combout\ $ (\Mux|output[12]~97_combout\ $ (\Adder|Gen_Adder:11:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[12]~_Duplicate_1_q\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \Mux|output[12]~97_combout\,
	datad => \Adder|Gen_Adder:11:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:12:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y55_N18
\RegG|output[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:12:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(12));

-- Location: DDIOOUTCELL_X0_Y53_N11
\RegG|output[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:13:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(13));

-- Location: DDIOOUTCELL_X0_Y55_N11
\RegG|output[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:14:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(14));

-- Location: LCCOMB_X2_Y55_N12
\Adder|Gen_Adder:14:AdderX|c_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:14:AdderX|c_out~0_combout\ = (\RegA|output[14]~_Duplicate_1_q\ & ((\Adder|Gen_Adder:13:AdderX|c_out~0_combout\) # (\Mux|output[14]~109_combout\ $ (\Ctrl|AddSub~0_combout\)))) # (!\RegA|output[14]~_Duplicate_1_q\ & 
-- (\Adder|Gen_Adder:13:AdderX|c_out~0_combout\ & (\Mux|output[14]~109_combout\ $ (\Ctrl|AddSub~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux|output[14]~109_combout\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \RegA|output[14]~_Duplicate_1_q\,
	datad => \Adder|Gen_Adder:13:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:14:AdderX|c_out~0_combout\);

-- Location: LCCOMB_X2_Y55_N4
\Adder|Gen_Adder:15:AdderX|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder|Gen_Adder:15:AdderX|sum~combout\ = \RegA|output[15]~_Duplicate_1_q\ $ (\Ctrl|AddSub~0_combout\ $ (\Mux|output[15]~115_combout\ $ (\Adder|Gen_Adder:14:AdderX|c_out~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegA|output[15]~_Duplicate_1_q\,
	datab => \Ctrl|AddSub~0_combout\,
	datac => \Mux|output[15]~115_combout\,
	datad => \Adder|Gen_Adder:14:AdderX|c_out~0_combout\,
	combout => \Adder|Gen_Adder:15:AdderX|sum~combout\);

-- Location: DDIOOUTCELL_X0_Y55_N25
\RegG|output[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_Clk~inputclkctrl_outclk\,
	d => \Adder|Gen_Adder:15:AdderX|sum~combout\,
	clrn => \Resetn~inputclkctrl_outclk\,
	ena => \Ctrl|state.C~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegG|output\(15));

ww_Data_Bus(0) <= \Data_Bus[0]~output_o\;

ww_Data_Bus(1) <= \Data_Bus[1]~output_o\;

ww_Data_Bus(2) <= \Data_Bus[2]~output_o\;

ww_Data_Bus(3) <= \Data_Bus[3]~output_o\;

ww_Data_Bus(4) <= \Data_Bus[4]~output_o\;

ww_Data_Bus(5) <= \Data_Bus[5]~output_o\;

ww_Data_Bus(6) <= \Data_Bus[6]~output_o\;

ww_Data_Bus(7) <= \Data_Bus[7]~output_o\;

ww_Data_Bus(8) <= \Data_Bus[8]~output_o\;

ww_Data_Bus(9) <= \Data_Bus[9]~output_o\;

ww_Data_Bus(10) <= \Data_Bus[10]~output_o\;

ww_Data_Bus(11) <= \Data_Bus[11]~output_o\;

ww_Data_Bus(12) <= \Data_Bus[12]~output_o\;

ww_Data_Bus(13) <= \Data_Bus[13]~output_o\;

ww_Data_Bus(14) <= \Data_Bus[14]~output_o\;

ww_Data_Bus(15) <= \Data_Bus[15]~output_o\;

ww_InR(0) <= \InR[0]~output_o\;

ww_InR(1) <= \InR[1]~output_o\;

ww_InR(2) <= \InR[2]~output_o\;

ww_InR(3) <= \InR[3]~output_o\;

ww_InR(4) <= \InR[4]~output_o\;

ww_InR(5) <= \InR[5]~output_o\;

ww_InR(6) <= \InR[6]~output_o\;

ww_InR(7) <= \InR[7]~output_o\;

ww_InR(8) <= \InR[8]~output_o\;

ww_R0(0) <= \R0[0]~output_o\;

ww_R0(1) <= \R0[1]~output_o\;

ww_R0(2) <= \R0[2]~output_o\;

ww_R0(3) <= \R0[3]~output_o\;

ww_R0(4) <= \R0[4]~output_o\;

ww_R0(5) <= \R0[5]~output_o\;

ww_R0(6) <= \R0[6]~output_o\;

ww_R0(7) <= \R0[7]~output_o\;

ww_R0(8) <= \R0[8]~output_o\;

ww_R0(9) <= \R0[9]~output_o\;

ww_R0(10) <= \R0[10]~output_o\;

ww_R0(11) <= \R0[11]~output_o\;

ww_R0(12) <= \R0[12]~output_o\;

ww_R0(13) <= \R0[13]~output_o\;

ww_R0(14) <= \R0[14]~output_o\;

ww_R0(15) <= \R0[15]~output_o\;

ww_R1(0) <= \R1[0]~output_o\;

ww_R1(1) <= \R1[1]~output_o\;

ww_R1(2) <= \R1[2]~output_o\;

ww_R1(3) <= \R1[3]~output_o\;

ww_R1(4) <= \R1[4]~output_o\;

ww_R1(5) <= \R1[5]~output_o\;

ww_R1(6) <= \R1[6]~output_o\;

ww_R1(7) <= \R1[7]~output_o\;

ww_R1(8) <= \R1[8]~output_o\;

ww_R1(9) <= \R1[9]~output_o\;

ww_R1(10) <= \R1[10]~output_o\;

ww_R1(11) <= \R1[11]~output_o\;

ww_R1(12) <= \R1[12]~output_o\;

ww_R1(13) <= \R1[13]~output_o\;

ww_R1(14) <= \R1[14]~output_o\;

ww_R1(15) <= \R1[15]~output_o\;

ww_R2(0) <= \R2[0]~output_o\;

ww_R2(1) <= \R2[1]~output_o\;

ww_R2(2) <= \R2[2]~output_o\;

ww_R2(3) <= \R2[3]~output_o\;

ww_R2(4) <= \R2[4]~output_o\;

ww_R2(5) <= \R2[5]~output_o\;

ww_R2(6) <= \R2[6]~output_o\;

ww_R2(7) <= \R2[7]~output_o\;

ww_R2(8) <= \R2[8]~output_o\;

ww_R2(9) <= \R2[9]~output_o\;

ww_R2(10) <= \R2[10]~output_o\;

ww_R2(11) <= \R2[11]~output_o\;

ww_R2(12) <= \R2[12]~output_o\;

ww_R2(13) <= \R2[13]~output_o\;

ww_R2(14) <= \R2[14]~output_o\;

ww_R2(15) <= \R2[15]~output_o\;

ww_R3(0) <= \R3[0]~output_o\;

ww_R3(1) <= \R3[1]~output_o\;

ww_R3(2) <= \R3[2]~output_o\;

ww_R3(3) <= \R3[3]~output_o\;

ww_R3(4) <= \R3[4]~output_o\;

ww_R3(5) <= \R3[5]~output_o\;

ww_R3(6) <= \R3[6]~output_o\;

ww_R3(7) <= \R3[7]~output_o\;

ww_R3(8) <= \R3[8]~output_o\;

ww_R3(9) <= \R3[9]~output_o\;

ww_R3(10) <= \R3[10]~output_o\;

ww_R3(11) <= \R3[11]~output_o\;

ww_R3(12) <= \R3[12]~output_o\;

ww_R3(13) <= \R3[13]~output_o\;

ww_R3(14) <= \R3[14]~output_o\;

ww_R3(15) <= \R3[15]~output_o\;

ww_R4(0) <= \R4[0]~output_o\;

ww_R4(1) <= \R4[1]~output_o\;

ww_R4(2) <= \R4[2]~output_o\;

ww_R4(3) <= \R4[3]~output_o\;

ww_R4(4) <= \R4[4]~output_o\;

ww_R4(5) <= \R4[5]~output_o\;

ww_R4(6) <= \R4[6]~output_o\;

ww_R4(7) <= \R4[7]~output_o\;

ww_R4(8) <= \R4[8]~output_o\;

ww_R4(9) <= \R4[9]~output_o\;

ww_R4(10) <= \R4[10]~output_o\;

ww_R4(11) <= \R4[11]~output_o\;

ww_R4(12) <= \R4[12]~output_o\;

ww_R4(13) <= \R4[13]~output_o\;

ww_R4(14) <= \R4[14]~output_o\;

ww_R4(15) <= \R4[15]~output_o\;

ww_R5(0) <= \R5[0]~output_o\;

ww_R5(1) <= \R5[1]~output_o\;

ww_R5(2) <= \R5[2]~output_o\;

ww_R5(3) <= \R5[3]~output_o\;

ww_R5(4) <= \R5[4]~output_o\;

ww_R5(5) <= \R5[5]~output_o\;

ww_R5(6) <= \R5[6]~output_o\;

ww_R5(7) <= \R5[7]~output_o\;

ww_R5(8) <= \R5[8]~output_o\;

ww_R5(9) <= \R5[9]~output_o\;

ww_R5(10) <= \R5[10]~output_o\;

ww_R5(11) <= \R5[11]~output_o\;

ww_R5(12) <= \R5[12]~output_o\;

ww_R5(13) <= \R5[13]~output_o\;

ww_R5(14) <= \R5[14]~output_o\;

ww_R5(15) <= \R5[15]~output_o\;

ww_R6(0) <= \R6[0]~output_o\;

ww_R6(1) <= \R6[1]~output_o\;

ww_R6(2) <= \R6[2]~output_o\;

ww_R6(3) <= \R6[3]~output_o\;

ww_R6(4) <= \R6[4]~output_o\;

ww_R6(5) <= \R6[5]~output_o\;

ww_R6(6) <= \R6[6]~output_o\;

ww_R6(7) <= \R6[7]~output_o\;

ww_R6(8) <= \R6[8]~output_o\;

ww_R6(9) <= \R6[9]~output_o\;

ww_R6(10) <= \R6[10]~output_o\;

ww_R6(11) <= \R6[11]~output_o\;

ww_R6(12) <= \R6[12]~output_o\;

ww_R6(13) <= \R6[13]~output_o\;

ww_R6(14) <= \R6[14]~output_o\;

ww_R6(15) <= \R6[15]~output_o\;

ww_R7(0) <= \R7[0]~output_o\;

ww_R7(1) <= \R7[1]~output_o\;

ww_R7(2) <= \R7[2]~output_o\;

ww_R7(3) <= \R7[3]~output_o\;

ww_R7(4) <= \R7[4]~output_o\;

ww_R7(5) <= \R7[5]~output_o\;

ww_R7(6) <= \R7[6]~output_o\;

ww_R7(7) <= \R7[7]~output_o\;

ww_R7(8) <= \R7[8]~output_o\;

ww_R7(9) <= \R7[9]~output_o\;

ww_R7(10) <= \R7[10]~output_o\;

ww_R7(11) <= \R7[11]~output_o\;

ww_R7(12) <= \R7[12]~output_o\;

ww_R7(13) <= \R7[13]~output_o\;

ww_R7(14) <= \R7[14]~output_o\;

ww_R7(15) <= \R7[15]~output_o\;

ww_RA(0) <= \RA[0]~output_o\;

ww_RA(1) <= \RA[1]~output_o\;

ww_RA(2) <= \RA[2]~output_o\;

ww_RA(3) <= \RA[3]~output_o\;

ww_RA(4) <= \RA[4]~output_o\;

ww_RA(5) <= \RA[5]~output_o\;

ww_RA(6) <= \RA[6]~output_o\;

ww_RA(7) <= \RA[7]~output_o\;

ww_RA(8) <= \RA[8]~output_o\;

ww_RA(9) <= \RA[9]~output_o\;

ww_RA(10) <= \RA[10]~output_o\;

ww_RA(11) <= \RA[11]~output_o\;

ww_RA(12) <= \RA[12]~output_o\;

ww_RA(13) <= \RA[13]~output_o\;

ww_RA(14) <= \RA[14]~output_o\;

ww_RA(15) <= \RA[15]~output_o\;

ww_RG(0) <= \RG[0]~output_o\;

ww_RG(1) <= \RG[1]~output_o\;

ww_RG(2) <= \RG[2]~output_o\;

ww_RG(3) <= \RG[3]~output_o\;

ww_RG(4) <= \RG[4]~output_o\;

ww_RG(5) <= \RG[5]~output_o\;

ww_RG(6) <= \RG[6]~output_o\;

ww_RG(7) <= \RG[7]~output_o\;

ww_RG(8) <= \RG[8]~output_o\;

ww_RG(9) <= \RG[9]~output_o\;

ww_RG(10) <= \RG[10]~output_o\;

ww_RG(11) <= \RG[11]~output_o\;

ww_RG(12) <= \RG[12]~output_o\;

ww_RG(13) <= \RG[13]~output_o\;

ww_RG(14) <= \RG[14]~output_o\;

ww_RG(15) <= \RG[15]~output_o\;

ww_Done <= \Done~output_o\;
END structure;


