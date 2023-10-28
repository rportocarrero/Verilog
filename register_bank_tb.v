module register_bank_tb;

  reg clk;
  reg [3:0] reg_write;
  reg [31:0] reg_in;
  wire [31:0] reg_out;

  register_bank uut (
    .clk(clk),
    .reg_write(reg_write),
    .reg_in(reg_in),
    .reg_out(reg_out)
  );

  initial begin
    clk = 0;
    reg_write = 0;
    reg_in = 0;
    #10 clk = 1;
    #10 clk = 0;
  end

  initial begin
    // Test case 1: Write to register 0
    reg_write = 0;
    reg_in = 1234;
    #10 reg_write = 4'b1111; // Deselect the register
    #10 $display("Test case 1: Register 0 = %d", reg_out);

    // Test case 2: Write to register 1
    reg_write = 1;
    reg_in = 5678;
    #10 reg_write = 4'b1111; // Deselect the register
    #10 $display("Test case 2: Register 1 = %d", reg_out);

    // Test case 3: Read-after-write
    reg_write = 0;
    reg_in = 2468;
    #10 $display("Test case 3: Register 0 after write = %d", reg_out);

    // Test case 4: Register file size
    reg_write = 4'b1111; // Deselect the register
    if (reg_out == 2468) begin
      $display("Test case 4: Register file size = %d", 4'b1111);
    end else begin
      $display("Test case 4: Register file size = %d", 4'b0000);
    end

    // Test case 5: Multiple write operations
    reg_write = 0;
    reg_in = 1111;
    #10 reg_write = 1;
    reg_in = 2222;
    #10 reg_write = 2;
    reg_in = 3333;
    #10 $display("Test case 5: Register 0 = %d, Register 1 = %d, Register 2 = %d", reg_out[31:24], reg_out[23:16], reg_out[15:8]);

    // Test case 6: Register select
    reg_write = 3;
    reg_in = 4444;
    #10 $display("Test case 6: Register 3 = %d", reg_out);

    // Test case 7: Register reset
    reg_write = 4'b1111; // Deselect the register
    #10 reg_write = 0;
    reg_in = 0;
    #10 $display("Test case 7: Register 0 after reset = %d", reg_out);

    // Test case 8: Concurrent accesses
    reg_write = 0;
    reg_in = 1234;
    reg_write = 1;
    reg_in = 5678;