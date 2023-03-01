// This module implements a pwm signal for a standard RC servo.
module servoPWM(input clk,  // input clk
    input rst_n, // reset
    input [9:0] dutyCycle,  // duty cycle
    output reg PWM_out  // output
    );
reg [9:0] counter = 0;  // internal counter

// reset to zero if the reset pin is pulled low
always @ (posedge clk) begin
    if(~rst_n) counter = 0;
end

// output a 1 if less than or equal to the duty cycle setpoint and 0 if greater
always @ (posedge clk) begin
    if(counter < dutyCycle) 
        PWM_out <= 1;
    else 
        PWM_out <= 0;
end

// reset the counter if it goes above the maximum count.
always @ (posedge clk) begin
    if(counter > 999)
        counter = 0;
    else
        counter = counter + 1;  
end

endmodule