----------------------------------------------------------------------------------
-- Company: PUC Chile
-- Engineer: Juan Aguillon
-- 
-- Create Date: 30.07.2019 02:06:07
-- Design Name: Binary BCD Decoder
-- Module Name: Binary_BCD - Behavioral
-- Project Name: Entrega 1C IIC2343 2019 2
-- Target Devices: Artix - 7 Basys 3
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

entity Decimal_BCD is
    Port(
    n       : in  STD_LOGIC_VECTOR (4 downto 0);
    dec : out STD_LOGIC_VECTOR (3 downto 0);
    unit    : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Decimal_BCD;

architecture Behavioral of Decimal_BCD is

begin

    dec(3) <= '0';
    dec(2) <= '0';
    dec(1) <= (n(4) and n(2)) or (n(4) and n(3));
    dec(0) <= (not n(4) and n(3) and n(1)) or (not n(4) and n(3) and n(2)) or (n(3) and n(2) and n(1)) or (n(4) and not n(3) and not n(2)) ;
    
    unit(0) <= n(0);
    unit(1) <= (not n(4) and not n(3) and n(1)) or (not n(3) and n(2) and n(1)) or (not n(4) and n(3) and n(2) and not n(1)) or (n(4) and not n(3) and not n(2) and not n(1)) or (n(4) and n(3) and not n(2) and n(1));
    unit(2) <= (not n(4) and not n(3) and n(2)) or (not n(4) and n(2) and n(1)) or (n(4) and not n(2) and not n(1)) or (n(4) and n(3) and not n(2));
    unit(3) <= (not n(4) and n(3) and not n(2) and not n(1)) or (n(4) and not n(3) and not n(2) and n(1)) or (n(4) and n(3) and n(2) and not n(1));
end Behavioral;
