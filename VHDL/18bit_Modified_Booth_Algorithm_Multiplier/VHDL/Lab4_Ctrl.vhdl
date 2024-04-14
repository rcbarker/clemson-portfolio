-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab4_Ctrl.vhdl
--
-- Purpose: Controller for N Bit bit pair multiplier. Outputs busy signal 
--          while multiplying.
--
-- Currently only supports 18 bits. Will expand for N bits if time allows.
--

LIBRARY ieee;
USE ieee.math_real.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

-- Declare controller (state machine) --
ENTITY Lab4_Ctrl IS 
   GENERIC (N : INTEGER := 18);
   PORT (start     : IN std_logic;
	      regB_bits : IN std_logic_vector(2 DOWNTO 0);
			count_val : IN std_logic_vector(3 DOWNTO 0);
			clk       : IN std_logic;
			mux_ctrl  : OUT std_logic_vector(2 DOWNTO 0);
			loadreg   : OUT std_logic;
			shiftreg  : OUT std_logic;
			count     : OUT std_logic;
			addreg    : OUT std_logic;
			busy      : OUT std_logic);
END Lab4_Ctrl;

-- Architecture of controller (state machine) --
ARCHITECTURE Lab4_Ctrl_B OF Lab4_Ctrl IS
    TYPE fsm_state IS (A, B, C, D);
	 SIGNAL state : fsm_state;
BEGIN
	 -- Process for state machine --
    next_state: PROCESS (clk)
	 BEGIN
	     IF(rising_edge(clk)) THEN
	         CASE state IS
			       WHEN A =>
					     -- Pre-processing/Completion state --
						  IF(start = '1') THEN state <= B;
						  ELSE state <= A;
						  END IF;
					 WHEN B => 
						  -- Load state -- 
						  state <= C;
				    WHEN C =>
						  -- Add state --
						  state <= D;
				    WHEN D =>
						  -- Shift state --
						  IF(count_val = std_logic_vector(to_unsigned((N / 2), 4))) THEN state <= A;
						  ELSE state <= C;
						  END IF;
		      END CASE;
		  END IF;
	 END PROCESS next_state;
	 
	 outputs: PROCESS (state)
	 BEGIN
	     CASE state IS
		      WHEN A =>
				    -- Pre-processing/Completion state outputs --
					 busy <= '0';
					 loadreg <= '0';
					 shiftreg <= '0';
					 addreg <= '0';
					 count <= '0';
				WHEN B =>
				    -- Load state outputs --
					 busy <= '1';
					 loadreg <= '1';
					 shiftreg <= '0';
					 addreg <= '0';
					 count <= '0';
				WHEN C =>
				    -- Add state outputs --
					 busy <= '1';
					 loadreg <= '0';
					 shiftreg <= '0';
					 addreg <= '1';
					 count <= '1';
				WHEN D => 
				    -- Shift state outputs --
					 busy <= '1'; 
					 loadreg <= '0';
					 shiftreg <= '1';
					 addreg <= '0';
					 count <= '0';			
        END CASE;
    END PROCESS outputs;
	 
    -- Connect reg B bits to multiplexer --
    mux_ctrl <= regB_bits;
END Lab4_Ctrl_B;