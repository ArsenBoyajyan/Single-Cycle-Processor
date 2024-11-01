module mux (
  input [31:0] a,
  input [31:0] b,
  input sel,
  output reg [31:0] out
);

  always @(*) begin
    if (sel)
      out = b;
    else
      out = a;
  end

endmodule
