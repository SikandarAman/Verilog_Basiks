module FA_tester;
    reg a, b, cin;
    wire cout, sum;
    FA DUT(.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

//Version 1
    // initial 
    //     begin
    //       $dumpfile("FA_data.vcd");
    //       $dumpvars(0, FA_tester);
    //       $monitor($time, " a = %b, b = %b, cin = %b, cout = %b, sum = %b ", a, b, cin, cout, sum);
    //       #5 a = 0; b = 0; cin = 0;
    //       #5 b = 1;
    //       #5 a = 1; b = 0;
    //       #5 b = 1;
    //       #5 $finish;
    //     end

//Version 2
    integer i;
    initial 
        begin
            $dumpfile("FA_data.vcd");
            $dumpvars(0, FA_tester);
            $monitor(" Time = %3d, a = %b, b = %b, cin = %b, cout = %b, sum = %b ", $time, a, b, cin, cout, sum);
            for (i=0; i<8; i++)
                begin
                    #5 {a,b,cin} = i;
                end
        end        
    initial
        #45 $finish;     
endmodule