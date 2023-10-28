module control_unit_tb;

// Inputs
reg clk;
reg [31:0] inst;

// Outputs
wire [3:0] opcode;
wire [3:0] ALU_op;
wire [1:0] ALU_src;
wire reg_write;
wire mem_write;
wire mem_to_reg;

// Instantiate the design under test
control_unit dut (
  .clk(clk),
  .inst(inst),
  .opcode(opcode),
  .ALU_op(ALU_op),
  .ALU_src(ALU_src),
  .reg_write(reg_write),
  .mem_write(mem_write),
  .mem_to_reg(mem_to_reg)
);

// Test bench initial block
initial begin
  // Reset the simulation
  #100;
  // Test R-type instruction
  inst = 32'h00000020;
  #100;
  // Check the outputs
  assert(opcode == 4'b0000)
    $display("R-type instruction: opcode is correct");
  assert(ALU_op == 2'b10)
    $display("R-type instruction: ALU_op is correct");
  assert(ALU_src == 2'b00)
    $display("R-type instruction: ALU_src is correct");
  assert(reg_write)
    $display("R-type instruction: reg_write is correct");
  assert(!mem_write)
    $display("R-type instruction: mem_write is correct");
  assert(!mem_to_reg)
    $display("R-type instruction: mem_to_reg is correct");
  // Test Load instruction
  inst = 32'h8c220000;
  #100;
  // Check the outputs
  assert(opcode == 4'b0001)
    $display("Load instruction: opcode is correct");
  assert(ALU_op == 2'b00)
    $display("Load instruction: ALU_op is correct");
  assert(ALU_src == 2'b01)
    $display("Load instruction: ALU_src is correct");
  assert(reg_write)
    $display("Load instruction: reg_write is correct");
  assert(!mem_write)
    $display("Load instruction: mem_write is correct");
  assert(mem_to_reg)
    $display("Load instruction: mem_to_reg is correct");
  // Test Store instruction
  inst = 32'hac220000;
  #100;
  // Check the outputs
  assert(opcode == 4'b0010)
    $display("Store instruction: opcode is correct");
  assert(ALU_op == 2'b00)
    $display("Store instruction: ALU_op is correct");
  assert(ALU_src == 2'b01)
    $display("Store instruction: ALU_src is correct");
  assert(!reg_write)
    $display("Store instruction: reg_write is correct");
  assert(mem_write)
