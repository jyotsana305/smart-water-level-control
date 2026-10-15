
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity smart_water_controller is
    Port (
        LEVEL    : in  STD_LOGIC_VECTOR(1 downto 0);
        PUMP_ON  : out STD_LOGIC;
        PUMP_OFF : out STD_LOGIC;
        ALARM    : out STD_LOGIC
    );
end smart_water_controller;

architecture Behavioral of smart_water_controller is
begin
    process(LEVEL)
    begin
        PUMP_ON  <= '0';
        PUMP_OFF <= '1';
        ALARM    <= '1';

        case LEVEL is
            when "00" =>
                PUMP_ON  <= '1';
                PUMP_OFF <= '0';
                ALARM    <= '1';

            when "01" =>
                PUMP_ON  <= '0';
                PUMP_OFF <= '1';
                ALARM    <= '0';

            when "10" =>
                PUMP_ON  <= '0';
                PUMP_OFF <= '1';
                ALARM    <= '1';

            when others =>
                PUMP_ON  <= '0';
                PUMP_OFF <= '1';
                ALARM    <= '1';
        end case;
    end process;
end Behavioral;
