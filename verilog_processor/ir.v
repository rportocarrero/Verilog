`define OP 8
`define ADDR 8

module ir (clk, nrst, ir_valid, ir_load, ir_bus);

input clk;
input nrst;
input ir_valid;
input ir_load;

inout [`OP+`ADDR-1:0] ir_bus;

wire [`OP+`ADDR-1:0] ir_bus;

reg [`OP+`ADDR-1:0] ir_reg;

assign ir_bus = ir_valid ? ir_reg : 16'bz;

always @( posedge clk) begin
    if(nrst==0) begin
        ir_reg <= 0;
    end
    else begin
        if(ir_load==1) begin
            ir_reg <= ir_bus;
        end
    end
end

endmodule