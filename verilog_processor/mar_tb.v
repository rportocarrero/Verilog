`define OP 8
`define ADDR 8

module mar_tb();
// declare the counter signals
reg clk;
reg nrst;
reg mar_load;

reg [`OP+`ADDR-1:0] data;
wire [`ADDR-1:0] address;

// set up the initial variables and reset
initial begin
    $dumpfile("mar_tb.vcd");
    $dumpvars();
    $display("time\t clk reset inc load valid data");
    $monitor("%g\t %b %b %b %b %b",
    $time, clk, nrst, mar_load, data, address);
    clk = 1;    // initialize the clock to 1
    nrst = 1;   // set the reset to 1 (not reset)
    mar_load = 0;
    data = 16'b0000000000001111;
    #5 nrst = 0; // reset = 0 : resets the counter
    #10 nrst = 1;   // reset back to 1 : counter can start
    #10 mar_load = 1;
    #10 mar_load = 0;
    #10 data = 16'bz;
    #200 $finish;   // Finish the simulation
end

// Clock generator
always begin
    #5 clk = ~clk; // Clock every 5 time slots
end

// assign data = datareg

// Connect DUT to test bench
mar DUT (clk, nrst, mar_load, data, address);

endmodule