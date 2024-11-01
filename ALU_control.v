module ALU_Control (
  input [1:0] ALUOp,
  input [2:0] funct3,
  input [6:0] funct7,
  output reg [3:0] ALUControl
);

  always @(*) begin
    case (ALUOp)
      2'b00: ALUControl = 4'b0010; // lw/sw
      2'b01: ALUControl = 4'b0110; // B-type
      2'b10: begin // R-type
        case (funct3)
          3'b000: ALUControl = (funct7[5] == 1'b1) ? 4'b0110 : 4'b0010; // add or sub
          3'b111: ALUControl = 4'b0000; // and
          3'b110: ALUControl = 4'b0001; // or
          default: ALUControl = 4'b0000;
        endcase
      end
      default: ALUControl = 4'b0000;
    endcase
  end

endmodule
