----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 10:16:23 PM
-- Design Name: 
-- Module Name: NanoProcessor_SIm - Behavioral
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

entity NanoProcessor_SIm is
--  Port ( );
end NanoProcessor_SIm;

architecture Behavioral of NanoProcessor_SIm is
component NanoProcessor
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Seg7input : out std_logic_vector (3 downto 0);
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Seg7output : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out std_logic_vector (3 downto 0));
end component;

signal Clk, Reset, OverFlow, Zero : std_logic;
signal Seg7output : std_logic_vector (6 downto 0);
signal Seg7input,Anode : std_logic_vector (3 downto 0);

begin
UUT: NanoProcessor port map (
    Clk => Clk,
    Reset => Reset,
    Seg7input => Seg7input,
    OverFlow => OverFlow,
    Zero => Zero,
    Seg7output => Seg7output,
    Anode => Anode);

Clk_process : process
begin
Clk <= '0';
wait for 5 ns;
Clk <= '1';
wait for 5 ns;
end process;

processor : process
begin
Reset <= '0';
wait for 250 ns;
Reset <= '1';
wait for 30 ns;
Reset <= '0';
wait;
end process;

end Behavioral;
