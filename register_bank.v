module register_bank (
  input clk,
  input [3:0] reg_write,
  input [31:0] reg_in,
  output [31:0] reg_out
);

  reg [31:0] reg_file [15:0]; // 16 32-bit registers

  always @ (posedge clk) begin
    if (reg_write) begin
      reg_file[reg_write[3:0]] <= reg_in;
    end
  end

  assign reg_out = reg_file[reg_write[3:0]];

endmodule
