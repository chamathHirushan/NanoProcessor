----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 10:28:06 AM
-- Design Name: 
-- Module Name: PROM - Behavioral
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

entity PROM is
    Port ( Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end PROM;

architecture Behavioral of PROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
 
 signal instruction_ROM : rom_type := (
 --CHANGE INSTRUCTIONS HERE
     "101110000000", --MOV R7, 0
     "100010000001", --MOV R1, 1 
     "100100000010", --MOV R2, 2
     "100110000011", --MOV R3, 3
     "001110010000", --ADD R7, R1
     "001110100000", --ADD R7, R2
     "001110110000", --ADD R7, R3
     "110000000111"  --JZR R0, 7
 );

begin

    I <= instruction_ROM(to_integer(unsigned(Mem_Sel)));

end Behavioral;