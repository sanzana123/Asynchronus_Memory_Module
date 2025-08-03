# Asynchronous Memory Module for x86 architecture

This project implements an 8-bit asynchronous memory system using Verilog, along with a corresponding testbench to demonstrate memory write and read operations. The memory is interfaced through chip select (CS), read (RD), and write (WR) control signals.

## Features

- 8-bit data and address bus
- 256-byte memory space
- Asynchronous memory access
- Tri-state output for data bus when not reading
- Fully functional testbench included

## Files

- `async_mem.v`: Main memory module
- `testBench_asynchronus_mem.v`: Testbench to simulate memory operations

## How It Works

- **Write Operation**
  - Activated on the **falling edge of `WR`**
  - Data is stored at the specified address if `CS = 0`, `RD = 1`, `WR = 0`

- **Read Operation**
  - Data is driven to `data_out` if `CS = 0`, `RD = 0`, `WR = 1`

- **High Impedance**
  - `data_out` remains in high-impedance (`8'hzz`) when not actively reading

## Simulation Output

The testbench simulates writing `0xAB` to address `0x10`, then reads back and displays the result.

