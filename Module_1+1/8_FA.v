module FA (Cin, A, B, Cout, Sum);
    input Cin;
    input A;
    input B;
    output Cout;
    output Sum;

    wire t1,t2,t3;

    xor G1 (Sum, A, B, Cin);
    and G2 (t1, A, B);
    and G3 (t2, A, Cin);
    and G4 (t3, B, Cin);
    or G5 (Cout, t1, t2, t3);

endmodule

