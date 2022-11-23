module alu (Ain, Bin, ALUop, out);
    input [7:0] Ain, Bin;
    input [2:0] ALUop;
    output [7:0] out;
    reg [7:0] out;

    always @(*) begin
        case(ALUop)
            3'b000: out = Ain + Bin;
            3'b001: out = Ain - Bin;
            3'b010: out = Ain & Bin;
            3'b011: out = ~Ain;
	        3'b100: out = Ain | Bin;
            default: out = 8'b0;
        endcase
    end
endmodule
