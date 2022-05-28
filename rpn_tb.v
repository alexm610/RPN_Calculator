module rpn_tb;
	reg CLOCK_50;
	reg [3:0] KEY;
	reg [9:0] SW;
	wire [9:0] LEDR;
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	reg [7:0] data_IN, data_OUT;
	reg error;

	rpn DUT(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
		
	initial forever begin
		CLOCK_50 = 0; #5;
		CLOCK_50 = 1; #5;
	end

	initial begin
		error = 0;
		
		KEY[0] = 1; // set enter button LOW

		KEY[1] = 1'b0; // assert reset
		#10; // wait for rising edge of clock
		KEY[1] = 1'b1; // deassert reset
		

		// set input value on the switches 
		SW[0] = 1'b1;
    		SW[1] = 1'b0;
    		SW[2] = 1'b0;
    		SW[3] = 1'b1;
    		SW[4] = 1'b0;
    		SW[5] = 1'b1;
    		SW[6] = 1'b0;
    		SW[7] = 1'b1;
    		SW[8] = 1'b0;
    		SW[9] = 1'b0;
		
		// wait a while
			
		#100;
		KEY[0] = 0;
		#10;
		KEY[0] = 1;

		#50;

		

		// set input value on the switches 
		SW[0] = 1'b1;
    		SW[1] = 1'b0;
    		SW[2] = 1'b0;
    		SW[3] = 1'b1;
    		SW[4] = 1'b0;
    		SW[5] = 1'b1;
    		SW[6] = 1'b0;
    		SW[7] = 1'b1;
    		SW[8] = 1'b0;
    		SW[9] = 1'b0;

		
		#40;
		KEY[0] = 0;
		#10;
		KEY[0] = 1;
		#40;

		KEY[1] = 0;
		#10;
		KEY[1] = 1;	
		#50;




		if (~error) $display("Calculator probably works.");
		$stop;
	end
endmodule 

