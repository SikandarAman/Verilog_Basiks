module tester;
    reg in, clk, clr;
    wire D;
    integer i;
    bit4_shift DUT(in, clk, clr, D);


    initial 
        begin
            clk = 0;
            #2 clr = 0;
            #5 clr = 1;
        end

    always
        #5 clk = ~clk;

    initial 
        begin
            $dumpfile("bit4_data.vcd");
            $dumpvars(1, clk, in, DUT.A, DUT.B, DUT.C, DUT.D);
            $monitor($time , " A = %b, B = %b, C = %b, D = %b ", DUT.A, DUT.B, DUT.C, D);
            repeat (2)
                begin
                    #10 in = 1; 
                    #10 in = 0;
                    #10 in = 1;
                    #10 in = 0;
                end
        end
    
    initial
        #124 $finish;

endmodule