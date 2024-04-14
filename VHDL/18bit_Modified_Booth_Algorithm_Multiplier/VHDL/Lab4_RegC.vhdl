-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4_RegC.vhdl
--
-- Purpose: N + 1 bit shift register that holds the partial product during multiplication. At each stage, the partial product is
--          sent to an N + 1 bit full adder, the new value is loaded from the adder multiplexer, and everything is 
--          shifted right two bits.
--
--          Falling edge activated.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Register C --
ENTITY Lab4_RegC IS 
   GENERIC (N : INTEGER := 18);
   PORT (partial_product : IN std_logic_vector(N DOWNTO 0);
	      loadreg         : IN std_logic;
			shift           : IN std_logic;
			clk             : IN std_logic;
			bits_out        : OUT std_logic_vector(1 DOWNTO 0);
			output          : BUFFER std_logic_vector(N DOWNTO 0));
END Lab4_RegC;

-- Architecture of Register C --
ARCHITECTURE Lab4_RegC_B OF Lab4_RegC IS
BEGIN
    main: PROCESS (clk, loadreg, shift)
	     VARIABLE shifted_out : std_logic_vector(1 DOWNTO 0); 
	     VARIABLE msb : std_logic;
	 BEGIN
        IF(falling_edge(clk) AND loadreg = '1') THEN
	         -- If loading or adding, set output to input from adder --
	         output(N DOWNTO 0) <= partial_product;
				
				-- Not needed for load, but set to last two bits of partial product --
		      bits_out <= partial_product(1 DOWNTO 0);
        END IF;
		  
		  IF(falling_edge(clk) AND shift = '1') THEN
	         -- Save bits coming out and most signficant bit before shift --
		      shifted_out := output(1 DOWNTO 0);
		      msb := output(N);
		  
		      -- Shift right two bits --
		      output(N - 2 DOWNTO 0) <= output(N DOWNTO 2);
				
			   -- Sign extend output after shift --
				output(N - 1) <= msb;
	         output(N) <= msb;
				
				-- Set bits out to proper value --
				bits_out <= shifted_out;
	     END IF;
    END PROCESS main;
END Lab4_RegC_B;