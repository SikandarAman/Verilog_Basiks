module add_tester;
    reg [7:0] a, b;
    wire cout;
    wire [7:0] sum;
    adder DUT(sum, cout, a, b);
    integer myseed;

    initial
        myseed = 15;

    initial 
        begin 
            $dumpfile("adder_values.vcd");
            $dumpvars(1, a, b, cout, sum);
            $monitor ($time, " A = %h, B = %h, Sum = %h, C_out = %b", a, b, sum, cout);
            repeat(5)
                begin
                    #10 a = $random(myseed); b = $random(myseed);
                end
        end
endmodule