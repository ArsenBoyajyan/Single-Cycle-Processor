# Single-Cycle RISC-V Processor Project

This document summarizes a project to design and implement a single-cycle RISC-V processor.

## author
Arsen Boyajyan \
arsen_04@sjtu.edu.cn

## Overview

This project focuses on building a 32-bit single-cycle RISC-V processor in Verilog HDL. Although single-cycle designs aren't typically used in modern processors, this project provides a valuable foundation for understanding processor architecture and instruction execution.  The design emphasizes modularity, with individual components built and verified separately before integration.

## Implementation Details

The processor implements a subset of RISC-V instructions:

* **Arithmetic-Logical Instructions:** `add`, `addi`, `sub`, `and`, `or`
* **Memory-Reference Instructions:** `lw`, `sw`
* **Branch Instructions:** `beq`, `bne`

The Verilog code is synthesizable using Xilinx synthesis tools. A test program written in RISC-V assembly language was used to verify the continuous and correct execution of instructions.

## Files

The project source code, simulation code and schematic architecture are available in the director.