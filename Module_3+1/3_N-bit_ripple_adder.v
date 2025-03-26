module Nbit_adder(a, b, sum, cin, cout);
    parameter N = 16;
    input [N-1:0] a,b;
    input cin;
    output [N-1:0] sum;
    output cout;
    wire t[N:0];

    assign t[0] = cin;
    assign cout = t[N];

    genvar i;

    generate for(i=0; i<N; i=i+1)
        begin : add_loop
            wire t1, t2, t3;
                xor G1(t1, a[i], b[i]);
                and G2(t2, a[i], b[i]);
                and G3(t3, t1, t[i]);
                xor G4(sum[i], t1, t[i]);
                or  G5(t[i+1], t2, t3);
        end
    endgenerate

endmodule