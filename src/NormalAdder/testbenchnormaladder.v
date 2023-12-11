
module tb_adder32Bit;

  reg [31:0] X, Y;
  reg Cin;
  wire [31:0] Z;
  wire Cout;

  // Instantiate the RippleCarryAdder module
  Adder32Bit uut (
    .cout(Cout),
    .s(Z),
    .a(X),
    .b(Y),
    .cin(Cin)
  );

  // Initial values
  initial begin
    X = 0;
    Y = 0;
    Cin = 0;

    // Test Case 1: Overflow of positive numbers
    X = 2147483647;
    Y = 1; 
    Cin = 0;
    #10;
    if (Z !== 0 || Cout !== 1) begin
      $display("TestCase#1: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#1: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

    // Test Case 2: Overflow of negative numbers
    X = -2147483648;
    Y = -1; 
    Cin = 0;
    #10;
    if (Z !== -1 || Cout !== 1) begin
      $display("TestCase#2: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#2: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

    // Test Case 3: Addition of positive and negative number
    X = 100;
    Y = -50;
    Cin = 0;
    #10;
    if (Z !== 50 || Cout !== 0) begin
      $display("TestCase#3: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#3: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

    // Test Case 4: Addition of positive and positive number
    X = 50;
    Y = 30;
    Cin = 0;
    #10;
    if (Z !== 80 || Cout !== 0) begin
      $display("TestCase#4: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#4: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

    // Test Case 5: Addition of negative and negative number
    X = -30;
    Y = -20;
    Cin = 0;
    #10;
    if (Z !== -50 || Cout !== 0) begin
      $display("TestCase#5: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#5: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

    // Test Case 6: Additional random test case
    X = 10;
    Y = 15;
    Cin = 1;
    #10;
    if (Z !== 26 || Cout !== 0) begin
      $display("TestCase#6: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#6: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

    // Test Case 7: Additional random test case
    X = -40;
    Y = 25;
    Cin = 0;
    #10;
    if (Z !== -15 || Cout !== 0) begin
      $display("TestCase#7: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#7: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

    // Test Case 8: Additional random test case
    X = 0;
    Y = 0;
    Cin = 1;
    #10;
    if (Z !== 1 || Cout !== 0) begin
      $display("TestCase#8: failed with input X=%0d, Y=%0d and Output Z=%0d, Cout=%0d", X, Y, Z, Cout);
    end
    else begin
      $display("TestCase#8: success. Input X=%0d, Y=%0d, Output Z=%0d", X, Y, Z);
    end

  end

endmodule
