module gpio_testing(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50, GPIO_0);
	input logic CLOCK_50;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	output logic [36:0] GPIO_0;
	output logic [9:0] LEDR;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	assign LEDR[9:0] = SW[9:0];
	assign GPIO_0[2] = SW[0];
endmodule
