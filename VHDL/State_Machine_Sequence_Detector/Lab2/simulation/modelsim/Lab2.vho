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

-- DATE "02/23/2015 14:27:03"

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

ENTITY 	Lab2c IS
    PORT (
	KEY : IN std_logic_vector(0 DOWNTO 0);
	SW : IN std_logic_vector(1 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(3 DOWNTO 0);
	LEDG : BUFFER std_logic_vector(0 DOWNTO 0)
	);
END Lab2c;

-- Design Ports Information
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab2c IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(0 DOWNTO 0);
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \Lab2c|y~17_combout\ : std_logic;
SIGNAL \Lab2c|y.C~q\ : std_logic;
SIGNAL \Lab2c|y~13_combout\ : std_logic;
SIGNAL \Lab2c|y.D~q\ : std_logic;
SIGNAL \Lab2c|y~19_combout\ : std_logic;
SIGNAL \Lab2c|y.E~q\ : std_logic;
SIGNAL \Lab2c|y~11_combout\ : std_logic;
SIGNAL \Lab2c|y~12_combout\ : std_logic;
SIGNAL \Lab2c|y.B~q\ : std_logic;
SIGNAL \Lab2c|y~20_combout\ : std_logic;
SIGNAL \Lab2c|y.I~q\ : std_logic;
SIGNAL \Lab2c|y~14_combout\ : std_logic;
SIGNAL \Lab2c|y~15_combout\ : std_logic;
SIGNAL \Lab2c|y.F~q\ : std_logic;
SIGNAL \Lab2c|y~18_combout\ : std_logic;
SIGNAL \Lab2c|y.G~q\ : std_logic;
SIGNAL \Lab2c|y~16_combout\ : std_logic;
SIGNAL \Lab2c|y.H~q\ : std_logic;
SIGNAL \Lab2c|WideOr5~combout\ : std_logic;
SIGNAL \Lab2c|WideOr4~0_combout\ : std_logic;
SIGNAL \Lab2c|WideOr3~combout\ : std_logic;
SIGNAL \Lab2c|z~combout\ : std_logic;

BEGIN

ww_KEY <= KEY;
ww_SW <= SW;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Lab2c|WideOr5~combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Lab2c|WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Lab2c|WideOr3~combout\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Lab2c|y.I~q\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Lab2c|z~combout\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

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

-- Location: LCCOMB_X111_Y69_N30
\Lab2c|y~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~17_combout\ = (\SW[1]~input_o\ & (\SW[0]~input_o\ & \Lab2c|y.B~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datac => \SW[0]~input_o\,
	datad => \Lab2c|y.B~q\,
	combout => \Lab2c|y~17_combout\);

-- Location: FF_X111_Y69_N31
\Lab2c|y.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.C~q\);

-- Location: LCCOMB_X111_Y69_N2
\Lab2c|y~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~13_combout\ = (\SW[0]~input_o\ & (\Lab2c|y.C~q\ & \SW[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \Lab2c|y.C~q\,
	datad => \SW[1]~input_o\,
	combout => \Lab2c|y~13_combout\);

-- Location: FF_X111_Y69_N3
\Lab2c|y.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.D~q\);

-- Location: LCCOMB_X111_Y69_N12
\Lab2c|y~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~19_combout\ = (\SW[0]~input_o\ & (\SW[1]~input_o\ & ((\Lab2c|y.D~q\) # (\Lab2c|y.E~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \Lab2c|y.D~q\,
	datac => \Lab2c|y.E~q\,
	datad => \SW[1]~input_o\,
	combout => \Lab2c|y~19_combout\);

-- Location: FF_X111_Y69_N13
\Lab2c|y.E\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.E~q\);

-- Location: LCCOMB_X111_Y69_N20
\Lab2c|y~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~11_combout\ = (\SW[1]~input_o\ & (\SW[0]~input_o\ & (!\Lab2c|y.B~q\ & !\Lab2c|y.D~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \SW[0]~input_o\,
	datac => \Lab2c|y.B~q\,
	datad => \Lab2c|y.D~q\,
	combout => \Lab2c|y~11_combout\);

-- Location: LCCOMB_X111_Y69_N4
\Lab2c|y~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~12_combout\ = (!\Lab2c|y.E~q\ & (!\Lab2c|y.C~q\ & \Lab2c|y~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Lab2c|y.E~q\,
	datac => \Lab2c|y.C~q\,
	datad => \Lab2c|y~11_combout\,
	combout => \Lab2c|y~12_combout\);

-- Location: FF_X111_Y69_N5
\Lab2c|y.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.B~q\);

-- Location: LCCOMB_X111_Y69_N0
\Lab2c|y~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~20_combout\ = (\SW[0]~input_o\ & (!\SW[1]~input_o\ & ((\Lab2c|y.H~q\) # (\Lab2c|y.I~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \Lab2c|y.H~q\,
	datac => \Lab2c|y.I~q\,
	datad => \SW[1]~input_o\,
	combout => \Lab2c|y~20_combout\);

-- Location: FF_X111_Y69_N1
\Lab2c|y.I\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.I~q\);

-- Location: LCCOMB_X111_Y69_N6
\Lab2c|y~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~14_combout\ = (!\SW[1]~input_o\ & (\SW[0]~input_o\ & !\Lab2c|y.I~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datac => \SW[0]~input_o\,
	datad => \Lab2c|y.I~q\,
	combout => \Lab2c|y~14_combout\);

-- Location: LCCOMB_X111_Y69_N28
\Lab2c|y~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~15_combout\ = (!\Lab2c|y.G~q\ & (!\Lab2c|y.H~q\ & (!\Lab2c|y.F~q\ & \Lab2c|y~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Lab2c|y.G~q\,
	datab => \Lab2c|y.H~q\,
	datac => \Lab2c|y.F~q\,
	datad => \Lab2c|y~14_combout\,
	combout => \Lab2c|y~15_combout\);

-- Location: FF_X111_Y69_N29
\Lab2c|y.F\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.F~q\);

-- Location: LCCOMB_X111_Y69_N16
\Lab2c|y~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~18_combout\ = (!\SW[1]~input_o\ & (\SW[0]~input_o\ & \Lab2c|y.F~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datac => \SW[0]~input_o\,
	datad => \Lab2c|y.F~q\,
	combout => \Lab2c|y~18_combout\);

-- Location: FF_X111_Y69_N17
\Lab2c|y.G\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.G~q\);

-- Location: LCCOMB_X111_Y69_N14
\Lab2c|y~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|y~16_combout\ = (!\SW[1]~input_o\ & (\SW[0]~input_o\ & \Lab2c|y.G~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datac => \SW[0]~input_o\,
	datad => \Lab2c|y.G~q\,
	combout => \Lab2c|y~16_combout\);

-- Location: FF_X111_Y69_N15
\Lab2c|y.H\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY[0]~input_o\,
	d => \Lab2c|y~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Lab2c|y.H~q\);

-- Location: LCCOMB_X111_Y69_N24
\Lab2c|WideOr5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|WideOr5~combout\ = (\Lab2c|y.B~q\) # ((\Lab2c|y.D~q\) # ((\Lab2c|y.H~q\) # (\Lab2c|y.F~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Lab2c|y.B~q\,
	datab => \Lab2c|y.D~q\,
	datac => \Lab2c|y.H~q\,
	datad => \Lab2c|y.F~q\,
	combout => \Lab2c|WideOr5~combout\);

-- Location: LCCOMB_X111_Y69_N22
\Lab2c|WideOr4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|WideOr4~0_combout\ = (\Lab2c|y.C~q\) # ((\Lab2c|y.G~q\) # ((\Lab2c|y.H~q\) # (\Lab2c|y.D~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Lab2c|y.C~q\,
	datab => \Lab2c|y.G~q\,
	datac => \Lab2c|y.H~q\,
	datad => \Lab2c|y.D~q\,
	combout => \Lab2c|WideOr4~0_combout\);

-- Location: LCCOMB_X111_Y69_N26
\Lab2c|WideOr3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|WideOr3~combout\ = (\Lab2c|y.G~q\) # ((\Lab2c|y.F~q\) # ((\Lab2c|y.H~q\) # (\Lab2c|y.E~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Lab2c|y.G~q\,
	datab => \Lab2c|y.F~q\,
	datac => \Lab2c|y.H~q\,
	datad => \Lab2c|y.E~q\,
	combout => \Lab2c|WideOr3~combout\);

-- Location: LCCOMB_X111_Y69_N10
\Lab2c|z\ : cycloneive_lcell_comb
-- Equation(s):
-- \Lab2c|z~combout\ = (\Lab2c|y.I~q\) # (\Lab2c|y.E~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Lab2c|y.I~q\,
	datad => \Lab2c|y.E~q\,
	combout => \Lab2c|z~combout\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;
END structure;


