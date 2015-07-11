library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--clk_in mapped to port P89
entity clk32mHz is
    Port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        scl: out STD_LOGIC
    );
end clk32mHz;

architecture Behavioral of clk32mHz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 999 := 0;
begin
--call a frequency divider process
--input clock needs to be divided
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    scl <= temporal;
end Behavioral;
