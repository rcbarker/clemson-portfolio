-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5b.vhdl
--
-- Purpose: Maps the main circuit to physical pins.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Main Circuit --
ENTITY Lab5b IS 
PORT (SW       : IN std_logic_vector(17 DOWNTO 0);
      KEY      : IN std_logic_vector(2 DOWNTO 0);
		LEDR     : OUT std_logic_vector(17 DOWNTO 0));
END Lab5b;

-- Architecture of Main Circuit --
ARCHITECTURE Lab5b_B OF Lab5b IS
	 COMPONENT Lab5_Main
        PORT (Run      : IN std_logic;
	           Resetn   : IN std_logic;
				  PClk     : IN std_logic;
				  MClk	  : IN std_logic;
				  Data_Bus : BUFFER std_logic_vector(15 DOWNTO 0);
				  Done     : OUT std_logic);
    END COMPONENT;
BEGIN
    LEDR(16) <= '1'; -- Keep Off
    Main : Lab5_Main
    PORT MAP (Run      => SW(17),
	           Resetn   => KEY(0),
				  PClk     => KEY(2),
				  MClk	  => KEY(1),
				  Data_Bus => LEDR(15 DOWNTO 0),
				  Done     => LEDR(17));
END Lab5b_B;