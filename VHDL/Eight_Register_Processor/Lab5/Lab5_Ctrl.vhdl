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
			DecX      : IN std_logic_vector(7 DOWNTO 0);
			DecY      : IN std_logic_vector(7 DOWNTO 0);
		   IR_in     : OUT std_logic;
			R_out     : OUT std_logic_vector(7 DOWNTO 0);
		   G_out     : OUT std_logic;
			DIN_out   : OUT std_logic;
			R_in      : OUT std_logic_vector(7 DOWNTO 0);
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
	 
	 outputs: PROCESS (state, IR(8 DOWNTO 6), DecX, DecY)
	 BEGIN
	     CASE state IS
		      WHEN A =>
				    -- Idle state outputs --
					 IR_in    <= '1';
			       R_out(0) <= '0';
			       R_out(1) <= '0';
			       R_out(2) <= '0';
			       R_out(3) <= '0';
			       R_out(4) <= '0';
			       R_out(5) <= '0';
			       R_out(6) <= '0';
			       R_out(7) <= '0';
		          G_out    <= '0';
			       DIN_out  <= '0';
			       
					 R_in(0)  <= '0';
			       R_in(1)  <= '0';
			       R_in(2)  <= '0';
			       R_in(3)  <= '0';
	        		 R_in(4)  <= '0';
			       R_in(5)  <= '0';
			       R_in(6)  <= '0';
			       R_in(7)  <= '0';
		          A_in     <= '0';
			       G_in     <= '0';
					 
                AddSub   <= '0';	
					 Done     <= '0';
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
			           R_out(0) <= DecY(0);			       
						  R_out(1) <= DecY(1);
						  R_out(2) <= DecY(2);			    
						  R_out(3) <= DecY(3);
						  R_out(4) <= DecY(4);
						  R_out(5) <= DecY(5);
						  R_out(6) <= DecY(6);
						  R_out(7) <= DecY(7);
						  DIN_out  <= '0';
			       
	     			     -- Use RX values --
						  R_in(0)  <= DecX(0);
						  R_in(1)  <= DecX(1);
						  R_in(2)  <= DecX(2);
						  R_in(3)  <= DecX(3);
						  R_in(4)  <= DecX(4);
						  R_in(5)  <= DecX(5);
						  R_in(6)  <= DecX(6);
						  R_in(7)  <= DecX(7);
						  A_in     <= '0';
				
					     Done    <= '1';
                ELSIF(IR(8 DOWNTO 6) = "001") THEN
                    -- Command is mvi --
			           R_out(0)  <= '0';			       
						  R_out(1)  <= '0';
						  R_out(2)  <= '0';			    
						  R_out(3)  <= '0';
						  R_out(4)  <= '0';
						  R_out(5)  <= '0';
						  R_out(6)  <= '0';
						  R_out(7)  <= '0';
						  DIN_out   <= '1';
			       
	     			     -- Use RX Values--
						  R_in(0)  <= DecX(0);
						  R_in(1)  <= DecX(1);
						  R_in(2)  <= DecX(2);
						  R_in(3)  <= DecX(3);
						  R_in(4)  <= DecX(4);
						  R_in(5)  <= DecX(5);
						  R_in(6)  <= DecX(6);
						  R_in(7)  <= DecX(7);
						  A_in    <= '0';
					  
						  Done    <= '1';
                ELSIF(IR(8 DOWNTO 6) = "010" OR 
					       IR(8 DOWNTO 6) = "011") THEN
					     -- Command is add/subtract --
								
						  -- Use RX Values --
			           R_out(0)  <= DecX(0);			       
						  R_out(1)  <= DecX(1);
						  R_out(2)  <= DecX(2);			    
						  R_out(3)  <= DecX(3);
						  R_out(4)  <= DecX(4);
						  R_out(5)  <= DecX(5);
						  R_out(6)  <= DecX(6);
						  R_out(7)  <= DecX(7);
						  DIN_out   <= '0';
			       
						  R_in(0)   <= '0';
						  R_in(1)   <= '0';
						  R_in(2)   <= '0';
						  R_in(3)   <= '0';
						  R_in(4)   <= '0';
						  R_in(5)   <= '0';
						  R_in(6)   <= '0';
						  R_in(7)   <= '0';
						  A_in      <= '1';
					  
					     Done    <= '0';
                ELSE
						  -- Command is unsupported --
			           R_out(0)  <= '0';			       
						  R_out(1)  <= '0';
					     R_out(2)  <= '0';			    
						  R_out(3)  <= '0';
						  R_out(4)  <= '0';
						  R_out(5)  <= '0';
						  R_out(6)  <= '0';
						  R_out(7)  <= '0';
						  DIN_out   <= '0';
						  R_in(0)   <= '0';
						  R_in(1)   <= '0';
						  R_in(2)   <= '0';
						  R_in(3)   <= '0';
						  R_in(4)   <= '0';
						  R_in(5)   <= '0';
						  R_in(6)   <= '0';
						  R_in(7)   <= '0';
						  A_in      <= '0';	
					     Done      <= '0';
					 END IF;					 
				WHEN C =>
				    -- Processing state 2 outputs
					 -- (for add/subtract) --
					 
					 -- Use RY Values --
					 IR_in     <= '0';
			       R_out(0)  <= DecY(0);
			       R_out(1)  <= DecY(1);
			       R_out(2)  <= DecY(2);
			       R_out(3)  <= DecY(3);
			       R_out(4)  <= DecY(4);
			       R_out(5)  <= DecY(5);
			       R_out(6)  <= DecY(6);
			       R_out(7)  <= DecY(7);
		          G_out     <= '0';
			       DIN_out   <= '0';
			       
					 R_in(0)   <= '0';
			       R_in(1)   <= '0';
			       R_in(2)   <= '0';
			       R_in(3)   <= '0';
	        		 R_in(4)   <= '0';
			       R_in(5)   <= '0';
			       R_in(6)   <= '0';
			       R_in(7)   <= '0';
		          A_in      <= '0';
			       G_in      <= '1';
					 
					 -- AddSub on if doing subtraction --
			       IF(IR(8 DOWNTO 6) = "011") THEN
			           AddSub  <= '1';
					 ELSE AddSub <= '0';	 
					 END IF;	
			       Done    <= '0';
				WHEN D => 
				    -- Processing state 3 outputs --
					 -- (for add/subtract) --
                IR_in     <= '0';
			       R_out(0)  <= '0';
			       R_out(1)  <= '0';
			       R_out(2)  <= '0';
			       R_out(3)  <= '0';
			       R_out(4)  <= '0';
			       R_out(5)  <= '0';
			       R_out(6)  <= '0';
			       R_out(7)  <= '0';
		          G_out     <= '1';
			       DIN_out   <= '0';
			       
					 -- Use RX Values --
					 R_in(0)   <= DecX(0);
			       R_in(1)   <= DecX(1);
			       R_in(2)   <= DecX(2);
			       R_in(3)   <= DecX(3);
	        		 R_in(4)   <= DecX(4);
			       R_in(5)   <= DecX(5);
			       R_in(6)   <= DecX(6);
			       R_in(7)   <= DecX(7);
		          A_in      <= '0';
			       G_in      <= '0';
					 
                AddSub    <= '0';	
			       Done      <= '1';			 
        END CASE;
    END PROCESS outputs;
END Lab5_Ctrl_B;