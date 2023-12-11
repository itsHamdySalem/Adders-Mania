module CarrySelectAdder (
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output [31:0] F,
    output Cout
);

  wire [15:0] F0, F1;
  wire CS, Cout0, Cout1;

  FullAdder FAL (.A(A[15:0]), .B(B[15:0]), .Cin(Cin), .F(F[15:0]), .Cout(CS));
  FullAdder FAU0 (.A(A[31:16]), .B(B[31:16]), .Cin(1'b0), .F(F0), .Cout(Cout0));
  FullAdder FAU1 (.A(A[31:16]), .B(B[31:16]), .Cin(1'b1), .F(F1), .Cout(Cout1));

  assign F[31:16] = CS ? F1 : F0;
  assign Cout = CS ? Cout1 : Cout0;

endmodule

module FullAdder (
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output [15:0] F,
    output Cout
);

  assign {Cout, F} = A + B + Cin;

endmodule
