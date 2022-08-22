`define OP 8
`define ADDR 8
`timescale 1ns/100ps

module mdr_tb();
// declare the counter signals
reg clk;
reg nrst;
reg mdr_valid;
reg mdr_load;

wire [`OP+`ADDR-1:0] data;
reg [`OP+`ADDR-1:0] memory;

// set up the inital variables and reset
initial begin
    $dumpfile("mdr_tb.vcd");
    $dumpvars();
    $display ("time\t clk reset inc load valid data");
    $monitor ("%g\t %b %b %b %b %b",
    $time, clk, nrst, mdr_load, mdr_valid, data);
    clk = 1;    // initialize the clock to 1
    nrst = 1;   // set the reset to 1 (not reset)
    mdr_valid = 0;
    mdr_load = 0;
    memory = 16'b0000000000001111;
    #5 nrst = 0;    // reset = 0 : resets the counter
    #10 nrst = 1;   // reset back to 1 : counter can start
    #10 mdr_load = 1;
    #10 mdr_load = 0;
    #10 memory = 16'b0000000000001111;
    mdr_valid = 1;
    #50 mdr_valid = 0;  // reset back to 1 : counter can start
    #200 $finish;   // Finish the simulation
end

// Clock generator
always begin
    #5 clk = ~clk;  //clock every 5 time slots
end

// assign data = datareg;

// Connect DUT to test bench
mdr DUT (clk, nrst, mdr_load, mdr_valid, memory, data);

endmodule