-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab1a.vhdl
--
-- Purpose: File contains code that will generate:
--				- A two to one multiplexer (Mux2to1)
--          - An eight bit two to one multiplexer (Mux2to1_8Bit)
-- 
-- The top level entity (Lab1a) tests the 8 Bit 2 to 1 Multiplexer


LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Delcare individual multiplexers --
ENTITY Mux2to1 IS 
   PORT (x,y,s : IN  std_logic;
         m     : OUT std_logic );
END Mux2to1;

-- Architecture of individual multiplexers: Dataflow (Boolean) --
ARCHITECTURE Dataflow OF Mux2to1 IS
BEGIN
	m <= (NOT (s) AND x) OR (s AND y);
END Dataflow;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare 8 Bit 2 to 1 Multiplexer --
ENTITY Mux2to1_8Bit IS
	GENERIC (WIDTH : INTEGER := 8);
	PORT(x, y : IN std_logic_vector(WIDTH - 1 DOWNTO 0);
	     s    : IN std_logic;
		  m    : OUT std_logic_vector(WIDTH -1 DOWNTO 0));
END Mux2to1_8Bit;

-- Architecture of 8 Bit 2 to 1 Multiplexer: Structural --
ARCHITECTURE Struct1 OF Mux2to1_8Bit IS
COMPONENT Mux2to1
	PORT(x,y  : IN std_logic;
	     s    : IN std_logic;
		  m    : OUT std_logic);
END COMPONENT;
	
BEGIN
	Gen_Mux : FOR i IN 0 to 7 GENERATE
		MuxX : Mux2to1
			PORT MAP(x=>x(i), y=>y(i), s=>s, m=>m(i));
	END GENERATE Gen_Mux;
END Struct1;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare overall entity --
ENTITY Lab1a IS
	GENERIC (WIDTH : INTEGER := 8);
	PORT(SW        : IN std_logic_vector(2*WIDTH DOWNTO 0);
		  LEDR      : OUT std_logic_vector(WIDTH - 1 DOWNTO 0));
END Lab1a;

-- Architecture of overall entity: Structural --
ARCHITECTURE Struct2 OF Lab1a IS
COMPONENT Mux2to1_8Bit
	PORT(x, y : IN std_logic_vector(7 DOWNTO 0);
	     s    : IN std_logic;
		  m    : OUT std_logic_vector(7 DOWNTO 0));
END COMPONENT;	 

BEGIN
	Lab1a : Mux2to1_8Bit 
		PORT MAP(x=>SW(7 DOWNTO 0), y=>SW(15 DOWNTO 8), s=>SW(16), m=>LEDR(7 DOWNTO 0));
END Struct2;