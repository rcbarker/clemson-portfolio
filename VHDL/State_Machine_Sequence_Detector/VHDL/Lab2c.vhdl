-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab2c.vhdl
--
-- Purpose: File contains code that will generate a finite state machine that detects 
-- an input of "1111" or an input of "0000". Repeated 1's or 0's after each string is
-- matched keep the output of the machine high.
-- 
-- This is a Moore FSM coded using case statements to describe the various states. 
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare state machine --
ENTITY FSM3 IS 
   PORT (clk	 : IN std_logic;
			w, rst : IN std_logic;	
         state	 : OUT std_logic_vector(3 DOWNTO 0);
			z 	    : OUT std_logic);
END FSM3;

-- Architecture of state machine: By case statements --
ARCHITECTURE Behavioral OF FSM3 IS
-- Define each state for FSM3 --
TYPE fsm_state IS (A, B, C, D, E, F, G, H, I);
-- To user-encode with four bit binary, uncomment the last two lines --
--ATTRIBUTE SYN_ENCODING : STRING;
--ATTRIBUTE SYN_ENCODING OF fsm_state : TYPE IS "0000 0001 0010 0011 0100 0101 0110 0111 1000";
SIGNAL y : fsm_state;

BEGIN
	logic: PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF rst = '0'
				-- Synchronous Reset --
				THEN y <= A;
			ELSE
				-- Specify next state based on current state and input. -- 
				-- Also, send current state to output --
				CASE y IS
					WHEN A =>
						IF w = '0' THEN y <= F;	
						ELSE y <= B;
						END IF;
					WHEN B =>
						IF w = '0' THEN y <= F; 
						ELSE y <= C; 
						END IF;
					WHEN C =>
						IF w = '0' THEN y <= F; 
						ELSE y <= D;
						END IF;
					WHEN D =>
						IF w = '0' THEN y <= F;
						ELSE y <= E;
						END IF;
					WHEN E =>
						IF w = '0' THEN y <=F;
						ELSE y <= E; 
						END IF;
					WHEN F =>
						IF w = '0' THEN y <= G; 
						ELSE y <= B;
						END IF;
					WHEN G =>
						IF w = '0' THEN y <= H; 
						ELSE y <= B;
						END IF;
					WHEN H =>
						IF w = '0' THEN y <= I; 
						ELSE y <= B; 
						END IF;
					WHEN I =>
						IF w = '0' THEN y <= I; 
						ELSE y <= B;
						END IF;
				END CASE;		
			END IF;
		END IF;
	END PROCESS logic;
	
	-- Find output --
	output : PROCESS (y)
	BEGIN
		CASE y IS
			WHEN A => z <= '0'; state <= "0000";
			WHEN B => z <= '0'; state <= "0001";
			WHEN C => z <= '0'; state <= "0010";
			WHEN D => z <= '0'; state <= "0011";
			WHEN E => z <= '1'; state <= "0100";
			WHEN F => z <= '0'; state <= "0101";
			WHEN G => z <= '0'; state <= "0110";
			WHEN H => z <= '0'; state <= "0111";
			WHEN I => z <= '1'; state <= "1000";
		END CASE;
	END PROCESS output;	
END Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Entity for mapping state machine to physical ports --
ENTITY Lab2c IS
	PORT(KEY  : IN std_logic_vector(0 DOWNTO 0);
		  SW   : IN std_logic_vector(1 DOWNTO 0);
		  LEDR : OUT std_logic_vector(3 DOWNTO 0);
		  LEDG : OUT std_logic_vector(0 DOWNTO 0));
END Lab2c;

-- Port map for state machine --
ARCHITECTURE Structural of Lab2c IS
COMPONENT FSM3
   PORT (clk	 : IN std_logic;
			w, rst : IN std_logic;	
         state  : OUT std_logic_vector(3 DOWNTO 0);
			z 	    : OUT std_logic);
END COMPONENT;

BEGIN
	Lab2c : FSM3
		PORT MAP(clk=>KEY(0), w=>SW(1), rst=>SW(0), state=>LEDR, z=>LEDG(0));
END Structural;
		  