module for_loop_synthesis_tb();
	reg r_Clock = 1'b0;
	for_loop_synthesis UUT(.i_Clock(r_Clock));
	always
		#10 r_Clock = !r_Clock;
endmodule