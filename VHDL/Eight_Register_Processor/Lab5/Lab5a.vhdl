-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_a.vhdl
--
-- Purpose: Maps processor to physical pins on board.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Entity for Part 1 --
ENTITY Lab5a IS 
GENERIC(N : INTEGER := 16);
PORT (SW   : IN std_logic_vector(17 DOWNTO 0);
      KEY  : IN std_logic_vector(1 DOWNTO 0);
      LEDR : OUT std_logic_vector(17 DOWNTO 0));
END Lab5a;

-- Architecture of Entity for Part 1 --
ARCHITECTURE Lab5a_B OF Lab5a IS
	 COMPONENT Lab5_Processor
    PORT (DIN      : IN std_logic_vector(N - 1 DOWNTO 0); 
	       Run      : IN std_logic;
			 Resetn   : IN std_logic;
			 Clk      : IN std_logic;	
			 Data_Bus : BUFFER std_logic_vector(N - 1 DOWNTO 0);
			 Done     : OUT std_logic);
    END COMPONENT;
BEGIN
LEDR(16) <= '0'; -- Keep off
Proc: Lab5_Processor
    PORT MAP (DIN      => SW(15 DOWNTO 0),
	           Run      => SW(17),
				  Resetn   => KEY(0),
				  Clk      => KEY(1),
				  Data_Bus => LEDR(15 DOWNTO 0),
				  Done     => LEDR(17));
END Lab5a_B;