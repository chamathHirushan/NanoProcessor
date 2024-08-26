----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 12:46:52 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCAS_4 is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Func : in STD_LOGIC; -- 0 is adder, 1 is substracter
           S : out STD_LOGIC_VECTOR(3 downto 0);
           C_out : out STD_LOGIC);
end RCAS_4;

architecture Behavioral of RCAS_4 is
    component FA
            port (
            A: in STD_LOGIC;
            B: in STD_LOGIC;
            C_in: in STD_LOGIC;
            S: out STD_LOGIC;
            C_out: out STD_LOGIC);
    end component;
    
SIGNAL FA0_C,FA1_C,FA2_C,FA3_C : STD_LOGIC;
SIGNAL BS : STD_LOGIC_VECTOR(3 downto 0);

begin

    FA_0 : FA
        port map(
        A => A(0),
        B => BS(0),
        C_in => Func,
        S => S(0),
        C_out => FA0_C);
        
    FA_1 : FA
            port map(
            A => A(1),
            B => BS(1),
            C_in => FA0_C,
            S => S(1),
            C_out => FA1_C);
 
    FA_2 : FA
            port map(
            A => A(2),
            B => BS(2),
            C_in => FA1_C,
            S => S(2),
            C_out => FA2_C);
            
    FA_3 : FA
            port map(
            A => A(3),
            B => BS(3),
            C_in => FA2_C,
            S => S(3),
            C_out => C_out);
    
    BS(0) <= B(0) xor Func;
    BS(1) <= B(1) xor Func;
    BS(2) <= B(2) xor Func;
    BS(3) <= B(3) xor Func;
    
end Behavioral;