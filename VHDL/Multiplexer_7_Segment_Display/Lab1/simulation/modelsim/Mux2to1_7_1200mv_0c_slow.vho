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

-- DATE "03/05/2015 21:02:05"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab1d IS
    PORT (
	SW : IN std_logic_vector(17 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END Lab1d;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[16]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[17]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab1d IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \Mux4|Gen_Mux:1:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \Mux1|Gen_Mux:1:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \Mux0|Gen_Mux:1:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \Mux1|Gen_Mux:2:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \Mux4|Gen_Mux:2:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux0|Gen_Mux:2:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \Mux4|Gen_Mux:0:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \Mux1|Gen_Mux:0:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux0|Gen_Mux:0:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Dec0|Mux6~0_combout\ : std_logic;
SIGNAL \Dec0|Mux5~0_combout\ : std_logic;
SIGNAL \Dec0|Mux4~0_combout\ : std_logic;
SIGNAL \Dec0|Mux3~0_combout\ : std_logic;
SIGNAL \Dec0|Mux2~0_combout\ : std_logic;
SIGNAL \Dec0|Mux1~0_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:1:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux1|Gen_Mux:1:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:2:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux1|Gen_Mux:2:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:0:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux1|Gen_Mux:0:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Dec1|Mux6~0_combout\ : std_logic;
SIGNAL \Dec1|Mux5~0_combout\ : std_logic;
SIGNAL \Dec1|Mux4~0_combout\ : std_logic;
SIGNAL \Dec1|Mux3~0_combout\ : std_logic;
SIGNAL \Dec1|Mux2~0_combout\ : std_logic;
SIGNAL \Dec1|Mux1~0_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:0:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:0:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:1:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:1:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:2:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:2:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\ : std_logic;
SIGNAL \Dec2|Mux6~0_combout\ : std_logic;
SIGNAL \Dec2|Mux5~0_combout\ : std_logic;
SIGNAL \Dec2|Mux4~0_combout\ : std_logic;
SIGNAL \Dec2|Mux3~0_combout\ : std_logic;
SIGNAL \Dec2|Mux2~0_combout\ : std_logic;
SIGNAL \Dec2|Mux1~0_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:2:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux3|Gen_Mux:2:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:1:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux3|Gen_Mux:1:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:0:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Mux3|Gen_Mux:0:MuxX|Mux0~0_combout\ : std_logic;
SIGNAL \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\ : std_logic;
SIGNAL \Dec3|Mux6~0_combout\ : std_logic;
SIGNAL \Dec3|Mux5~0_combout\ : std_logic;
SIGNAL \Dec3|Mux4~0_combout\ : std_logic;
SIGNAL \Dec3|Mux3~0_combout\ : std_logic;
SIGNAL \Dec3|Mux2~0_combout\ : std_logic;
SIGNAL \Dec3|Mux1~0_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:2:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:0:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:1:MuxX|Mux0~2_combout\ : std_logic;
SIGNAL \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\ : std_logic;
SIGNAL \Dec4|Mux6~0_combout\ : std_logic;
SIGNAL \Dec4|Mux5~0_combout\ : std_logic;
SIGNAL \Dec4|Mux4~0_combout\ : std_logic;
SIGNAL \Dec4|Mux3~0_combout\ : std_logic;
SIGNAL \Dec4|Mux2~0_combout\ : std_logic;
SIGNAL \Dec4|Mux1~0_combout\ : std_logic;
SIGNAL \Dec4|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \Dec3|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \Dec2|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \Dec1|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \Dec0|ALT_INV_Mux6~0_combout\ : std_logic;

BEGIN

ww_SW <= SW;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\Dec4|ALT_INV_Mux6~0_combout\ <= NOT \Dec4|Mux6~0_combout\;
\Dec3|ALT_INV_Mux6~0_combout\ <= NOT \Dec3|Mux6~0_combout\;
\Dec2|ALT_INV_Mux6~0_combout\ <= NOT \Dec2|Mux6~0_combout\;
\Dec1|ALT_INV_Mux6~0_combout\ <= NOT \Dec1|Mux6~0_combout\;
\Dec0|ALT_INV_Mux6~0_combout\ <= NOT \Dec0|Mux6~0_combout\;

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec0|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec0|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec0|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec0|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec0|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec1|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec1|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec1|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec2|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec2|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec2|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec2|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec2|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec2|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec2|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec3|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec3|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec3|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec3|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec3|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec3|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec3|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec4|ALT_INV_Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec4|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec4|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec4|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec4|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec4|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Dec4|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOIBUF_X115_Y13_N1
\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: LCCOMB_X114_Y14_N26
\Mux4|Gen_Mux:1:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:1:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & ((\SW[7]~input_o\))) # (!\SW[16]~input_o\ & (\SW[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[16]~input_o\,
	datac => \SW[13]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \Mux4|Gen_Mux:1:MuxX|Mux0~0_combout\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LCCOMB_X114_Y14_N0
\Mux1|Gen_Mux:1:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:1:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & ((\SW[4]~input_o\))) # (!\SW[16]~input_o\ & (\SW[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[16]~input_o\,
	datac => \SW[10]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \Mux1|Gen_Mux:1:MuxX|Mux0~0_combout\);

