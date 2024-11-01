module ImmediateGenerator (
  input [31:0] instruction,
  output reg [31:0] immediate
);

    wire [6:0] opcode;
    assign opcode = instruction[6:0];  // Extract opcode (bits [6:0])

    always @(*) begin
        case (opcode)
            7'b0010011, 7'b0000011, 7'b1100111: begin  // I-type
                immediate = {{20{instruction[31]}}, instruction[31:20]};
            end
            7'b0100011: begin  // S-type
                immediate = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; 
            end
            7'b1100011: begin  // B-type
                immediate = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
            end
            7'b0110111, 7'b0010111: begin  // U-type
                immediate = {instruction[31:12], 12'b0};
            end
            7'b1101111: begin  // J-type
                immediate = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};
            end
            default: begin
                immediate = 32'b0;
            end
        endcase
    end

endmodule
