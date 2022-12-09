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
`define A           7'b0001000
`define b           7'b0000011
`define C           7'b1000110
`define d           7'b0100001
`define E     		7'b0000110
`define F           7'b0001110
`define r     		7'b0101111
`define o     		7'b0100011
`define OFF   		7'b1111111

module binary_to_hex (BINARY, HEX);
    input logic [3:0] BINARY;
    output logic [6:0] HEX;

    always @(*) begin
        case (BINARY)
            4'h0: HEX = `ZERO;
            4'h1: HEX = `ONE;
            4'h2: HEX = `TWO;
            4'h3: HEX = `THREE;
            4'h4: HEX = `FOUR;
            4'h5: HEX = `FIVE;
            4'h6: HEX = `SIX;
            4'h7: HEX = `SEVEN;
            4'h8: HEX = `EIGHT;
            4'h9: HEX = `NINE; 
            4'hA: HEX = `A;
            4'hB: HEX = `b;
            4'hC: HEX = `C;
            4'hD: HEX = `d;
            4'hE: HEX = `E;
            4'hF: HEX = `F;
        endcase
    end
endmodule: binary_to_hex