`timescale 1 ns/10 ps

module half_adder_tb;

    reg a, b;
    wire sum, carry;

    localparam period = 20;

    half_adder UUT (.a(a), .b(b), .sum(sum), .carry(carry));

    initial
        begin
            a = 0;
            b = 0;
            #period;

            a = 0;
            b = 1;
            #period;

            a = 1;
            b = 0;
            #period

            a = 1;
            b = 1;
            #period;
        end
endmodule