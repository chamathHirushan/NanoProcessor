----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 11:01:28 AM
-- Design Name: 
-- Module Name: Mux_8way_4bit - Behavioral
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

entity Mux_8way_4bit is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (31 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is

component Decoder_3_to_8 
 port ( 
     address: in std_logic_vector(2 downto 0); 
     data: out std_logic_vector(7 downto 0)); 
end component;

signal decoded_S :std_logic_vector(7 downto 0);
signal S0_vec :std_logic_vector(3 downto 0);
signal S1_vec :std_logic_vector(3 downto 0);
signal S2_vec :std_logic_vector(3 downto 0);
signal S3_vec :std_logic_vector(3 downto 0);
signal S4_vec :std_logic_vector(3 downto 0);
signal S5_vec :std_logic_vector(3 downto 0);
signal S6_vec :std_logic_vector(3 downto 0);
signal S7_vec :std_logic_vector(3 downto 0);

begin

    LUT_Decoder : Decoder_3_to_8
            port map(
            address => S,
            data => decoded_S);

    
    S0_vec <= (others => decoded_S(0)); -- Assigning decoded_s(0) to every element of S0_vec
    S1_vec <= (others => decoded_S(1));
    S2_vec <= (others => decoded_S(2));
    S3_vec <= (others => decoded_S(3));
    S4_vec <= (others => decoded_S(4));
    S5_vec <= (others => decoded_S(5)); 
    S6_vec <= (others => decoded_S(6));
    S7_vec <= (others => decoded_S(7));
    
    Y <= (D(3 downto 0) and S0_vec) or (D(7 downto 4) and S1_vec) or (D(11 downto 8) and S2_vec) or (D(15 downto 12) and S3_vec) or (D(19 downto 16) and S4_vec) or (D(23 downto 20) and S5_vec) or (D(27 downto 24) and S6_vec) or (D(31 downto 28) and S7_vec);
    
end Behavioral;
