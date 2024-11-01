module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALU_Sel,
    output reg [31:0] ALU_Out,
    output reg Zero
);

    always @(*) begin
        case (ALU_Sel)
            4'b0010: ALU_Out = A + B;
            4'b0110: ALU_Out = A - B;
            4'b0000: ALU_Out = A & B;
            4'b0001: ALU_Out = A | B;
            default: ALU_Out = 32'b0;
        endcase
        Zero = (ALU_Out == 32'b0) ? 1'b1 : 1'b0;
    end

endmodule
