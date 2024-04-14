-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4_Shift_tst.vhdl
--
-- Purpose: Test driver that maps Reg B to Reg C so shifting behavior can be observed.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Bit Pair Multiplier --
ENTITY Lab4_Shift_tst IS 
   GENERIC (N : INTEGER := 18);
   PORT (partial_product : IN std_logic_vector(N DOWNTO 0);
	      multiplier      : IN std_logic_vector(N - 1 DOWNTO 0);
			loadreg         : IN std_logic;
			shift           : IN std_logic;
			clk             : IN std_logic;
			regB_to_ctrl    : OUT std_logic_vector(2 DOWNTO 0);
			regB_out        : BUFFER std_logic_vector(N - 1 DOWNTO 0);
			regC_out        : BUFFER std_logic_vector(N DOWNTO 0);
			product         : OUT std_logic_vector((2 * N) - 1 DOWNTO 0));
END Lab4_Shift_tst;

-- Architecture of Bit Pair Multiplier --
ARCHITECTURE Lab4_Shift_tst_B OF Lab4_Shift_tst IS
    -- Line from Reg C to Reg B --
	 SIGNAL regC_to_regB  : std_logic_vector(1 DOWNTO 0);
	 
	 -- Add Reg B and Reg C: 
	 COMPONENT Lab4_RegB
        PORT (multiplier : IN std_logic_vector(N - 1 DOWNTO 0);
		        regC_bits  : IN std_logic_vector(1 DOWNTO 0);
			     loadreg    : IN std_logic;
			     shift      : IN std_logic;
			     clk        : IN std_logic;
		        bits_out   : OUT std_logic_vector(2 DOWNTO 0);
		        output     : BUFFER std_logic_vector(N - 1 DOWNTO 0));
        END COMPONENT;

    COMPONENT Lab4_RegC
        PORT (partial_product : IN std_logic_vector(N DOWNTO 0);
	           loadreg         : IN std_logic;
		        shift           : IN std_logic;
			     clk             : IN std_logic;
		        bits_out        : OUT std_logic_vector(1 DOWNTO 0);
			     output          : BUFFER std_logic_vector(N DOWNTO 0));
        END COMPONENT;
BEGIN
    RegB: Lab4_RegB
	     PORT MAP ( multiplier => multiplier,
		             regC_bits => regC_to_regB,
						 loadreg => loadreg,
						 shift => shift,
						 clk => clk,
						 bits_out => regB_to_ctrl,
						 output => regB_out );
		  
	 RegC: Lab4_RegC
	     PORT MAP ( partial_product => partial_product,
						 loadreg => loadreg,
						 shift => shift,
						 clk => clk,
						 bits_out => regC_to_regB,
						 output => regC_out );
						 
    -- Product --	 
    product((2*N) - 1 DOWNTO N) <= regC_out(N - 1 DOWNTO 0);
    product(N - 1 DOWNTO 0) <= regB_out;
END Lab4_Shift_tst_B;