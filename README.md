# Smart Water-Level Control System Using VHDL

## Overview
A VHDL-based combinational controller that generates pump-control and alarm outputs based on digital water-level sensor inputs.

## Features
- Pump control for low and normal water-level conditions
- Alarm activation for low water and overflow
- Default safe outputs for invalid sensor input
- Testbench with assertions for all four input combinations

## Input Encoding

| LEVEL | Condition |
|---|---|
| `00` | Low water |
| `01` | Normal water |
| `10` | Overflow |
| `11` | Invalid input |

## Output Behavior

| Condition | PUMP_ON | PUMP_OFF | ALARM |
|---|---:|---:|---:|
| Low water | 1 | 0 | 1 |
| Normal water | 0 | 1 | 0 |
| Overflow | 0 | 1 | 1 |
| Invalid input | 0 | 1 | 1 |

## Project Files
- `smart_water_controller.vhd` — controller implementation
- `tb_smart_water_controller.vhd` — testbench and assertions

## Verification
The testbench checks all four possible input combinations. Run the testbench using a VHDL simulator to verify the expected outputs.

## Tools
VHDL, GHDL or another compatible VHDL simulator.

## Limitations
This project has been designed and verified through digital simulation. Physical pump control and hardware implementation are outside the current scope.
