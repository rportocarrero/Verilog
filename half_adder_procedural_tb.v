`timescale 1 ns/ 10 ps

module half_adder_procedural_tb;

    reg a, b;
    wire sum, carry;

    localparam period = 20;

    half_adder UUT (.a(a), .b(b), .sum(sum), .carry(carry));
reg clk;

always
begin
    clk = 1'b1;
    #period;
    clk = 1'b0;
end

always @(posedge clk)
begin
    a = 0;
    b = 0;
    #period;
    if(sum != 0 || carry != 0)
        $display("Test failed for input combination 00");

    a = 0;
    b = 1;
    #period;
    if(sum != 1 || carry != 0)
        $display("Test failed for input combination 01");

    a = 1;
    b = 0;
    #period;
    if(sum != 1 || carry != 0)
        $display("Test failed for input combination 10");

    a = 1;
    b = 1;
    #period;
    if(sum != 1 || carry != 0)
        $display("Test failed for input combination 11");

    $stop;
end
endmodule