
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_smart_water_controller is
end tb_smart_water_controller;

architecture Test of tb_smart_water_controller is

    signal LEVEL    : STD_LOGIC_VECTOR(1 downto 0);
    signal PUMP_ON  : STD_LOGIC;
    signal PUMP_OFF : STD_LOGIC;
    signal ALARM    : STD_LOGIC;

begin

    uut: entity work.smart_water_controller
        port map (
            LEVEL    => LEVEL,
            PUMP_ON  => PUMP_ON,
            PUMP_OFF => PUMP_OFF,
            ALARM    => ALARM
        );

    stimulus: process
    begin
        -- Test 1: Low water
        LEVEL <= "00";
        wait for 10 ns;

        assert PUMP_ON = '1' and PUMP_OFF = '0'
            and ALARM = '1'
            report "Low water test failed"
            severity error;

        -- Test 2: Normal water
        LEVEL <= "01";
        wait for 10 ns;

        assert PUMP_ON = '0' and PUMP_OFF = '1'
            and ALARM = '0'
            report "Normal water test failed"
            severity error;

        -- Test 3: Overflow
        LEVEL <= "10";
        wait for 10 ns;

        assert PUMP_ON = '0' and PUMP_OFF = '1'
            and ALARM = '1'
            report "Overflow test failed"
            severity error;

        -- Test 4: Invalid input
        LEVEL <= "11";
        wait for 10 ns;

        assert PUMP_ON = '0' and PUMP_OFF = '1'
            and ALARM = '1'
            report "Invalid input test failed"
            severity error;

        report "All tests completed successfully"
            severity note;

        wait;
    end process;

end Test;