-- Location: IOIBUF_X115_Y14_N8
\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: LCCOMB_X114_Y14_N12
\Mux0|Gen_Mux:1:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0|Gen_Mux:1:MuxX|Mux0~0_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux1|Gen_Mux:1:MuxX|Mux0~0_combout\))) # (!\SW[15]~input_o\ & (\Mux4|Gen_Mux:1:MuxX|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:1:MuxX|Mux0~0_combout\,
	datab => \Mux1|Gen_Mux:1:MuxX|Mux0~0_combout\,
	datac => \SW[17]~input_o\,
	datad => \SW[15]~input_o\,
	combout => \Mux0|Gen_Mux:1:MuxX|Mux0~0_combout\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LCCOMB_X114_Y14_N14
\Mux0|Gen_Mux:1:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ = (\Mux0|Gen_Mux:1:MuxX|Mux0~0_combout\) # ((\SW[1]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0|Gen_Mux:1:MuxX|Mux0~0_combout\,
	datab => \SW[1]~input_o\,
	datac => \SW[17]~input_o\,
	combout => \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: LCCOMB_X114_Y15_N24
\Mux1|Gen_Mux:2:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:2:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & ((\SW[5]~input_o\))) # (!\SW[16]~input_o\ & (\SW[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[11]~input_o\,
	datac => \SW[16]~input_o\,
	datad => \SW[5]~input_o\,
	combout => \Mux1|Gen_Mux:2:MuxX|Mux0~0_combout\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: LCCOMB_X114_Y15_N2
\Mux4|Gen_Mux:2:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:2:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & ((\SW[8]~input_o\))) # (!\SW[16]~input_o\ & (\SW[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[16]~input_o\,
	datac => \SW[14]~input_o\,
	datad => \SW[8]~input_o\,
	combout => \Mux4|Gen_Mux:2:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y15_N20
\Mux0|Gen_Mux:2:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0|Gen_Mux:2:MuxX|Mux0~0_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & (\Mux1|Gen_Mux:2:MuxX|Mux0~0_combout\)) # (!\SW[15]~input_o\ & ((\Mux4|Gen_Mux:2:MuxX|Mux0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[17]~input_o\,
	datab => \Mux1|Gen_Mux:2:MuxX|Mux0~0_combout\,
	datac => \SW[15]~input_o\,
	datad => \Mux4|Gen_Mux:2:MuxX|Mux0~0_combout\,
	combout => \Mux0|Gen_Mux:2:MuxX|Mux0~0_combout\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LCCOMB_X114_Y15_N22
