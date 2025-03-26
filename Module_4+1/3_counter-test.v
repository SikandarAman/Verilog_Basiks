module testbench;
    reg clk, clr;
    counter COUNT(clk, clr);

    initial 
        begin
            #2 clr = 0;
            #2 clr = 1;
        end

    initial
        begin
            clk = 0;
            #5; 
            forever    #1 clk = ~clk; //time period becomes 10
        end
    
    initial 
        begin
            $dumpfile("values.vcd");
            $dumpvars(1, clk, COUNT.A);
            $monitor($time, " Count = %d", COUNT.A);
            #201 $finish;
        end
endmodule
    