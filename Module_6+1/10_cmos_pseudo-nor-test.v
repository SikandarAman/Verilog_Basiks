module tester;
    reg X1, X2;
    wire Y;
    integer k;

    cmos_pseudo_Nor DUT(Y, X1, X2);

    initial
        begin
            $dumpfile("nandvalues.vcd");
            $dumpvars(0, tester);
            $monitor($time, ": X1 = %b, X2 = %b, Y = %b", X1, X2, Y);
            for(k = 0; k < 4; k ++)
                begin
                    #5 {X1, X2} = k;
                end
        end
endmodule