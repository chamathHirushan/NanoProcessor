----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 08:19:01 AM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionDecoder is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_Check : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel0 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_Sel1 : out STD_LOGIC_VECTOR (2 downto 0);
           Address : out STD_LOGIC_VECTOR (2 downto 0);
           d_value : out STD_LOGIC_VECTOR (3 downto 0);
           Jump : out STD_LOGIC;
           Load_Sel : out STD_LOGIC;
           Add_Sub : out STD_LOGIC);
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

signal Jump_Temp : std_logic;

begin
    
    d_value <= I(3 downto 0);
    Reg_EN <= I(9 downto 7);
    Reg_Sel1 <= I(9 downto 7);
    Reg_Sel0 <= I(6 downto 4);
    Add_Sub <= (not I(11)) and I(10);
    Jump_Temp <= I(11) and I(10);
    Load_Sel <= I(11) and (not I(10));
    Address <= I(2 downto 0);
    Jump <= Jump_Temp and (not (Reg_Check(0) or Reg_Check(1) or Reg_Check(2) or Reg_Check(3)));

end Behavioral;