\Mux0|Gen_Mux:2:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\ = (\Mux0|Gen_Mux:2:MuxX|Mux0~0_combout\) # ((\SW[17]~input_o\ & \SW[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[17]~input_o\,
	datab => \Mux0|Gen_Mux:2:MuxX|Mux0~0_combout\,
	datad => \SW[2]~input_o\,
	combout => \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: LCCOMB_X114_Y18_N26
\Mux4|Gen_Mux:0:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:0:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & ((\SW[6]~input_o\))) # (!\SW[16]~input_o\ & (\SW[12]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[12]~input_o\,
	datac => \SW[6]~input_o\,
	datad => \SW[16]~input_o\,
	combout => \Mux4|Gen_Mux:0:MuxX|Mux0~0_combout\);

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: LCCOMB_X114_Y18_N16
\Mux1|Gen_Mux:0:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:0:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & (\SW[3]~input_o\)) # (!\SW[16]~input_o\ & ((\SW[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[16]~input_o\,
	datac => \SW[9]~input_o\,
	combout => \Mux1|Gen_Mux:0:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y18_N4
\Mux0|Gen_Mux:0:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0|Gen_Mux:0:MuxX|Mux0~0_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux1|Gen_Mux:0:MuxX|Mux0~0_combout\))) # (!\SW[15]~input_o\ & (\Mux4|Gen_Mux:0:MuxX|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \SW[17]~input_o\,
	datac => \Mux4|Gen_Mux:0:MuxX|Mux0~0_combout\,
	datad => \Mux1|Gen_Mux:0:MuxX|Mux0~0_combout\,
	combout => \Mux0|Gen_Mux:0:MuxX|Mux0~0_combout\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X114_Y18_N6
\Mux0|Gen_Mux:0:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\ = (\Mux0|Gen_Mux:0:MuxX|Mux0~0_combout\) # ((\SW[17]~input_o\ & \SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux0|Gen_Mux:0:MuxX|Mux0~0_combout\,
	datac => \SW[17]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y15_N8
\Dec0|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec0|Mux6~0_combout\ = (\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & (!\Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\)) # (!\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & (\Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\ & !\Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datac => \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datad => \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec0|Mux6~0_combout\);

-- Location: LCCOMB_X114_Y15_N26
\Dec0|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec0|Mux5~0_combout\ = (\Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\) # ((!\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & !\Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datac => \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datad => \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec0|Mux5~0_combout\);

-- Location: LCCOMB_X114_Y15_N12
\Dec0|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec0|Mux4~0_combout\ = (\Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\) # (\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ $ (!\Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datac => \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datad => \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec0|Mux4~0_combout\);

-- Location: LCCOMB_X114_Y15_N14
\Dec0|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec0|Mux3~0_combout\ = (\Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\) # ((!\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datac => \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datad => \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec0|Mux3~0_combout\);

-- Location: LCCOMB_X114_Y15_N0
\Dec0|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec0|Mux2~0_combout\ = (\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & ((\Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\) # (!\Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\))) # (!\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & ((\Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datac => \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datad => \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec0|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y15_N10
\Dec0|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec0|Mux1~0_combout\ = (\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & (\Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\)) # (!\Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\ & ((\Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux0|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datac => \Mux0|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datad => \Mux0|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec0|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y14_N8
\Mux2|Gen_Mux:1:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:1:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & (\SW[1]~input_o\)) # (!\SW[16]~input_o\ & ((\SW[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[1]~input_o\,
	datac => \SW[16]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \Mux2|Gen_Mux:1:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y14_N10
\Mux1|Gen_Mux:1:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:1:MuxX|Mux0~1_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & (\Mux2|Gen_Mux:1:MuxX|Mux0~0_combout\)) # (!\SW[15]~input_o\ & ((\Mux1|Gen_Mux:1:MuxX|Mux0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \Mux2|Gen_Mux:1:MuxX|Mux0~0_combout\,
	datac => \SW[17]~input_o\,
	datad => \Mux1|Gen_Mux:1:MuxX|Mux0~0_combout\,
	combout => \Mux1|Gen_Mux:1:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y14_N4
