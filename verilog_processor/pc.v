`define N 8

module pc (clk, nrst, pc_inc, pc_valid, pc_load,data);

input clk;
input nrst;
input pc_inc;
input pc_valid;
input pc_load;

inout [`N-1:0] data;

wire [`N-1:0] data;

reg [`N-1:0] counter;

assign data = pc_valid ? counter : `N'bz;

always @(posedge clk) begin
    if(nrst==0) begin
        counter <= 0;
    end
    else begin
        if(pc_inc==1) begin
            counter <= counter + 1;
        end
        else begin
            if(pc_load==1) begin
                counter <= data;
            end
            else begin
                counter <= 0;
            end
        end
    end
end
endmodule