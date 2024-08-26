----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:21:11 PM
-- Design Name: 
-- Module Name: Sim_regbank - Behavioral
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

entity Sim_regbank is
--  Port ( );
end Sim_regbank;

architecture Behavioral of Sim_regbank is

component RegisterBank
    Port ( R_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Res  : in STD_LOGIC;
           Clk  : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal R_EN : std_logic_vector (2 downto 0);
signal Input : std_logic_vector (3 downto 0);
signal D : std_logic_vector (31 downto 0);
signal Res, Clk: std_logic;

begin

UUT: RegisterBank port map(
    R_EN => R_EN,
    Res => Res,
    Clk => Clk,
    Input => Input,
    D => D
);

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
        R_EN <= "001";
        Input <= "1101";
        wait for 100 ns;
        
        R_EN <= "010";
        wait for 100ns;
        R_EN <= "011";
        wait for 100ns;
        R_EN <= "100";
        wait for 100ns;
        R_EN <= "101";
        wait for 100ns;   
         R_EN <= "110";
         wait for 100ns;
         R_EN <= "111";
         wait for 100ns;
         Res <= '1';
         wait for 100ns;
         Res <= '0';
        wait;
        end process;

end Behavioral;
