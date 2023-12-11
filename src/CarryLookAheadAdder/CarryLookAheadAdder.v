module CarryLookAheadAdder (
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output [31:0] F,
    output Cout
);
  wire [31:0] P, G;
  wire [32:0] C;

  assign C[0] = Cin;

  genvar i;
  generate
    for (i = 0; i < 32; i = i + 1) begin : gen_blk
      assign G[i]   = A[i] & B[i];
      assign P[i]   = A[i] ^ B[i];
      assign C[i+1] = G[i] | (P[i] & C[i]);
    end
  endgenerate

  assign F = P ^ C[31:0];
  assign Cout = C[32];

endmodule
