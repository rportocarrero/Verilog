// This is an example of a counter testbench
`timescale 1ns/1ps  // timescale and precision

module tb_counter;
reg clk;    // register for storing clk
reg rst_n;  // register for storing negative reset signal
wire [7:0] out; //wire for output from module

//instantiate module under test
counter uut(.clk(clk), .rst_n(rst_n), .out(out));

// clk swicthes every 5 timesteps
always #5 clk = ~clk;

initial begin
    // get file for gtkwave
    $dumpfile("tb_counter.vcd");
    $dumpvars(0, tb_counter);

    clk <= 0;
    rst_n <= 0;

    // simulation
    #20 rst_n <= 1; //turn counter on after 20 timesteps
    #100 rst_n <= 0;    // 100 timesteps later turn the counter off
    #20 rst_n <= 1; // 20 timesteps later turn the counter back on
    #80 $finish;    // run for 80 more timesteps
end

initial begin
    $display("Time\tclk\trst\tout\t");  // display at begining of test run
    $monitor("%3dns\t%b\t%b\t%b",$time, clk, rst_n, out);   // display at every change
end
endmodule
