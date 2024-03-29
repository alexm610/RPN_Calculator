module RAM (clk, read_address, write_address, write, din, dout);
    parameter data_width = 8; 
    parameter addr_width = 8;

    input clk, write;
    input [addr_width-1:0] read_address, write_address;
    input [data_width-1:0] din;
    output [data_width-1:0] dout;
    reg [data_width-1:0] dout;

    reg [data_width-1:0] mem [2**addr_width-1:0];

    always @ (posedge clk) begin
        if (write) 
            mem[write_address] <= din;
        dout <= mem[read_address];
    end
endmodule
