`timescale 10ns/1ns
module exclusive_or (f, a, b);
    input a, b;
    output f;
    wire t1, t2, t3;
    nand #5 m1 (t1, a, b);
    and #5 m2 (t2,a,t1);
    and #5 m3 (t3, t1, b);
    nor #5 m4 (f, t2, t3);
endmodule