\Mux1|Gen_Mux:1:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ = (\Mux1|Gen_Mux:1:MuxX|Mux0~1_combout\) # ((\SW[17]~input_o\ & \SW[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datab => \SW[17]~input_o\,
	datac => \SW[13]~input_o\,
	combout => \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y15_N4
\Mux2|Gen_Mux:2:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:2:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & ((\SW[2]~input_o\))) # (!\SW[16]~input_o\ & (\SW[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datac => \SW[16]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \Mux2|Gen_Mux:2:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y15_N30
\Mux1|Gen_Mux:2:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:2:MuxX|Mux0~1_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & (\Mux2|Gen_Mux:2:MuxX|Mux0~0_combout\)) # (!\SW[15]~input_o\ & ((\Mux1|Gen_Mux:2:MuxX|Mux0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[17]~input_o\,
	datab => \Mux2|Gen_Mux:2:MuxX|Mux0~0_combout\,
	datac => \SW[15]~input_o\,
	datad => \Mux1|Gen_Mux:2:MuxX|Mux0~0_combout\,
	combout => \Mux1|Gen_Mux:2:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y14_N22
\Mux1|Gen_Mux:2:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\ = (\Mux1|Gen_Mux:2:MuxX|Mux0~1_combout\) # ((\SW[14]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[14]~input_o\,
	datab => \SW[17]~input_o\,
	datac => \Mux1|Gen_Mux:2:MuxX|Mux0~1_combout\,
	combout => \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y17_N16
\Mux2|Gen_Mux:0:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:0:MuxX|Mux0~0_combout\ = (\SW[16]~input_o\ & ((\SW[0]~input_o\))) # (!\SW[16]~input_o\ & (\SW[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[6]~input_o\,
	datac => \SW[16]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Mux2|Gen_Mux:0:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y18_N24
\Mux1|Gen_Mux:0:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:0:MuxX|Mux0~1_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux2|Gen_Mux:0:MuxX|Mux0~0_combout\))) # (!\SW[15]~input_o\ & (\Mux1|Gen_Mux:0:MuxX|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \Mux1|Gen_Mux:0:MuxX|Mux0~0_combout\,
	datac => \SW[17]~input_o\,
	datad => \Mux2|Gen_Mux:0:MuxX|Mux0~0_combout\,
	combout => \Mux1|Gen_Mux:0:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y18_N18
\Mux1|Gen_Mux:0:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\ = (\Mux1|Gen_Mux:0:MuxX|Mux0~1_combout\) # ((\SW[17]~input_o\ & \SW[12]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux1|Gen_Mux:0:MuxX|Mux0~1_combout\,
	datac => \SW[17]~input_o\,
	datad => \SW[12]~input_o\,
	combout => \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y18_N28
\Dec1|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec1|Mux6~0_combout\ = (\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & (!\Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\)) # (!\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & (\Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\ & !\Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\,
	datab => \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datad => \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\,
	combout => \Dec1|Mux6~0_combout\);

-- Location: LCCOMB_X114_Y18_N22
\Dec1|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec1|Mux5~0_combout\ = (\Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\) # ((!\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & !\Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\,
	datab => \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datad => \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\,
	combout => \Dec1|Mux5~0_combout\);

-- Location: LCCOMB_X114_Y18_N8
\Dec1|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec1|Mux4~0_combout\ = (\Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\) # (\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ $ (!\Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\,
	datab => \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datad => \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\,
	combout => \Dec1|Mux4~0_combout\);

-- Location: LCCOMB_X114_Y18_N2
\Dec1|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec1|Mux3~0_combout\ = (\Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\) # ((!\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\,
	datab => \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datad => \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\,
	combout => \Dec1|Mux3~0_combout\);

