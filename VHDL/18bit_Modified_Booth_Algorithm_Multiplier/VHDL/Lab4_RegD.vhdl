-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4_RegD.vhdl
--
-- Purpose: Reg D counts from zero to maxval and outputs the current value. When 
--          maxval is reached, the counter wraps back around to zero. 
--
--          Falling edge activated. Not Generic.
--

LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

-- Declare Register D --
ENTITY Lab4_RegD IS 
   GENERIC (N : INTEGER := 18);
   PORT (maxval  : IN std_logic_vector(3 DOWNTO 0);
	      loadreg : IN std_logic;
			count   : IN std_logic;
			clk     : IN std_logic;
			output  : OUT std_logic_vector(3 DOWNTO 0));
END Lab4_RegD;

-- Architecture of Register D --
ARCHITECTURE Lab4_RegD_B OF Lab4_RegD IS
    SIGNAL counter : unsigned (3 DOWNTO 0);
BEGIN
    cntr: PROCESS(clk, loadreg, count)
	 BEGIN
	     IF(falling_edge(clk) AND loadreg = '1') THEN
		      -- Initialize counter to zero --
			   load: FOR i IN 0 TO 3 LOOP
                counter(i) <= '0';
            END LOOP;
		  END IF;
		  
		  IF(falling_edge(clk) AND count = '1') THEN
		      IF(counter < unsigned(maxval)) THEN
				    -- Increment counter --
		          counter <= counter + 1;
			   ELSE 
				    -- Reset Counter --
					 reset: FOR i IN 0 TO 3 LOOP
                    counter(i) <= '0';
					 END LOOP;
			   END IF;
		  END IF;
		 
		  -- Set output to counter value --
		  output <= std_logic_vector(counter);
	 END PROCESS cntr;
END Lab4_RegD_B;