-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4_RegA_Mux.vhdl
--
-- Purpose: RegA_Mux is a N + 1 bit 5-to-1 multiplexer that sends either zeroes, the multiplicand, the multiplicand shifted right once, 
--          the two's complement of the multiplicand or the two's complement of the multiplicand right shifted once to the main
--          adder to be added with the partial product. The control for this multiplixer comes from the control FSM, but it is 
--          ultimately from Reg B.
--
LIBRARY ieee;
use ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

-- Declare Register A multiplexer --
ENTITY Lab4_RegA_Mux IS 
   GENERIC (N : INTEGER := 18);
   PORT (regA_out     : IN std_logic_vector(N DOWNTO 0);
         mux_ctrl     : IN std_logic_vector(2 DOWNTO 0);
			output       : OUT std_logic_vector(N DOWNTO 0));
END Lab4_RegA_Mux;

-- Architecture of Register A multiplexer --
ARCHITECTURE Lab4_RegA_Mux_B OF Lab4_RegA_Mux IS
BEGIN
    multiplex: PROCESS (regA_out, mux_ctrl)
	     VARIABLE twos_complement : std_logic_vector(N DOWNTO 0);
    BEGIN
	     -- Initialize two's complement --
		  twos_complement := NOT(regA_out);
		  twos_complement := std_logic_vector(unsigned(twos_complement) + 1);
		  
		  -- Use mux_ctrl value to determine output --
		  CASE mux_ctrl IS
		      WHEN "000"|"111" =>
			       -- Output = 0*M --
					 zeroes: FOR i IN 0 TO N LOOP
                    output(i) <= '0';
                END LOOP;
			   WHEN "001"|"010" =>
			       -- Output = +1*M --
				    output <= regA_out;
			   WHEN "011" =>
					 -- Output = +2*M --
				    output(0) <= '0';
				    output(N DOWNTO 1) <= regA_out(N - 1 DOWNTO 0);
			   WHEN "100" =>
					 -- Output = -2*M --
					 output(0) <= '0';
				    output(N DOWNTO 1) <= twos_complement(N - 1 DOWNTO 0);
			   WHEN "101"|"110" =>
					 -- Output = -1*M --
			       output <= twos_complement;
			   WHEN OTHERS =>
				    -- Impossible --
				    error: FOR i IN 0 TO N LOOP
                    output(i) <= '0';
                END LOOP;
        END CASE;
    END PROCESS multiplex;
END Lab4_RegA_Mux_B;