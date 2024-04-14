-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab1d.vhdl
--
-- Purpose: File contains code that will generate the top level entity for
--          Lab 1, a combinational circuit that consists of a five to one,
--          three bit multiplexer that inputs into three to seven bit decoder.
--          the inputs and control lines of the multiplexer are set so the word
--          "TIGERS" may be displayed on the seven segment display connected to
--          the output of the decoder.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare overall entity --
ENTITY Lab1d IS
	GENERIC (WIDTH : INTEGER := 18);
	PORT(SW   : IN std_logic_vector(WIDTH - 1 DOWNTO 0);
		  HEX0 : OUT std_logic_vector(6 DOWNTO 0);
		  HEX1 : OUT std_logic_vector(6 DOWNTO 0);
		  HEX2 : OUT std_logic_vector(6 DOWNTO 0);
		  HEX3 : OUT std_logic_vector(6 DOWNTO 0);
		  HEX4 : OUT std_logic_vector(6 DOWNTO 0));
END Lab1d;

-- Architecture of overall entity: Structural --
ARCHITECTURE Structural OF Lab1d IS

SIGNAL Mux_to_Dec0, Mux_to_Dec1, Mux_to_Dec2, Mux_to_Dec3, Mux_to_Dec4 : std_logic_vector(2 DOWNTO 0);

COMPONENT Mux5to1_3Bit
	PORT (u,v,w,x,y,s : IN std_logic_vector(2 DOWNTO 0);
	      m           : OUT std_logic_vector(2 DOWNTO 0));
END COMPONENT;

COMPONENT Decoder3to7
   PORT (c : IN std_logic_vector(2 DOWNTO 0);
         d : OUT std_logic_vector(6 DOWNTO 0));
END COMPONENT;
	
BEGIN
	Mux4 : Mux5to1_3Bit
		PORT MAP(u=>SW(2 DOWNTO 0), v=>SW(14 DOWNTO 12), w=>SW(11 DOWNTO 9), x=>SW(8 DOWNTO 6), y=>SW(5 DOWNTO 3), s=>SW(17 DOWNTO 15), m=>Mux_to_Dec4);
	Dec4 : Decoder3to7
		PORT MAP(c=>Mux_to_Dec4, d=>HEX4(6 DOWNTO 0));
	Mux3 : Mux5to1_3Bit
		PORT MAP(u=>SW(5 DOWNTO 3), v=>SW(2 DOWNTO 0), w=>SW(14 DOWNTO 12), x=>SW(11 DOWNTO 9), y=>SW(8 DOWNTO 6), s=>SW(17 DOWNTO 15), m=>Mux_to_Dec3);
	Dec3 : Decoder3to7
		PORT MAP(c=>Mux_to_Dec3, d=>HEX3(6 DOWNTO 0));
	Mux2 : Mux5to1_3Bit
		PORT MAP(u=>SW(8 DOWNTO 6), v=>SW(5 DOWNTO 3), w=>SW(2 DOWNTO 0), x=>SW(14 DOWNTO 12), y=>SW(11 DOWNTO 9), s=>SW(17 DOWNTO 15), m=>Mux_to_Dec2);
	Dec2 : Decoder3to7
		PORT MAP(c=>Mux_to_Dec2, d=>HEX2(6 DOWNTO 0));
	Mux1 : Mux5to1_3Bit
		PORT MAP(u=>SW(11 DOWNTO 9), v=>SW(8 DOWNTO 6), w=>SW(5 DOWNTO 3), x=>SW(2 DOWNTO 0), y=>SW(14 DOWNTO 12), s=>SW(17 DOWNTO 15), m=>Mux_to_Dec1);
	Dec1 : Decoder3to7
		PORT MAP(c=>Mux_to_Dec1, d=>HEX1(6 DOWNTO 0));
	Mux0 : Mux5to1_3Bit
		PORT MAP(u=>SW(14 DOWNTO 12), v=>SW(11 DOWNTO 9), w=>SW(8 DOWNTO 6), x=>SW(5 DOWNTO 3), y=>SW(2 DOWNTO 0), s=>SW(17 DOWNTO 15), m=>Mux_to_Dec0);
	Dec0 : Decoder3to7
		PORT MAP(c=>Mux_to_Dec0, d=>HEX0(6 DOWNTO 0));
END Structural;