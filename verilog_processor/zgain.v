module zgain(
    din, // Digital input
    dout // Digital output
);

parameter n = 8;    // width of digital input and output
parameter gain = 1; // gain parameter

input [n-1:0] din;
output [2*n-1:0] dout;

wire signed[n-1:0] din;
reg signed[2*n-1:0] dout;

always @ (din)
begin
    dout <= din * gain;
end

endmodule