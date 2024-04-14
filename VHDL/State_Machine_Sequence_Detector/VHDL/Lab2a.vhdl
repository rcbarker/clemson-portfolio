-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab2a.vhdl
--
-- Purpose: File contains code that will generate a finite state machine that detects 
-- an input of "1111" or an input of "0000". Repeated 1's or 0's after each string is
-- matched keep the output of the machine high.
-- 
-- This is a Moore FSM coded manually. It is designed with "one-hot" encoding.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare state machine --
ENTITY FSM IS 
   PORT (clk	 : IN std_logic;
			w, rst : IN std_logic;	
         state  : OUT std_logic_vector(8 DOWNTO 0);
			z 	    : OUT std_logic);
END FSM;

-- Architecture of state machine: Manual --
ARCHITECTURE Behavioral OF FSM IS
SIGNAL y : std_logic_vector(8 DOWNTO 0);
BEGIN
	logic: PROCESS (clk)
	BEGIN
		IF rising_edge(clk) THEN
			IF rst = '0' 
			   -- Synchronous Reset --
				THEN y <= "000000001";
			ELSE
			   -- Find intermediate logic --
				y(0) <= '0';
				y(1) <= w AND (y(0) OR y(5) OR y(6) OR y(7) OR y(8));
				y(2) <= w AND y(1);
				y(3) <= w AND y(2);
				y(4) <= w AND (y(3) OR y(4));
				y(5) <= (NOT(w)) AND (y(0) OR y(1) OR y(2) OR y(3) OR y(4));
				y(6) <= (NOT(w)) AND y(5);
				y(7) <= (NOT(w)) AND y(6);
				y(8) <= (NOT(w)) AND (y(7) OR y(8));
			END IF;
		END IF;			
	END PROCESS logic;
	
	-- Find output --
	state <= y;
	z <= y(4) OR y(8);
END Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Entity for mapping state machine to physical ports --
ENTITY Lab2a IS
	PORT(KEY  : IN std_logic_vector(0 DOWNTO 0);
		  SW   : IN std_logic_vector(1 DOWNTO 0);
		  LEDR : OUT std_logic_vector(8 DOWNTO 0);
		  LEDG : OUT std_logic_vector(0 DOWNTO 0));
END Lab2a;

-- Port map for state machine --
ARCHITECTURE Structural of Lab2a IS
COMPONENT FSM
   PORT (clk	 : IN std_logic;
			w, rst : IN std_logic;	
         state	 : OUT std_logic_vector(8 DOWNTO 0);
			z 	    : OUT std_logic);
END COMPONENT;

BEGIN
	Lab2a : FSM
		PORT MAP(clk=>KEY(0), w=>SW(1), rst=>SW(0), state=>LEDR, z=>LEDG(0));
END Structural;
		  