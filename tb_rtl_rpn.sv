`timescale 1 ps / 1 ps

module tb_rtl_rpn();
	logic CLOCK_50;
	logic [3:0] KEY;
	logic [9:0] SW;
	logic [9:0] LEDR;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

	rpn dut (.KEY(KEY), 
		.SW(SW), 
		.LEDR(LEDR), 
		.HEX0(HEX0), 
		.HEX1(HEX1), 
		.HEX2(HEX2), 
		.HEX3(HEX3), 
		.HEX4(HEX4),
		.HEX5(HEX5), 
		.CLOCK_50(CLOCK_50));
		
	initial forever begin
		CLOCK_50 = 0; #1;
		CLOCK_50 = 1; #1;
	end

	initial begin
		$display("");
		$display("------Begin rpn.sv testbench------");
		$display("");
		
		// REMEMBER: all buttons are active LOW
		KEY[0] = 1; 
		SW = 8'hA9;
		$display("TEST 1: Assert and hold reset, and confirm PC is set to zero");
		KEY[3] = 1; #2;
		KEY[3] = 0; #8;
		// at this time, with reset continuously asserted, PC should be held at zero
		if (dut.PC !== 0) begin
			$display("TEST 1 FAILED: PC is not zero with reset asserted."); #10; $stop;
		end else begin
			$display("TEST 1 PASSED.");
			$display("");
		end

		$display("TEST 2: Deassert reset, wait a bit, DO NOT ASSERT ENABLE, and confirm PC is still zero");
		KEY[3] = 1; #20;
		if (dut.PC !== 0) begin
			$display("TEST 2 FAILED: PC is not zero with reset asserted."); #10; $stop;
		end else begin
			$display("TEST 2 PASSED.");
			$display("");
		end

		$display("TEST 3: Assert ENABLE, confirm PC is incremented, and output on memory is correct");
		KEY[0] = 0; #2;
		KEY[0] = 1; #4;
		if (dut.PC !== 1) begin
			$display("TEST 3 FAILED: PC did not increase to 1."); #10; $stop;
		end else begin
			$display("TEST 3 PASSED.");
			$display("");
		end

		$display("------End rpn.sv Testbench------");
		$stop;
	end
endmodule 

