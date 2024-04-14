-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_AddSub.vhdl
--
-- Purpose: Sixteen bit full addition/subtraction macro which toggles
--          operations based on a mode bit. The addition macro used is
--          a ripple adder. The macro does not have a overall carry in,
--          since it is not necessary for the design.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare One Bit Full Adder Entity --
ENTITY One_Bit_Full_Adder IS 
   PORT (a,b   : IN std_logic;
			c_in  : IN std_logic;
			sum   : OUT std_logic;
			c_out : OUT std_logic);
END One_Bit_Full_Adder;

-- Architecture of One Bit Full_Adder Entity --
ARCHITECTURE One_Bit_Full_Adder_B OF One_Bit_Full_Adder IS
BEGIN
    sum <= a XOR b XOR c_in;
    c_out <= (a AND b) OR (c_in AND (a XOR b));
END One_Bit_Full_Adder_B;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Adder Entity --
ENTITY Lab5_AddSub IS 
   GENERIC (N : INTEGER := 16);
   PORT (in1   : IN std_logic_vector(N - 1 DOWNTO 0);
	      in2   : IN std_logic_vector(N - 1 DOWNTO 0);
			mode  : IN std_logic;
			sum   : OUT std_logic_vector(N - 1 DOWNTO 0);
			c_out : OUT std_logic);
END Lab5_AddSub;

-- Architecture of Adder Entity --
ARCHITECTURE Lab5_AddSub_B OF Lab5_AddSub IS
    SIGNAL carries : std_logic_vector(N DOWNTO 0);
	 SIGNAL xors    : std_logic_vector(N - 1 DOWNTO 0);
COMPONENT One_Bit_Full_Adder
   PORT (a,b   : IN std_logic;
			c_in  : IN std_logic;
			sum   : OUT std_logic;
			c_out : OUT std_logic);
END COMPONENT;
BEGIN
   carries(0) <= mode;
	c_out <= carries(N);
		
	Gen_Adder : FOR i IN 0 to N - 1 GENERATE
      xors(i) <= in2(i) XOR mode;

		AdderX : One_Bit_Full_Adder
			PORT MAP(a=>in1(i), b=>xors(i), c_in=>carries(i), sum=>sum(i), c_out=>carries(i + 1));
	END GENERATE Gen_Adder;
END Lab5_AddSub_B;