// This is an implementation of a moving average filter.

module MA
(	
	input clk, rst_n,
	input[0:31] a,
	output[0:31] y

);
parameter WINDOW_SIZE = 8;
integer i;

// storage for delay values and feedback value
reg [0:32] delay_elements [0:WINDOW_SIZE - 1];

//wires for sums and multiplications
reg [0:32] sum;

//Combinational Part
assign y = sum * 2;

//Sequential Part
always@(posedge clk)
begin
	if(!rst_n) begin
		for(i = 0; i < WINDOW_SIZE; i = i + 1) begin
			delay_elements[i] <= 32'b0;
		end
	end

	delay_elements[0] <= a;
	sum = 0;
	for(i = 0; i < WINDOW_SIZE; i = i + 1) begin
		delay_elements[i] <= delay_elements[i-1];
		sum = sum + delay_elements[i];
	end
end

endmodule