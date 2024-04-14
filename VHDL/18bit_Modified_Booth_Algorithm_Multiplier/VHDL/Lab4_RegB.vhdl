-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4_RegB.vhdl
--
-- Purpose: N bit shift register that is initially loaded with the multiplier. Each cycle that shift = 1, 
--          the output is shifted right two bits. The least two significant bits of the output plus the most 
--          significant bit of the two bits that were shifted out are sent to the CTRL FSM to be used 
--          as the control bits for RegA_Mux on that cycle (As per the bit-pair algorithm).
--
--          Falling edge activated.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Register B --
ENTITY Lab4_RegB IS 
   GENERIC (N : INTEGER := 18);
   PORT (multiplier : IN std_logic_vector(N - 1 DOWNTO 0);
		   regC_bits  : IN std_logic_vector(1 DOWNTO 0);
			loadreg    : IN std_logic;
			shift      : IN std_logic;
			clk        : IN std_logic;
		   bits_out   : OUT std_logic_vector(2 DOWNTO 0);
			output     : BUFFER std_logic_vector(N - 1 DOWNTO 0));
END Lab4_RegB;

-- Architecture of Register B --
ARCHITECTURE Lab4_RegB_B OF Lab4_RegB IS
    SIGNAL last_bit : std_logic;
BEGIN
    main : PROCESS (clk, loadreg, shift)
	 BEGIN
	     IF(falling_edge(clk) AND loadreg = '1') THEN
		      -- Initially set last_bit to the "dummy zero" --
		  	   last_bit <= '0';
				
		 	   -- Initially set output to multiplier -- 
		      output <= multiplier;
		  END IF;
		  
		  IF (falling_edge(clk) AND shift = '1') THEN
		  		-- If shifting, shift right two bits --
		  		last_bit <= output(1); -- Saves output(1) before it is lost --
				output(N - 3 DOWNTO 0) <= output(N - 1 DOWNTO 2);
		      output(N - 1 DOWNTO N - 2) <= regC_bits;
		  END IF;
	 END PROCESS main;
	 
    -- Set bits_out to proper bits --
    bits_out(2 DOWNTO 1) <= output(1 DOWNTO 0);
	 bits_out(0) <= last_bit;
END Lab4_RegB_B;