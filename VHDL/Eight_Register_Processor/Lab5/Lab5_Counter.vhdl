-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_Counter.vhdl
--
-- Purpose: Generic 5-Bit Counter for Part II.
--

LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

-- Declare Counter --
ENTITY Lab5_Counter IS 
   GENERIC (CNT : INTEGER := 5);
   PORT (clk     : IN std_logic;
	      reset   : IN std_logic;
			output  : OUT std_logic_vector(CNT - 1 DOWNTO 0));
END Lab5_Counter;

-- Architecture of Counter --
ARCHITECTURE Lab5_Counter_B OF Lab5_Counter IS
    SIGNAL counter : unsigned (CNT - 1 DOWNTO 0);
BEGIN
    cntr: PROCESS(clk, reset)
	 BEGIN
	     IF(reset = '0') THEN
		      zeroes: FOR i IN 0 TO CNT - 1 LOOP
                counter(i) <= '0';
            END LOOP;
		  ELSIF(rising_edge(clk)) THEN
				-- Increment counter --
		      counter <= counter + 1;
		  END IF;
		 
		  -- Set output to counter value --
		  output <= std_logic_vector(counter);
	 END PROCESS cntr;
END Lab5_Counter_B;