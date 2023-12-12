module CarryBypassAdder (
  input [31:0] A,
  input [31:0] B,
  input Cin,
  output [31:0] F,
  output Cout
);

wire C[8:0];
assign C[0] = Cin;

genvar i;
generate
for (i = 0; i < 32; i = i + 4) begin : gen_loop
    CarryBypassAdder4bit cbpa(.A(A[i+3:i]), .B(B[i+3:i]), .Cin(C[i/4]), .Sum(F[i+3:i]), .Cout(C[i/4+1]));
end
endgenerate

assign Cout = C[8];

endmodule
