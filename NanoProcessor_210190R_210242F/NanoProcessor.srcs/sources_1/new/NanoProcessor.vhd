----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 09:17:10 AM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Seg7input : out std_logic_vector (3 downto 0);
           Reset : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Seg7output : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out std_logic_vector (3 downto 0));
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

component LUT_16_7
    Port ( result : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component RegisterBank
    Port ( R_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Res  : in STD_LOGIC;
           Clk  : in STD_LOGIC;
           Input : in STD_LOGIC_VECTOR (3 downto 0);
           D : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Add_Sub_unit
    Port ( D : in STD_LOGIC_VECTOR (31 downto 0);
           RegSel0 : in STD_LOGIC_VECTOR (2 downto 0);
           RegSel1 : in STD_LOGIC_VECTOR (2 downto 0);
           AddSub : in STD_LOGIC; -- 0 is adder, 1 is substracter
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           RegCheck : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component PC
    Port ( Jump : in STD_LOGIC;
           Address : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           M : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component PROM 
    Port ( Mem_Sel : in STD_LOGIC_VECTOR (2 downto 0);
           I : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Mux_2way_4bit
    Port ( S : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component InstructionDecoder
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
end component;

signal slow_clk_sig, AddSub,Jump, Load_sel : std_logic;
signal Reg_En,RegSel0, RegSel1, JumpAddress,M : std_logic_vector(2 downto 0);
signal Regbank_input, AddSub_out, RegCheck, d_value : std_logic_vector(3 downto 0);
signal I : std_logic_vector(11 downto 0);
signal D : std_logic_vector(31 downto 0);

begin
    Slow_Clk_0: Slow_Clk
    port map(
        Clk_in => Clk,
        Clk_out => slow_clk_sig
    );
    
    Reg_bank: RegisterBank
    port map(
        R_EN => Reg_En,
        Res => Reset,
        Clk => slow_clk_sig,
        Input => Regbank_input,
        D => D
    );
    
    AddSubUnit: Add_Sub_unit
    port map(
        D => D,
        RegSel0 => RegSel0,
        RegSel1 => RegSel1,
        AddSub => AddSub,
        OverFlow => overflow,
        Zero => Zero,
        Output => AddSub_out,
        RegCheck => RegCheck
    );
    
    ProgrammeCounter: PC
    port map(
        Jump => Jump,
        Address => JumpAddress,
        Clk => slow_clk_sig,
        Res => Reset,
        M => M
    );
    
    ProgramROM : PROM
    port map(
        Mem_Sel => M,
        I => I
    );
    
    LUT_16_7_0: LUT_16_7
    port map(
        result => D(31 downto 28),
        data => Seg7output
    );
    
    Mux: Mux_2way_4bit
    port map(
        S => Load_sel,
        D0 => AddSub_out,
        D1 => d_value,
        Y => Regbank_input
    );
    
    Instruction_decoder: InstructionDecoder
    port map(
        I => I,
        Reg_Check => RegCheck,
        Reg_EN => Reg_En,
        Reg_sel0 => RegSel0,
        Reg_sel1 => RegSel1,
        Address => JumpAddress,
        d_value => d_value,
        Jump => Jump,
        Load_Sel => Load_sel,
        Add_Sub => AddSub
    );
    
    Anode <= "1110";
    Seg7input <= D(31 downto 28);

end Behavioral;