-- Location: LCCOMB_X114_Y18_N12
\Dec1|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec1|Mux2~0_combout\ = (\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & ((\Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\) # (!\Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\))) # (!\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & ((\Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\,
	datab => \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datad => \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\,
	combout => \Dec1|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y18_N14
\Dec1|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec1|Mux1~0_combout\ = (\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & (\Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\)) # (!\Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\ & ((\Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux1|Gen_Mux:1:MuxX|Mux0~2_combout\,
	datab => \Mux1|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datad => \Mux1|Gen_Mux:0:MuxX|Mux0~2_combout\,
	combout => \Dec1|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y18_N0
\Mux2|Gen_Mux:0:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:0:MuxX|Mux0~1_combout\ = (\SW[16]~input_o\ & ((\SW[12]~input_o\))) # (!\SW[16]~input_o\ & (\SW[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[12]~input_o\,
	datad => \SW[16]~input_o\,
	combout => \Mux2|Gen_Mux:0:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y17_N10
\Mux2|Gen_Mux:0:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:0:MuxX|Mux0~2_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux2|Gen_Mux:0:MuxX|Mux0~1_combout\))) # (!\SW[15]~input_o\ & (\Mux2|Gen_Mux:0:MuxX|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~0_combout\,
	datab => \Mux2|Gen_Mux:0:MuxX|Mux0~1_combout\,
	datac => \SW[17]~input_o\,
	datad => \SW[15]~input_o\,
	combout => \Mux2|Gen_Mux:0:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y17_N12
\Mux2|Gen_Mux:0:MuxX|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ = (\Mux2|Gen_Mux:0:MuxX|Mux0~2_combout\) # ((\SW[9]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~2_combout\,
	datab => \SW[9]~input_o\,
	datac => \SW[17]~input_o\,
	combout => \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\);

-- Location: LCCOMB_X114_Y14_N24
\Mux2|Gen_Mux:1:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:1:MuxX|Mux0~1_combout\ = (\SW[16]~input_o\ & (\SW[13]~input_o\)) # (!\SW[16]~input_o\ & ((\SW[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[16]~input_o\,
	datac => \SW[13]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \Mux2|Gen_Mux:1:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y14_N2
\Mux2|Gen_Mux:1:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:1:MuxX|Mux0~2_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux2|Gen_Mux:1:MuxX|Mux0~1_combout\))) # (!\SW[15]~input_o\ & (\Mux2|Gen_Mux:1:MuxX|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \Mux2|Gen_Mux:1:MuxX|Mux0~0_combout\,
	datac => \SW[17]~input_o\,
	datad => \Mux2|Gen_Mux:1:MuxX|Mux0~1_combout\,
	combout => \Mux2|Gen_Mux:1:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y14_N28
\Mux2|Gen_Mux:1:MuxX|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\ = (\Mux2|Gen_Mux:1:MuxX|Mux0~2_combout\) # ((\SW[10]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[10]~input_o\,
	datac => \SW[17]~input_o\,
	datad => \Mux2|Gen_Mux:1:MuxX|Mux0~2_combout\,
	combout => \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\);

-- Location: LCCOMB_X113_Y11_N24
\Mux2|Gen_Mux:2:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:2:MuxX|Mux0~1_combout\ = (\SW[16]~input_o\ & (\SW[14]~input_o\)) # (!\SW[16]~input_o\ & ((\SW[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[14]~input_o\,
	datab => \SW[5]~input_o\,
	datac => \SW[16]~input_o\,
	combout => \Mux2|Gen_Mux:2:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y15_N16
\Mux2|Gen_Mux:2:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:2:MuxX|Mux0~2_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux2|Gen_Mux:2:MuxX|Mux0~1_combout\))) # (!\SW[15]~input_o\ & (\Mux2|Gen_Mux:2:MuxX|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[17]~input_o\,
	datab => \Mux2|Gen_Mux:2:MuxX|Mux0~0_combout\,
	datac => \SW[15]~input_o\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~1_combout\,
	combout => \Mux2|Gen_Mux:2:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y17_N6
