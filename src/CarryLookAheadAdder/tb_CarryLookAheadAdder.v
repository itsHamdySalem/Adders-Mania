`timescale 1 ns / 100 ps

module tb_CarryLookAheadAdder;

  reg [31:0] A, B;
  reg Cin;

  wire [31:0] F;
  wire Cout;

  CarryLookAheadAdder UUT (
      .A(A),
      .B(B),
      .Cin(Cin),
      .F(F),
      .Cout(Cout)
  );

  initial begin
    // Test Case 1: Overflow of positive numbers
    A = 2147483647;  // Maximum positive signed 32-bit integer
    B = 1;
    Cin = 0;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#1: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#1: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    // Test Case 2: Overflow of negative numbers
    A = -2147483648;  // Minimum negative signed 32-bit integer
    B = -1;
    Cin = 0;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#2: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#2: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    // Test Case 3: Addition of positive and negative number
    A = 100;
    B = -50;
    Cin = 0;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#3: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#3: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    // Test Case 4: Addition of positive and positive number
    A = 50;
    B = 30;
    Cin = 0;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#4: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#4: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    // Test Case 5: Addition of negative and negative number
    A = -30;
    B = -20;
    Cin = 0;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#5: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#5: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    // Test Case 6: Additional random test case
    A = 10;
    B = 15;
    Cin = 1;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#6: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#6: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    // Test Case 7: Additional random test case
    A = -40;
    B = 25;
    Cin = 0;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#7: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#7: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    // Test Case 8: Additional random test case
    A = -10;
    B = -5;
    Cin = 1;
    #10;
    if ({Cout, F} !== (A + B + Cin)) begin
      $display("TestCase#8: failed with input A=%0d, B=%0d and Output F=%0d, Cout=%0d", A, B, F, Cout);
    end else begin
      $display("TestCase#8: success. Input A=%0d, B=%0d, Output F=%0d", A, B, F);
    end

    $stop;
  end

endmodule
