---- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_Ctrl.vhdl
--
-- Purpose: Contains the finite state machine that works as the "Brain" 
--          of the CPU. Uses two decodes to decode RX/RY in instructions.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare controller (state machine) --
ENTITY Lab5_Ctrl IS 
   PORT (IR        : IN std_logic_vector(8 DOWNTO 0); 
	      Run       : IN std_logic;
	      Resetn    : IN std_logic;
			Clk       : IN std_logic;
			DecX0     : IN std_logic;
			DecX1     : IN std_logic;
			DecX2     : IN std_logic;
			DecX3     : IN std_logic;
			DecX4     : IN std_logic;
			DecX5     : IN std_logic;
			DecX6     : IN std_logic;
			DecX7     : IN std_logic;
			DecY0     : IN std_logic;
			DecY1     : IN std_logic;
			DecY2     : IN std_logic;
			DecY3     : IN std_logic;
			DecY4     : IN std_logic;
			DecY5     : IN std_logic;
			DecY6     : IN std_logic;
			DecY7     : IN std_logic;
		   IR_in     : OUT std_logic;
			R0_out    : OUT std_logic;
			R1_out    : OUT std_logic;
			R2_out    : OUT std_logic;
			R3_out    : OUT std_logic;
			R4_out    : OUT std_logic;
			R5_out    : OUT std_logic;
			R6_out    : OUT std_logic;
			R7_out    : OUT std_logic;
		   G_out     : OUT std_logic;
			DIN_out   : OUT std_logic;
			R0_in     : OUT std_logic;
			R1_in     : OUT std_logic;
			R2_in     : OUT std_logic;
			R3_in     : OUT std_logic;
			R4_in     : OUT std_logic;
			R5_in     : OUT std_logic;
			R6_in     : OUT std_logic;
			R7_in     : OUT std_logic;
		   A_in      : OUT std_logic;
			G_in      : OUT std_logic;
         AddSub    : OUT std_logic;			
			Done      : OUT std_logic;
		   DecX_out  : OUT std_logic_vector(2 DOWNTO 0);
			DecY_out  : OUT std_logic_vector(2 DOWNTO 0));
END Lab5_Ctrl;

-- Architecture of controller (state machine) --
ARCHITECTURE Lab5_Ctrl_B OF Lab5_Ctrl IS
	 TYPE fsm_state IS (A, B, C, D);
	 SIGNAL state : fsm_state;
BEGIN
    -- Send RX Value and RY Value to Decoders --
    DecX_out <= IR(5 DOWNTO 3);
	 DecY_out <= IR(2 DOWNTO 0);
	 
    next_state: PROCESS (Resetn, Clk)
	 BEGIN
	     IF (Resetn = '0') THEN
		      -- Asynchronous Reset --
		      state <= A;
		  ELSIF (rising_edge(Clk)) THEN
				CASE state IS
			       WHEN A =>
					     -- Idle state (T0) --
					     IF(Run = '1') THEN state <= B;
				        ELSE state <= A;
			    	     END IF;
			       WHEN B => 
						  -- Processing state 1 (T1) -- 
						  IF(IR(8 DOWNTO 6) = "010" OR
				           IR(8 DOWNTO 6) = "011") THEN
					         state  <= C;
						  ELSE state <= A;
				        END IF;
			       WHEN C =>
		    	        -- Processing state 2 (T2) --
				        state <= D;
				    WHEN D =>
					     -- Processing state 3 (T3) --
					     state <= A;
		      END CASE;
		  END IF;
	 END PROCESS next_state;
	 
	 outputs: PROCESS (state, IR(8 DOWNTO 6), DecX0,
	                   DecX1, DecX2, DecX3, DecX4,
							 DecX5, DecX6, DecX7, DecY0,
							 DecY1, DecY2, DecY3, DecY4,
							 DecY5, DecY6, DecY7)
	 BEGIN
	     CASE state IS
		      WHEN A =>
				    -- Idle state outputs --
					 IR_in   <= '1';
			       R0_out  <= '0';
			       R1_out  <= '0';
			       R2_out  <= '0';
			       R3_out  <= '0';
			       R4_out  <= '0';
			       R5_out  <= '0';
			       R6_out  <= '0';
			       R7_out  <= '0';
		          G_out   <= '0';
			       DIN_out <= '0';
			       
					 R0_in   <= '0';
			       R1_in   <= '0';
			       R2_in   <= '0';
			       R3_in   <= '0';
	        		 R4_in   <= '0';
			       R5_in   <= '0';
			       R6_in   <= '0';
			       R7_in   <= '0';
		          A_in    <= '0';
			       G_in    <= '0';
					 
                AddSub  <= '0';	
					 Done    <= '0';
				WHEN B =>
				    -- The below are never asserted in this state --
				    IR_in  <= '0';
					 G_out  <= '0';
					 G_in   <= '0';
					 AddSub <= '0';					  
				
				    -- Processing state 1 outputs--
			       IF (IR(8 DOWNTO 6) = "000") THEN  
                    -- Command is mv --
								
					  	  -- Use RY values --
			           R0_out  <= DecY0;			       
						  R1_out  <= DecY1;
						  R2_out  <= DecY2;			    
						  R3_out  <= DecY3;
						  R4_out  <= DecY4;
						  R5_out  <= DecY5;
						  R6_out  <= DecY6;
						  R7_out  <= DecY7;
						  DIN_out <= '0';
			       
	     			     -- Use RX values --
						  R0_in   <= DecX0;
						  R1_in   <= DecX1;
						  R2_in   <= DecX2;
						  R3_in   <= DecX3;
						  R4_in   <= DecX4;
						  R5_in   <= DecX5;
						  R6_in   <= DecX6;
						  R7_in   <= DecX7;
						  A_in    <= '0';
				
					     Done    <= '1';
                ELSIF(IR(8 DOWNTO 6) = "001") THEN
                    -- Command is mvi --
			           R0_out  <= '0';			       
						  R1_out  <= '0';
						  R2_out  <= '0';			    
						  R3_out  <= '0';
						  R4_out  <= '0';
						  R5_out  <= '0';
						  R6_out  <= '0';
						  R7_out  <= '0';
						  DIN_out <= '1';
			       
	     			     -- Use RX Values--
						  R0_in   <= DecX0;
						  R1_in   <= DecX1;
						  R2_in   <= DecX2;
						  R3_in   <= DecX3;
						  R4_in   <= DecX4;
						  R5_in   <= DecX5;
						  R6_in   <= DecX6;
						  R7_in   <= DecX7;
						  A_in    <= '0';
					  
						  Done    <= '1';
                ELSIF(IR(8 DOWNTO 6) = "010" OR 
					       IR(8 DOWNTO 6) = "011") THEN
					     -- Command is add/subtract --
								
						  -- Use RX Values --
			           R0_out  <= DecX0;			       
						  R1_out  <= DecX1;
						  R2_out  <= DecX2;			    
						  R3_out  <= DecX3;
						  R4_out  <= DecX4;
						  R5_out  <= DecX5;
						  R6_out  <= DecX6;
						  R7_out  <= DecX7;
						  DIN_out <= '0';
			       
						  R0_in   <= '0';
						  R1_in   <= '0';
						  R2_in   <= '0';
						  R3_in   <= '0';
						  R4_in   <= '0';
						  R5_in   <= '0';
						  R6_in   <= '0';
						  R7_in   <= '0';
						  A_in    <= '1';
					  
					     Done    <= '0';
                ELSE
						  -- Command is unsupported --
			           R0_out  <= '0';			       
						  R1_out  <= '0';
					     R2_out  <= '0';			    
						  R3_out  <= '0';
						  R4_out  <= '0';
						  R5_out  <= '0';
						  R6_out  <= '0';
						  R7_out  <= '0';
						  DIN_out <= '0';
						  R0_in   <= '0';
						  R1_in   <= '0';
						  R2_in   <= '0';
						  R3_in   <= '0';
						  R4_in   <= '0';
						  R5_in   <= '0';
						  R6_in   <= '0';
						  R7_in   <= '0';
						  A_in    <= '0';	
					     Done    <= '0';
					 END IF;					 
				WHEN C =>
				    -- Processing state 2 outputs
					 -- (for add/subtract) --
					 
					 -- Use RY Values --
					 IR_in   <= '0';
			       R0_out  <= DecY0;
			       R1_out  <= DecY1;
			       R2_out  <= DecY2;
			       R3_out  <= DecY3;
			       R4_out  <= DecY4;
			       R5_out  <= DecY5;
			       R6_out  <= DecY6;
			       R7_out  <= DecY7;
		          G_out   <= '0';
			       DIN_out <= '0';
			       
					 R0_in   <= '0';
			       R1_in   <= '0';
			       R2_in   <= '0';
			       R3_in   <= '0';
	        		 R4_in   <= '0';
			       R5_in   <= '0';
			       R6_in   <= '0';
			       R7_in   <= '0';
		          A_in    <= '0';
			       G_in    <= '1';
					 
					 -- AddSub on if doing subtraction --
			       IF(IR(8 DOWNTO 6) = "011") THEN
			           AddSub  <= '1';
					 ELSE AddSub <= '0';	 
					 END IF;	
			       Done    <= '0';
				WHEN D => 
				    -- Processing state 3 outputs --
					 -- (for add/subtract) --
                IR_in   <= '0';
			       R0_out  <= '0';
			       R1_out  <= '0';
			       R2_out  <= '0';
			       R3_out  <= '0';
			       R4_out  <= '0';
			       R5_out  <= '0';
			       R6_out  <= '0';
			       R7_out  <= '0';
		          G_out   <= '1';
			       DIN_out <= '0';
			       
					 -- Use RX Values --
					 R0_in   <= DecX0;
			       R1_in   <= DecX1;
			       R2_in   <= DecX2;
			       R3_in   <= DecX3;
	        		 R4_in   <= DecX4;
			       R5_in   <= DecX5;
			       R6_in   <= DecX6;
			       R7_in   <= DecX7;
		          A_in    <= '0';
			       G_in    <= '0';
					 
                AddSub  <= '0';	
			       Done    <= '1';			 
        END CASE;
    END PROCESS outputs;
END Lab5_Ctrl_B;