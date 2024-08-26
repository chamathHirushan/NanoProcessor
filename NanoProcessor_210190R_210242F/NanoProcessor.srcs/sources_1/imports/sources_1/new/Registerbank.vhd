----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 08:54:06 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( R_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Res  : in STD_LOGIC;
           Clk  : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (31 downto 0));
end RegisterBank;

architecture Behavioral of RegisterBank is

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Res  : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
 end component;
 
 component Decoder_3_to_8
     Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
            data : out STD_LOGIC_VECTOR (7 downto 0));
 end component;
 
signal EN_vec : std_logic_vector(7 downto 0);

begin
    
   LUT_Decoder : Decoder_3_to_8
     PORT MAP(
        address => R_EN,
        data => EN_vec
    );
    
   Reg_0 : Reg
     PORT MAP(
         D => "0000",
         En => '1' ,
         Res => '0',
         Clk => Clk,
         Q => D(3 downto 0)
     );
     
   Reg_1 : Reg
       PORT MAP(
           D => Input,
           En => EN_vec(1) ,
           Res => Res,
           Clk => Clk,
           Q => D(7 downto 4)
       );
       
   Reg_2 : Reg
         PORT MAP(
             D => Input,
             En => EN_vec(2) ,
             Res => Res,
             Clk => Clk,
             Q => D(11 downto 8)
         );

   Reg_3 : Reg
     PORT MAP(
         D => Input,
         En => EN_vec(3) ,
         Res => Res,
         Clk => Clk,
         Q => D(15 downto 12)
     );

   Reg_4 : Reg
     PORT MAP(
         D => Input,
         En => EN_vec(4) ,
         Res => Res,
         Clk => Clk,
         Q => D(19 downto 16)
     );

   Reg_5 : Reg
     PORT MAP(
         D => Input,
         En => EN_vec(5) ,
         Res => Res,
         Clk => Clk,
         Q => D(23 downto 20)
     );

   Reg_6 : Reg
     PORT MAP(
         D => Input,
         En => EN_vec(6) ,
         Res => Res,
         Clk => Clk,
         Q => D(27 downto 24)
     );

   Reg_7 : Reg
     PORT MAP(
         D => Input,
         En => EN_vec(7) ,
         Res => Res,
         Clk => Clk,
         Q => D(31 downto 28)
     );

end Behavioral;
