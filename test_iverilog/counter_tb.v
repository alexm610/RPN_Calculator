module counter_tb;
    counter DEVICE(value, clk, reset);

    wire [7:0] value;
    reg clk, reset;
    
    initial forever begin   
        clk = 0; #5;
        clk = 1; #5;
    end

    initial begin
        reset = 0;

        #16;

        reset = 1;
    

        #100;
        $stop;
    end




        //$monitor("At time %t, value = %h (%0d)", $time, value, value);

endmodule