module cmos_pseudo_Nor (Y, X1, X2);
    input X1, X2;
    output Y;
    supply0 gnd;

    nmos nx(Y, gnd, X1);
    nmos ny(Y, gnd, X2);
    pullup(Y); 
endmodule