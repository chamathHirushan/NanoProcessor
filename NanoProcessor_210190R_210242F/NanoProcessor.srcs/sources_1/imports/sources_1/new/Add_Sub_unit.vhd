----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 10:33:52 PM
-- Design Name: 
-- Module Name: Add_Sub_unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Add_Sub_unit is
    Port ( D : in STD_LOGIC_VECTOR (31 downto 0);
           RegSel0 : in STD_LOGIC_VECTOR (2 downto 0);
           RegSel1 : in STD_LOGIC_VECTOR (2 downto 0);
           AddSub : in STD_LOGIC; -- 0 is adder, 1 is substracter
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           RegCheck : out STD_LOGIC_VECTOR (3 downto 0));
end Add_Sub_unit;

architecture Behavioral of Add_Sub_unit is

    component RCAS_4
        Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
               B : in STD_LOGIC_VECTOR(3 downto 0);
               Func : in STD_LOGIC; -- 0 is adder, 1 is substracter
               S : out STD_LOGIC_VECTOR(3 downto 0);
               C_out : out STD_LOGIC);
    end component;
    
    component Mux_8way_4bit
        Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
               D : in STD_LOGIC_VECTOR (31 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
 SIGNAL Mux0_out, Mux1_out, result: STD_LOGIC_VECTOR(3 downto 0);
 SIGNAL Overflow_flag: STD_LOGIC;

begin
   
    Mux_8way_4bit_0 : Mux_8way_4bit
    port map(
    S => RegSel0,
    D => D,
    Y => Mux0_out); 
    
    Mux_8way_4bit_1 : Mux_8way_4bit
    port map(
    S => RegSel1,
    D => D,
    Y => Mux1_out); 
    
    RCAS_0 : RCAS_4
    port map(
    A => Mux0_out,
    B => Mux1_out,
    Func => AddSub,
    S => result,
    C_out => Overflow_flag);
    
    Overflow <= Overflow_flag;
    Output <= result;
    RegCheck <= Mux0_out;
    Zero <= NOT( result(0) OR result(1) OR result(2) OR result(3) OR Overflow_flag);

end Behavioral;
