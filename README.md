# Nano Processor Instruction Set

This repository contains instructions and details for a custom 12-bit instruction set designed for a nano processor.

# Nano-Processor-Design
A Nano Processor designed to execute a basic set of instructions, featuring a 4-bit Add/Subtract unit, a 3-bit adder, a 3-bit Program Counter, and k-way b-bit multiplexers.


| Instruction | Description | Format (12-bit instruction) |
|-------------|-------------|-----------------------------|
| MOVI R, d | Move immediate value d to register R, i.e., R ← d <br>R ∈ [0, 7], d ∈ [0, 15] | 1 0 R R R 0 0 0 d d d d |
| ADD Ra, Rb | Add values in registers Ra and Rb and store the result in Ra, i.e., Ra ← Ra + Rb <br>Ra, Rb ∈ [0, 7] | 0 0 Ra Ra Ra Rb Rb Rb 0 0 0 0 |
| NEG R | 2’s complement of registers R, i.e., R ← −R <br>R ∈ [0, 7] | 0 1 R R R 0 0 0 0 0 0 0 |
| JZR R, d | Jump if value in register R is 0, i.e., <br>&nbsp;If R == 0 <br>&nbsp;&nbsp;&nbsp;PC ← d; <br>&nbsp;Else <br>&nbsp;&nbsp;&nbsp;PC ← PC + 1; <br>R ∈ [0, 7], d ∈ [0, 7] | 1 1 R R R 0 0 0 0 d d d |

<br>
<br>

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
