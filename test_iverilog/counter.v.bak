module counter(out, clk, reset);
    input clk, reset;
    output reg [7:0] out;
    

    always @(posedge clk) begin
        if (reset) begin
            out <= 0;
        end else begin
            out <= out + 1;
        end
    end 
endmodule