`define ADDR 8
`define OP 8
 
 module mar (clk, nrst, mar_load, mar_bus, address);

 input clk;
 input nrst;
 input mar_load;

 input [`OP+`ADDR-1:0] mar_bus;
 output [`ADDR-1:0] address;

 wire [`OP+`ADDR-1:0] mar_bus;
 reg [`ADDR-1:0] address;

 always @(posedge clk) begin
    if(nrst==0) begin
        address <= 0;
    end
    else begin
        if(mar_load==1) begin
            address <= mar_bus[`ADDR-1:0];
        end
    end
end

endmodule