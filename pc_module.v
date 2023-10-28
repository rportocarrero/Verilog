module pc_module (
  input clk,
  input reset,
  input [31:0] next_pc,
  output [31:0] pc_out
);

reg [31:0] pc;

always @(posedge clk) begin
  if (reset) begin
    pc <= 0;
  end else begin
    pc <= next_pc;
  end
end

assign pc_out = pc;

endmodule
