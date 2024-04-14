-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4_RegA.vhdl
--
-- Purpose: Register A is a N + 1 bit register that stores the multiplicand sign extended by one bit. This is
--          sent to RegA Mux at each stage of the multiplication and is used to determine the multiplicand, two 
--          times the multiplicand, the multiplicand's two's complement, and two times the multiplicand's two's
--          complement in RegA Mux.
--
--          Falling edge activated.
--          

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Register A --
ENTITY Lab4_RegA IS 
   GENERIC (N : INTEGER := 18);
   PORT (multiplicand : IN std_logic_vector(N - 1 DOWNTO 0);
         loadreg      : IN std_logic;
			clk          : IN std_logic;
			output       : OUT std_logic_vector(N DOWNTO 0));
END Lab4_RegA;

-- Architecture of Register A --
ARCHITECTURE Lab4_RegA_B OF Lab4_RegA IS
BEGIN
    init: PROCESS (clk, loadreg)
    BEGIN
		  IF(falling_edge(clk) AND loadreg = '1') THEN
		      -- If loading, set output to multiplicand --
				output(N) <= multiplicand(N - 1); -- Sign Extend --
		      output(N - 1 DOWNTO 0) <= multiplicand;
		  END IF;
    END PROCESS init;
END Lab4_RegA_B;