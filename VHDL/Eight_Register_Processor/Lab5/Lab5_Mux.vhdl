---- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_Mux.vhdl
--
-- Purpose: Giant multiplexer macro that places data from one of
--          the CPU's register's on the bus based on which control
--          line is high.
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Multiplexer Entity --
ENTITY Lab5_Mux IS 
   GENERIC (N : INTEGER := 16);
   PORT (reg0_in   : IN std_logic_vector(N - 1 DOWNTO 0);
	      reg1_in   : IN std_logic_vector(N - 1 DOWNTO 0);
	      reg2_in   : IN std_logic_vector(N - 1 DOWNTO 0);			
	      reg3_in   : IN std_logic_vector(N - 1 DOWNTO 0);	
	      reg4_in   : IN std_logic_vector(N - 1 DOWNTO 0);
	      reg5_in   : IN std_logic_vector(N - 1 DOWNTO 0);		
	      reg6_in   : IN std_logic_vector(N - 1 DOWNTO 0);
	      reg7_in   : IN std_logic_vector(N - 1 DOWNTO 0);
         data_in   : IN std_logic_vector(N - 1 DOWNTO 0);
	      adder_in  : IN std_logic_vector(N - 1 DOWNTO 0);
         reg0_out  : IN std_logic;
	      reg1_out  : IN std_logic;
	      reg2_out  : IN std_logic;			
	      reg3_out  : IN std_logic;	
	      reg4_out  : IN std_logic;
	      reg5_out  : IN std_logic;		
	      reg6_out  : IN std_logic;
	      reg7_out  : IN std_logic;
         data_out  : IN std_logic;
	      adder_out : IN std_logic;
			output    : BUFFER std_logic_vector(N - 1 DOWNTO 0));
END Lab5_Mux;

-- Architecture of Multiplexer Entity --
ARCHITECTURE Lab5_Mux_B OF Lab5_Mux IS
BEGIN
    multiplex: PROCESS (reg0_in, reg1_in, reg2_in, reg3_in, reg4_in,
	                     reg5_in, reg6_in, reg7_in, data_in, adder_in,
								reg0_out, reg1_out, reg2_out, reg3_out, reg4_out,
								reg5_out, reg6_out, reg7_out, data_out, adder_out)
    BEGIN
        IF(reg0_out = '1') THEN
		      output <= reg0_in;
		  ELSIF(reg1_out = '1') THEN
			   output <= reg1_in;
		  ELSIF(reg2_out = '1') THEN
			   output <= reg2_in;
		  ELSIF(reg3_out = '1') THEN
		      output <= reg3_in;
		  ELSIF(reg4_out = '1') THEN
			   output <= reg4_in;
		  ELSIF(reg5_out = '1') THEN
			   output <= reg5_in;
		  ELSIF(reg6_out = '1') THEN
			   output <= reg6_in;
		  ELSIF(reg7_out = '1') THEN
			   output <= reg7_in;
		  ELSIF(data_out = '1') THEN
			   output <= data_in;
		  ELSIF(adder_out = '1') THEN
			   output <= adder_in;
		  ELSE
		      -- If an output signal is not asserted --
			   -- by the controller, output zeroes	--
				zeroes: FOR i IN 0 TO N - 1 LOOP
                output(i) <= '0';
            END LOOP;
        END IF;		 
    END PROCESS multiplex;
END Lab5_Mux_B;