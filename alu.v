module ALU (
  input [31:0] a,
  input [31:0] b,
  input [4:0] opcode,
  output reg [31:0] result,
  output reg zero,
  output reg negative
);

always @* begin
  // Set default values
  result = 0;
  zero = 1;
  negative = 0;

  // Perform the operation based on the opcode
  case (opcode)
    5'b00000: // Addition
      result = a + b;
      if (result == 0) zero = 1;
      else zero = 0;
      if (result < 0) negative = 1;
      else negative = 0;
    5'b00001: // Subtraction
      result = a - b;
      if (result == 0) zero = 1;
      else zero = 0;
      if (result < 0) negative = 1;
      else negative = 0;
    5'b00010: // AND
      result = a & b;
      if (result == 0) zero = 1;
      else zero = 0;
      if (result < 0) negative = 1;
      else negative = 0;
    5'b00011: // OR
      result = a | b;
      if (result == 0) zero = 1;
      else zero = 0;
      if (result < 0) negative = 1;
      else negative = 0;
    5'b00100: // NOT
      result = ~a;
      if (result == 0) zero = 1;
      else zero = 0;
      if (result < 0) negative = 1;
      else negative = 0;
    5'b00101: // Left Shift
      result = a << b;
      if (result == 0) zero = 1;
      else zero = 0;
      if (result < 0) negative = 1;
      else negative = 0;
    5'b00110: // Right Shift
      result = a >> b;
      if (result == 0) zero = 1;
      else zero = 0;
      if (result < 0) negative = 1;
      else negative = 0;
    default:
      result = 0;
      zero = 1;
      negative = 0;
  endcase
end

endmodule
