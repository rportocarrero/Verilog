`define OP 8
`define ADDR 8
`timescale 1ns/100ps

module alu_tb();
// declare the counter signals
reg clk;
reg nrst;
reg alu_valid;
wire alu_zero;

wire [`OP+`ADDR-1:0] alu_bus;
reg [`OP-1:0] opcode;
reg [`OP+`ADDR-1:0] alu_reg;

assign alu_bus = alu_reg;

// Set up the initial varaibles and reset
initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars();

    $display ("time\t clk reset inc load valid data");
    $monitor ("%g\t %b %b %b %b %b",
    $time, clk, nrst, alu_zero, alu_valid, opcode, alu_bus);
    clk = 1;    // initialize the clock to 1
    nrst = 1;   // set the reset to 1 (not reset)
    alu_valid = 0;
    opcode = 8'h00;
    alu_reg = 'bz;
    #5 nrst = 0;    // reset = 0 : resets the counter
    #10 nrst = 1;   // reset back to 1 : counter can start
    alu_valid = 1;
    #10 alu_valid = 0;  // reset back to 1 : counter can start
    #10 alu_reg = 16'h0012;
    #200 $finish;   // Finish the simulation
end

// Clock generator
always begin
    #5 clk = ~clk;  // clock every 5 time slots
end

//assign data = datareg;

// Connect DUT to test bench
alu DUT (clk, nrst, opcode, alu_zero, alu_valid, alu_bus);

endmodule