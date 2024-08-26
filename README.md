# Nano Processor Instruction Set

This repository contains instructions and details for a custom 12-bit instruction set designed for a nano processor.

## Instruction Format

The instructions are structured as a 12-bit sequence:

*Note: The instruction format is without spaces.*

- `cc` - 2-bit command
- `rrr` - Address of Register A
- `RRR` - Address of Register B
- `dddd` - 4-bit data

### Command (`cc`)

- `00` - **ADD**: Adds the data in the two given registers.
- `10` - **MOVI**: Moves data to a register.
- `01` - **NEG**: Computes the two’s complement of the register data.
- `11` - **JZR**: Jump command; if the given register has `0000`, jump to a specific instruction.

### Register Addressing (`rrr` and `RRR`)

- `000` - R0
- `001` - R1
- `010` - R2
- `011` - R3
- `100` - R4
- `101` - R5
- `110` - R6
- `111` - R7

### Data (`dddd`)

- A 4-bit data value that can be moved to a register using the `MOVI` command.

## Output Details

- **Register 7 Output**: Displayed on LEDs `LD0` to `LD3`.
- **Zero Flag**: If the add/sub unit results in all zeros, this is indicated by LED `LD14`.
- **Overflow Flag**: Overflow from the add/sub unit is indicated by LED `LD15`.
- **7-Segment Display**: The data stored in Register 7 is displayed on the first 7-segment display (`an[0]`), with segments mapped from `seg[0]` to `seg[6]`.

## Reset Functionality

- The **Reset** button (`bttnC`) resets the program counter, registers, and other components. Instructions can be restarted by pressing the Reset button.

## Instruction Execution

- Instructions are fetched from the programmable ROM and executed in sequence.
- The 7-segment display reflects the data stored in Register 7.
- LEDs display the corresponding values based on the execution outcome.

---

Feel free to explore the code and contribute to this project!
