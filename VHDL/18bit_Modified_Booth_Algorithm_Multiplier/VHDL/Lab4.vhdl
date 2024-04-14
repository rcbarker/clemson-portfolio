-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4.vhdl
--
-- Purpose: N bit Bit-Pair Multiplier. Made of 8 different components.
--

LIBRARY ieee;
USE ieee.math_real.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

-- Declare Bit Pair Multiplier --
ENTITY Lab4 IS 
   GENERIC (N : INTEGER := 18);
   PORT (start        : IN std_logic;
	      multiplicand : IN std_logic_vector(N - 1 DOWNTO 0);
         multiplier   : IN std_logic_vector(N - 1 DOWNTO 0);
		   clk          : IN std_logic;
			busy         : OUT std_logic;
		   product      : OUT std_logic_vector((2 * N) - 1 DOWNTO 0));
END Lab4;

-- Architecture of Bit Pair Multiplier --
ARCHITECTURE Lab4_B OF Lab4 IS
    -- Signals for Registers and Adder --
    SIGNAL regA_out      : std_logic_vector(N DOWNTO 0);
	 SIGNAL regA_mux_out  : std_logic_vector(N DOWNTO 0);
	 SIGNAL adder_out     : std_logic_vector(N DOWNTO 0);
	 SIGNAL adder_mux_out : std_logic_vector(N DOWNTO 0);
	 SIGNAL regC_out      : std_logic_vector(N DOWNTO 0);
	 SIGNAL regC_to_regB  : std_logic_vector(1 DOWNTO 0);
	 SIGNAL regB_to_ctrl  : std_logic_vector(2 DOWNTO 0);
	 SIGNAL regB_out      : std_logic_vector(N - 1 DOWNTO 0);
	 SIGNAL regD_out      : std_logic_vector(3 DOWNTO 0);
	 
	 -- Signals from Controller --
	 SIGNAL loadreg       : std_logic;
	 SIGNAL addreg        : std_logic;
	 SIGNAL load_or_add   : std_logic;
	 SIGNAL shift         : std_logic;
	 SIGNAL count         : std_logic;
	 SIGNAL regA_mux_ctrl : std_logic_vector(2 DOWNTO 0);
	 
	 -- Begin Adding Everything: 
    COMPONENT Lab4_Ctrl
        PORT ( start     : IN std_logic;
	            regB_bits : IN std_logic_vector(2 DOWNTO 0);
			      count_val : IN std_logic_vector(3 DOWNTO 0);
			      clk       : IN std_logic;
			      mux_ctrl  : OUT std_logic_vector(2 DOWNTO 0);
			      loadreg   : OUT std_logic;
			      shiftreg  : OUT std_logic;
		         count     : OUT std_logic;
			      addreg    : OUT std_logic;
			      busy      : OUT std_logic );
        END COMPONENT;
		  
    COMPONENT Lab4_RegA
        PORT ( multiplicand : IN std_logic_vector(N - 1 DOWNTO 0);
               loadreg      : IN std_logic;
			      clk          : IN std_logic;
			      output       : OUT std_logic_vector(N DOWNTO 0) );
        END COMPONENT;

	 COMPONENT Lab4_RegB
        PORT ( multiplier : IN std_logic_vector(N - 1 DOWNTO 0);
		         regC_bits  : IN std_logic_vector(1 DOWNTO 0);
			      loadreg    : IN std_logic;
			      shift      : IN std_logic;
			      clk        : IN std_logic;
		         bits_out   : OUT std_logic_vector(2 DOWNTO 0);
		         output     : BUFFER std_logic_vector(N - 1 DOWNTO 0) );
        END COMPONENT;

    COMPONENT Lab4_RegC
        PORT ( partial_product : IN std_logic_vector(N DOWNTO 0);
	            loadreg         : IN std_logic;
		         shift           : IN std_logic;
			      clk             : IN std_logic;
		         bits_out        : OUT std_logic_vector(1 DOWNTO 0);
			      output          : BUFFER std_logic_vector(N DOWNTO 0) );
        END COMPONENT;

    COMPONENT Lab4_RegD
        PORT ( maxval  : IN std_logic_vector(3 DOWNTO 0);
	            loadreg : IN std_logic;
			      count   : IN std_logic;
			      clk     : IN std_logic;
			      output  : OUT std_logic_vector(3 DOWNTO 0) );
        END COMPONENT;
		  
    COMPONENT Lab4_RegA_Mux
        PORT ( regA_out     : IN std_logic_vector(N DOWNTO 0);
               mux_ctrl     : IN std_logic_vector(2 DOWNTO 0);
			      output       : OUT std_logic_vector(N DOWNTO 0) );
        END COMPONENT;
		  
    COMPONENT Lab4_Adder_Mux
        PORT ( partial_product : IN std_logic_vector(N DOWNTO 0);
               loadreg         : IN std_logic;
			      output          : OUT std_logic_vector(N DOWNTO 0) );
        END COMPONENT;
		  
    COMPONENT Lab4_Adder
        PORT ( partial_product : IN std_logic_vector(N DOWNTO 0);
	            multiplicand    : IN std_logic_vector(N DOWNTO 0);
			      c_in            : IN std_logic;
			      sum             : OUT std_logic_vector(N DOWNTO 0);
			      c_out           : OUT std_logic );
    END COMPONENT;
BEGIN
    load_or_add <= loadreg OR addreg;

    Ctrl: Lab4_Ctrl
        PORT MAP ( start => start,
		             regB_bits => regB_to_ctrl,
						 count_val => regD_out,
						 clk => clk,
						 mux_ctrl => regA_mux_ctrl,
						 loadreg => loadreg,
						 shiftreg => shift,
						 count => count,
						 addreg => addreg,
						 busy => busy );
    	
	 RegA: Lab4_RegA
	     PORT MAP ( multiplicand => multiplicand,
		             loadreg => loadreg,
						 clk => clk,
						 output => regA_out );
		  
    RegB: Lab4_RegB
	     PORT MAP ( multiplier => multiplier,
		             regC_bits => regC_to_regB,
						 loadreg => loadreg,
						 shift => shift,
						 clk => clk,
						 bits_out => regB_to_ctrl,
						 output => regB_out );
		  
	 RegC: Lab4_RegC
	     PORT MAP ( partial_product => adder_mux_out,
						 loadreg => load_or_add,
						 shift => shift,
						 clk => clk,
						 bits_out => regC_to_regB,
						 output => regC_out );

    RegD: Lab4_RegD
	     PORT MAP ( maxval => std_logic_vector(to_unsigned((N / 2), 4)),
		             loadreg => loadreg,
						 count => count,
						 clk => clk,
						 output => RegD_out );
		  
	 RegA_Mux: Lab4_RegA_Mux
	     PORT MAP ( regA_out => regA_out,
		             mux_ctrl => regA_mux_ctrl,
						 output => regA_mux_out );
		  
	 Adder_Mux: Lab4_Adder_Mux
	     PORT MAP ( partial_product => adder_out,
		             loadreg => loadreg,
						 output => adder_mux_out );
		  
	 Adder: Lab4_Adder
	     PORT MAP ( partial_product => regC_out,
					    multiplicand => regA_mux_out,
						 c_in => '0',
						 sum => adder_out );
		  
    -- Product --	 
    product((2*N) - 1 DOWNTO N) <= regC_out(N - 1 DOWNTO 0);
    product(N - 1 DOWNTO 0) <= regB_out;
END Lab4_B;