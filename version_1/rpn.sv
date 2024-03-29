`timescale 1 ps / 1 ps

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

module rpn (CLOCK_50, KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
    input logic CLOCK_50;
    input logic [3:0] KEY;
    input logic [9:0] SW; 
    output logic [9:0] LEDR;
    output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    logic [7:0] data, out, addr, into_B, into_A, out_ALU;
    logic wren, A_en, B_en;
    logic [2:0] ALU_sel;
    logic increment;
    enum {IDLE, WAIT, START, WRITE, OPERATE_1, OPERATE_2, OPERATE_3, OPERATE_4, OPERATE_5, MATH_0, ERROR} state;

    stack STACK (.address(addr), 
        .clock(CLOCK_50), 
        .data(data), 
        .wren(wren), 
        .q(out));

    alu ALU (.Ain(into_A),
        .Bin(into_B),
        .ALUop(ALU_sel),
        .out(out_ALU));

    reg_load_enable #(8) A_REG (.clk(CLOCK_50),
        .in(out),
        .enable(A_en),
        .out(into_A));

    reg_load_enable #(8) B_REG (.clk(CLOCK_50),
        .in(out),
        .enable(B_en),
        .out(into_B));

    binary_to_hex HEX_ZERO (.BINARY(out[3:0]),
        .HEX(HEX0));
    
    binary_to_hex HEX_ONE (.BINARY(out[7:4]),
        .HEX(HEX1));

    assign HEX2 = `OFF;
    assign HEX3 = `OFF;
    assign HEX4 = `OFF;
    assign HEX5 = `OFF;
    assign LEDR = out;
    
    always @(posedge CLOCK_50) begin
        if (~KEY[3]) begin
            state <= IDLE;
            wren <= 0;
            A_en <= 0;
            B_en <= 0;
            addr <= 8'd0;
            data <= 8'd0;
            ALU_sel <= 3'b000;
            increment <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (~KEY[0]) state <= WAIT;
                end
                WAIT: begin
                    if (~KEY[0]) begin
                        state <= WAIT;
                    end else begin
                        state <= START;
                    end
                end
                START: begin
                    wren <= 0;
                    if (SW[9]) begin
                        ALU_sel <= SW[2:0];
                        state <= OPERATE_1;
                    end else begin
                        if (increment == 0) begin
                            increment <= 1;
                        end else begin
                            addr <= addr + 8'd1;
                        end
                        wren <= 1;
                        data <= SW;
                        state <= WRITE;
                    end
                end
                WRITE: begin
                    wren <= 0;
                    state <= IDLE;
                end
                OPERATE_1: begin
                    state <= OPERATE_2;
                end
                OPERATE_2: begin
                    B_en <= 1;
                    state <= OPERATE_3;
                end
                OPERATE_3: begin
                    B_en <= 0;
                    addr <= addr - 8'd1;
                    state <= OPERATE_4;
                end
                OPERATE_4: begin
                    A_en <= 1;
                    state <= OPERATE_5;
                end
                OPERATE_5: begin
                    A_en <= 0;
                    ALU_sel <= SW[2:0];
                    state <= MATH_0;
                end
                MATH_0: begin
                    data <= out_ALU;
                    wren <= 1; // here the stack address should still be set to the position of the second number that was POPped off the stack, which is where we want the result to go
                    state <= IDLE;
                end
                ERROR: state <= ERROR;
            endcase
        end 
    end
endmodule: rpn