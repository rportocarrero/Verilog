module clock_generator (
  output clk
);

reg clk;

always #5 clk = ~clk; // toggle clock every 5 ns

endmodule