\Mux2|Gen_Mux:2:MuxX|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\ = (\Mux2|Gen_Mux:2:MuxX|Mux0~2_combout\) # ((\SW[11]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[11]~input_o\,
	datab => \Mux2|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datac => \SW[17]~input_o\,
	combout => \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\);

-- Location: LCCOMB_X114_Y17_N8
\Dec2|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec2|Mux6~0_combout\ = (\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\ & ((!\Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\))) # (!\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\ & (!\Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ & \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datac => \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\,
	combout => \Dec2|Mux6~0_combout\);

-- Location: LCCOMB_X114_Y17_N26
\Dec2|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec2|Mux5~0_combout\ = (\Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\) # ((!\Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ & !\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datac => \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\,
	combout => \Dec2|Mux5~0_combout\);

-- Location: LCCOMB_X114_Y17_N28
\Dec2|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec2|Mux4~0_combout\ = (\Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\) # (\Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ $ (!\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datac => \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\,
	combout => \Dec2|Mux4~0_combout\);

-- Location: LCCOMB_X114_Y17_N22
\Dec2|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec2|Mux3~0_combout\ = (\Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\) # ((\Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ & !\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datac => \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\,
	combout => \Dec2|Mux3~0_combout\);

-- Location: LCCOMB_X114_Y17_N0
\Dec2|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec2|Mux2~0_combout\ = (\Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ & ((\Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\) # (!\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\))) # (!\Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\ & (\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datac => \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\,
	combout => \Dec2|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y17_N18
\Dec2|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec2|Mux1~0_combout\ = (\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\ & ((\Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\))) # (!\Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\ & (\Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datac => \Mux2|Gen_Mux:1:MuxX|Mux0~3_combout\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~3_combout\,
	combout => \Dec2|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N18
\Mux4|Gen_Mux:2:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:2:MuxX|Mux0~1_combout\ = (\SW[16]~input_o\ & (\SW[11]~input_o\)) # (!\SW[16]~input_o\ & ((\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[11]~input_o\,
	datac => \SW[16]~input_o\,
	datad => \SW[2]~input_o\,
	combout => \Mux4|Gen_Mux:2:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y15_N28
\Mux3|Gen_Mux:2:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3|Gen_Mux:2:MuxX|Mux0~0_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & (\Mux4|Gen_Mux:2:MuxX|Mux0~1_combout\)) # (!\SW[15]~input_o\ & ((\Mux2|Gen_Mux:2:MuxX|Mux0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[17]~input_o\,
	datab => \Mux4|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \SW[15]~input_o\,
	datad => \Mux2|Gen_Mux:2:MuxX|Mux0~1_combout\,
	combout => \Mux3|Gen_Mux:2:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y12_N10
\Mux3|Gen_Mux:2:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\ = (\Mux3|Gen_Mux:2:MuxX|Mux0~0_combout\) # ((\SW[8]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \Mux3|Gen_Mux:2:MuxX|Mux0~0_combout\,
	datad => \SW[17]~input_o\,
	combout => \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y14_N6
\Mux4|Gen_Mux:1:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:1:MuxX|Mux0~1_combout\ = (\SW[16]~input_o\ & (\SW[10]~input_o\)) # (!\SW[16]~input_o\ & ((\SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[16]~input_o\,
	datac => \SW[10]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \Mux4|Gen_Mux:1:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y14_N16
\Mux3|Gen_Mux:1:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3|Gen_Mux:1:MuxX|Mux0~0_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & (\Mux4|Gen_Mux:1:MuxX|Mux0~1_combout\)) # (!\SW[15]~input_o\ & ((\Mux2|Gen_Mux:1:MuxX|Mux0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datab => \Mux2|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datac => \SW[17]~input_o\,
	datad => \SW[15]~input_o\,
	combout => \Mux3|Gen_Mux:1:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y14_N18
