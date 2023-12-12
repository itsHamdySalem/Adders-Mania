module RippleCarryAdder4bit (
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] Sum,
  output Cout
);

  wire [3:0] C;
  wire [3:0] S;

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : gen_loop
      assign {C[i], S[i]} = A[i] + B[i] + (i > 0 ? C[i-1] : Cin);
    end
  endgenerate

  assign Sum = S;
  assign Cout = C[3];

endmodule
