// This is an example module that impelments a counter
module counter(input clk,   // clk input
    input rst_n,    // negative reset
    output reg[7:0] out);   // 8-bit output number

// at the rising edge of the clock
always @ (posedge clk) begin
    if(! rst_n) out <= 0;   // reset if reset is pulled negative
    else
        out <= out + 1; //increment counter
end
endmodule
