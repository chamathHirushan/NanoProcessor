----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 06:07:39 AM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( Jump : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           M : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

component RCA_3
    Port ( A : in STD_LOGIC_VECTOR (2 DOWNTO 0);
           S : out STD_LOGIC_VECTOR (2 DOWNTO 0);
           C_out : out STD_LOGIC);
end component;

component Mux_2way_3bit
    Port ( S : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (2 downto 0);
           D1 : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component PCReg
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res  : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

SIGNAL adder_out,Mux_out,PC_out : STD_LOGIC_VECTOR(2 downto 0);
SIGNAL C_out_adder: STD_LOGIC;

begin
    adder_3_bit: RCA_3
    port map(
        A => PC_out,
        S => adder_out,
        C_out => C_out_adder);
        
    Mux_2way_3bit_0: Mux_2way_3bit
    port map(
        S => Jump,
        D0 => adder_out,
        D1 => Address,
        Y => Mux_out);
        
    ProgramCounter: PCReg
    port map(
        D => Mux_out,
        Res => Res,
        Clk => Clk,
        Q => PC_out);
        
     M <= PC_out;

end Behavioral;
