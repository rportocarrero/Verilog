module datapath (
  input clk,
  input reset,
  input [31:0] opcode,
  input [31:0] data_in,
  input [1:0] write_select, // 0: read, 1: write, 2: none
  output [31:0] data_out,
  output [31:0] alu_result,
  output [7:0] status,
  output reg [31:0] pc
);

reg [31:0] a_reg, b_reg;
reg [31:0] op1, op2;

// Connect ALU
alu alu_unit (
  .clk(clk),
  .reset(reset),
  .opcode(opcode),
  .op1(op1),
  .op2(op2),
  .result(alu_result)
);

// Connect Register Bank
register_bank reg_bank (
  .clk(clk),
  .reset(reset),
  .opcode(opcode),
  .data_in(data_in),
  .write_select(write_select),
  .a_reg(a_reg),
  .b_reg(b_reg),
  .status(status)
);

// Connect IO Interface
io_interface io_unit (
  .clk(clk),
  .reset(reset),
  .address(pc),
  .data_in(data_in),
  .write_select(write_select),
  .data_out(data_out),
  .status(status)
);

always @(posedge clk) begin
  if (reset) begin
    pc <= 0;
  end else begin
    pc <= pc + 4;
  end
end

assign op1 = a_reg;
assign op2 = b_reg;

endmodule
