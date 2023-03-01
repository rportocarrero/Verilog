`timescale 1us/1ns

module tb_servoPWM;
reg clk;
wire uut_out_1;
wire uut_out_15;
wire uut_out_2;
reg[9:0] dutyCycle_1;
reg[9:0] dutyCycle_15;
reg[9:0] dutyCycle_2;
reg rst_n;

servoPWM uut_1ms(.clk(clk), .rst_n(rst_n), .dutyCycle(dutyCycle_1), .PWM_out(uut_out_1));
servoPWM uut_05ms(.clk(clk), .rst_n(rst_n), .dutyCycle(dutyCycle_15), .PWM_out(uut_out_15));
servoPWM uut_15ms(.clk(clk), .rst_n(rst_n), .dutyCycle(dutyCycle_2), .PWM_out(uut_out_2));

always #10 clk = ~clk; // 20us is a 50Khz clock 

initial begin
    $display("time\tclk\tuut_out_1\tuut_out_15\tuut_out2");
    $monitor("%3dus\t%b\t%b\t%b\t%b",$time,clk,uut_out_1,uut_out_15,uut_out_2);
end

initial begin
    //set starting conditions
    rst_n <= 1;
    clk <= 1;
    dutyCycle_1 <= 50; // 1ms pulse
    dutyCycle_15 <= 76; // 1.5ms pulse
    dutyCycle_2 <= 100; // 0.5ms pulse

    #45000 // run for 45ms


    $finish;
    
end

endmodule