\Mux3|Gen_Mux:1:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ = (\Mux3|Gen_Mux:1:MuxX|Mux0~0_combout\) # ((\SW[17]~input_o\ & \SW[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux3|Gen_Mux:1:MuxX|Mux0~0_combout\,
	datac => \SW[17]~input_o\,
	datad => \SW[7]~input_o\,
	combout => \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y18_N10
\Mux4|Gen_Mux:0:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:0:MuxX|Mux0~1_combout\ = (\SW[16]~input_o\ & (\SW[9]~input_o\)) # (!\SW[16]~input_o\ & ((\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[16]~input_o\,
	datac => \SW[9]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Mux4|Gen_Mux:0:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y18_N20
\Mux3|Gen_Mux:0:MuxX|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3|Gen_Mux:0:MuxX|Mux0~0_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux4|Gen_Mux:0:MuxX|Mux0~1_combout\))) # (!\SW[15]~input_o\ & (\Mux2|Gen_Mux:0:MuxX|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[15]~input_o\,
	datab => \Mux2|Gen_Mux:0:MuxX|Mux0~1_combout\,
	datac => \SW[17]~input_o\,
	datad => \Mux4|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Mux3|Gen_Mux:0:MuxX|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y12_N16
\Mux3|Gen_Mux:0:MuxX|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\ = (\Mux3|Gen_Mux:0:MuxX|Mux0~0_combout\) # ((\SW[6]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3|Gen_Mux:0:MuxX|Mux0~0_combout\,
	datac => \SW[6]~input_o\,
	datad => \SW[17]~input_o\,
	combout => \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\);

-- Location: LCCOMB_X114_Y12_N12
\Dec3|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec3|Mux6~0_combout\ = (\Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\ & (!\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ & !\Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\)) # (!\Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\ & (\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datad => \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec3|Mux6~0_combout\);

-- Location: LCCOMB_X114_Y12_N14
\Dec3|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec3|Mux5~0_combout\ = (\Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\) # ((!\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ & !\Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datad => \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec3|Mux5~0_combout\);

-- Location: LCCOMB_X114_Y12_N24
\Dec3|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec3|Mux4~0_combout\ = (\Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\) # (\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ $ (!\Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datad => \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec3|Mux4~0_combout\);

-- Location: LCCOMB_X114_Y12_N26
\Dec3|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec3|Mux3~0_combout\ = (\Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\) # ((!\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ & \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datad => \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec3|Mux3~0_combout\);

-- Location: LCCOMB_X114_Y12_N4
\Dec3|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec3|Mux2~0_combout\ = (\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ & ((\Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\) # (!\Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\))) # (!\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ & ((\Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datad => \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec3|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y12_N6
\Dec3|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec3|Mux1~0_combout\ = (\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ & (\Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\)) # (!\Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\ & ((\Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux3|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \Mux3|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datad => \Mux3|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Dec3|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y15_N6
\Mux4|Gen_Mux:2:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:2:MuxX|Mux0~2_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & ((\Mux4|Gen_Mux:2:MuxX|Mux0~0_combout\))) # (!\SW[15]~input_o\ & (\Mux4|Gen_Mux:2:MuxX|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[17]~input_o\,
	datab => \Mux4|Gen_Mux:2:MuxX|Mux0~1_combout\,
	datac => \SW[15]~input_o\,
	datad => \Mux4|Gen_Mux:2:MuxX|Mux0~0_combout\,
	combout => \Mux4|Gen_Mux:2:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X113_Y11_N12
\Mux4|Gen_Mux:2:MuxX|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\ = (\Mux4|Gen_Mux:2:MuxX|Mux0~2_combout\) # ((\SW[17]~input_o\ & \SW[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:2:MuxX|Mux0~2_combout\,
	datab => \SW[17]~input_o\,
	datac => \SW[5]~input_o\,
	combout => \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\);

