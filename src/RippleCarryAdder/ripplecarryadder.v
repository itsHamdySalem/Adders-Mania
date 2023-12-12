module RippleCarryAdder (
  input [31:0] a, 
  input [31:0] b, 
  input cin,    
  output  [31:0] s,
  output  cout  
);

wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c26,c27,c28,c29,c30,c31,c32;
            FullAdder bit1(c1,s[0],a[0],b[0],cin);
            FullAdder bit2(c2,s[1],a[1],b[1],c1);
            FullAdder bit3(c3,s[2],a[2],b[2],c2);
            FullAdder bit4(c4,s[3],a[3],b[3],c3);
            FullAdder bit5(c5,s[4],a[4],b[4],c4);
            FullAdder bit6(c6,s[5],a[5],b[5],c5);
            FullAdder bit7(c7,s[6],a[6],b[6],c6);
            FullAdder bit8(c8,s[7],a[7],b[7],c7);
            FullAdder bit9(c9,s[8],a[8],b[8],c8);
            FullAdder bit10(c10,s[9],a[9],b[9],c9);
            FullAdder bit11(c11,s[10],a[10],b[10],c10);
            FullAdder bit12(c12,s[11],a[11],b[11],c11);
            FullAdder bit13(c13,s[12],a[12],b[12],c12);
            FullAdder bit14(c14,s[13],a[13],b[13],c13);
            FullAdder bit15(c15,s[14],a[14],b[14],c14);
            FullAdder bit16(c16,s[15],a[15],b[15],c15);
            FullAdder bit17(c17,s[16],a[16],b[16],c16);
            FullAdder bit18(c18,s[17],a[17],b[17],c17);
            FullAdder bit19(c19,s[18],a[18],b[18],c18);
            FullAdder bit20(c20,s[19],a[19],b[19],c19);
            FullAdder bit21(c21,s[20],a[20],b[20],c20);
            FullAdder bit22(c22,s[21],a[21],b[21],c21);
            FullAdder bit23(c23,s[22],a[22],b[22],c22);
            FullAdder bit24(c24,s[23],a[23],b[23],c23);
            FullAdder bit25(c25,s[24],a[24],b[24],c24);
            FullAdder bit26(c26,s[25],a[25],b[25],c25);
            FullAdder bit27(c27,s[26],a[26],b[26],c26);
            FullAdder bit28(c28,s[27],a[27],b[27],c27);
            FullAdder bit29(c29,s[28],a[28],b[28],c28);
            FullAdder bit30(c30,s[29],a[29],b[29],c29);
            FullAdder bit31(c31,s[30],a[30],b[30],c30);
	    FullAdder bit32(c32,s[31],a[31],b[31],c31);
assign cout = c32;
endmodule
module FullAdder (
    output Cout,
    output Sum,
    input A,
    input B,
    input Cin

);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule