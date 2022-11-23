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
    logic [7:0] data, out, addr;
    logic wren;
    integer PC; // program counter
    enum {IDLE} state;

    stack STACK (.address(addr), 
        .clock(CLOCK_50), 
        .data(data), 
        .wren(wren), 
        .q(out));

    alu ALU (.Ain(),
        .Bin(),
        .ALUop(),
        .out());
    
    assign LEDR = out;

    initial PC = 0;

    always @(posedge CLOCK_50) begin
        if (~KEY[3]) begin
            state <= IDLE;
            wren <= 0;
            addr <= 8'd0;
            data <= 8'd0;
            PC <= 0; // reset the program counter
        end else begin
            case (state)
                IDLE: begin
                    if (~KEY[0]) begin
                        addr <= PC[7:0];
                        wren <= 1;
                        data <= SW;
                        state <= IDLE;
                        PC <= PC + 1;
                    end else begin
                        state <= IDLE;
                        wren <= 0;
                    end
                end
            endcase
        end 
    end
endmodule: rpn