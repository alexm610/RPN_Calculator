// Seven segment display definitions 
`define ZERO  		7'b1000000
`define ONE   		7'b1111001
`define TWO   		7'b0100100
`define THREE 		7'b0110000
`define FOUR  		7'b0011001
`define FIVE  		7'b0010010
`define SIX   		7'b0000010
`define SEVEN 		7'b1111000
`define EIGHT 		7'b0000000
`define NINE  		7'b0011000
`define E     		7'b0000110
`define r     		7'b0101111
`define o     		7'b0100011
`define OFF   		7'b1111111

// State machine definitions
`define S_WAIT		4'b0000
`define S_WRITE1	4'b0001
`define S_WRITE_ZEROS	4'b0010
`define S_ZERO		4'b0011
`define S_WRITE2	4'b0100
`define S_WRITE3	4'b0101

module rpn(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, CLOCK_50);
	input CLOCK_50;
	input [3:0] KEY;
	input [9:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	wire [7:0] data_IN, data_OUT, SP, PC, into_SP_reg, output_line, memory_out, into_alu_A, into_alu_B, out_ALU, into_PC;
	reg write_dummy, tri_enable, write_SP, write_memory, load_A, load_B, write_PC;
	reg [3:0] current_state;
	reg [2:0] ALU_OP;
	
	reg_load_enable #(8) PROGRAM_COUNTER (CLOCK_50, into_PC, write_PC, PC); 
	reg_load_enable #(8) STACK_POINTER (CLOCK_50, into_SP_reg, write_SP, SP);
	
	//reg_load_enable #(8) reg_A (CLOCK_50, memory_out, load_A, into_alu_A);
	//reg_load_enable #(8) reg_B (CLOCK_50, memory_out, load_B, into_alu_B);
	//alu ALU (into_alu_A, into_alu_B, ALU_OP, out_ALU);
	RAM STACK (CLOCK_50, SP, SP, write_memory, output_line, memory_out); 

	assign data_IN = tri_enable ? SW[7:0] : 8'b0; 	
	assign into_SP_reg = tri_enable ? (1'b1 + SP) : 8'b0;

	assign LEDR[7:0] = memory_out;// output_line;
	assign LEDR[8] = 1'b0;
	assign LEDR[9] = 1'b0;
	assign HEX0[6:0] = `ZERO;
	assign HEX1[6:0] = `ZERO;
	assign HEX2[6:0] = `ZERO;
	assign HEX3[6:0] = `ZERO;
	assign HEX4[6:0] = `ZERO;
	assign HEX5[6:0] = `ZERO;

	always @(posedge CLOCK_50) begin
		if (~KEY[1]) begin
			current_state = `S_ZERO;
		end else begin
			casex ({current_state, ~KEY[0]})
				{`S_ZERO, 1'bx}: 	current_state = `S_WRITE_ZEROS;
				{`S_WRITE_ZEROS, 1'bx}: current_state = `S_WAIT;
				{`S_WAIT, 1'b0}: 	current_state = `S_WAIT;
				{`S_WAIT, 1'b1}: 	current_state = `S_WRITE1;
				{`S_WRITE1, 1'bx}: 	current_state = `S_WRITE2;
				{`S_WRITE2, 1'bx}: 	current_state = `S_WRITE3;
				{`S_WRITE3, 1'bx}: 	current_state = `S_WAIT;
			endcase

			case (current_state)
				`S_ZERO: 	{write_dummy, write_SP, write_memory, tri_enable} = {1'b0, 1'b0, 1'b0, 1'b0};
				`S_WRITE_ZEROS: {write_dummy, write_SP, write_memory, tri_enable} = {1'b1, 1'b1, 1'b0, 1'b0};
				`S_WAIT: 	{write_dummy, write_SP, write_memory, tri_enable} = {1'b0, 1'b0, 1'b0, 1'b0};
				`S_WRITE1: 	{write_dummy, write_SP, write_memory, tri_enable} = {1'b1, 1'b0, 1'b0, 1'b1};
				`S_WRITE2: 	{write_dummy, write_SP, write_memory, tri_enable} = {1'b0, 1'b0, 1'b1, 1'b1};
				`S_WRITE3:	{write_dummy, write_SP, write_memory, tri_enable} = {1'b0, 1'b1, 1'b0, 1'b1};	
			endcase	
		end
	end
endmodule
