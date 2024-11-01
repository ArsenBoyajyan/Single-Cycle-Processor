module SingleCycleProcessor (
    input clk
);
    wire [31:0] Inst;
    wire [31:0] Read_data1, Read_data2;
    wire [31:0] Imm_out;
    wire [31:0] ALU_result;
    wire [31:0] Mem_read_data;
    wire [31:0] PC_cs;
    wire RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch, Zero;
    wire [1:0] ALUOp;
    wire [3:0] ALUControl;
    
    InstructionMemory IM (
        .address(PC_cs),
        .instruction(Inst)
    );

    ControlUnit CU (
        .opcode(Inst[6:0]),
        .funct7(Inst[31:25]),
        .funct3(Inst[14:12]),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    ImmediateGenerator IG (
        .instruction(Inst),
        .immediate(Imm_out)
    );

    RegisterFile RF1 (
        .clk(clk),
        .read_addr_1(Inst[19:15]),
        .read_addr_2(Inst[24:20]),
        .write_addr(Inst[11:7]),
        .write_data(MemtoReg ? Mem_read_data : ALU_result),
        .we(RegWrite),
        .read_data_1(Read_data1),
        .read_data_2(Read_data2)
    );

    ALU_Control AC (
        .ALUOp(ALUOp),
        .funct3(Inst[14:12]),
        .funct7(Inst[31:25]),
        .ALUControl(ALUControl)
    );

    ALU ALU (
        .A(Read_data1),
        .B(ALUSrc? Imm_out: Read_data2),
        .ALU_Sel(ALUControl),
        .ALU_Out(ALU_result),
        .Zero(Zero)
    );

    DataMemory DataMem1 (
        .clk(clk),
        .address(ALU_result),
        .write_data(Read_data2),
        .write_enable(MemWrite),
        .read_enable(MemRead),
        .read_data(Mem_read_data)
    );

    // PC logic
    reg [31:0] PC = 32'b0;
    always @(posedge clk) begin
        if (Branch && Zero) begin
            PC <= Imm_out + PC;
        end else begin
            PC <= PC + 4;
        end
    end
    assign PC_cs = PC;
    assign RF1_reg5 = RF1.regs[5];
    

endmodule