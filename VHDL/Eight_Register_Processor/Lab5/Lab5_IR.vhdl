---- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_IR.vhdl
--
-- Purpose: Contains entity and architecture of the instruction register. It is
--          nine bits and falling edge activated.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Generic Register Entity --
ENTITY Lab5_IR IS 
   GENERIC (N : INTEGER := 9);
   PORT (input  : IN std_logic_vector(N - 1 DOWNTO 0);
	      reset  : IN std_logic;
         load   : IN std_logic;
			clk    : IN std_logic;
			output : OUT std_logic_vector(N - 1 DOWNTO 0));
END Lab5_IR;

-- Architecture of Generic Register Entity --
ARCHITECTURE Lab5_IR_B OF Lab5_IR IS
BEGIN
    initialize: PROCESS (clk, reset)
    BEGIN
	 	  IF(reset = '0') THEN
		      -- Low active reset --
			   zeroes: FOR i IN 0 TO N - 1 LOOP
                output(i) <= '0';
            END LOOP;
		  ELSIF(falling_edge(clk) AND load = '1') THEN
		      -- Load input into register --
		      output <= input;
		  END IF;
    END PROCESS initialize;
END Lab5_IR_B;