module CarryBypassAdder4bit(
    input [3:0] A,
    input[3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

wire [3:0] p;
wire c0;
wire bp;
 
RippleCarryAdder4bit rca (.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(c0));
assign p = A^B;
assign bp = &p;
assign Cout = bp ? Cin : c0;
    
endmodule