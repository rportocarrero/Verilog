module shift4(clk, rst, D0, shift, Q);
    input clk, rst, D0, shift;
    output reg [3:0] Q;
    always @(posedge clk)
    begin
        if (!rst)
            Q <= 4'b0000;
        else if(shift == 1)
        begin
            Q <= Q << 1;
            Q[0] <= D0;
        end
        else;
    end
endmodule