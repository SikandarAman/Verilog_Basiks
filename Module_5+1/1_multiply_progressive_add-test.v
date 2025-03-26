module tester;
    reg [15:0] data_in;
    reg clk, start;
    
    datapath_mul DP(eqz, ldA, ldB, ldP, clrP, decB, data_in, clk);
    controlpath_mul CP(eqz, ldA, ldB, ldP, clrP, decB, start, done, clk);

    initial 
        begin 
            clk = 1'b0;
            #3 start = 1'b1;
            #500 $finish;
        end
    
    always 
        #5 clk = ~clk;

    initial 
        begin
            $dumpfile("mul_values.vcd");
            $dumpvars(0, tester);
            $monitor($time, " Value = %d, Done = %1b, A = %2d, B = %2d, State = %d,", DP.Y, CP.done, DP.X, DP.Bout, CP.state, CP.eqz);
        end
    
    initial 
        begin
            #17 data_in = 100;
            #10 data_in = 17;
        end
endmodule

//THE GTK VALUES ARE IN HEXADECIMAL those x,y,z ones