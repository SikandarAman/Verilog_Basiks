module xor_tester;
    reg [15:0] a,b;
    wire [15:0] f;
    Nbit_xor DUT(.f(f), .a(a), .b(b));

    initial
        begin
            $monitor("x: %b, y: %b, Out: %b", a, b, f);
            a = 16'h0f0f; b = 16'h00ff;
            #10 a = 16'h0f0f; b = 16'h3333;
            #15 a = 16'h0f0f; b = 16'hf0f0;
            #20 $finish;
        end
endmodule