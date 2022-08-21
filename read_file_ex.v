`timescale 1 ns/ 10 ps

module read_file_ex;
    reg a, b;
    reg[1:0] sum_carry_expected;

    reg[3:0] read_data [0:5];
    integer i;

    initial
    begin
        $readmemb("read_file_ex.txt", read_data);

        for(i=0; i<6; i=i+1)
        begin
            {a, b, sum_carry_expected} = read_data[i];
            #20;
        end
    end
endmodule
