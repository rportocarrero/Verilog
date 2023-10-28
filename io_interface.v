module io_interface (
  input clk,
  input reset,
  input [31:0] address,
  input [31:0] data_in,
  input [1:0] write_select, // 0: read, 1: write, 2: none
  output [31:0] data_out,
  output [7:0] status
);

reg [31:0] data_mem [255:0]; // data memory
reg [7:0] status_reg;

always @(posedge clk) begin
  if (write_select == 1) // write to memory
    data_mem[address] <= data_in;
end

assign data_out = data_mem[address];
assign status = status_reg;

endmodule
