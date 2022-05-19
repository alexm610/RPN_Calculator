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

module multiplexer_8input(a7, a6, a5, a4, a3, a2, a1, a0, s, out); // this multiplexer is the one that takes the register files as input, and outputs data_out
    parameter signal_width = 1;
    input [signal_width-1:0] a7, a6, a5, a4, a3, a2, a1, a0;
    input [7:0] s; // select signal here, is 8 bits, since there are 8 inputs --> select is a one-hot signal
    output reg [signal_width-1:0] out;

    always @(*) begin // select signal is one-hot
        case(s)
            8'b00000001: out = a0;
            8'b00000010: out = a1;
            8'b00000100: out = a2;
            8'b00001000: out = a3;
            8'b00010000: out = a4;
            8'b00100000: out = a5;
            8'b01000000: out = a6;
            8'b10000000: out = a7;
            default: out = {signal_width{1'bx}};
        endcase
    end
endmodule

module DFF_Alex(clk, in, out);
    parameter n = 1;
    input clk;
    input [n-1:0] in;
    output reg [n-1:0] out;

    always @(posedge clk)
        out = in; 
endmodule

module decoder(a, b);
    parameter n = 3;
    parameter m = 8;
    input [n-1:0] a;
    output [m-1:0] b;

    wire [m-1:0] b = 1 << a;
endmodule