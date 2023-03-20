module multiply(
    input clk,
    input wire signed [9:0] A,
    input wire signed [9:0] B,
    output reg signed [19:0] out
);

always @ (posedge clk) begin
    out <= A * B;
end

endmodule