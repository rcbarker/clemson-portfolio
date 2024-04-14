---- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_Decoder.vhdl
--
-- Purpose: Used by controller to decode regX/regY 
--          inputs into one bit control lines.
--
--          Standard 3-to-8 Decoder.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Decoder Entity --
ENTITY Lab5_Decoder IS 
   PORT (input  : IN std_logic_vector(2 DOWNTO 0);
         out0   : OUT std_logic;
         out1   : OUT std_logic;
         out2   : OUT std_logic;
         out3   : OUT std_logic;
         out4   : OUT std_logic;
         out5   : OUT std_logic;
         out6   : OUT std_logic;
         out7   : OUT std_logic);
END Lab5_Decoder;

-- Architecture of Decoder Entity --
ARCHITECTURE Lab5_Decoder_B OF Lab5_Decoder IS
BEGIN
Decode : PROCESS (input)
	 BEGIN
        out0 <= NOT(input(2)) AND NOT(input(1)) AND NOT(input(0));
        out1 <= NOT(input(2)) AND NOT(input(1)) AND     input(0);
        out2 <= NOT(input(2)) AND     input(1)  AND NOT(input(0));
        out3 <= NOT(input(2)) AND     input(1)  AND     input(0);
        out4 <=     input(2)  AND NOT(input(1)) AND NOT(input(0));
        out5 <=     input(2)  AND NOT(input(1)) AND     input(0);
        out6 <=     input(2)  AND     input(1)  AND NOT(input(0));
        out7 <=     input(2)  AND     input(1)  AND     input(0);
    END PROCESS Decode;
END Lab5_Decoder_B;