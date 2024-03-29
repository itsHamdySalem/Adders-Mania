`timescale 1ns/1ps
module testbench;

  reg [31:0] a, b;
  wire [31:0] result;
  wire overflow;

  ieee754_float_adder_2 adder (
    .a(a),
    .b(b),
    .result(result),
    .overflow(overflow)
  );

  reg clk = 0;
  always #5 clk = ~clk;

  initial begin
    a = 32'b01000000101000000000000000000000; // 5.0
    b = 32'b01000000110000000000000000000000; // 6.0
    #10
    if (result !== 32'b01000001001100000000000000000000 || overflow !== 0) #10 $display("Test Case 1 failed");

    a = 32'b11000000101000000000000000000000; // -5.0
    b = 32'b11000000110000000000000000000000; // -6.0
    #10
    if (result !== 32'b11000001001100000000000000000000 || overflow !== 0) #10 $display("Test Case 2 failed");

    a = 32'b01000000101000000000000000000000; // 5.0
    b = 32'b11000000110000000000000000000000; // -6.0
    #10
    if (result !== 32'b10111111100000000000000000000000 || overflow !== 0) #10 $display("Test Case 3 failed");

    a = 32'b01111111100000000000000000000000; // INF
    b = 32'b01000000000000000000000000000000; // 2.0
    #10
    if (overflow !== 1) #10 $display("Test Case 4 failed");

    a = 32'b01000000001000000000000000000000; // 2.5
    b = 32'b00111111110000000000000000000000; // 1.5
    #10
    if (result !== 32'b01000000100000000000000000000000 || overflow !== 0) #10 $display("Test Case 5 failed");


    a = 32'b01000000001001100110011001100110; // 2.6
    b = 32'b00111111100011001100110011001101; // 1.1
    #10
    if (result !== 32'b01000000011011001100110011001100 || overflow !== 0) #10 $display("Test Case 6 failed");

    a = 32'b11111111100000000000000000000000; // -INF
    b = 32'b11000000000000000000000000000000; // -2.0
    #10
    if (overflow !== 1) #10 $display("Test Case 7 failed");

    a = 32'b10111111110000000000000000000000; // -1.5
    b = 32'b01000000010000000000000000000000; // 3.0
    #10
    if (result !== 32'b00111111110000000000000000000000 || overflow !== 0) #10 $display("Test Case 8 failed");

    a = 32'b01000010110111000000000000000000; // 110.0
    b = 32'b00111111000000000000000000000000; // 0.5
    #10
    if (result !== 32'b01000010110111010000000000000000 || overflow !== 0) #10 $display("Test Case 9 failed");

    a = 32'b00111111111000000000000000000000; // 1.75
    b = 32'b10111111010000000000000000000000; // -0.75
    #10
    if (result !== 32'b00111111100000000000000000000000 || overflow !== 0) #10 $display("Test Case 10 failed");


    #10;
  end

endmodule
