module cmos_inverter(Y, X);
    input X;
    output Y;
    supply1 vdd;
    supply0 gnd;

    pmos(Y, vdd, X);
    nmos(Y, gnd, X);
endmodule