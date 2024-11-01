module ControlUnit (
  input [6:0] opcode,
  input [4:0] funct7,
  input [2:0] funct3,
  output reg RegWrite,
  output reg ALUSrc,
  output reg MemtoReg,
  output reg MemRead,
  output reg MemWrite,
  output reg Branch,
  output reg [1:0] ALUOp
);

  always @(*) begin
    case (opcode)
      7'b0000011: begin // lw
        RegWrite = 1'b1;
        ALUSrc = 1'b1;
        MemtoReg = 1'b1;
        MemRead = 1'b1;
        MemWrite = 1'b0;
        Branch = 1'b0;
        ALUOp = 2'b00; // Add
      end
      7'b0100011: begin // sw
        RegWrite = 1'b0;
        ALUSrc = 1'b1;
        MemtoReg = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b1;
        Branch = 1'b0;
        ALUOp = 2'b00; // Add
      end
      7'b1100011: begin // beq
        RegWrite = 1'b0;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b1;
        ALUOp = 2'b01; // Subtract
      end
      7'b1100011: begin // bne
        RegWrite = 1'b0;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b1;
        ALUOp = 2'b01; // Subtract
      end
      7'b0110011: begin  //R-type
        RegWrite = 'b1;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b0;
//        case (funct3)
//          3'b000: ALUOp = (funct7 == 7'b0000000) ? 2'b00 : 2'b01; // add or sub
//          3'b111: ALUOp = 2'b10; // and
//          3'b110: ALUOp = 2'b11; // or
//          default: ALUOp = 2'b00; //default to add
//        endcase
        ALUOp = 2'b10;
      end
      7'b0010011: begin // addi
        RegWrite = 1'b1;
        ALUSrc = 1'b1;
        MemtoReg = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b0;
        ALUOp = 2'b00; // Add
      end
      default: begin
        RegWrite = 1'b0;
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b0;
        ALUOp = 2'b00; //Default
      end
    endcase
  end

endmodule
