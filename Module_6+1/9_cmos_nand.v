module cmos_nand(Y, X1, X2);
    input X1, X2;
    output Y;
    supply0 gnd;
    supply1 vdd;
    wire A;

    pmos p1(Y, vdd, X1);
    pmos p2(Y, vdd, X2);

    nmos n1(Y, A, X1);
    nmos n2(A, gnd, X2);
endmodule