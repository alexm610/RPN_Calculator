module gpio_testing(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50, GPIO_0);
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	output [36:0] GPIO_0;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	assign LEDR[9:0] = SW[9:0];
	assign GPIO_0[2] = SW[0];
endmodule
