-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_Main.vhdl
--
-- Purpose: Builds the main circuit for simulation. 
--          Consists of a counter, memory, and the CPU.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Main Circuit --
ENTITY Lab5_Main IS 
GENERIC (N : INTEGER := 16);
PORT (Run      : IN std_logic;
	   Resetn   : IN std_logic;
	   PClk     : IN std_logic;
	   MClk	   : IN std_logic;
      Data_Bus : BUFFER std_logic_vector(N - 1 DOWNTO 0);
		InRg     : OUT std_logic_vector(8 DOWNTO 0);
      Rg0      : OUT std_logic_vector(N - 1 DOWNTO 0);
      Rg1      : OUT std_logic_vector(N - 1 DOWNTO 0);
      Rg2      : OUT std_logic_vector(N - 1 DOWNTO 0);
      Rg3      : OUT std_logic_vector(N - 1 DOWNTO 0);
	   Rg4      : OUT std_logic_vector(N - 1 DOWNTO 0);
      Rg5      : OUT std_logic_vector(N - 1 DOWNTO 0);
      Rg6      : OUT std_logic_vector(N - 1 DOWNTO 0);		
		Rg7      : OUT std_logic_vector(N - 1 DOWNTO 0);
      RgA      : OUT std_logic_vector(N - 1 DOWNTO 0);
      RgG      : OUT std_logic_vector(N - 1 DOWNTO 0);
		Done     : OUT std_logic);
END Lab5_Main;

-- Architecture of Main Circuit --
ARCHITECTURE Lab5_Main_B OF Lab5_Main IS
    SIGNAL count_to_mem : std_logic_vector(4 DOWNTO 0);
	 SIGNAL mem_to_proc  : std_logic_vector(N - 1 DOWNTO 0);

	 COMPONENT Lab5_Counter
        PORT (clk     : IN std_logic;
	           reset   : IN std_logic;
			     output  : OUT std_logic_vector(4 DOWNTO 0));
    END COMPONENT;
	 
	 COMPONENT Lab5_Mem
        PORT (address : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		        clock	 : IN STD_LOGIC;
		        q		 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
    END COMPONENT;
	 
    COMPONENT Lab5_Processor
        PORT (DIN      : IN std_logic_vector(N - 1 DOWNTO 0); 
	           Run      : IN std_logic;
	           Resetn   : IN std_logic;
				  Clk      : IN std_logic;	
				  Data_Bus : BUFFER std_logic_vector(N - 1 DOWNTO 0);
				  InR      : OUT std_logic_vector(8 DOWNTO 0);
				  R0       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  R1       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  R2       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  R3       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  R4       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  R5       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  R6       : OUT std_logic_vector(N - 1 DOWNTO 0);		
				  R7       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  RA       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  RG       : OUT std_logic_vector(N - 1 DOWNTO 0);
				  Done     : OUT std_logic);    
    END COMPONENT;
BEGIN
    Counter: Lab5_Counter
    PORT MAP (clk     => MClk,
	           reset   => Resetn,
			     output  => count_to_mem);	 

	 Mem: Lab5_Mem
    PORT MAP (address => count_to_mem,
		        clock	 => MClk,
		        q		 => mem_to_proc);	 
				  
    Proc: Lab5_Processor
    PORT MAP (DIN      => mem_to_proc,
	           Run      => Run,
	           Resetn   => Resetn,
				  Clk      => PClk,	
				  Data_Bus => Data_Bus,
				  InR      => InRg,
				  R0       => Rg0,
				  R1       => Rg1,
				  R2       => Rg2,
				  R3       => Rg3,
				  R4       => Rg4,
				  R5       => Rg5,
				  R6       => Rg6,		
				  R7       => Rg7,
				  RA       => RgA,
				  RG       => RgG,
				  Done     => Done);				  
END Lab5_Main_B;--