module ieee754_float_adder (
  input [31:0] a,
  input [31:0] b, 
  output reg [31:0] result,
  output reg overflow
);

  reg [24:0] man_a, man_b;
  reg [7:0] exp_a, exp_b, exp_result;
  reg [24:0] sum;
  reg sign;
  integer i;
  integer first_one_index = 0;

  always @* begin
    exp_a = a[30:23];
    man_a = {2'b01, a[22:0]};

    exp_b = b[30:23];
    man_b = {2'b01, b[22:0]};

    if (exp_a > exp_b) begin
      man_b = man_b >> (exp_a + (~exp_b+1));
      exp_result = exp_a;
    end else begin
      man_a = man_a >> (exp_b + (~exp_a+1));
      exp_result = exp_b;
    end

    if (a[31] != b[31]) begin
      if(man_a > man_b) begin
        sum = (man_a + (~man_b+1));
        sign = a[31];
      end else begin
        sum = (man_b + (~man_a+1));
        sign = b[31];
      end
    end else begin 
      sum = man_a + man_b; 
      sign = a[31];
    end


    for (i = 0; i < 25; i = i + 1) begin
      if (sum[i] == 1'b1) begin
        first_one_index = i;
      end
    end


    if (a[31] != b[31]) begin
      sum = sum << (24 + (~first_one_index+1));
      exp_result = exp_result + (~(23 + (~first_one_index+1))+1);
    end else begin 
      if(sum[24]==1) begin
        exp_result=exp_result+1;
      end else begin
        sum = sum << 1;
      end
    end

    if (exp_result > 8'b11111110) begin
      overflow = 1;
    end else begin
      overflow = 0;
    end

    result = {sign, exp_result, sum[23:1]};
  end
endmodule
