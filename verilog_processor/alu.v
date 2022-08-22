`define OP 8
`define ADDR 8

module alu (clk, nrst, alu_op, alu_zero, alu_valid, alu_bus);

// Interface Defenitions
input clk;  // Clock input
input nrst; // reset (active low)
output alu_zero;    // ALU is alu_zero
input alu_valid;    // ALU output is alu_valid

inout [`OP+`ADDR-1:0] alu_bus;  // ALU alu_bus
input [`OP-1:0] alu_op;    // ALU OP code

// Register Defenitions
reg alu_zero; // ALU is alu_zero

reg [`OP+`ADDR-1:0] acc; // Accumulator
reg [`OP+`ADDR-1:0] alu_reg;    // Accumulator Reg

assign alu_bus = alu_valid ? alu_reg : 'bz;

always @(posedge clk) begin
    if(nrst==0) begin
        acc <= 0;
    end
    else begin
        case (alu_op)
            8'h00 : acc <= alu_bus;
            8'h01 : acc <= acc + alu_bus;
            8'h02 : acc <= ~alu_bus;
            8'h03 : acc <= acc | alu_bus;
            8'h04 : acc <= acc & alu_bus;
            8'h05 : acc <= acc ^ alu_bus;
            8'h06 : acc <= acc + 1;
            8'h07 : alu_reg <= acc;
            default: acc = 0;
        endcase
        if(acc==0) begin
            alu_zero <= 1;
        end
        else begin
            alu_zero <= 0;
        end
    end
end

endmodule