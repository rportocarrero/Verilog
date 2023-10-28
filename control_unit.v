module control_unit (
  input clk,
  input [31:0] inst,
  output reg [3:0] opcode,
  output reg [3:0] ALU_op,
  output reg [1:0] ALU_src,
  output reg reg_write,
  output reg mem_write,
  output reg mem_to_reg
);

always @(posedge clk) begin
  opcode <= inst[31:28];
  case (opcode)
    4'b0000: begin // R-type instruction
      ALU_op <= 2'b10;
      ALU_src <= 2'b00;
      reg_write <= 1'b1;
      mem_write <= 1'b0;
      mem_to_reg <= 1'b0;
    end
    4'b0001: begin // Load instruction
      ALU_op <= 2'b00;
      ALU_src <= 2'b01;
      reg_write <= 1'b1;
      mem_write <= 1'b0;
      mem_to_reg <= 1'b1;
    end
    4'b0010: begin // Store instruction
      ALU_op <= 2'b00;
      ALU_src <= 2'b01;
      reg_write <= 1'b0;
      mem_write <= 1'b1;
      mem_to_reg <= 1'b0;
    end
    4'b0011: begin // Branch instruction
      ALU_op <= 2'b01;
      ALU_src <= 2'b00;
      reg_write <= 1'b0;
      mem_write <= 1'b0;
      mem_to_reg <= 1'b0;
    end
    default: begin
      ALU_op <= 2'b00;
      ALU_src <= 2'b00;
      reg_write <= 1'b0;
      mem_write <= 1'b0;
      mem_to_reg <= 1'b0;
    end
  endcase
end

endmodule
