module mux2to1 (in1, in0, s, f);
    input in1, in0, s;
    output reg f;

    always @(in1 or in0 or s)  //or like always @(in1, in0, s) //or always @(*)
        begin 
            if (s)
                f = in1;
            else
                f = in0;
        end
endmodule