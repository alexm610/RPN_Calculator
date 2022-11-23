module reg_load_enable(clk, in, enable, out);
    parameter k = 16;
    input clk, enable;
    input [k-1:0] in;
    output [k-1:0] out;
    wire [k-1:0] mux_into_reg;

    DFF_Alex #(k) DFF0 (clk, mux_into_reg, out);
    multiplexer_2input #(k) MUX0 (in, out, enable, mux_into_reg);
endmodule

module multiplexer_2input(a1, a0, s, out); // this multiplexer is to be used ONLY with the enable-registers
    parameter k = 1;
    input [k-1:0] a1, a0;
    input s; // select signal s needs to be only 1 bit, if HIGH then write in value to register, if LOW then maintain the current value
    output reg [k-1:0] out;

    always @(*) begin
        case(s)
            1'b0: out = a0;
            1'b1: out = a1;
            default: out = {k{1'bx}};
        endcase
    end
endmodule

module DFF_Alex(clk, in, out);
    parameter n = 1;
    input clk;
    input [n-1:0] in;
    output reg [n-1:0] out;

    always @(posedge clk) begin
        out = in; 
    end
endmodule
