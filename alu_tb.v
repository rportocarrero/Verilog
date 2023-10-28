module alu_tb;

// Inputs and Outputs
reg [31:0] a, b;
reg [4:0] opcode;
wire [31:0] result;
wire zero, negative;

// Instantiate the ALU
ALU alu(.a(a), .b(b), .opcode(opcode), .result(result), .zero(zero), .negative(negative));

// Testbench Initialization
initial begin
  // Basic Arithmetic Operations
  // Test Addition
  a = 10;
  b = 20;
  opcode = 5'b00000; // Addition
  #10;
  // Check the result
  assert(result == 30)
    else $display("Addition Test Failed. Got: %d", result);

  // Test Subtraction
  a = 10;
  b = 20;
  opcode = 5'b00001; // Subtraction
  #10;
  // Check the result
  assert(result == -10)
    else $display("Subtraction Test Failed. Got: %d", result);

  // Bitwise Operations
  // Test AND
  a = 10;
  b = 20;
  opcode = 5'b00010; // AND
  #10;
  // Check the result
  assert(result == 0)
    else $display("AND Test Failed. Got: %d", result);

  // Test OR
  a = 10;
  b = 20;
  opcode = 5'b00011; // OR
  #10;
  // Check the result
  assert(result == 30)
    else $display("OR Test Failed. Got: %d", result);

  // Test NOT
  a = 10;
  b = 0;
  opcode = 5'b00100; // NOT
  #10;
  // Check the result
  assert(result == -11)
    else $display("NOT Test Failed. Got: %d", result);

  // Shift Operations
  // Test Left Shift
  a = 10;
  b = 2;
  opcode = 5'b00101; // Left Shift
  #10;
  // Check the result
  assert(result == 40)
    else $display("Left Shift Test Failed. Got: %d", result);

  // Test Right Shift
  a = 10;
  b = 2;
  opcode = 5'b00110; // Right Shift
  #10;
  // Check the result
  assert(result == 2)
    else $display("Right Shift Test Failed. Got: %d", result);

  // Overflow/Underflow
  // Test Overflow
  a = 2147483647;
  b = 1;
  opcode = 5'b00000; // Addition
  #10;
  // Check the result
  assert(result == -2147483648)
    else $display("Overflow Test Failed. Got: %d", result);

  // Test Underflow
  a = -2147483648;
  b = -1;
  opcode = 5'b00001; // Subtraction
  #10;
 
