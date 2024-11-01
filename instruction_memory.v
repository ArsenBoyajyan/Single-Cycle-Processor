module InstructionMemory(
    input wire [31:0] address,
    output wire [31:0] instruction
);

    reg [31:0] mem [0:17];

  initial begin
    mem[0] = 32'b11111111011000000000001010010011;
    mem[1] = 32'b00000000010100101000001100110011;
    mem[2] = 32'b01000000011000101000001110110011;
    mem[3] = 32'b00000000000000110111111000110011;
    mem[4] = 32'b00000000010100110110111010110011;
    mem[5] = 32'b00000001110100000010000000100011;
    mem[6] = 32'b00000000010100000010001000100011;
    mem[7] = 32'b00000000000000101000010001100011;
    mem[8] = 32'b00000000000000110000111010110011;
    mem[9] = 32'b00000001110100110001010001100011;
    mem[10] = 32'b00000001110000110001010001100011;
    mem[11] = 32'b00000000000000111000001110110011;
    mem[12] = 32'b00000000000000000010010000000011;
    mem[13] = 32'b00000000010000000010010010000011;
    mem[14] = 32'b00000000100001001000010010010011;
    mem[15] = 32'b00000000100101000000010001100011;
    mem[16] = 32'b00000000000000000000001110110011;
    mem[17] = 32'b00000000011100111000001110110011;
  end

    // Fetch the instruction based on the PC
    assign instruction = mem[address >> 2];
    

endmodule