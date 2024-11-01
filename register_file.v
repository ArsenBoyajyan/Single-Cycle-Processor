module RegisterFile (
    input wire clk,
    input wire [4:0] read_addr_1,
    input wire [4:0] read_addr_2,
    input wire [4:0] write_addr,
    input wire [31:0] write_data,
    input wire we,
    output reg [31:0] read_data_1,
    output reg [31:0] read_data_2
);


    reg [31:0] regs [0:31];
    integer i;

    // Initialize all registers to 0
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            regs[i] <= 0;
        end
    end

    always @(*) begin
        read_data_1 = regs[read_addr_1];
        read_data_2 = regs[read_addr_2];
        read_data_2 = read_data_2 + 0;
    end

    always @(posedge clk) begin
        if (we) begin
            regs[write_addr] <= write_data;
        end
    end

endmodule