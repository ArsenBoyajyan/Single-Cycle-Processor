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

## Testing

The following RISC-V instrucction code was tested, by translating it into a machine code and inicializing it in the instruction memory:

```assembly
 addi t0 x0 -10
 add t1 t0 t0
 sub t2 t0 t1
 and t3 t1 x0
 or t4 t1 t0
 sw t4 0(x0)
 sw t0 4(x0)
 beq t0 x0 L1
 add t4 t1 x0 # possible error

L1: bne t1 t4 error1
	bne t1 t3 L2
error1: add t2 x0 x0
L2: lw s0 0(x0)
	lw s1 4(x0)
	addi s1 s1 8
	beq s0 s1 L3
error2: add t2 x0 x0
L3: add t2 t2 t2
```

## Files

The project source code, simulation code and schematic architecture are available in the director.