-- Location: LCCOMB_X114_Y18_N30
\Mux4|Gen_Mux:0:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:0:MuxX|Mux0~2_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & (\Mux4|Gen_Mux:0:MuxX|Mux0~0_combout\)) # (!\SW[15]~input_o\ & ((\Mux4|Gen_Mux:0:MuxX|Mux0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:0:MuxX|Mux0~0_combout\,
	datab => \SW[17]~input_o\,
	datac => \SW[15]~input_o\,
	datad => \Mux4|Gen_Mux:0:MuxX|Mux0~1_combout\,
	combout => \Mux4|Gen_Mux:0:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X113_Y11_N26
\Mux4|Gen_Mux:0:MuxX|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ = (\Mux4|Gen_Mux:0:MuxX|Mux0~2_combout\) # ((\SW[3]~input_o\ & \SW[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:0:MuxX|Mux0~2_combout\,
	datab => \SW[3]~input_o\,
	datac => \SW[17]~input_o\,
	combout => \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\);

-- Location: LCCOMB_X114_Y14_N20
\Mux4|Gen_Mux:1:MuxX|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:1:MuxX|Mux0~2_combout\ = (!\SW[17]~input_o\ & ((\SW[15]~input_o\ & (\Mux4|Gen_Mux:1:MuxX|Mux0~0_combout\)) # (!\SW[15]~input_o\ & ((\Mux4|Gen_Mux:1:MuxX|Mux0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:1:MuxX|Mux0~0_combout\,
	datab => \SW[17]~input_o\,
	datac => \Mux4|Gen_Mux:1:MuxX|Mux0~1_combout\,
	datad => \SW[15]~input_o\,
	combout => \Mux4|Gen_Mux:1:MuxX|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y14_N30
\Mux4|Gen_Mux:1:MuxX|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\ = (\Mux4|Gen_Mux:1:MuxX|Mux0~2_combout\) # ((\SW[17]~input_o\ & \SW[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mux4|Gen_Mux:1:MuxX|Mux0~2_combout\,
	datac => \SW[17]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\);

-- Location: LCCOMB_X113_Y11_N14
\Dec4|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec4|Mux6~0_combout\ = (\Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\ & (!\Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ & !\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\)) # (!\Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\ & ((\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\,
	datac => \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datad => \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\,
	combout => \Dec4|Mux6~0_combout\);

-- Location: LCCOMB_X113_Y11_N16
\Dec4|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec4|Mux5~0_combout\ = (\Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\) # ((!\Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ & !\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\,
	datac => \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datad => \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\,
	combout => \Dec4|Mux5~0_combout\);

-- Location: LCCOMB_X113_Y11_N10
\Dec4|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec4|Mux4~0_combout\ = (\Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\) # (\Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ $ (!\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\,
	datac => \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datad => \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\,
	combout => \Dec4|Mux4~0_combout\);

-- Location: LCCOMB_X113_Y11_N4
\Dec4|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec4|Mux3~0_combout\ = (\Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\) # ((\Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ & !\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\,
	datac => \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datad => \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\,
	combout => \Dec4|Mux3~0_combout\);

-- Location: LCCOMB_X113_Y11_N22
\Dec4|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec4|Mux2~0_combout\ = (\Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ & ((\Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\) # (!\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\))) # (!\Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\ & ((\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\,
	datac => \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datad => \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\,
	combout => \Dec4|Mux2~0_combout\);

-- Location: LCCOMB_X113_Y11_N0
\Dec4|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Dec4|Mux1~0_combout\ = (\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\ & (\Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\)) # (!\Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\ & ((\Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux4|Gen_Mux:2:MuxX|Mux0~3_combout\,
	datac => \Mux4|Gen_Mux:0:MuxX|Mux0~3_combout\,
	datad => \Mux4|Gen_Mux:1:MuxX|Mux0~3_combout\,
	combout => \Dec4|Mux1~0_combout\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;
END structure;


