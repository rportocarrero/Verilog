`define OP 8
`define ADDR 8

module mdr (clk, nrst, mdr_load, mdr_valid, mem_bus, mdr_bus);

input clk;
input nrst;
input mdr_valid;
input mdr_load;
//input mem_bus;

inout [`OP+`ADDR-1:0] mdr_bus;
input [`OP+`ADDR-1:0] mem_bus;

wire [`OP+`ADDR-1:0] mdr_bus;
wire [`OP+`ADDR-1:0] mem_bus;

reg [`OP+`ADDR-1:0] mdr_reg;
assign mdr_bus = mdr_valid ? mdr_reg : 16'bz;

always @(posedge clk) begin
    if(nrst==0) begin
        mdr_reg <= 0;
    end
    else begin
        if(mdr_load==1) begin
            mdr_reg <= mem_bus;
        end
    end
end

endmodule