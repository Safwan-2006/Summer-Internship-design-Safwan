# 8x8 Block Memory Generator (BRAM) in Verilog

## 📌 Project Overview
This repository contains the Verilog RTL design and verification environment for an 8x8 Block Memory Generator. The design implements a Simple Dual-Port RAM with 8 memory locations (3-bit address width), where each location stores 8 bits of data. It features synchronous read/write operations controlled by a Write Enable (`wrenb`) signal and an asynchronous active-low reset (`arstn`).

## 📁 File Structure
* **block_memory_generator.v**: The top-level module implementing the 8x8 RAM array and control logic.
* **block_memory_generator_tb.v**: The testbench for verifying the memory block through sequential write and read operations.

## 🛠️ Tools Used
* **Hardware Description Language:** Verilog
* **Simulation & Synthesis:** Xilinx Vivado

## 📊 Expected Simulation Results
The `block_memory_generator_tb` applies a sequence of resets, writes, and reads synchronized to the clock. 

*(Note: In the testbench, the value `8'h0A` (decimal 10, binary `1010`) is assigned to the 3-bit address buses. In hardware, this automatically truncates the most significant bit, wrapping the address to `3'b010` (decimal 2). The table below reflects this true hardware behavior).*

| Operation Phase | `arstn` | `wrenb` | `write_address` | `data_in` (Hex) | `read_address` | Expected `data_out` (Hex) | Description |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| **Reset** | 0 | 0 | 000 | `00` | 000 | `00` | System is in reset. Output is cleared. |
| **Write 1** | 1 | 1 | 101 (5) | `B9` | 000 | `00` | Writing `10111001` to memory location 5. |
| **Write 2** | 1 | 1 | 010 (2)* | `F0` | 000 | `00` | Writing `11110000` to memory location 2. |
| **Read 1** | 1 | 0 | 010 (2) | `F0` | 101 (5) | `B9` | Reading from location 5. Output updates to `B9`. |
| **Read 2** | 1 | 0 | 010 (2) | `F0` | 010 (2)* | `F0` | Reading from location 2. Output updates to `F0`. |

## 📈 Simulation Waveform
<img width="1547" height="694" alt="bmg-8x8" src="https://github.com/user-attachments/assets/b1a2345e-e2e2-45e5-8253-999873e254dd" />

---
**Author:** Mohammed Safwan M.

