module gpio_tb;
	reg CLOCK_50;
	reg [3:0] KEY;
	reg [9:0] SW;
	wire [36:0] GPIO_0;
	wire [9:0] LEDR;
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	gpio_testing DUT(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
		
	initial forever begin
		CLOCK_50 = 0; #5;
		CLOCK_50 = 1; #5;
	end

	initial begin
		SW[9:0] = 10'b0011001101;
		#30;
		$stop;
	end
endmodule 

