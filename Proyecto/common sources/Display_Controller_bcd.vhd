-- NO TOCAR

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Display_Controller is
    Port (
        dis_a       : in   STD_LOGIC_VECTOR (3 downto 0);
        dis_b       : in   STD_LOGIC_VECTOR (3 downto 0);
        dis_c       : in   STD_LOGIC_VECTOR (3 downto 0);
        dis_d       : in   STD_LOGIC_VECTOR (3 downto 0);
        clk         : in   STD_LOGIC;
        seg         : out  STD_LOGIC_VECTOR (7 downto 0);
        an          : out  STD_LOGIC_VECTOR (3 downto 0)
          );
end Display_Controller;

architecture Behavioral of Display_Controller is    

constant clock_divide_max   : STD_LOGIC_VECTOR (16 downto 0) := "11110000100000000";
signal clock_divide_counter : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');
signal display              : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
signal number               : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

begin

clock_divide : process (clk)
    begin
        if (rising_edge(clk)) then
            if (clock_divide_counter >= clock_divide_max) then
                clock_divide_counter <= (others => '0');
                display <= display + 1;
            else
                clock_divide_counter <= clock_divide_counter + 1;
            end if;
        else
                -- necesario para poder simular
        end if;
    end process;

with display select
    an <=       "0111" when "00",
                "1011" when "01",
                "1101" when "10",
                "1110" when "11",
                "0000" when others;
          
with display select
    number <=   dis_a when "00",
                dis_b when "01",
                dis_c when "10",
                dis_d when "11",
                "0000" when others;
   
with number select
    seg <=      "11000000" when "0000",
                "11111001" when "0001",
                "10100100" when "0010",
                "10110000" when "0011",
                "10011001" when "0100",
                "10010010" when "0101",
                "10000010" when "0110",
                "11111000" when "0111",
                "10000000" when "1000",
                "10010000" when "1001",
                "11111111" when others;
            
end Behavioral;