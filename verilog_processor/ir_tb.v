`define OP 8
`define ADDR 8
`timescale 1ns/100ps

module ir_tb();
// declare the counter signals
reg clk;
reg nrst;
reg ir_valid;
reg ir_load;

wire [`OP+`ADDR-1:0] data;
reg [`OP+`ADDR-1:0] datareg;

// Set u pthe initial variables and reset
initial begin
    $dumpfile("ir_tb.vcd");
    $dumpvars();

    $display ("time\t clk reset inc load valid data");
    $monitor ("%g\t %b %b %b %b %b", 
    $time, clk, nrst, ir_load, ir_valid, data);

    clk = 1;    // initialize the clock to 1
    nrst = 1;   // set the reset to 1 (not reset)
    ir_valid = 0;
    ir_load = 0;
    datareg = 16'b0000000000001111;
    #5 nrst = 0;    // reset = 0 : resets the counter
    #10 nrst = 1;   // reset back to 1 : counter can start
    #10 ir_load = 1;
    #10 ir_load = 0;
    #10 datareg  = 16'bzzzzzzzzzzzzzzzz;
    ir_valid = 1;
    #50 ir_valid = 0;   // reset back to 1 : counter can start
    #200 $finish;   // Finish the simulation
end

// Clock generator
always begin
    #5 clk = ~clk;  // clock every 5 time slots
end

assign data = datareg;

// connect DUT to test bench
ir DUT (clk, nrst, ir_valid, ir_load, data);

endmodule
