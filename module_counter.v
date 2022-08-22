module counter(
    clk,
    rst,
    dout
);
// port declarations
input clk;
input rst;
output [7:0] dout;

// wire defenitions
wire clk;
wire rst;

// register defenitions
reg[7:0] dout;

always @ ( posedge clk) //count on the rising edge of the clock
begin: COUNTER // start of the counter - block named COUNTER
    if (rst == 1'b1) begin 
        dout <= #1 8'b00000000;
    end
    else begin
        dout <= #1 dout + 1;
    end
    //$dumpfile("module_counter_test.vcd");
    $display("hello");

end // end of the COUNTER block
endmodule