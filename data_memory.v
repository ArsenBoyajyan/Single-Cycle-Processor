module DataMemory (
  input clk,
  input [31:0] address,
  input [31:0] write_data,
  input write_enable,
  input read_enable,
  output reg [31:0] read_data
);

  reg [31:0] regs [0:200];
  
      integer i;

    // Initialize all registers to 0
    initial begin
        for (i = 0; i < 200; i = i + 1) begin
            regs[i] <= 0;
        end
    end

  always @(posedge clk) begin
    if (write_enable)
      regs[address[11:0]] <= write_data; 
  end

  always @(*) begin
    if (read_enable)
      read_data = regs[address[11:0]];
    else
      read_data = 32'b0;
  end

endmodule
