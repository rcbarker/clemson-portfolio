-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab1c.vhdl
--
-- Purpose: File contains code that will generate:
--				- A three to seven bit decoder for use with a low active seven segment display (Decoder3to7)
-- 
-- The top level entity (Lab1c) tests the 3 to 7 Bit Decoder

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare decoder --
ENTITY Decoder3to7 IS	
   PORT (c : IN std_logic_vector(2 DOWNTO 0);
         d : OUT std_logic_vector(6 DOWNTO 0));
END Decoder3to7;

-- Architecture of decoder: Behavioral --
ARCHITECTURE Behavioral OF Decoder3to7 IS
BEGIN
	Dec : PROCESS(c)
	BEGIN
		CASE c IS
			WHEN "000" => d <= "0000111";
			WHEN "001" => d <= "1111001";
			WHEN "010" => d <= "0010000";
			WHEN "011" => d <= "0000100";
			WHEN "100" => d <= "1001110";
			WHEN OTHERS => d <= "1111111";
		END CASE;
	END PROCESS Dec;
END Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare overall entity --
ENTITY Lab1c IS
	GENERIC (WIDTH : INTEGER := 3);
	PORT(SW   : IN std_logic_vector(WIDTH - 1 DOWNTO 0);
		  HEX0 : OUT std_logic_vector(6 DOWNTO 0));
END Lab1c;

-- Architecture of overall entity: Structural --
ARCHITECTURE Structural OF Lab1c IS
COMPONENT Decoder3to7
   PORT (c : IN std_logic_vector(2 DOWNTO 0);
         d : OUT std_logic_vector(6 DOWNTO 0));
END COMPONENT;
	
BEGIN
	Dec : Decoder3to7
		PORT MAP(c=>SW(2 DOWNTO 0), d=>HEX0(6 DOWNTO 0));
END Structural;