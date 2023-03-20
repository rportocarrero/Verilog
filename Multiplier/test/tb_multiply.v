module tb_multiply;

reg clk = 1;
reg [9:0] number_A;
reg [9:0] number_B;
wire [19:0] result;

multiply UUT(.clk(clk), .A(number_A), .B(number_B), .out(result));

always #5 clk = ~clk;

initial begin
    $display("time\tclk");
    $monitor("%3dus\t%b\t%f2\t%f1\t%f1", $time, clk,number_A, number_B, result);

    number_A = 10'd10;
    number_B = 10'd10;

    #10;

    number_A = ;
    number_B = 2;

    #10;

    $finish;

end

endmodule
