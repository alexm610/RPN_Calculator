`timescale 1 ps / 1 ps

module tb_rtl_rpn();
	logic CLOCK_50;
	logic [3:0] KEY;
	logic [9:0] SW;
	logic [9:0] LEDR;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	integer i;
	enum {IDLE, WRITE, OPERATE_1, OPERATE_2, OPERATE_3, OPERATE_4, OPERATE_5, MATH_0, ERROR} state;


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
		SW = {2'b00, 8'hA9};
		$display("TEST 1: Assert and hold reset, and confirm PC is set to zero");
		KEY[3] = 1; #2;
		KEY[3] = 0; #8;
		// at this time, with reset continuously asserted, PC should be held at zero
		if (dut.addr !== 0) begin
			$display("TEST 1 FAILED: PC is not zero with reset asserted."); $stop;
		end else begin
			$display("TEST 1 PASSED.");
			$display("");
		end

		$display("TEST 2: Deassert reset, wait a bit, DO NOT ASSERT ENABLE, and confirm PC is still zero");
		KEY[3] = 1; #20;
		if (dut.addr !== 0) begin
			$display("TEST 2 FAILED: PC is not zero with reset asserted."); $stop;
		end else begin
			$display("TEST 2 PASSED.");
			$display("");
		end

		$display("TEST 3: Assert ENABLE, confirm PC is incremented, and output on memory is correct");
		KEY[0] = 0; #2;
		KEY[0] = 1; wait (dut.state == IDLE); #1; // one more posedge of the clock is needed for memory to be written.
		if (dut.addr !== 0) begin
			$display("TEST 3 FAILED: PC is not at zero, as it should stay at zero after first value entry."); $stop;
		end else if (dut.STACK.altsyncram_component.m_default.altsyncram_inst.mem_data[0] !== 8'hA9) begin
			$display("TEST 3 FAILED: STACK[0] != A9."); $stop;
		end else begin
			$display("TEST 3 PASSED.");
			$display("");
		end

		$display("TEST 4: Assert ENABLE, confirm PC is incremented, and output on memory is correct");
		SW = {2'b00, 8'h1B};
		KEY[0] = 0; #2;
		KEY[0] = 1; wait (dut.state  == IDLE); #1;
		if (dut.addr !== 1) begin
			$display("TEST 4 FAILED: PC did not increase to 1."); $stop;
		end else if (dut.STACK.altsyncram_component.m_default.altsyncram_inst.mem_data[0] !== 8'hA9) begin
			$display("TEST 4 FAILED: STACK[0] != A9."); $stop;
		end else if (dut.STACK.altsyncram_component.m_default.altsyncram_inst.mem_data[1] !== 8'h1B) begin
			$display("TEST 4 FAILED: STACK[1] != 1B."); $stop;
		end else begin
			$display("TEST 4 PASSED.");
			$display("");
		end
		/*
		//time to do some math!!
		SW = 10'b10_0000_0000; // add operation
		$display("TEST 5: Set SW[9] high, assert ENABLE, confirm PC is decremented, and output on memory is correct");
		KEY[0] = 0; #2;
		KEY[0] = 1; 
		wait (dut.state == IDLE); #10; // need to wait a bit, for the memory block to update!
		if (dut.addr !== 0) begin
			$display("TEST 5 FAILED: PC did not decrease to 0."); #10; $stop;
		end else if (dut.STACK.altsyncram_component.m_default.altsyncram_inst.mem_data[0] !== (8'hA9 + 8'h1B)) begin
			$display("TEST 5 FAILED: STACK[0] != A9 + 1B. Actual = %h", dut.STACK.altsyncram_component.m_default.altsyncram_inst.mem_data[0]); #10; $stop;
		end else begin
			$display("TEST 5 PASSED.");
			$display("");
		end
		*/
		// don't forget to add a test for the ERROR check!!
		$display("------End rpn.sv Testbench------");
		$stop;
	end
endmodule 

