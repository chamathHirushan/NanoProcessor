----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 09:40:13 AM
-- Design Name: 
-- Module Name: PC_SIm - Behavioral
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

entity PC_SIm is
--  Port ( );
end PC_SIm;

architecture Behavioral of PC_SIm is

component PC
    Port ( Jump : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           M : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal Address, M : std_logic_vector (2 downto 0);
signal Res, Clk , Jump : std_logic;

begin
UUT: PC port map (
    Jump => Jump,
    Address => Address,
    Clk => Clk,
    Res => Res,
    M => M);
    
Clk_process : process
    begin
    Clk <= '0';
    wait for 5 ns;
    Clk <= '1';
    wait for 5 ns;
    end process;

Util_Process : process
    begin
    Res <= '0';
    wait for 50 ns;
    Res <= '1';
    wait for 50 ns;
    Res <= '0';
    wait;
    end process;

end Behavioral;
