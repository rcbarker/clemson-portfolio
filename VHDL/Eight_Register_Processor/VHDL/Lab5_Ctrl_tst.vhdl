-- Ryan Barker --
-- ECE 3270
-- Dr. Smith
-- Lab5_Ctrl_tst.vhdl
--
-- Purpose: Test driver for controller. Uses CTRL with two decoders and the IR 
--          and outputs each command signal so controller behavior may be observed.
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Declare Controller Test --
ENTITY Lab5_Ctrl_tst IS 
PORT (IR_bits  : IN std_logic_vector(8 DOWNTO 0); 
	   Run      : IN std_logic;
	   Resetn   : IN std_logic;
	   Clk      : IN std_logic;
		R0_out   : OUT std_logic;
		R1_out   : OUT std_logic;
		R2_out   : OUT std_logic;
		R3_out   : OUT std_logic;
		R4_out   : OUT std_logic;
		R5_out   : OUT std_logic;
		R6_out   : OUT std_logic;
		R7_out   : OUT std_logic;
		G_out    : OUT std_logic;
		DIN_out  : OUT std_logic;
		R0_in    : OUT std_logic;
		R1_in    : OUT std_logic;
		R2_in    : OUT std_logic;
		R3_in    : OUT std_logic;
		R4_in    : OUT std_logic;
		R5_in    : OUT std_logic;
		R6_in    : OUT std_logic;
		R7_in    : OUT std_logic;
		A_in     : OUT std_logic;
		G_in     : OUT std_logic;
		AddSub   : OUT std_logic;			
		Done     : OUT std_logic);
END Lab5_Ctrl_tst;

-- Architecture of Controller Test --
ARCHITECTURE Lab5_Ctrl_tst_B OF Lab5_Ctrl_tst IS
    SIGNAL IR_to_ctrl : std_logic_vector(8 DOWNTO 0);
	 SIGNAL IR_in : std_logic;
	 SIGNAL ctrl_to_DecX : std_logic_vector(2 DOWNTO 0);
	 SIGNAL ctrl_to_DecY : std_logic_vector(2 DOWNTO 0);
	 SIGNAL decX0, decX1, decX2, decX3, decX4, decX5,
	        decX6, decX7, decY0, decY1, decY2, decY3,
			  decY4, decY5, decY6, decY7 : std_logic;
			  
    COMPONENT Lab5_Ctrl
    PORT (IR       : IN std_logic_vector(8 DOWNTO 0); 
	       Run      : IN std_logic;
	       Resetn   : IN std_logic;
		    Clk      : IN std_logic;
			 DecX0    : IN std_logic;
			 DecX1    : IN std_logic;
			 DecX2    : IN std_logic;
			 DecX3    : IN std_logic;
			 DecX4    : IN std_logic;
			 DecX5    : IN std_logic;
			 DecX6    : IN std_logic;
			 DecX7    : IN std_logic;
			 DecY0    : IN std_logic;
			 DecY1    : IN std_logic;
			 DecY2    : IN std_logic;
			 DecY3    : IN std_logic;
			 DecY4    : IN std_logic;
			 DecY5    : IN std_logic;
			 DecY6    : IN std_logic;
			 DecY7    : IN std_logic;
		    IR_in    : OUT std_logic;
			 R0_out   : OUT std_logic;
			 R1_out   : OUT std_logic;
			 R2_out   : OUT std_logic;
			 R3_out   : OUT std_logic;
			 R4_out   : OUT std_logic;
			 R5_out   : OUT std_logic;
			 R6_out   : OUT std_logic;
			 R7_out   : OUT std_logic;
		    G_out    : OUT std_logic;
			 DIN_out  : OUT std_logic;
			 R0_in    : OUT std_logic;
			 R1_in    : OUT std_logic;
			 R2_in    : OUT std_logic;
			 R3_in    : OUT std_logic;
			 R4_in    : OUT std_logic;
			 R5_in    : OUT std_logic;
			 R6_in    : OUT std_logic;
			 R7_in    : OUT std_logic;
		    A_in     : OUT std_logic;
			 G_in     : OUT std_logic;
          AddSub   : OUT std_logic;			
			 Done     : OUT std_logic;
		    DecX_out : OUT std_logic_vector(2 DOWNTO 0);
			 DecY_out : OUT std_logic_vector(2 DOWNTO 0));
    END COMPONENT;
	 
	 COMPONENT Lab5_Decoder
    PORT (input : IN std_logic_vector(2 DOWNTO 0);
          out0  : OUT std_logic;
          out1  : OUT std_logic;
          out2  : OUT std_logic;
          out3  : OUT std_logic;
          out4  : OUT std_logic;
          out5  : OUT std_logic;
          out6  : OUT std_logic;
          out7  : OUT std_logic);
    END COMPONENT;
	 
	 COMPONENT Lab5_IR
    PORT (input  : IN std_logic_vector(8 DOWNTO 0);
	       reset  : IN std_logic;
          load   : IN std_logic;
	  		 clk    : IN std_logic;
			 output : OUT std_logic_vector(8 DOWNTO 0));
    END COMPONENT;
BEGIN
    Ctrl: Lab5_Ctrl
    PORT MAP (IR       => IR_to_ctrl,
	           Run      => Run,
	           Resetn   => Resetn,
		        Clk      => Clk,
			     DecX0    => decX0,
			     DecX1    => decX1,
			     DecX2    => decX2,
			     DecX3    => decX3,
			     DecX4    => decX4,
			     DecX5    => decX5,
			     DecX6    => decX6,
			     DecX7    => decX7,
			     DecY0    => decY0,
			     DecY1    => decY1,
			     DecY2    => decY2,
		  	     DecY3    => decY3,
			     DecY4    => decY4,
			     DecY5    => decY5,
			     DecY6    => decY6,
			     DecY7    => decY7,
		        IR_in    => IR_in,
			     R0_out   => R0_out,
			     R1_out   => R1_out,
			     R2_out   => R2_out,
			     R3_out   => R3_out,
			     R4_out   => R4_out,
			     R5_out   => R5_out,
			     R6_out   => R6_out,
			     R7_out   => R7_out,
		        G_out    => G_out,
			     DIN_out  => DIN_out,
			     R0_in    => R0_in,
			     R1_in    => R1_in,
			     R2_in    => R2_in, 
			     R3_in    => R3_in,
			     R4_in    => R4_in,
				  R5_in    => R5_in,
				  R6_in    => R6_in,
				  R7_in    => R7_in,
				  A_in     => A_in,
				  G_in     => G_in,
				  AddSub   => AddSub,		
				  Done     => Done,
				  DecX_out => ctrl_to_DecX,
				  DecY_out => ctrl_to_DecY);
				  
DecX: Lab5_Decoder
    PORT MAP (input => ctrl_to_DecX,
              out0  => decX0,
              out1  => decX1,
              out2  => decX2,
              out3  => decX3,
              out4  => decX4,
              out5  => decX5,
              out6  => decX6,
              out7  => decX7);
				  
DecY: Lab5_Decoder
    PORT MAP (input => ctrl_to_DecY,
              out0  => decY0,
              out1  => decY1,
              out2  => decY2,
              out3  => decY3,
              out4  => decY4,
              out5  => decY5,
              out6  => decY6,
              out7  => decY7);
				  
IR: Lab5_IR
    PORT MAP (input => IR_bits,
	           reset => Resetn,
              load  => IR_in,
	  		     clk   => Clk,
			     output => IR_to_ctrl);
END Lab5_Ctrl_tst_B;