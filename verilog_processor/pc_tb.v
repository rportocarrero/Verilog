`define N 8
`timescale 1ns/100 ps

module pc_tb();
// declare the counter signals
reg clk;
reg nrst;
reg pc_valid;
reg pc_load;
reg pc_inc;
wire [`N-1:0] data;
reg [`N-1:0] datareg;

// set up initial variables and reset
initial begin

    $dumpfile("pc_tb.vcd");
    $dumpvars();

    $display ("time\t clk reset inc load valid data");
    $monitor ("%g\t %b %b %b %b %b %b", 
    $time, clk, nrst, pc_inc, pc_load, pc_valid, data);
    
    clk = 1;
    nrst = 1;
    pc_valid = 0;
    pc_inc = 0;
    pc_load = 0;
    datareg = 4;
    #5 nrst = 0;    // reset = 0 : resets the counter
    #10 nrst = 1;   // reset back to 1 : counter can start
    #10 pc_inc = 1;
    #10 pc_inc = 0;
    #10 pc_load = 1;
    #10 datareg = 8'bzzzzzzzz;
    #10 pc_load = 0;
    #10 pc_inc = 1;
    pc_valid = 1;
    #50 pc_valid = 0; //reset back to 1 : counter can start
    #200 $finish; // Finish the simulation
end

// Clock generator
always begin
    #5 clk = ~clk; // Clock every 5 time slots
end

assign data = datareg;

// Connect DUT to test bench
pc DUT (clk, nrst, pc_inc, pc_valid, pc_load, data);

endmodule