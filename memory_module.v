module mem_module (
  input clk,
  input [31:0] addr,
  input [31:0] data_in,
  input [1:0] write_select, // 0: instruction, 1: data, 2: none
  output [31:0] data_out
);

reg [31:0] inst_mem [4096]; // 4 KB instruction memory
reg [31:0] data_mem [4096]; // 4 KB data memory

always @(posedge clk) begin
  if (write_select == 0) // write to instruction memory
    inst_mem[addr] <= data_in;
  else if (write_select == 1) // write to data memory
    data_mem[addr] <= data_in;
end

assign data_out = inst_mem[addr] + data_mem[addr];

endmodule
